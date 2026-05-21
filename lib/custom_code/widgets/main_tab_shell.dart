import 'package:flutter/material.dart';

import '/custom_code/widgets/floating_nav_bar.dart';
import '/custom_code/widgets/floating_nav_bar_scroll.dart';

/// Envuelve pantallas principales (Ahorros, Crédito, Convenios, Perfil)
/// para buena UX con [FloatingNavBar]:
/// - El scroll no queda tapado por el menú.
/// - El menú flota encima; el contenido puede pasar detrás (efecto vidrio).
class MainTabShell extends StatelessWidget {
  const MainTabShell({
    super.key,
    required this.body,
    required this.onConvenios,
    required this.onInicio,
    required this.onPerfil,
    this.activeIndex,
    this.showNavBar = true,
    this.overlay,
  });

  final Widget body;
  final Future<dynamic> Function() onConvenios;
  final Future<dynamic> Function() onInicio;
  final Future<dynamic> Function() onPerfil;
  final int? activeIndex;
  final bool showNavBar;

  /// Botón Ayuda u otro FAB encima del contenido (opcional).
  final Widget? overlay;

  @override
  Widget build(BuildContext context) {
    final clearance = floatingNavBarClearance(context);

    return FloatingNavBarScrollScope(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: showNavBar ? clearance : 0),
            child: FloatingNavBarScrollListener(child: body),
          ),
          if (overlay != null) Positioned.fill(child: overlay!),
          if (showNavBar)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: FloatingNavBar(
                activeIndex: activeIndex,
                onLeftPressed: onConvenios,
                onCenterPressed: onInicio,
                onRightPressed: onPerfil,
              ),
            ),
        ],
      ),
    );
  }
}
