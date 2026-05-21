import 'package:flutter/material.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Rutas que deben ocupar todo el ancho (p. ej. splash inicial).
const Set<String> kAdaptiveShellExcludedRouteNames = {
  '_initialize',
};

/// Ancho máximo del contenido en pantallas medianas/grandes.
double adaptiveContentMaxWidth(double screenWidth) {
  if (screenWidth < kBreakpointMedium) {
    return 480.0;
  }
  if (screenWidth < kBreakpointLarge) {
    return 600.0;
  }
  return 720.0;
}

/// Envuelve cada pantalla desde el router.
/// En teléfono (&lt; [kBreakpointSmall]) devuelve [child] sin cambios.
/// En tablet/web centra el árbol y ajusta [MediaQuery] para que los
/// `MediaQuery.sizeOf(context).width * …` de FlutterFlow no desborden.
class AdaptivePageShell extends StatelessWidget {
  const AdaptivePageShell({
    super.key,
    required this.child,
    this.routeName,
  });

  final Widget child;
  final String? routeName;

  @override
  Widget build(BuildContext context) {
    if (routeName != null &&
        kAdaptiveShellExcludedRouteNames.contains(routeName)) {
      return child;
    }

    final screenSize = MediaQuery.sizeOf(context);
    if (screenWidthIsMobile(context)) {
      return child;
    }

    final maxWidth = adaptiveContentMaxWidth(screenSize.width);
    final effectiveWidth = screenSize.width.clamp(0.0, maxWidth);
    final effectiveSize = Size(effectiveWidth, screenSize.height);

    return ColoredBox(
      color: FlutterFlowTheme.of(context).secondaryBackground,
      child: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: effectiveWidth,
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(size: effectiveSize),
            child: child,
          ),
        ),
      ),
    );
  }
}

bool screenWidthIsMobile(BuildContext context) =>
    MediaQuery.sizeOf(context).width < kBreakpointSmall;
