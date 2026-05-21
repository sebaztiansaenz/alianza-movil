// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:ui';

import '/custom_code/widgets/floating_nav_bar_scroll.dart';
import '/custom_code/widgets/index.dart';
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

/// Altura aproximada del menú (píldora + margen inferior).
const double kFloatingNavBarHeight = 68;

/// Espacio que debe dejar el scroll para que nada quede tapado por el menú.
double floatingNavBarClearance(BuildContext context) {
  return kFloatingNavBarHeight +
      20 +
      MediaQuery.paddingOf(context).bottom;
}

/// Mismo layout/stack original de FlutterFlow; solo paleta tema claro tipo WhatsApp.
class FloatingNavBar extends StatefulWidget {
  const FloatingNavBar({
    Key? key,
    this.width,
    this.height,
    this.onLeftPressed,
    this.onCenterPressed,
    this.onRightPressed,
    this.activeIndex,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Future<dynamic> Function()? onLeftPressed;
  final Future<dynamic> Function()? onCenterPressed;
  final Future<dynamic> Function()? onRightPressed;
  final int? activeIndex;

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

  // Vidrio claro WhatsApp: más blur + velo blanco (sin tinte oscuro).
  static double get _blurSigma => kIsWeb ? 18 : 26;

  static List<Color> get _glassGradient => kIsWeb
      ? const [Color(0x58FFFFFF), Color(0x42FFFFFF)]
      : const [Color(0x62FFFFFF), Color(0x4AFFFFFF)];

  /// Anillo exterior: define la píldora sobre fondos claros u oscuros.
  static const Color _outerRingBorder = Color(0x40263242);
  /// Borde interior brillante (efecto vidrio / bisel).
  static const Color _innerRingBorder = Color(0xE8FFFFFF);
  static const Color _activePill = Color(0xA8E9EDEF);
  static const Color _centerCircleBg = Color(0x78FFFFFF);
  static const Color _centerCircleBorder = Color(0xCCFFFFFF);
  static const Color _labelActive = Color(0xFF111B21);
  static const Color _labelInactive = Color(0xFF64748B);

  static const double _labelLineHeight = 10.5;
  static const double _iconLabelOverlap = 7.0;

  int _resolveActiveIndex(BuildContext context) {
    if (widget.activeIndex != null) {
      return widget.activeIndex!.clamp(0, 2);
    }
    try {
      final path = GoRouterState.of(context).uri.path.toLowerCase();
      if (path.contains('convenios')) return 0;
      if (path.contains('perfil')) return 2;
      if (path.contains('invertirahorros') ||
          path.contains('ahorros') ||
          path.contains('ahorro') ||
          path.contains('misinversiones') ||
          path.contains('nomina')) {
        return 1;
      }
    } catch (_) {}
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final active = _resolveActiveIndex(context);
    final scrollCtrl = FloatingNavBarScrollScopeInherited.maybeOf(context);

    Widget pill = Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: screenWidth - 16),
        child: _buildNavPill(active),
      ),
    );

    if (scrollCtrl != null) {
      pill = ValueListenableBuilder<bool>(
        valueListenable: scrollCtrl.isVisible,
        builder: (context, visible, child) {
          return AnimatedSlide(
            duration: const Duration(milliseconds: 260),
            curve: Curves.easeOutCubic,
            offset: visible ? Offset.zero : const Offset(0, 1.35),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: visible ? 1 : 0,
              child: IgnorePointer(
                ignoring: !visible,
                child: child,
              ),
            ),
          );
        },
        child: pill,
      );
    }

    // Mismo stack que FlutterFlow: pantalla completa + píldora abajo al centro.
    return SizedBox(
      width: screenWidth,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: pill,
          ),
        ],
      ),
    );
  }

  Widget _buildNavPill(int activeIndex) {
    const pillRadius = 32.0;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(pillRadius),
        border: Border.all(color: _outerRingBorder, width: 1.25),
        boxShadow: const [
          BoxShadow(
            color: Color(0x22000000),
            blurRadius: 20,
            offset: Offset(0, 6),
            spreadRadius: -4,
          ),
          BoxShadow(
            color: Color(0x18FFFFFF),
            blurRadius: 8,
            offset: Offset(0, -1),
          ),
        ],
      ),
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(pillRadius),
        border: Border.all(color: _innerRingBorder, width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(pillRadius),
        child: Stack(
          children: [
            // Capa 1: desenfoque del contenido detrás (siluetas de texto).
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: _blurSigma,
                  sigmaY: _blurSigma,
                ),
                child: const ColoredBox(color: Colors.transparent),
              ),
            ),
            // Capa 2: velo claro fino encima del blur (estilo WhatsApp).
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: _blurSigma * 0.55,
                  sigmaY: _blurSigma * 0.55,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(pillRadius),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: _glassGradient,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildNavItem(
                      index: 0,
                      activeIndex: activeIndex,
                      slotWidth: 56,
                      iconDiameter: 48,
                      imageUrl: leftIconUrl,
                      onTap: () => widget.onLeftPressed?.call(),
                      bottomLabel: 'Convenios',
                    ),
                    const SizedBox(width: 4),
                    _buildNavItem(
                      index: 1,
                      activeIndex: activeIndex,
                      slotWidth: 52,
                      iconDiameter: 52,
                      imageUrl: centerIconUrl,
                      onTap: () => widget.onCenterPressed?.call(),
                      isCenter: true,
                    ),
                    const SizedBox(width: 4),
                    _buildNavItem(
                      index: 2,
                      activeIndex: activeIndex,
                      slotWidth: 56,
                      iconDiameter: 48,
                      imageUrl: rightIconUrl,
                      onTap: () => widget.onRightPressed?.call(),
                      bottomLabel: 'Perfil',
                    ),
                  ],
                ),
              ),
            // Brillo / reflejo superior (espejo del vidrio).
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 26,
              child: IgnorePointer(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(32),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white.withValues(alpha: 0.62),
                        Colors.white.withValues(alpha: 0.22),
                        Colors.white.withValues(alpha: 0),
                      ],
                      stops: const [0.0, 0.42, 1.0],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 12,
              right: 12,
              child: Container(
                height: 1,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withValues(alpha: 0),
                      Colors.white.withValues(alpha: 0.85),
                      Colors.white.withValues(alpha: 0),
                    ],
                  ),
                ),
              ),
            ),
            // Borde inferior suave (separa del contenido detrás).
            Positioned(
              left: 8,
              right: 8,
              bottom: 0,
              child: IgnorePointer(
                child: Container(
                  height: 1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0x00000000),
                        Color(0x28000000),
                        Color(0x00000000),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _labelStyle(bool active) {
    return TextStyle(
      fontFamily: 'Satoshi',
      fontSize: 10,
      height: 1.0,
      letterSpacing: 0.15,
      fontWeight: FontWeight.w600,
      color: active ? _labelActive : _labelInactive,
      // Legible sobre fondos oscuros (tarjeta azul) al ver el vidrio.
      shadows: const [
        Shadow(color: Color(0xCCFFFFFF), blurRadius: 5),
        Shadow(
          color: Color(0x33000000),
          blurRadius: 2,
          offset: Offset(0, 1),
        ),
      ],
    );
  }

  Widget _buildNavItem({
    required int index,
    required int activeIndex,
    required double slotWidth,
    required double iconDiameter,
    required String imageUrl,
    required VoidCallback onTap,
    String? bottomLabel,
    bool isCenter = false,
  }) {
    final active = index == activeIndex;
    final pad = iconDiameter <= 50 ? 4.0 : 6.0;
    final label = bottomLabel;
    final stackHeight = label != null
        ? iconDiameter + _labelLineHeight - _iconLabelOverlap
        : iconDiameter;

    final iconChild = Image.network(
      imageUrl,
      fit: BoxFit.contain,
      alignment: Alignment.bottomCenter,
      errorBuilder: (context, error, stackTrace) {
        return const Icon(Icons.error, color: Colors.red, size: 18);
      },
    );

    final Widget iconCircle = isCenter
        ? Container(
            width: iconDiameter,
            height: iconDiameter,
            decoration: BoxDecoration(
              color: _centerCircleBg,
              shape: BoxShape.circle,
              border: Border.all(color: _centerCircleBorder, width: 1),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x0F002CE9),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            padding: EdgeInsets.all(pad),
            child: iconChild,
          )
        : Container(
            width: iconDiameter,
            height: iconDiameter,
            padding: EdgeInsets.all(pad),
            child: iconChild,
          );

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        splashColor: const Color(0x12002CE9),
        highlightColor: const Color(0x08002CE9),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          width: slotWidth,
          height: stackHeight,
          decoration: BoxDecoration(
            color: (!isCenter && active) ? _activePill : Colors.transparent,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: iconCircle,
              ),
              if (label != null)
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textHeightBehavior: const TextHeightBehavior(
                      applyHeightToFirstAscent: false,
                      applyHeightToLastDescent: false,
                    ),
                    style: _labelStyle(active),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
