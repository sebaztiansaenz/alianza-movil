import '/credito/widgets/credito_dashboard_metrics.dart';
import '/credito/widgets/credito_ui_theme.dart';
import 'package:flutter/material.dart';

/// Columna lateral de atajos, manteniendo el estilo original pero mostrando las 4 opciones.
class CreditoQuickActionsRail extends StatelessWidget {
  const CreditoQuickActionsRail({
    super.key,
    required this.onPerfilCredito,
    required this.onSolicitar,
    required this.onSimulador,
    required this.onHistorial,
    this.height = CreditoDashboardMetrics.rowHeight,
    this.visible = true,
  });

  final VoidCallback onPerfilCredito;
  final VoidCallback onSolicitar;
  final VoidCallback onSimulador;
  final VoidCallback onHistorial;
  final double height;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    final ui = CreditoUi(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeInOut,
      width: visible ? CreditoDashboardMetrics.railWidth : 0,
      height: visible ? height : 0,
      child: visible
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
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                child: Column(
                  children: [
                    Expanded(
                      child: _ActionItem(
                        ui: ui,
                        icon: Icons.person_outline_rounded,
                        label: 'Perfil crédito',
                        onTap: onPerfilCredito,
                      ),
                    ),
                    Expanded(
                      child: _ActionItem(
                        ui: ui,
                        icon: Icons.note_add_outlined,
                        label: 'Solicitar',
                        onTap: onSolicitar,
                      ),
                    ),
                    Expanded(
                      child: _ActionItem(
                        ui: ui,
                        icon: Icons.calculate_outlined,
                        label: 'Simulador',
                        onTap: onSimulador,
                      ),
                    ),
                    Expanded(
                      child: _ActionItem(
                        ui: ui,
                        icon: Icons.history_rounded,
                        label: 'Historial',
                        onTap: onHistorial,
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
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 46,
                height: 46,
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
      ),
    );
  }
}
