import 'package:flutter/material.dart';

import '../alianza_auth_colors.dart';

/// En pantallas anchas (web/desktop) muestra la UI auth como un móvil centrado.
class AlianzaAuthShell extends StatelessWidget {
  const AlianzaAuthShell({
    super.key,
    required this.background,
    required this.child,
    this.surfaceColor = AlianzaAuthColors.surface,
  });

  final Widget background;
  final Widget child;
  final Color surfaceColor;

  static const double _phoneMaxWidth = 430;
  static const double _phoneMaxHeight = 844;
  static const double _wideBreakpoint = 520;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final wide = size.width > _wideBreakpoint;

    if (!wide) {
      return ColoredBox(
        color: surfaceColor,
        child: Stack(
          fit: StackFit.expand,
          children: [
            background,
            child,
          ],
        ),
      );
    }

    return ColoredBox(
      color: const Color(0xFF1C2030),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: _phoneMaxWidth,
              maxHeight: size.height > _phoneMaxHeight + 48
                  ? _phoneMaxHeight
                  : size.height - 48,
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: surfaceColor,
                borderRadius: BorderRadius.circular(28),
                border: Border.all(color: const Color(0xFF2E3348)),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x66000000),
                    blurRadius: 48,
                    offset: Offset(0, 16),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    background,
                    child,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
