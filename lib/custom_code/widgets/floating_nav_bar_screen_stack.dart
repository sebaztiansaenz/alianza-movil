import 'package:flutter/material.dart';

import '/custom_code/widgets/floating_nav_bar_scroll.dart';

/// Layout estándar: contenido con scroll + Ayuda (opcional) + [FloatingNavBar].
/// Incluye ocultar/mostrar el menú al hacer scroll (estilo Facebook).
class FloatingNavBarScreenStack extends StatelessWidget {
  const FloatingNavBarScreenStack({
    super.key,
    required this.scrollContent,
    required this.navBar,
    this.helpButton,
  });

  final Widget scrollContent;
  final Widget navBar;
  final Widget? helpButton;

  @override
  Widget build(BuildContext context) {
    return FloatingNavBarScrollScope(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          FloatingNavBarScrollListener(child: scrollContent),
          if (helpButton != null) helpButton!,
          navBar,
        ],
      ),
    );
  }
}
