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

import '/custom_code/widgets/index.dart';
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

class DraggableFloatingButton extends StatefulWidget {
  const DraggableFloatingButton({
    Key? key,
    this.width,
    this.height,
    this.onPressed,
    this.backgroundColor,
    this.iconColor,
    this.showLabel = true,
    this.labelText = 'Ayuda',
  }) : super(key: key);

  final double? width;
  final double? height;
  final Future<dynamic> Function()? onPressed;
  final Color? backgroundColor;
  final Color? iconColor;
  /// When true, shows [labelText] in small text below the headset icon.
  final bool showLabel;
  final String labelText;

  @override
  State<DraggableFloatingButton> createState() =>
      _DraggableFloatingButtonState();
}

class _DraggableFloatingButtonState extends State<DraggableFloatingButton> {
  final GlobalKey _dragAreaKey = GlobalKey();

  double? xPosition;
  double? yPosition;

  static const double _circleSize = 60.0;
  /// Compact vertical chip: icon + small label.
  static const double _labeledWidth = 52.0;
  static const double _labeledHeight = 58.0;
  static const double _labeledRadius = 16.0;

  bool get _useLabeledStack =>
      widget.showLabel && widget.labelText.isNotEmpty;

  double get _buttonWidth =>
      _useLabeledStack ? _labeledWidth : _circleSize;

  double get _buttonHeight =>
      _useLabeledStack ? _labeledHeight : _circleSize;

  BoxDecoration _decoration({required bool circle}) {
    final color = widget.backgroundColor ?? const Color(0xFF002CE9);
    if (circle) {
      return BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(
            color: Color(0x33000000),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
          BoxShadow(
            color: Color(0x40002CE9),
            blurRadius: 8,
            offset: Offset(0, 2),
            spreadRadius: -2,
          ),
        ],
      );
    }
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(_labeledRadius),
      border: Border.all(
        color: const Color(0x45FFFFFF),
        width: 1,
      ),
      boxShadow: const [
        BoxShadow(
          color: Color(0x38000000),
          blurRadius: 14,
          offset: Offset(0, 5),
        ),
        BoxShadow(
          color: Color(0x55002CE9),
          blurRadius: 10,
          offset: Offset(0, 2),
          spreadRadius: -4,
        ),
      ],
    );
  }

  Widget _buildFace() {
    final iconColor = widget.iconColor ?? Colors.white;
    final icon = Icon(
      Icons.headset_mic_rounded,
      color: iconColor,
      size: _useLabeledStack ? 21 : 28,
    );
    if (!_useLabeledStack) {
      return Center(child: icon);
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 7, 4, 6),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(height: 4),
          Text(
            widget.labelText,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontFamily: 'Satoshi',
              color: Colors.white,
              fontSize: 10,
              height: 1.05,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonShell() {
    final decoration = _decoration(circle: !_useLabeledStack);
    return Container(
      width: _buttonWidth,
      height: _buttonHeight,
      alignment: Alignment.center,
      decoration: decoration,
      child: _buildFace(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = widget.width ?? MediaQuery.of(context).size.width;
    final height = widget.height ?? MediaQuery.of(context).size.height;

    // Posición inicial como antes (esquina inferior derecha aprox.).
    xPosition ??= (width * 0.83).clamp(0.0, width - _buttonWidth);
    yPosition ??= (height * 0.82).clamp(0.0, height - _buttonHeight);

    return SizedBox(
      key: _dragAreaKey,
      width: width,
      height: height,
      child: Stack(
        children: [
          Positioned(
            left: xPosition,
            top: yPosition,
            child: Draggable(
              feedback: Material(
                color: Colors.transparent,
                elevation: 6,
                borderRadius: BorderRadius.circular(
                  _useLabeledStack ? _labeledRadius : 30,
                ),
                child: _buildButtonShell(),
              ),
              childWhenDragging: SizedBox(
                width: _buttonWidth,
                height: _buttonHeight,
              ),
              onDragEnd: (DraggableDetails details) {
                final box = _dragAreaKey.currentContext?.findRenderObject()
                    as RenderBox?;
                if (box == null || !box.hasSize || !box.attached) {
                  return;
                }
                // details.offset es global; Positioned usa coordenadas del Stack.
                final local = box.globalToLocal(details.offset);
                setState(() {
                  xPosition = local.dx.clamp(0.0, width - _buttonWidth);
                  yPosition = local.dy.clamp(0.0, height - _buttonHeight);
                });
              },
              child: GestureDetector(
                onTap: () {
                  widget.onPressed?.call();
                },
                child: _buildButtonShell(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
