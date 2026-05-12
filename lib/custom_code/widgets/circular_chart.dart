// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math' as math;

class CircularChart extends StatefulWidget {
  final double width;
  final double height;
  final List<ChartDataStruct> data; // ✅ Usa tu struct de FlutterFlow
  final double strokeWidth;

  const CircularChart({
    Key? key,
    required this.width,
    required this.height,
    required this.data,
    this.strokeWidth = 30.0,
  }) : super(key: key);

  @override
  State<CircularChart> createState() => _CircularChartState();
}

class _CircularChartState extends State<CircularChart> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: CustomPaint(
        painter: CircularChartPainter(
          data: widget.data,
          strokeWidth: widget.strokeWidth,
        ),
      ),
    );
  }
}

class CircularChartPainter extends CustomPainter {
  final List<ChartDataStruct> data;
  final double strokeWidth;

  CircularChartPainter({required this.data, required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (math.min(size.width, size.height) - strokeWidth) / 2;

    double startAngle = -math.pi / 2; // ✅ Comenzar desde arriba
    double total = data.fold(0, (sum, item) => sum + (item.value ?? 0));

    for (final chartData in data) {
      final paint = Paint()
        ..color = chartData.color ?? Colors.grey
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.butt; // ✅ puntas planas

      final percentage = total == 0 ? 0 : (chartData.value ?? 0) / total;
      final sweepAngle = percentage * 2 * math.pi;

      // Gap entre segmentos
      final gapAngle = data.length > 1 ? 0.002 : 0.0;
      final adjustedStartAngle = startAngle + gapAngle;
      final adjustedSweepAngle =
          math.max(0, sweepAngle - (gapAngle * 2)).toDouble();

      // Dibujar arco
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        adjustedStartAngle,
        adjustedSweepAngle,
        false,
        paint,
      );

      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(CircularChartPainter oldDelegate) {
    return oldDelegate.data != data || oldDelegate.strokeWidth != strokeWidth;
  }
}
