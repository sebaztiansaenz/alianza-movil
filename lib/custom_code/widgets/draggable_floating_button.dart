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
  }) : super(key: key);

  final double? width;
  final double? height;
  final Future<dynamic> Function()? onPressed;
  final Color? backgroundColor;
  final Color? iconColor;

  @override
  State<DraggableFloatingButton> createState() =>
      _DraggableFloatingButtonState();
}

class _DraggableFloatingButtonState extends State<DraggableFloatingButton> {
  double? xPosition;
  double? yPosition;

  @override
  Widget build(BuildContext context) {
    final width = widget.width ?? MediaQuery.of(context).size.width;
    final height = widget.height ?? MediaQuery.of(context).size.height;

    // Inicializar en esquina inferior derecha
    xPosition ??= width * 0.83; // 83% del ancho (derecha)
    yPosition ??= height * 0.82; // 82% de la altura (abajo)

    print('🟢 Widget: ${width}x$height');
    print('📍 Posición: x=$xPosition, y=$yPosition');

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Positioned(
            left: xPosition,
            top: yPosition,
            child: Draggable(
              feedback: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: widget.backgroundColor ?? Color(0xFF002CE9),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.headset_mic,
                  color: widget.iconColor ?? Colors.white,
                  size: 28,
                ),
              ),
              childWhenDragging: Container(),
              onDragEnd: (details) {
                setState(() {
                  xPosition = details.offset.dx;
                  yPosition = details.offset.dy;

                  // Mantener dentro de límites
                  if (xPosition! < 0) xPosition = 0;
                  if (xPosition! > width - 60) xPosition = width - 60;
                  if (yPosition! < 0) yPosition = 0;
                  if (yPosition! > height - 60) yPosition = height - 60;

                  print('🔵 Nueva posición: x=$xPosition, y=$yPosition');
                });
              },
              child: GestureDetector(
                onTap: () {
                  print('🟠 Tap');
                  widget.onPressed?.call();
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: widget.backgroundColor ?? Color(0xFF002CE9),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.headset_mic,
                    color: widget.iconColor ?? Colors.white,
                    size: 28,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
