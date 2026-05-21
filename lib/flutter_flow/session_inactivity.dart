import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/app/otros/cierrede_sesion/cierrede_sesion_widget.dart';

/// Tiempo sin actividad antes de cerrar sesión (mismo valor que [past5Mins]).
const int kSessionInactivityMinutes = 8;

const Duration kSessionInactivityCheckInterval = Duration(seconds: 10);

/// Indica si la sesión expiró por inactividad.
bool isSessionInactiveExpired(DateTime lastAction) {
  return DateTime.now().difference(lastAction).inMinutes >=
      kSessionInactivityMinutes;
}

/// Registra actividad del usuario (tocar, escribir, desplazar).
void registerSessionActivity() {
  FFAppState().lastAction = getCurrentTimestamp;
}

/// Reinicia el contador de inactividad al abrir una pantalla (formularios, modales).
class SessionActivityPage extends StatefulWidget {
  const SessionActivityPage({super.key, required this.child});

  final Widget child;

  @override
  State<SessionActivityPage> createState() => _SessionActivityPageState();
}

class _SessionActivityPageState extends State<SessionActivityPage> {
  @override
  void initState() {
    super.initState();
    registerSessionActivity();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

/// En [initState] de pantallas GoRouter de crédito / solicitud.
mixin SessionActivityOnInitMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    registerSessionActivity();
  }
}

/// Rutas nombradas del flujo de crédito (GoRouter).
bool isCreditoSessionRoute(Route<dynamic> route) {
  final name = (route.settings.name ?? '').toLowerCase();
  if (name.isEmpty) return false;
  const markers = [
    'credito',
    'solicitar',
    'invertirahorros',
    'mensajedeconfirmacin',
    'tipodepersona',
    'bienvenidacredito',
    'creditoshome',
    'intermissionzapsign',
    'creditosimulador',
    'creditooferta',
    'rebancarizacion',
  ];
  return markers.any((m) => name.contains(m));
}

/// Al navegar con GoRouter dentro del módulo crédito, reinicia [lastAction].
class SessionActivityNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (isCreditoSessionRoute(route)) {
      registerSessionActivity();
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (isCreditoSessionRoute(route) ||
        (previousRoute != null && isCreditoSessionRoute(previousRoute))) {
      registerSessionActivity();
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute != null && isCreditoSessionRoute(newRoute)) {
      registerSessionActivity();
    }
  }
}

final sessionActivityNavigatorObserver = SessionActivityNavigatorObserver();

/// Escucha actividad global y cierra sesión tras [kSessionInactivityMinutes].
/// Las pantallas antiguas siguen con su `InstantTimer`; este componente evita
/// que el usuario sea expulsado mientras llena formularios sin cambiar de ruta.
class SessionInactivityScope extends StatefulWidget {
  const SessionInactivityScope({super.key, required this.child});

  final Widget child;

  @override
  State<SessionInactivityScope> createState() => _SessionInactivityScopeState();
}

class _SessionInactivityScopeState extends State<SessionInactivityScope> {
  Timer? _checkTimer;
  bool _signingOut = false;

  @override
  void initState() {
    super.initState();
    registerSessionActivity();
    _checkTimer = Timer.periodic(
      kSessionInactivityCheckInterval,
      (_) => unawaited(_checkInactivity()),
    );
    HardwareKeyboard.instance.addHandler(_onKeyEvent);
  }

  @override
  void dispose() {
    _checkTimer?.cancel();
    HardwareKeyboard.instance.removeHandler(_onKeyEvent);
    super.dispose();
  }

  bool _onKeyEvent(KeyEvent event) {
    if (event is KeyDownEvent || event is KeyRepeatEvent) {
      registerSessionActivity();
    }
    return false;
  }

  Future<void> _checkInactivity() async {
    if (_signingOut || !loggedIn) return;

    final last = FFAppState().lastAction;
    if (last == null || !isSessionInactiveExpired(last)) return;

    final ctx = appNavigatorKey.currentContext;
    if (ctx == null || !ctx.mounted) return;

    _signingOut = true;
    try {
      final router = GoRouter.of(ctx);
      router.prepareAuthEvent();
      await authManager.signOut();
      router.clearRedirectLocation();

      if (ctx.mounted) {
        ctx.goNamedAuth(CierredeSesionWidget.routeName, ctx.mounted);
      }
    } finally {
      _signingOut = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollUpdateNotification ||
            notification is UserScrollNotification) {
          registerSessionActivity();
        }
        return false;
      },
      child: Listener(
        behavior: HitTestBehavior.translucent,
        onPointerDown: (_) => registerSessionActivity(),
        child: widget.child,
      ),
    );
  }
}
