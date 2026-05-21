import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

/// Colores y tipografía del módulo Crédito (desde [FlutterFlowTheme], no del HTML de referencia).
class CreditoUi {
  CreditoUi(BuildContext context) : theme = FlutterFlowTheme.of(context);

  final FlutterFlowTheme theme;

  /// Mismo azul que Ayuda y tarjeta de ahorro (parte inferior del gradiente).
  static const Color fabBlue = Color(0xFF002CE9);
  /// Tope del gradiente (igual que línea de ahorro en ahorros).
  static const Color fabBlueLight = Color(0xFF3357EE);

  Color get brand => fabBlue;
  Color get brandAccent => fabBlue;
  Color get accent => theme.tertiary;
  Color get accentBright => theme.customColor4;
  Color get title => theme.primaryText;
  Color get muted => theme.secondaryText;
  Color get cardBorder => theme.customColor5;
  Color get surfaceSubtle => theme.primaryBackground;
  Color get iconCircleBg => fabBlue.withValues(alpha: 0.08);
  Color get detailFill => theme.primaryBackground;
  Color get dashedBorder => theme.alternate;
  Color get railBorder => theme.alternate;
  Color get success => theme.success;

  Color get badgeNeutralBg => theme.customColor5;
  Color get badgeNeutralFg => brandAccent;
  Color get badgeSuccessBg => success.withValues(alpha: 0.12);
  Color get badgeSuccessFg => success;
  Color get promoChipBg => accent.withValues(alpha: 0.12);

  LinearGradient get heroGradient => const LinearGradient(
        begin: AlignmentDirectional(0, -1),
        end: AlignmentDirectional(0, 1),
        colors: [fabBlueLight, fabBlue],
        stops: [0.0, 1.0],
      );

  TextStyle sectionTitle({double fontSize = 16}) =>
      theme.bodyMedium.override(
        fontFamily: theme.bodyMediumFamily,
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        color: title,
        letterSpacing: 0,
      );

  TextStyle dashboardLabel({double fontSize = 9}) =>
      theme.labelSmall.override(
        fontFamily: theme.labelSmallFamily,
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        color: muted,
        letterSpacing: 0,
      );

  TextStyle dashboardAmount({double fontSize = 17}) =>
      theme.headlineSmall.override(
        fontFamily: theme.headlineSmallFamily,
        fontSize: fontSize,
        fontWeight: FontWeight.w800,
        color: brandAccent,
        letterSpacing: -0.3,
      );

  TextStyle dashboardTitle({double fontSize = 12}) =>
      theme.bodySmall.override(
        fontFamily: theme.bodySmallFamily,
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        color: title,
        lineHeight: 1.25,
      );

  TextStyle dashboardBody({double fontSize = 11}) =>
      theme.bodySmall.override(
        fontFamily: theme.bodySmallFamily,
        fontSize: fontSize,
        color: muted,
        lineHeight: 1.4,
      );

  TextStyle railLabel() => theme.labelSmall.override(
        fontFamily: theme.labelSmallFamily,
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: title,
        lineHeight: 1.1,
      );

  TextStyle badge({double fontSize = 9, Color? color}) =>
      theme.labelSmall.override(
        fontFamily: theme.labelSmallFamily,
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        color: color ?? badgeNeutralFg,
      );

  ButtonStyle outlinedAction({double fontSize = 9}) =>
      OutlinedButton.styleFrom(
        foregroundColor: brandAccent,
        side: BorderSide(color: brandAccent),
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
        minimumSize: const Size(0, 30),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textStyle: theme.labelSmall.override(
          fontFamily: theme.labelSmallFamily,
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
          color: brandAccent,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      );

  TextStyle detailValue({double fontSize = 10, Color? color}) =>
      theme.bodySmall.override(
        fontFamily: theme.bodySmallFamily,
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        color: color ?? title,
      );

  TextStyle detailLabel({double fontSize = 8}) =>
      theme.labelSmall.override(
        fontFamily: theme.labelSmallFamily,
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        color: muted,
      );
}
