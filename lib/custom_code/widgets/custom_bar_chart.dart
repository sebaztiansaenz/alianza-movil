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

import '/custom_code/actions/index.dart'; // Imports other custom actions

class CustomBarChart extends StatefulWidget {
  final double width;
  final double height;
  final List<BarChartDataStruct> data;
  final Color color1;
  final Color color2;
  final Color backgroundColor;
  final Color textColor;
  final Color gridColor;

  const CustomBarChart({
    Key? key,
    required this.width,
    required this.height,
    required this.data,
    this.color1 = const Color(0xFF2196F3),
    this.color2 = const Color(0xFF4CAF50),
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black54,
    this.gridColor = Colors.grey,
  }) : super(key: key);

  @override
  State<CustomBarChart> createState() => _CustomBarChartState();
}

class _CustomBarChartState extends State<CustomBarChart> {
  int? hoveredIndex;
  OverlayEntry? _tooltipEntry;
  final List<GlobalKey> _barKeys = [];

  @override
  void initState() {
    super.initState();
    _barKeys.addAll(List.generate(widget.data.length * 2, (_) => GlobalKey()));
  }

  String _formatNumber(double value) {
    if (value >= 1000) {
      if (value >= 1000000) {
        return "${(value / 1000000).toStringAsFixed(1)}M";
      } else {
        return "${(value / 1000).toStringAsFixed(1)}k";
      }
    }
    return value.toStringAsFixed(0);
  }

  void _showTooltip(int index) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final renderBox =
          _barKeys[index].currentContext?.findRenderObject() as RenderBox?;
      if (renderBox == null) return;

      final position = renderBox.localToGlobal(Offset.zero);
      final overlay = Overlay.of(context);
      if (overlay == null) return;

      _tooltipEntry?.remove();

      final value = (index % 2 == 0)
          ? widget.data[index ~/ 2].value1
          : widget.data[index ~/ 2].value2;
      final currency = (index % 2 == 0) ? '' : '\$';

      _tooltipEntry = OverlayEntry(
        builder: (context) => Positioned(
          left: position.dx - 20,
          top: position.dy - 40,
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: 80,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ],
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Center(
                child: Text(
                  '$currency${_formatNumber(value)}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      overlay.insert(_tooltipEntry!);
    });
  }

  void _hideTooltip() {
    _tooltipEntry?.remove();
    _tooltipEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    final maxValue = widget.data
        .map((e) => [e.value1, e.value2].reduce((a, b) => a > b ? a : b))
        .reduce((a, b) => a > b ? a : b);

    final topMargin = 20.0;
    final bottomMargin = 50.0;
    final leftMargin = 40.0;

    final chartHeight = widget.height - topMargin - bottomMargin;
    final barGroupWidth = (widget.width - leftMargin) / widget.data.length;
    final barWidth = barGroupWidth * 0.3;
    final barSpacing = barWidth * 0.2;

    final yIntervals = List.generate(5, (i) => maxValue * (i / 4));

    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: widget.gridColor.withOpacity(0.2)),
      ),
      child: Stack(
        children: [
          // Líneas y etiquetas Y
          Positioned(
            left: 0,
            top: topMargin,
            bottom: bottomMargin,
            width: leftMargin,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: yIntervals.reversed
                  .map(
                    (v) => Text(
                      _formatNumber(v),
                      style: TextStyle(
                        color: widget.textColor,
                        fontSize: 12,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          // Barras
          Positioned(
            left: leftMargin,
            top: topMargin,
            right: 0,
            bottom: bottomMargin,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  children: List.generate(widget.data.length, (i) {
                    final xOffset = i * barGroupWidth +
                        (barGroupWidth - 2 * barWidth - barSpacing) / 2;

                    final bar1Height =
                        (widget.data[i].value1 / maxValue) * chartHeight;
                    final bar2Height =
                        (widget.data[i].value2 / maxValue) * chartHeight;

                    return Stack(
                      children: [
                        // Barra 1
                        Positioned(
                          left: xOffset,
                          bottom: 0,
                          child: MouseRegion(
                            onEnter: (_) {
                              setState(() => hoveredIndex = i * 2);
                              _showTooltip(i * 2);
                            },
                            onExit: (_) {
                              setState(() => hoveredIndex = null);
                              _hideTooltip();
                            },
                            child: Container(
                              key: _barKeys[i * 2],
                              width: barWidth,
                              height: bar1Height,
                              decoration: BoxDecoration(
                                color: hoveredIndex == i * 2
                                    ? widget.color1.withOpacity(0.8)
                                    : widget.color1,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                        // Barra 2
                        Positioned(
                          left: xOffset + barWidth + barSpacing,
                          bottom: 0,
                          child: MouseRegion(
                            onEnter: (_) {
                              setState(() => hoveredIndex = i * 2 + 1);
                              _showTooltip(i * 2 + 1);
                            },
                            onExit: (_) {
                              setState(() => hoveredIndex = null);
                              _hideTooltip();
                            },
                            child: Container(
                              key: _barKeys[i * 2 + 1],
                              width: barWidth,
                              height: bar2Height,
                              decoration: BoxDecoration(
                                color: hoveredIndex == i * 2 + 1
                                    ? widget.color2.withOpacity(0.8)
                                    : widget.color2,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                );
              },
            ),
          ),
          // Etiquetas de meses
          Positioned(
            left: leftMargin,
            bottom: 0,
            right: 0,
            height: bottomMargin,
            child: Stack(
              children: List.generate(widget.data.length, (i) {
                final xOffset = i * barGroupWidth +
                    (barGroupWidth - 2 * barWidth - barSpacing) / 2;

                return Positioned(
                  left: xOffset,
                  top: 10,
                  width: 2 * barWidth + barSpacing,
                  child: Center(
                    child: Text(
                      widget.data[i].month,
                      style: TextStyle(color: widget.textColor, fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _hideTooltip();
    super.dispose();
  }
}
