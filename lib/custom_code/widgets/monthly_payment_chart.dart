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

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey[300]!
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    const dashWidth = 4.0;
    const dashSpace = 4.0;
    double currentX = 0;

    while (currentX < size.width) {
      canvas.drawLine(
        Offset(currentX, size.height / 2),
        Offset(currentX + dashWidth, size.height / 2),
        paint,
      );
      currentX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class MonthlyPaymentChart extends StatefulWidget {
  const MonthlyPaymentChart({Key? key, this.width, this.height, this.chartData})
      : super(key: key);

  final double? width;
  final double? height;
  final List<double>? chartData;

  @override
  _MonthlyPaymentChartState createState() => _MonthlyPaymentChartState();
}

class _MonthlyPaymentChartState extends State<MonthlyPaymentChart> {
  int? hoveredIndex;
  OverlayEntry? _tooltipEntry;
  final List<GlobalKey> _barKeys = List.generate(12, (index) => GlobalKey());

  final List<double> monthlyData = [
    10900,
    10000,
    10000,
    14000,
    19000,
    20000,
    10000,
    20000,
    5000,
    10000,
    18000,
    15000,
  ];

  final List<String> months = [
    'Enero',
    'Febrero',
    'Marzo',
    'Abril',
    'Mayo',
    'Junio',
    'Julio',
    'Agosto',
    'Septiembre',
    'Octubre',
    'Noviembre',
    'Diciembre',
  ];

  List<double> _calculateYAxisIntervals(double maxValue) {
    const numberOfLines = 5; // Exactamente 5 líneas incluyendo el cero

    if (maxValue <= 0) return [0, 1, 2, 3, 4]; // Caso extremo

    // Calculamos el intervalo óptimo
    double roughInterval = maxValue / (numberOfLines - 1);
    double magnitude =
        math.pow(10, (math.log(roughInterval) / math.ln10).floor()).toDouble();
    double fraction = roughInterval / magnitude;

    double niceInterval;
    if (fraction < 1.5) {
      niceInterval = magnitude * 1;
    } else if (fraction < 3) {
      niceInterval = magnitude * 2;
    } else if (fraction < 7) {
      niceInterval = magnitude * 5;
    } else {
      niceInterval = magnitude * 10;
    }

    // Ajustamos el máximo para que sea múltiplo del intervalo
    double niceMax = niceInterval * (numberOfLines - 1);
    if (maxValue > niceMax) {
      niceMax += niceInterval;
    }

    // Generamos las 5 líneas exactas
    List<double> intervals = [];
    for (int i = 0; i < numberOfLines; i++) {
      intervals.add((niceMax / (numberOfLines - 1)) * i);
    }

    return intervals;
  }

  String _formatYAxisLabel(double value) {
    if (value >= 1000000) {
      return '${(value / 1000000).toStringAsFixed(value % 1000000 == 0 ? 0 : 1)}M';
    } else if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(value % 1000 == 0 ? 0 : 1)}k';
    } else {
      return value.toStringAsFixed(0);
    }
  }

  void _showTooltip(int index) {
    final renderBox =
        _barKeys[index].currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final position = renderBox.localToGlobal(Offset.zero);
    final overlay = Overlay.of(context);

    _tooltipEntry?.remove();

    _tooltipEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: position.dx - 25,
        top: position.dy - 40,
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: 100,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
              ],
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '\$${(widget.chartData?[index] ?? monthlyData[index]).toStringAsFixed(0)}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    overlay.insert(_tooltipEntry!);
  }

  void _hideTooltip() {
    _tooltipEntry?.remove();
    _tooltipEntry = null;
  }

  @override
  void dispose() {
    _hideTooltip();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.chartData ?? monthlyData;
    final maxValue = data.reduce((a, b) => a > b ? a : b);
    final yAxisIntervals = _calculateYAxisIntervals(maxValue);
    final chartHeight = 218.0;
    final barWidth = 32.0;
    final barSpacing = 4.0;

    return Container(
      width: widget.width ?? 450,
      height: widget.height ?? 500,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: 45,
                  child: Column(
                    children: [
                      for (final interval in yAxisIntervals.reversed)
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              _formatYAxisLabel(interval),
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Column(
                          children: [
                            for (int i = 0; i < yAxisIntervals.length; i++)
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  child: CustomPaint(
                                    size: Size(double.infinity, 1),
                                    painter: DottedLinePainter(),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      Positioned.fill(
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            final totalWidth = constraints.maxWidth;
                            final itemWidth =
                                (totalWidth - (barSpacing * 11)) / 12;
                            final startOffset = itemWidth / 2 - barWidth / 2;

                            return Stack(
                              children: List.generate(data.length, (index) {
                                final left = startOffset +
                                    (itemWidth + barSpacing) * index;
                                final height =
                                    (data[index] / yAxisIntervals.last) *
                                        chartHeight;

                                return Positioned(
                                  left: left,
                                  bottom: 25,
                                  child: MouseRegion(
                                    onEnter: (_) {
                                      setState(() => hoveredIndex = index);
                                      _showTooltip(index);
                                    },
                                    onExit: (_) {
                                      setState(() => hoveredIndex = null);
                                      _hideTooltip();
                                    },
                                    child: Container(
                                      key: _barKeys[index],
                                      width: barWidth,
                                      height: height,
                                      decoration: BoxDecoration(
                                        color: hoveredIndex == index
                                            ? Colors.blue[700]
                                            : Color(0xff0B35B8),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 45),
            height: 40,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final totalWidth = constraints.maxWidth;
                final itemWidth = (totalWidth - (barSpacing * 11)) / 12;
                final startOffset = itemWidth / 2;

                return Stack(
                  children: List.generate(months.length, (index) {
                    final left =
                        startOffset + (itemWidth + barSpacing) * index - 30;

                    return Positioned(
                      left: left,
                      child: Container(
                        width: 60,
                        child: Center(
                          child: Text(
                            months[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey[600],
                            ),
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
