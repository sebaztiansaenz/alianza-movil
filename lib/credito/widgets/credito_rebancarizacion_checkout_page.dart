import '/credito/widgets/credito_ui_theme.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

/// Confirmar pago del diagnóstico de rebancarización.
class CreditoRebancarizacionCheckoutPage extends StatelessWidget {
  const CreditoRebancarizacionCheckoutPage({super.key});

  static const int _subtotal = 150000;
  static const int _descuento = 51000;
  static const int _total = 99000;
  static const double _kPrimaryButtonHeight = 48.0;

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    final topPad = valueOrDefault<double>(
      MediaQuery.sizeOf(context).height * 0.07584,
      64.0,
    );

    return Scaffold(
      backgroundColor: theme.secondaryBackground,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(bottom: 32, top: topPad),
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0, 24.0, 10.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: theme.primaryText,
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(
                      minWidth: 44,
                      minHeight: 44,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Confirmar pago',
                      style: theme.bodyMedium.override(
                        fontFamily: theme.bodyMediumFamily,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: theme.primaryText,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Text(
                'Estás a un paso de iniciar tu proceso de recuperación financiera.',
                style: theme.bodyMedium.override(
                  fontFamily: theme.bodyMediumFamily,
                  fontSize: 14,
                  color: theme.secondaryText,
                  lineHeight: 1.4,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: theme.secondaryBackground,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: theme.alternate),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.03),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _summaryRow(
                      context,
                      'Servicio',
                      'Diagnóstico Financiero',
                      valueColor: CreditoUi.fabBlue,
                    ),
                    _summaryRow(
                      context,
                      'Subtotal',
                      functions.formatAmount(_subtotal.toDouble()),
                    ),
                    _summaryRow(
                      context,
                      'Descuento aplicado',
                      '- ${functions.formatAmount(_descuento.toDouble())}',
                      valueColor: theme.customColor4,
                    ),
                    Divider(height: 32, color: theme.alternate),
                    _summaryRow(
                      context,
                      'Total a pagar',
                      functions.formatAmount(_total.toDouble()),
                      labelBold: true,
                      valueSize: 20,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Método de pago',
                style: theme.bodyMedium.override(
                  fontFamily: theme.bodyMediumFamily,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: theme.primaryText,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.primaryBackground,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: CreditoUi.fabBlue,
                    width: 1.5,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: theme.secondaryBackground,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.account_balance_wallet_outlined,
                        color: CreditoUi.fabBlue,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ahorros Alianza',
                            style: theme.bodyMedium.override(
                              fontFamily: theme.bodyMediumFamily,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: theme.primaryText,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Saldo disponible: consulta en app',
                            style: theme.bodySmall.override(
                              fontFamily: theme.bodySmallFamily,
                              fontSize: 13,
                              color: theme.secondaryText,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: CreditoUi.fabBlue,
                          width: 6,
                        ),
                        color: theme.secondaryBackground,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                height: _kPrimaryButtonHeight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.customColor4,
                    foregroundColor: theme.secondaryBackground,
                    elevation: 0,
                    minimumSize:
                        const Size.fromHeight(_kPrimaryButtonHeight),
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: theme.bodyMedium.override(
                      fontFamily: theme.bodyMediumFamily,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: theme.secondaryBackground,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text(
                    'Confirmar y pagar ${functions.formatAmount(_total.toDouble())}',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _summaryRow(
    BuildContext context,
    String label,
    String value, {
    Color? valueColor,
    bool labelBold = false,
    double valueSize = 15,
  }) {
    final theme = FlutterFlowTheme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: theme.bodyMedium.override(
              fontFamily: theme.bodyMediumFamily,
              fontSize: 14,
              fontWeight: labelBold ? FontWeight.w700 : FontWeight.w400,
              color: labelBold ? theme.primaryText : theme.secondaryText,
            ),
          ),
          Text(
            value,
            style: theme.bodyMedium.override(
              fontFamily: theme.bodyMediumFamily,
              fontSize: valueSize,
              fontWeight: FontWeight.w700,
              color: valueColor ?? theme.primaryText,
            ),
          ),
        ],
      ),
    );
  }
}
