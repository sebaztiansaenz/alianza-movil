import '/credito/widgets/credito_dashboard_metrics.dart';
import '/credito/widgets/credito_ui_theme.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

/// Contenedor izquierdo del dashboard (misma caja para vacío u oferta).
class CreditoDashboardLeftShell extends StatelessWidget {
  const CreditoDashboardLeftShell({
    super.key,
    required this.body,
    this.dashedBorder = false,
    this.footer,
    this.showFooter = true,
    /// Altura fija de la tarjeta (alinea vacío y oferta con el carrusel).
    this.dashboardFixedHeight,
  });

  final Widget body;
  final bool dashedBorder;
  final Widget? footer;
  final bool showFooter;
  final double? dashboardFixedHeight;

  @override
  Widget build(BuildContext context) {
    final ui = CreditoUi(context);
    final fixedH = dashboardFixedHeight;

    Widget card = Container(
      width: double.infinity,
      height: fixedH,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius:
            BorderRadius.circular(CreditoDashboardMetrics.cardRadius),
        border: dashedBorder
            ? null
            : Border.all(color: ui.cardBorder, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (fixedH != null)
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: body,
              ),
            )
          else
            body,
          if (showFooter) footer ?? const CreditoDashboardFooterBar(),
        ],
      ),
    );

    if (!dashedBorder) {
      return card;
    }

    return _DashedBorderWrapper(child: card);
  }
}

/// Pie de tarjeta con altura fija (solo oferta preaprobada).
class CreditoDashboardFooterBar extends StatelessWidget {
  const CreditoDashboardFooterBar({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final ui = CreditoUi(context);
    return SizedBox(
      height: CreditoDashboardMetrics.footerHeight,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ui.cardBorder,
              ui.cardBorder.withValues(alpha: 0.1),
            ],
          ),
          border: Border(
            top: BorderSide(color: ui.cardBorder),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(child: child ?? const SizedBox.shrink()),
        ),
      ),
    );
  }
}

class _DashedBorderWrapper extends StatelessWidget {
  const _DashedBorderWrapper({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final dashed = CreditoUi(context).dashedBorder;
    return CustomPaint(
      foregroundPainter: _DashedRoundedRectPainter(
        radius: CreditoDashboardMetrics.cardRadius,
        color: dashed,
      ),
      child: Padding(
        padding: const EdgeInsets.all(1.5),
        child: child,
      ),
    );
  }
}

class _DashedRoundedRectPainter extends CustomPainter {
  _DashedRoundedRectPainter({required this.radius, required this.color});

  final double radius;
  final Color color;
  static const double _dash = 6;
  static const double _gap = 4;

  @override
  void paint(Canvas canvas, Size size) {
    final rrect = RRect.fromRectAndRadius(
      Rect.fromLTWH(1, 1, size.width - 2, size.height - 2),
      Radius.circular(radius),
    );
    final path = Path()..addRRect(rrect);
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    for (final metric in path.computeMetrics()) {
      var distance = 0.0;
      while (distance < metric.length) {
        final end = (distance + _dash).clamp(0.0, metric.length);
        canvas.drawPath(metric.extractPath(distance, end), paint);
        distance = end + _gap;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DashedRoundedRectPainter oldDelegate) =>
      oldDelegate.radius != radius || oldDelegate.color != color;
}
