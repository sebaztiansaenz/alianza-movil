import '/credito/widgets/credito_dashboard_left_shell.dart';
import '/credito/widgets/credito_dashboard_metrics.dart';
import '/credito/widgets/credito_oferta_admin_flow.dart';
import '/credito/widgets/credito_quick_actions_rail.dart';
import '/credito/credito_navigation.dart';
import '/credito/widgets/credito_rebancarizacion_info_page.dart';
import '/credito/widgets/credito_ui_theme.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

/// Dashboard Mis créditos + Rebancarización.
class CreditoMisCreditosHomeSection extends StatelessWidget {
  const CreditoMisCreditosHomeSection({
    super.key,
    required this.onPerfilCredito,
    required this.onSolicitar,
    required this.onSimulador,
    required this.onHistorial,
    this.perfilCredito = false,
    this.montoPreAprobado = 0,
    this.cuotaMensual = 0,
    this.plazoAprobadoMeses = 0,
    this.rebancarizacionProgramaActivo = false,
    this.ahorroRebankActual = 0,
    this.metaAhorroRebank = 300000,
    this.pasoRebank = 2,
    this.onAbonarRebank,
    this.onDetallesRebank,
    this.onRebancarizacionActivada,
  });

  final VoidCallback onPerfilCredito;
  final VoidCallback onSolicitar;
  final VoidCallback onSimulador;
  final VoidCallback onHistorial;
  final bool perfilCredito;
  final int montoPreAprobado;
  final int cuotaMensual;
  final int plazoAprobadoMeses;
  final bool rebancarizacionProgramaActivo;
  final int ahorroRebankActual;
  final int metaAhorroRebank;
  final int pasoRebank;
  final VoidCallback? onAbonarRebank;
  final VoidCallback? onDetallesRebank;
  final VoidCallback? onRebancarizacionActivada;

  @override
  Widget build(BuildContext context) {
    final ui = CreditoUi(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _CreditoMisCreditosDashboardRow(
          perfilCredito: perfilCredito,
          montoPreAprobado: montoPreAprobado,
          cuotaMensual: cuotaMensual,
          plazoAprobadoMeses: plazoAprobadoMeses,
          emptyPlaceholder: _buildEmptyActiveCreditsCard(context),
          onPerfilCredito: onPerfilCredito,
          onSolicitar: onSolicitar,
          onSimulador: onSimulador,
          onHistorial: onHistorial,
        ),
        const SizedBox(height: 32),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text('Rebancarización', style: ui.sectionTitle()),
        ),
        const SizedBox(height: 16),
        if (rebancarizacionProgramaActivo)
          _RebankActiveCard(
            ahorroActual: ahorroRebankActual,
            metaAhorro: metaAhorroRebank,
            paso: pasoRebank,
            onAbonar: onAbonarRebank,
            onDetalles: onDetallesRebank,
          )
        else
          _PremiumRebankCta(
            onAdquirir: () async {
              final paid = await Navigator.of(context).push<bool>(
                creditoMaterialPageRoute(const CreditoRebancarizacionInfoPage()),
              );
              if (paid == true && context.mounted) {
                onRebancarizacionActivada?.call();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '¡Pago exitoso! Bienvenido al programa de rebancarización.',
                      style: ui.theme.bodyMedium,
                    ),
                  ),
                );
              }
            },
          ),
      ],
    );
  }

  Widget _buildEmptyActiveCreditsCard(BuildContext context) {
    final ui = CreditoUi(context);
    return CreditoDashboardLeftShell(
      dashedBorder: true,
      showFooter: false,
      dashboardFixedHeight: CreditoDashboardMetrics.rowHeight,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: ui.iconCircleBg,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.credit_card_outlined,
                size: 22,
                color: CreditoUi.fabBlue,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Aún no tienes créditos activos',
              textAlign: TextAlign.center,
              style: ui.dashboardTitle(),
            ),
            const SizedBox(height: 6),
            Text(
              'Aquí aparecerá la información y el estado de tus futuros créditos en Alianza.',
              textAlign: TextAlign.center,
              style: ui.dashboardBody(),
            ),
          ],
        ),
      ),
    );
  }
}

/// Fila tarjeta + menú lateral; el botón ⋮ muestra u oculta los atajos.
class _CreditoMisCreditosDashboardRow extends StatefulWidget {
  const _CreditoMisCreditosDashboardRow({
    required this.perfilCredito,
    required this.montoPreAprobado,
    required this.cuotaMensual,
    required this.plazoAprobadoMeses,
    required this.emptyPlaceholder,
    required this.onPerfilCredito,
    required this.onSolicitar,
    required this.onSimulador,
    required this.onHistorial,
  });

  final bool perfilCredito;
  final int montoPreAprobado;
  final int cuotaMensual;
  final int plazoAprobadoMeses;
  final Widget emptyPlaceholder;
  final VoidCallback onPerfilCredito;
  final VoidCallback onSolicitar;
  final VoidCallback onSimulador;
  final VoidCallback onHistorial;

  @override
  State<_CreditoMisCreditosDashboardRow> createState() =>
      _CreditoMisCreditosDashboardRowState();
}

class _CreditoMisCreditosDashboardRowState
    extends State<_CreditoMisCreditosDashboardRow> {
  bool _sidebarVisible = true;

  @override
  Widget build(BuildContext context) {
    final ui = CreditoUi(context);
    final mostrarOferta =
        widget.perfilCredito && widget.montoPreAprobado > 0;
    final rowHeight = mostrarOferta
        ? CreditoDashboardMetrics.rowHeightWithOffer
        : CreditoDashboardMetrics.rowHeight;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(child: Text('Mis créditos', style: ui.sectionTitle())),
            Material(
              color: ui.iconCircleBg,
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                onTap: () => setState(() => _sidebarVisible = !_sidebarVisible),
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  width: 36,
                  height: 36,
                  child: Icon(
                    Icons.more_vert_rounded,
                    size: 18,
                    color: ui.brandAccent,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: rowHeight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: mostrarOferta
                    ? CreditoOfertaAdminFlow(
                        embeddedInDashboard: true,
                        montoPreAprobado: widget.montoPreAprobado,
                        cuotaMensual: widget.cuotaMensual,
                        plazoAprobadoMeses: widget.plazoAprobadoMeses,
                      )
                    : widget.emptyPlaceholder,
              ),
              SizedBox(
                width:
                    _sidebarVisible ? CreditoDashboardMetrics.columnGap : 0,
              ),
              CreditoQuickActionsRail(
                visible: _sidebarVisible,
                height: rowHeight,
                onPerfilCredito: widget.onPerfilCredito,
                onSolicitar: widget.onSolicitar,
                onSimulador: widget.onSimulador,
                onHistorial: widget.onHistorial,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PremiumRebankCta extends StatelessWidget {
  const _PremiumRebankCta({required this.onAdquirir});

  final VoidCallback onAdquirir;

  @override
  Widget build(BuildContext context) {
    final ui = CreditoUi(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: ui.heroGradient,
        boxShadow: [
          BoxShadow(
            color: ui.brandAccent.withValues(alpha: 0.25),
            blurRadius: 32,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Positioned(
              top: -40,
              right: -40,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      ui.accent.withValues(alpha: 0.15),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.2),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'OFERTA EXCLUSIVA',
                      style: ui.theme.labelSmall.override(
                        fontFamily: ui.theme.labelSmallFamily,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '¿Reportado en centrales de riesgo?',
                    style: ui.theme.headlineSmall.override(
                      fontFamily: ui.theme.headlineSmallFamily,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: ui.theme.secondaryBackground,
                      lineHeight: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Obtén tu diagnóstico financiero detallado y un plan de acción para recuperar tu acceso al crédito.',
                    style: ui.theme.bodySmall.override(
                      fontFamily: ui.theme.bodySmallFamily,
                      fontSize: 13,
                      color: ui.theme.secondaryBackground.withValues(alpha: 0.85),
                      lineHeight: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: ui.theme.secondaryBackground,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '\$ 150.000',
                                style: ui.theme.bodySmall.override(
                                  fontFamily: ui.theme.bodySmallFamily,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: ui.muted,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              Text(
                                functions.formatAmount(99000),
                                style: ui.theme.headlineSmall.override(
                                  fontFamily: ui.theme.headlineSmallFamily,
                                  fontSize: 26,
                                  fontWeight: FontWeight.w800,
                                  color: ui.brandAccent,
                                  letterSpacing: -0.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: ui.promoChipBg,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'Ahorras 34%',
                            style: ui.theme.labelSmall.override(
                              fontFamily: ui.theme.labelSmallFamily,
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              color: ui.accent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ui.accent,
                        foregroundColor: ui.theme.secondaryBackground,
                        elevation: 0,
                        shadowColor: ui.accent.withValues(alpha: 0.3),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        textStyle: ui.theme.bodyMedium.override(
                          fontFamily: ui.theme.bodyMediumFamily,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: ui.theme.secondaryBackground,
                        ),
                      ),
                      onPressed: onAdquirir,
                      child: const Text('Adquirir diagnóstico ahora'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RebankActiveCard extends StatelessWidget {
  const _RebankActiveCard({
    required this.ahorroActual,
    required this.metaAhorro,
    required this.paso,
    this.onAbonar,
    this.onDetalles,
  });

  final int ahorroActual;
  final int metaAhorro;
  final int paso;
  final VoidCallback? onAbonar;
  final VoidCallback? onDetalles;

  @override
  Widget build(BuildContext context) {
    final ui = CreditoUi(context);
    final progress = metaAhorro > 0
        ? (ahorroActual / metaAhorro).clamp(0.0, 1.0)
        : 0.0;

    return Container(
      decoration: BoxDecoration(
        color: ui.theme.secondaryBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ui.brandAccent, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: ui.brandAccent.withValues(alpha: 0.08),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(height: 4, color: ui.brandAccent),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Línea RebankCoop',
                      style: ui.theme.bodyMedium.override(
                        fontFamily: ui.theme.bodyMediumFamily,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: ui.title,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: ui.badgeSuccessBg,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'ACTIVA',
                        style: ui.badge(
                          fontSize: 11,
                          color: ui.badgeSuccessFg,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: ui.surfaceSubtle,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: ui.railBorder),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: ui.brandAccent,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '$paso',
                          style: ui.theme.bodySmall.override(
                            fontFamily: ui.theme.bodySmallFamily,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: ui.theme.secondaryBackground,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ahorro Programado',
                              style: ui.theme.bodyMedium.override(
                                fontFamily: ui.theme.bodyMediumFamily,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: ui.brandAccent,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'Construye tu base para habilitar el crédito.',
                              style: ui.theme.bodySmall.override(
                                fontFamily: ui.theme.bodySmallFamily,
                                fontSize: 13,
                                color: ui.muted,
                                lineHeight: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ahorro actual',
                            style: ui.dashboardLabel(fontSize: 12),
                          ),
                          Text(
                            functions.formatAmount(ahorroActual.toDouble()),
                            style: ui.theme.headlineSmall.override(
                              fontFamily: ui.theme.headlineSmallFamily,
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: ui.title,
                              letterSpacing: -0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Meta: ${functions.formatAmount(metaAhorro.toDouble())}',
                      style: ui.dashboardLabel(fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 8,
                    backgroundColor: ui.railBorder,
                    valueColor: AlwaysStoppedAnimation<Color>(ui.accent),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ui.brandAccent,
                          foregroundColor: ui.theme.secondaryBackground,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          textStyle: ui.theme.bodyMedium.override(
                            fontFamily: ui.theme.bodyMediumFamily,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: ui.theme.secondaryBackground,
                          ),
                        ),
                        onPressed: onAbonar,
                        child: const Text('Abonar a mi meta'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: ui.brandAccent,
                          side: BorderSide(color: ui.brandAccent),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          textStyle: ui.theme.bodyMedium.override(
                            fontFamily: ui.theme.bodyMediumFamily,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: ui.brandAccent,
                          ),
                        ),
                        onPressed: onDetalles,
                        child: const Text('Detalles'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
