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

class FloatingNavBar extends StatefulWidget {
  const FloatingNavBar({
    Key? key,
    this.width,
    this.height,
    this.onLeftPressed,
    this.onCenterPressed,
    this.onRightPressed,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Future<dynamic> Function()? onLeftPressed;
  final Future<dynamic> Function()? onCenterPressed;
  final Future<dynamic> Function()? onRightPressed;

  @override
  State<FloatingNavBar> createState() => _FloatingNavBarState();
}

class _FloatingNavBarState extends State<FloatingNavBar> {
  final String leftIconUrl =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/oz8zkn6raf68/6.png';
  final String centerIconUrl =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/s661k42v83dc/1.png';
  final String rightIconUrl =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/lk1cugpilktx/8.png';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: screenWidth,
      height: screenHeight,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: Center(
              child: Container(
                width: 238,
                height: 72,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.80),
                  borderRadius: BorderRadius.circular(200),
                  border: Border.all(color: Color(0xFFE7ECFA), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFD4D4D4).withOpacity(0.40),
                      blurRadius: 64,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildCircleButton(
                      backgroundColor: Colors.transparent,
                      imageUrl: leftIconUrl,
                      onTap: () => widget.onLeftPressed?.call(),
                    ),
                    SizedBox(width: 12),
                    _buildCircleButton(
                      backgroundColor: Color(0xFFEEF1FA),
                      imageUrl: centerIconUrl,
                      onTap: () => widget.onCenterPressed?.call(),
                    ),
                    SizedBox(width: 12),
                    _buildCircleButton(
                      backgroundColor: Colors.transparent,
                      imageUrl: rightIconUrl,
                      onTap: () => widget.onRightPressed?.call(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircleButton({
    required Color backgroundColor,
    required String imageUrl,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        padding: EdgeInsets.all(6),
        child: Image.network(
          imageUrl,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return Icon(Icons.error, color: Colors.red, size: 24);
          },
        ),
      ),
    );
  }
}
