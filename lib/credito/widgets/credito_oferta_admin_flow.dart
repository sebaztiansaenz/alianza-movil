import '/auth/firebase_auth/auth_util.dart';
import '/credito/widgets/credito_dashboard_left_shell.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/credito/widgets/credito_dashboard_metrics.dart';
import '/credito/widgets/credito_oferta_estado.dart';
import '/credito/credito_navigation.dart';
import '/credito/widgets/credito_oferta_proceso_page.dart';
import '/credito/widgets/credito_ui_theme.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

/// Tarjeta compacta de oferta en la pestaña Crédito. El flujo largo abre [CreditoOfertaProcesoPage].
class CreditoOfertaAdminFlow extends StatefulWidget {
  const CreditoOfertaAdminFlow({
    super.key,
    this.montoPreAprobado = 12000000,
    this.cuotaMensual = 545000,
    this.plazoAprobadoMeses = 24,
    /// Misma fila que el vacío punteado (hueco izquierdo + carrusel 88px).
    this.embeddedInDashboard = false,
  });

  /// Valores por defecto = demo anterior; en app se pasan desde `UserRecord` (Firestore `user`).
  final int montoPreAprobado;
  final int cuotaMensual;
  final int plazoAprobadoMeses;
  final bool embeddedInDashboard;

  @override
  State<CreditoOfertaAdminFlow> createState() => _CreditoOfertaAdminFlowState();
}

class _CreditoOfertaAdminFlowState extends State<CreditoOfertaAdminFlow> {
  bool _homePostDisbursement = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (FFAppState().creditoOpenProcesoDisbursement) {
        FFAppState().creditoOpenProcesoDisbursement = false;
        _openProcesoDesembolso();
      }
    });
  }

  String get _estadoOferta =>
      currentUserDocument?.estadoOfertaCredito ?? '';

  bool get _pendienteFirma =>
      _estadoOferta == CreditoOfertaEstado.pendienteFirma;

  bool get _enDesembolso =>
      _homePostDisbursement ||
      _estadoOferta == CreditoOfertaEstado.enDesembolso;

  bool get _mostrarBotonesAceptarRechazar =>
      !_pendienteFirma && !_enDesembolso;

  MaterialPageRoute<dynamic> _procesoRoute({
    bool startWithReject = false,
    bool openAtSignDocuments = false,
    bool openAtDisbursement = false,
  }) {
    return creditoMaterialPageRoute(
      CreditoOfertaProcesoPage(
        startWithReject: startWithReject,
        openAtSignDocuments: openAtSignDocuments,
        openAtDisbursement: openAtDisbursement,
        montoPreAprobado: widget.montoPreAprobado,
        cuotaMensual: widget.cuotaMensual,
        plazoAprobadoMeses: widget.plazoAprobadoMeses,
      ),
    );
  }

  Future<void> _openProcesoDesembolso() async {
    final result = await Navigator.of(context).push<dynamic>(
      _procesoRoute(openAtDisbursement: true),
    );
    if (!mounted) return;
    if (result == true) {
      setState(() => _homePostDisbursement = true);
    }
  }

  Future<void> _openProcesoAcepto() async {
    final result = await Navigator.of(context).push<dynamic>(_procesoRoute());
    if (!mounted) return;
    if (result == CreditoOfertaEstado.popPendienteFirma) {
      setState(() {});
    } else if (result == true) {
      setState(() => _homePostDisbursement = true);
    }
  }

  Future<void> _openFirmaDocumentos() async {
    final result = await Navigator.of(context).push<dynamic>(
      _procesoRoute(openAtSignDocuments: true),
    );
    if (!mounted) return;
    if (result == true) {
      setState(() => _homePostDisbursement = true);
    }
  }

  Future<void> _openProcesoRechazo() async {
    await Navigator.of(context).push<dynamic>(
      _procesoRoute(startWithReject: true),
    );
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (widget.embeddedInDashboard) {
      return _buildDashboardEmbeddedCard(context);
    }
    return _buildHomeCard(context);
  }

  /// Versión compacta para la fila Mis créditos (misma geometría que tarjeta vacía).
  Widget _buildDashboardEmbeddedCard(BuildContext context) {
    final ui = CreditoUi(context);
    final badgeLabel = _enDesembolso
        ? 'En desembolso'
        : (_pendienteFirma ? 'Pendiente firma' : 'Pre-aprobado');
    final badgeBg = _enDesembolso
        ? ui.badgeSuccessBg
        : ui.badgeNeutralBg;
    final badgeFg = _enDesembolso
        ? ui.badgeSuccessFg
        : (_pendienteFirma ? ui.brandAccent : ui.badgeNeutralFg);

    final btnStyle = ui.outlinedAction();

    final shell = CreditoDashboardLeftShell(
      showFooter: false,
      dashboardFixedHeight: CreditoDashboardMetrics.rowHeight,
      body: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Material(
              color: badgeBg,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(11),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                child: Text(
                  badgeLabel,
                  style: ui.badge(fontSize: 9, color: badgeFg),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                Text(
                  'Valor Pre-Aprobado',
                  style: ui.dashboardLabel(),
                ),
                const SizedBox(height: 2),
                AutoSizeText(
                  functions.formatAmount(widget.montoPreAprobado.toDouble()),
                  maxLines: 1,
                  minFontSize: 11,
                  style: ui.dashboardAmount(),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Expanded(
                      child: _detailBox(
                        ui,
                        'Cuota mensual',
                        functions.formatAmount(
                            widget.cuotaMensual.toDouble()),
                        compact: true,
                        tight: true,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: _detailBox(
                        ui,
                        'Plazo',
                        '${widget.plazoAprobadoMeses} meses',
                        compact: true,
                        tight: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                if (_mostrarBotonesAceptarRechazar)
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          style: btnStyle,
                          onPressed: _openProcesoAcepto,
                          child: const Text('Acepto crédito'),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: OutlinedButton(
                          style: btnStyle,
                          onPressed: _openProcesoRechazo,
                          child: const Text('Rechazo crédito'),
                        ),
                      ),
                    ],
                  )
                else if (_enDesembolso)
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: ui.surfaceSubtle,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: ui.railBorder),
                    ),
                    child: Text(
                      'Desembolso en proceso',
                      textAlign: TextAlign.center,
                      style: ui.theme.bodySmall.override(
                        fontFamily: ui.theme.bodySmallFamily,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: ui.brandAccent,
                      ),
                    ),
                  )
                else if (_pendienteFirma)
                  Text(
                    'Toca la tarjeta para firmar documentos',
                    textAlign: TextAlign.center,
                    style: ui.dashboardBody(fontSize: 10),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    if (_pendienteFirma) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _openFirmaDocumentos,
          borderRadius:
              BorderRadius.circular(CreditoDashboardMetrics.cardRadius),
          child: shell,
        ),
      );
    }
    return shell;
  }

  Widget _buildHomeCard(BuildContext context) {
    final ui = CreditoUi(context);
    final badgeLabel = _enDesembolso
        ? 'En desembolso'
        : (_pendienteFirma ? 'Pendiente firma' : 'Pre-aprobado');
    final badgeBg = _enDesembolso
        ? ui.badgeSuccessBg
        : ui.badgeNeutralBg;
    final badgeFg = _enDesembolso
        ? ui.badgeSuccessFg
        : (_pendienteFirma ? ui.brandAccent : ui.badgeNeutralFg);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ui.theme.secondaryBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ui.cardBorder, width: 1),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            offset: const Offset(0, 2),
            color: Colors.black.withOpacity(0.04),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: Material(
                  color: badgeBg,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(11),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4),
                    child: Text(
                      badgeLabel,
                      style: ui.badge(fontSize: 10, color: badgeFg),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Valor Pre-Aprobado',
                          textAlign: TextAlign.start,
                          style: ui.dashboardLabel(fontSize: 10),
                        ),
                        const SizedBox(height: 2),
                        AutoSizeText(
                          functions
                              .formatAmount(widget.montoPreAprobado.toDouble()),
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          minFontSize: 12,
                          style: ui.dashboardAmount(fontSize: 19),
                        ),
                        const SizedBox(height: 8),
                        LayoutBuilder(
                          builder: (context, constraints) {
                            final maxW = constraints.maxWidth;
                            const gap = 6.0;
                            // Más estrechas que `Expanded` 50/50; espacio libre a la derecha.
                            final wCuota = maxW * 0.42;
                            final wPlazo = maxW * 0.34;
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: wCuota,
                                  child: _detailBox(
                                    ui,
                                    'Cuota mensual',
                                    functions.formatAmount(
                                        widget.cuotaMensual.toDouble()),
                                    compact: true,
                                    tight: true,
                                  ),
                                ),
                                const SizedBox(width: gap),
                                SizedBox(
                                  width: wPlazo,
                                  child: _detailBox(
                                    ui,
                                    'Plazo',
                                    '${widget.plazoAprobadoMeses} meses',
                                    compact: true,
                                    tight: true,
                                  ),
                                ),
                                const Spacer(),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    if (_mostrarBotonesAceptarRechazar) ...[
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              style: ui.outlinedAction(fontSize: 10).copyWith(
                                padding: WidgetStateProperty.all(
                                  const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 4,
                                  ),
                                ),
                                minimumSize: WidgetStateProperty.all(
                                  const Size(0, 42),
                                ),
                              ),
                              onPressed: _openProcesoAcepto,
                              child: const Text('Acepto crédito'),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: OutlinedButton(
                              style: ui.outlinedAction(fontSize: 10).copyWith(
                                padding: WidgetStateProperty.all(
                                  const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 4,
                                  ),
                                ),
                                minimumSize: WidgetStateProperty.all(
                                  const Size(0, 42),
                                ),
                              ),
                              onPressed: _openProcesoRechazo,
                              child: const Text('Rechazo crédito'),
                            ),
                          ),
                        ],
                      ),
                    ] else if (_enDesembolso) ...[
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: ui.surfaceSubtle,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: ui.railBorder),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Desembolso en proceso',
                              textAlign: TextAlign.center,
                              style: ui.theme.bodyMedium.override(
                                fontFamily: ui.theme.bodyMediumFamily,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: ui.brandAccent,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Tu dinero estará en tu cuenta pronto.',
                              textAlign: TextAlign.center,
                              style: ui.dashboardBody(fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          _buildCreditoNominaFooter(ui),
        ],
      ),
    );
  }

  Widget _buildCreditoNominaFooter(CreditoUi ui) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            ui.cardBorder,
            ui.cardBorder.withValues(alpha: 0.1),
          ],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        border: Border.all(color: ui.cardBorder, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
        child: Row(
          children: [
            Expanded(
              child: Text(
                'Crédito de nómina',
                style: ui.theme.bodySmall.override(
                  fontFamily: ui.theme.bodySmallFamily,
                  color: ui.title,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  lineHeight: 15 / 12,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              size: 14,
              color: ui.accent,
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailBox(
    CreditoUi ui,
    String label,
    String value, {
    Color? valueColor,
    bool compact = false,
    /// Caja más pequeña (fila cuota + plazo en la tarjeta).
    bool tight = false,
  }) {
    final pad = tight ? 5.0 : (compact ? 8.0 : 14.0);
    final labelSize = tight ? 8.0 : (compact ? 11.0 : 14.0);
    final valueSize = tight ? 10.0 : (compact ? 13.0 : 17.0);
    final radius = tight ? 6.0 : (compact ? 10.0 : 12.0);
    final EdgeInsetsGeometry padding = tight
        ? const EdgeInsets.fromLTRB(5, 4, 4, 4)
        : EdgeInsets.all(pad);
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: ui.detailFill,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            textAlign: TextAlign.start,
            style: ui.detailLabel(fontSize: labelSize),
          ),
          SizedBox(height: tight ? 1 : (compact ? 2 : 4)),
          Text(
            value,
            textAlign: TextAlign.start,
            maxLines: tight ? 1 : null,
            overflow: tight ? TextOverflow.ellipsis : null,
            style: ui.detailValue(
              fontSize: valueSize,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}
