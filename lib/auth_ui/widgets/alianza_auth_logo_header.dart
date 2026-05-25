import 'package:flutter/material.dart';

import '../alianza_auth_colors.dart';

/// Logo oficial (mismo que favicon / splash de la app).
const String kAlianzaBrandLogoAsset = 'assets/images/Frame_1261153445.png';

class AlianzaAuthLogoHeader extends StatelessWidget {
  const AlianzaAuthLogoHeader({super.key, this.compact = false});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    final logoBoxSize = compact ? 32.0 : 46.0;
    final imageRadius = compact ? 10.0 : 12.0;
    final imagePadding = compact ? 1.0 : 1.5;
    final textSize = compact ? 11.0 : 14.0;

    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: logoBoxSize,
            height: logoBoxSize,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.45),
              borderRadius: BorderRadius.circular(imageRadius),
              border: Border.all(
                color: AlianzaAuthColors.border.withValues(alpha: 0.95),
              ),
            ),
            padding: EdgeInsets.all(imagePadding),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(imageRadius - imagePadding),
              child: Image.asset(
                kAlianzaBrandLogoAsset,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AlianzaAuthColors.orange.withValues(alpha: 0.12),
                    borderRadius:
                        BorderRadius.circular(imageRadius - imagePadding),
                  ),
                  child: const Icon(
                    Icons.account_balance,
                    size: 16,
                    color: AlianzaAuthColors.orange,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 9),
          Text(
            'Alianza Capital',
            style: TextStyle(
              fontFamily: 'Satoshi',
              fontSize: textSize,
              fontWeight: FontWeight.w700,
              color: AlianzaAuthColors.textPrimary,
              height: 1.15,
            ),
          ),
        ],
      ),
    );
  }
}
