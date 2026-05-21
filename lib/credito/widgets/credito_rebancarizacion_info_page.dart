import '/credito/credito_navigation.dart';
import '/credito/widgets/credito_ui_theme.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'credito_rebancarizacion_checkout_page.dart';
import 'package:flutter/material.dart';

/// Plan de rebancarización.
class CreditoRebancarizacionInfoPage extends StatelessWidget {
  const CreditoRebancarizacionInfoPage({super.key});

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
                      'Plan de Rebancarización',
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
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
              child: Text(
                'Este programa está diseñado para estructurar tu recuperación financiera a través de tres pasos clave:',
                style: theme.bodyMedium.override(
                  fontFamily: theme.bodyMediumFamily,
                  fontSize: 14,
                  color: theme.secondaryText,
                  lineHeight: 1.4,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  _StepCard(
                    number: '1',
                    text:
                        'Validación de títulos valor de sus obligaciones actuales.',
                  ),
                  SizedBox(height: 16),
                  _StepCard(
                    number: '2',
                    text:
                        'Inicio de línea de ahorro especializada de Rebancarización.',
                  ),
                  SizedBox(height: 16),
                  _StepCard(
                    number: '3',
                    text: 'Acceso directo al crédito de Rebancarización.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.customColor4.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Aclaración importante:',
                      style: theme.bodyMedium.override(
                        fontFamily: theme.bodyMediumFamily,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: theme.primaryText,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Alianza Capital no es una casa de cobranza. El valor del diagnóstico (\$99.000) corresponde exclusivamente a la asesoría sobre su estado actual en centrales de riesgo (DataCrédito y TransUnion) y la estructuración de posibles soluciones para su situación financiera.',
                      style: theme.bodySmall.override(
                        fontFamily: theme.bodySmallFamily,
                        fontSize: 13,
                        color: theme.secondaryText,
                        lineHeight: 1.5,
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
                  onPressed: () async {
                    final paid = await Navigator.of(context).push<bool>(
                      creditoMaterialPageRoute(
                        const CreditoRebancarizacionCheckoutPage(),
                      ),
                    );
                    if (paid == true && context.mounted) {
                      Navigator.of(context).pop(true);
                    }
                  },
                  child: const Text('Acceder al programa'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StepCard extends StatelessWidget {
  const _StepCard({required this.number, required this.text});

  final String number;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    final ui = CreditoUi(context);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.secondaryBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.alternate),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: ui.iconCircleBg,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              number,
              style: theme.bodyMedium.override(
                fontFamily: theme.bodyMediumFamily,
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: CreditoUi.fabBlue,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                text,
                style: theme.bodyMedium.override(
                  fontFamily: theme.bodyMediumFamily,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: theme.primaryText,
                  lineHeight: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
