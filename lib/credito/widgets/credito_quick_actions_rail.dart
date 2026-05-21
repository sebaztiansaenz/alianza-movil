import 'dart:async';

import '/credito/widgets/credito_dashboard_metrics.dart';
import '/credito/widgets/credito_ui_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show ScrollDirection;

/// Altura de cada ítem (ícono + etiqueta + separación).
const double _kActionItemStride = 82;

/// Columna lateral: carrusel vertical automático (lento) + scroll manual.
class CreditoQuickActionsRail extends StatefulWidget {
  const CreditoQuickActionsRail({
    super.key,
    required this.onPerfilCredito,
    required this.onSolicitar,
    required this.onSimulador,
    required this.onHistorial,
    this.height = CreditoDashboardMetrics.rowHeight,
    this.visible = true,
    this.scrollPixelsPerTick = 0.28,
    this.tickDuration = const Duration(milliseconds: 45),
    this.resumeAutoScrollAfter = const Duration(seconds: 2),
  });

  final VoidCallback onPerfilCredito;
  final VoidCallback onSolicitar;
  final VoidCallback onSimulador;
  final VoidCallback onHistorial;
  final double height;
  final bool visible;
  final double scrollPixelsPerTick;
  final Duration tickDuration;
  final Duration resumeAutoScrollAfter;

  @override
  State<CreditoQuickActionsRail> createState() => _CreditoQuickActionsRailState();
}

class _CreditoQuickActionsRailState extends State<CreditoQuickActionsRail> {
  late ScrollController _scrollController;
  Timer? _autoScrollTimer;
  Timer? _resumeAutoScrollTimer;
  bool _autoScrollPaused = false;

  List<_ActionData> get _actions => [
        _ActionData(
          icon: Icons.person_outline_rounded,
          label: 'Perfil crédito',
          onTap: widget.onPerfilCredito,
        ),
        _ActionData(
          icon: Icons.note_add_outlined,
          label: 'Solicitar',
          onTap: widget.onSolicitar,
        ),
        _ActionData(
          icon: Icons.calculate_outlined,
          label: 'Simulador',
          onTap: widget.onSimulador,
        ),
        _ActionData(
          icon: Icons.history_rounded,
          label: 'Historial',
          onTap: widget.onHistorial,
        ),
      ];

  double get _cycleLength => _actions.length * _kActionItemStride;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) => _initScrollAndStart());
  }

  @override
  void didUpdateWidget(CreditoQuickActionsRail oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.visible && !oldWidget.visible) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _initScrollAndStart());
    } else if (!widget.visible) {
      _autoScrollTimer?.cancel();
    }
  }

  void _initScrollAndStart() {
    if (!mounted || !widget.visible) return;
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_cycleLength);
    }
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _autoScrollTimer?.cancel();
    if (!widget.visible) return;
    _autoScrollTimer = Timer.periodic(widget.tickDuration, (_) {
      if (!mounted ||
          !widget.visible ||
          !_scrollController.hasClients ||
          _autoScrollPaused) {
        return;
      }
      final cycle = _cycleLength;
      var next = _scrollController.offset + widget.scrollPixelsPerTick;
      if (next >= cycle * 2) {
        next -= cycle;
      }
      _scrollController.jumpTo(next);
    });
  }

  void _pauseAutoScroll() {
    if (_autoScrollPaused) return;
    setState(() => _autoScrollPaused = true);
    _resumeAutoScrollTimer?.cancel();
  }

  void _scheduleResumeAutoScroll() {
    _resumeAutoScrollTimer?.cancel();
    _resumeAutoScrollTimer = Timer(widget.resumeAutoScrollAfter, () {
      if (!mounted) return;
      _normalizeScrollPosition();
      setState(() => _autoScrollPaused = false);
    });
  }

  void _normalizeScrollPosition() {
    if (!_scrollController.hasClients) return;
    final offset = _scrollController.offset;
    final cycle = _cycleLength;
    if (offset < cycle * 0.25) {
      _scrollController.jumpTo(offset + cycle);
    } else if (offset > cycle * 2.75) {
      _scrollController.jumpTo(offset - cycle);
    }
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification.depth != 0) return false;

    if (notification is UserScrollNotification) {
      if (notification.direction != ScrollDirection.idle) {
        _pauseAutoScroll();
      } else {
        _normalizeScrollPosition();
        _scheduleResumeAutoScroll();
      }
    } else if (notification is ScrollEndNotification) {
      _normalizeScrollPosition();
      _scheduleResumeAutoScroll();
    }
    return false;
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _resumeAutoScrollTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ui = CreditoUi(context);
    final looped = [..._actions, ..._actions, ..._actions];

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: widget.visible ? CreditoDashboardMetrics.railWidth : 0,
      height: widget.height,
      child: widget.visible
          ? DecoratedBox(
              decoration: BoxDecoration(
                color: ui.theme.secondaryBackground,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: ui.railBorder),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.02),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  children: [
                    NotificationListener<ScrollNotification>(
                      onNotification: _handleScrollNotification,
                      child: ListView.builder(
                        controller: _scrollController,
                        physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics(),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        itemCount: looped.length,
                        itemExtent: _kActionItemStride,
                        itemBuilder: (context, index) {
                          final action = looped[index];
                          return _ActionItem(
                            ui: ui,
                            icon: action.icon,
                            label: action.label,
                            onTap: action.onTap,
                          );
                        },
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      height: 24,
                      child: IgnorePointer(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                ui.theme.secondaryBackground,
                                ui.theme.secondaryBackground
                                    .withValues(alpha: 0),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      height: 24,
                      child: IgnorePointer(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                ui.theme.secondaryBackground,
                                ui.theme.secondaryBackground
                                    .withValues(alpha: 0),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}

class _ActionData {
  const _ActionData({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
}

class _ActionItem extends StatelessWidget {
  const _ActionItem({
    required this.ui,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final CreditoUi ui;
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: ui.iconCircleBg,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, size: 20, color: ui.title),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: ui.railLabel(),
            ),
          ],
        ),
      ),
    );
  }
}
