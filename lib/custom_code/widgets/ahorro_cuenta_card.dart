import 'package:flutter/material.dart';

/// Altura mínima recomendada para tarjetas de cuenta (evita overflow vs 98–100px fijos).
const double kAhorroCuentaCardMinHeight = 112.0;

/// Tarjeta naranja de cuenta de ahorro: badge E.A en esquina, sin altura fija.
class AhorroCuentaCard extends StatelessWidget {
  const AhorroCuentaCard({
    super.key,
    required this.savingsType,
    required this.accountLine,
    required this.balanceChild,
    this.leading,
    this.borderColor = const Color(0xFFFF6700),
    this.backgroundColor = Colors.white,
    this.badgeAsset = 'assets/images/Frame_2085662540_(5).png',
    this.minHeight = kAhorroCuentaCardMinHeight,
  });

  final String savingsType;
  final Widget accountLine;
  final Widget balanceChild;
  /// Radio / selector a la izquierda (p. ej. PSE elegir cuenta).
  final Widget? leading;
  final Color borderColor;
  final Color backgroundColor;
  final String badgeAsset;
  final double minHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: minHeight),
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: const [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x1B262632),
            offset: Offset(0.0, 2.0),
          ),
        ],
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: borderColor, width: 1.0),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 14.0, 56.0, 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (leading != null) ...[
                      leading!,
                      const SizedBox(width: 8.0),
                    ],
                    Image.asset(
                      'assets/images/Group_3.png',
                      width: 14.0,
                      height: 20.0,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            savingsType,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontFamily: 'Satoshi',
                              color: Color(0xFF002CE9),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          accountLine,
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6.0),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: balanceChild,
                ),
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional(1.0, -1.0),
            child: Image.asset(
              badgeAsset,
              width: 54.0,
              height: 22.0,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
