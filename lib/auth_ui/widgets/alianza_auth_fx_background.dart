import 'package:flutter/material.dart';

import '../alianza_auth_colors.dart';

/// Fondo animado estilo HTML (ondas + mesh) para login.
class AlianzaLoginFxBackground extends StatelessWidget {
  const AlianzaLoginFxBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      fit: StackFit.expand,
      children: [
        _WaveBlob(
          size: 420,
          top: -180,
          left: -120,
          color: Color(0x0F1E35B7),
          duration: Duration(seconds: 12),
        ),
        _WaveBlob(
          size: 380,
          bottom: -160,
          right: -100,
          color: Color(0x0DF57601),
          duration: Duration(seconds: 15),
        ),
        _MeshGrid(opacity: 0.035),
        _Orb(
          size: 160,
          top: 120,
          left: -50,
          color: Color(0x211E35B7),
          duration: Duration(seconds: 13),
        ),
        _Orb(
          size: 140,
          bottom: 160,
          right: -40,
          color: Color(0x1CF57601),
          duration: Duration(seconds: 16),
        ),
      ],
    );
  }
}

/// Fondo onboarding: grid + orbes + icono decorativo.
class AlianzaOnboardingFxBackground extends StatelessWidget {
  const AlianzaOnboardingFxBackground({
    super.key,
    required this.bgIcon,
  });

  final IconData bgIcon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const _MeshGrid(opacity: 0.028, cellSize: 40),
        const _Orb(
          size: 190,
          top: 40,
          left: -70,
          color: Color(0x2A7B6FD4),
          duration: Duration(seconds: 13),
        ),
        const _Orb(
          size: 160,
          bottom: 100,
          right: -50,
          color: Color(0x18F57601),
          duration: Duration(seconds: 16),
        ),
        Positioned(
          top: 72,
          right: -30,
          child: Icon(
            bgIcon,
            size: 220,
            color: AlianzaAuthColors.blue.withValues(alpha: 0.045),
          ),
        ),
      ],
    );
  }
}

class _MeshGrid extends StatefulWidget {
  const _MeshGrid({required this.opacity, this.cellSize = 44});

  final double opacity;
  final double cellSize;

  @override
  State<_MeshGrid> createState() => _MeshGridState();
}

class _MeshGridState extends State<_MeshGrid>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c;

  @override
  void initState() {
    super.initState();
    _c = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _c,
      builder: (context, child) {
        return CustomPaint(
          painter: _GridPainter(
            offset: widget.cellSize * _c.value,
            cellSize: widget.cellSize,
            color: AlianzaAuthColors.blue.withValues(alpha: widget.opacity),
          ),
          size: Size.infinite,
        );
      },
    );
  }
}

class _GridPainter extends CustomPainter {
  _GridPainter({
    required this.offset,
    required this.cellSize,
    required this.color,
  });

  final double offset;
  final double cellSize;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    for (double x = -cellSize + offset; x < size.width + cellSize; x += cellSize) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = -cellSize + offset; y < size.height + cellSize; y += cellSize) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(_GridPainter old) => old.offset != offset;
}

class _Orb extends StatefulWidget {
  const _Orb({
    required this.size,
    required this.color,
    required this.duration,
    this.top,
    this.left,
    this.right,
    this.bottom,
  });

  final double size;
  final Color color;
  final Duration duration;
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;

  @override
  State<_Orb> createState() => _OrbState();
}

class _OrbState extends State<_Orb> with SingleTickerProviderStateMixin {
  late final AnimationController _c;

  @override
  void initState() {
    super.initState();
    _c = AnimationController(vsync: this, duration: widget.duration)
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _c,
      builder: (context, child) {
        final t = _c.value;
        return Positioned(
          top: widget.top != null ? widget.top! + 20 * t : null,
          left: widget.left != null ? widget.left! + 15 * t : null,
          right: widget.right,
          bottom: widget.bottom != null ? widget.bottom! - 18 * t : null,
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.color,
              boxShadow: [
                BoxShadow(
                  color: widget.color,
                  blurRadius: 45,
                  spreadRadius: 10,
                ),
              ],
            ),
          ),
        );
      },
      child: null,
    );
  }
}

class _WaveBlob extends StatefulWidget {
  const _WaveBlob({
    required this.size,
    required this.color,
    required this.duration,
    this.top,
    this.left,
    this.right,
    this.bottom,
  });

  final double size;
  final Color color;
  final Duration duration;
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;

  @override
  State<_WaveBlob> createState() => _WaveBlobState();
}

class _WaveBlobState extends State<_WaveBlob>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c;

  @override
  void initState() {
    super.initState();
    _c = AnimationController(vsync: this, duration: widget.duration)
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _c,
      builder: (context, _) {
        return Positioned(
          top: widget.top != null ? widget.top! - 10 * _c.value : null,
          left: widget.left != null ? widget.left! - 12 * _c.value : null,
          right: widget.right,
          bottom: widget.bottom,
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(widget.size * 0.45),
            ),
          ),
        );
      },
    );
  }
}
