import 'dart:async';

import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';

import 'alianza_auth_colors.dart';
import 'widgets/alianza_auth_fx_background.dart';
import 'widgets/alianza_auth_logo_header.dart';
import 'widgets/alianza_auth_page_layout.dart';
import 'widgets/alianza_auth_shell.dart';

class _OnboardSlide {
  const _OnboardSlide({
    required this.icon,
    required this.tag,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String tag;
  final String title;
  final String description;
}

class AlianzaOnboardingProposalWidget extends StatefulWidget {
  const AlianzaOnboardingProposalWidget({super.key});

  @override
  State<AlianzaOnboardingProposalWidget> createState() =>
      _AlianzaOnboardingProposalWidgetState();
}

class _AlianzaOnboardingProposalWidgetState
    extends State<AlianzaOnboardingProposalWidget> {
  static const _slides = [
    _OnboardSlide(
      icon: Icons.savings_outlined,
      tag: 'AHORRO',
      title: 'Tu ahorro de hoy,\ntu inversión de mañana',
      description:
          'Haz crecer tu dinero con nuestras líneas de ahorro al 9% E.A.',
    ),
    _OnboardSlide(
      icon: Icons.credit_card_outlined,
      tag: 'CRÉDITO',
      title: 'Crédito para todos,\nsin excepciones',
      description:
          'Creemos en la inclusión financiera, incluso si estás reportado o castigado.',
    ),
    _OnboardSlide(
      icon: Icons.show_chart_outlined,
      tag: 'INVERSIÓN',
      title: 'Invierte y gana\ndesde el primer día',
      description:
          'Recibe tus ganancias de forma anticipada, sin largas esperas.',
    ),
    _OnboardSlide(
      icon: Icons.account_balance_outlined,
      tag: 'REBANCARIZACIÓN',
      title: 'Tu ruta de regreso\nal sistema',
      description:
          'Te guiamos de salida con nuestras opciones de ahorro y crédito de rebancarización.',
    ),
  ];

  int _index = 0;
  Timer? _autoTimer;

  @override
  void initState() {
    super.initState();
    _startAuto();
  }

  void _startAuto() {
    _autoTimer?.cancel();
    _autoTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      if (!mounted) return;
      _next();
    });
  }

  void _goTo(int index) {
    setState(() => _index = index);
    _startAuto();
  }

  void _next() => _goTo((_index + 1) % _slides.length);

  void _prev() => _goTo((_index - 1 + _slides.length) % _slides.length);

  void _handleSwipeEnd(DragEndDetails details) {
    final velocity = details.primaryVelocity ?? 0;
    if (velocity <= -250) {
      _next();
    } else if (velocity >= 250) {
      _prev();
    }
  }

  @override
  void dispose() {
    _autoTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final slide = _slides[_index];
    final wide = MediaQuery.sizeOf(context).width > 520;

    return Scaffold(
      backgroundColor:
          wide ? const Color(0xFF1C2030) : AlianzaAuthColors.surface,
      body: AlianzaAuthShell(
        background: AlianzaOnboardingFxBackground(bgIcon: slide.icon),
        child: SafeArea(
          child: AlianzaAuthPageLayout(
            topPadding: 18,
            headerGap: 8,
            header: const Padding(
              padding: EdgeInsets.only(top: 26),
              child: AlianzaAuthLogoHeader(),
            ),
            body: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onHorizontalDragEnd: _handleSwipeEnd,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 450),
                    switchInCurve: Curves.easeOutCubic,
                    switchOutCurve: Curves.easeInCubic,
                    layoutBuilder: (currentChild, previousChildren) {
                      return Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          ...previousChildren,
                          if (currentChild != null) currentChild,
                        ],
                      );
                    },
                    transitionBuilder: (child, animation) {
                      final slideIn = Tween<Offset>(
                        begin: const Offset(0.08, 0),
                        end: Offset.zero,
                      ).animate(animation);
                      return FadeTransition(
                        opacity: animation,
                        child: SlideTransition(
                          position: slideIn,
                          child: child,
                        ),
                      );
                    },
                    child: _SlideContent(
                      key: ValueKey(_index),
                      slide: slide,
                    ),
                  ),
                ),
              ),
            ),
            bottom: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Row(
                      children: List.generate(_slides.length, (i) {
                        final active = i == _index;
                        return GestureDetector(
                          onTap: () => _goTo(i),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.easeOutCubic,
                            margin: const EdgeInsets.only(right: 7),
                            width: active ? 24 : 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: active
                                  ? AlianzaAuthColors.orange
                                  : const Color(0xFFD6D9E6),
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        );
                      }),
                    ),
                    const Spacer(),
                    _NavArrow(
                      icon: Icons.chevron_left,
                      onTap: _prev,
                    ),
                    const SizedBox(width: 8),
                    _NavArrow(
                      icon: Icons.chevron_right,
                      onTap: _next,
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                _PrimaryBtn(
                  label: 'Iniciar sesión',
                  onTap: () {
                    context.pushNamed(
                      LoginPagenewWidget.routeName,
                      extra: <String, dynamic>{
                        '__transition_info__': const TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.rightToLeft,
                          duration: Duration(milliseconds: 300),
                        ),
                      },
                    );
                  },
                ),
                const SizedBox(height: 10),
                _OutlineBtn(
                  label: 'Registrarme',
                  onTap: () {
                    context.pushNamed(
                      SelectCountryWidget.routeName,
                      extra: <String, dynamic>{
                        '__transition_info__': const TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.rightToLeft,
                          duration: Duration(milliseconds: 300),
                        ),
                      },
                    );
                  },
                ),
              ],
            ),
            footer: const _TrustFooter(),
          ),
        ),
      ),
    );
  }
}

class _SlideContent extends StatelessWidget {
  const _SlideContent({
    super.key,
    required this.slide,
  });

  final _OnboardSlide slide;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxWidth < 360;
        final titleSize = compact ? 27.0 : 31.0;
        final descSize = compact ? 13.5 : 14.5;

        return Column(
          key: key,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _IconChip(icon: slide.icon),
            const SizedBox(height: 18),
            Text(
              slide.tag,
              style: TextStyle(
                fontFamily: 'Satoshi',
                fontSize: compact ? 10 : 11,
                fontWeight: FontWeight.w700,
                letterSpacing: compact ? 3 : 4,
                color: AlianzaAuthColors.orange,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              slide.title,
              style: TextStyle(
                fontFamily: 'Satoshi',
                fontSize: titleSize,
                fontWeight: FontWeight.w700,
                height: 1.18,
                color: AlianzaAuthColors.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 72),
              child: Text(
                slide.description,
                style: TextStyle(
                  fontFamily: 'Satoshi',
                  fontSize: descSize,
                  height: 1.65,
                  color: AlianzaAuthColors.textSecondary,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _IconChip extends StatefulWidget {
  const _IconChip({required this.icon});

  final IconData icon;

  @override
  State<_IconChip> createState() => _IconChipState();
}

class _IconChipState extends State<_IconChip>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56,
      height: 56,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final scale = 0.82 + (_controller.value * 0.5);
          final opacity = 0.12 - (_controller.value * 0.08);
          return Stack(
            alignment: Alignment.center,
            children: [
              Transform.scale(
                scale: scale,
                child: Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AlianzaAuthColors.orange.withValues(alpha: opacity),
                  ),
                ),
              ),
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AlianzaAuthColors.orange.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  widget.icon,
                  size: 28,
                  color: AlianzaAuthColors.orange,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _NavArrow extends StatelessWidget {
  const _NavArrow({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFF4F5FA),
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 36,
          height: 36,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AlianzaAuthColors.border),
          ),
          child: Icon(icon, size: 18, color: AlianzaAuthColors.blue),
        ),
      ),
    );
  }
}

class _PrimaryBtn extends StatelessWidget {
  const _PrimaryBtn({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: AlianzaAuthColors.orange,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            const _ButtonSheen(),
            Center(
              child: Text(
                label,
                style: const TextStyle(
                  fontFamily: 'Satoshi',
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ButtonSheen extends StatefulWidget {
  const _ButtonSheen();

  @override
  State<_ButtonSheen> createState() => _ButtonSheenState();
}

class _ButtonSheenState extends State<_ButtonSheen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final progress =
              _controller.value <= 0.6 ? _controller.value / 0.6 : 1.0;
          return Align(
            alignment: Alignment(-1.6 + (progress * 3.2), 0),
            child: Transform.rotate(
              angle: -0.35,
              child: Container(
                width: 72,
                height: 120,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.white.withValues(alpha: 0.34),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _OutlineBtn extends StatelessWidget {
  const _OutlineBtn({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          foregroundColor: AlianzaAuthColors.blue,
          side: const BorderSide(color: AlianzaAuthColors.blue, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(
            fontFamily: 'Satoshi',
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
        child: Text(label),
      ),
    );
  }
}

class _TrustFooter extends StatelessWidget {
  const _TrustFooter();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Entidad vigilada · Datos cifrados',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Satoshi',
          fontSize: 11,
          color: AlianzaAuthColors.textMuted,
        ),
      ),
    );
  }
}
