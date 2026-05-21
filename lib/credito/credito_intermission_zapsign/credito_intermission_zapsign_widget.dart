import '/backend/api_requests/api_calls.dart';
import '/credito/services/credito_zapsign_service.dart';
import '/credito/widgets/credito_oferta_firestore_service.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/session_inactivity.dart';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Pantalla intermedia al volver de ZapSign (mismo rol que [IntermissionZapsignWidget]
/// en registro, pero para el flujo de crédito: pagaré → autorización → desembolso).
class CreditoIntermissionZapsignWidget extends StatefulWidget {
  const CreditoIntermissionZapsignWidget({super.key});

  static String routeName = 'creditoIntermissionZapsign';
  static String routePath = '/creditoIntermissionZapsign';

  @override
  State<CreditoIntermissionZapsignWidget> createState() =>
      _CreditoIntermissionZapsignWidgetState();
}

class _CreditoIntermissionZapsignWidgetState
    extends State<CreditoIntermissionZapsignWidget> with SessionActivityOnInitMixin {
  bool _procesando = true;
  String? _error;
  String _mensaje = 'Verificando firma electrónica…';

  String get _documentoLabel {
    final fase = FFAppState().creditoZapsignFase;
    if (fase == 'documentos') {
      return 'Pagaré, carta de instrucciones y autorización de nómina';
    }
    if (fase == 'pagare') return 'Pagaré y carta de instrucciones';
    if (fase == 'autorizacion') return 'Autorización de descuentos de nómina';
    return 'Documento de crédito';
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) => _onReturn());
  }

  Future<void> _onReturn() async {
    if (!mounted) return;
    setState(() {
      _procesando = true;
      _error = null;
      _mensaje = 'Verificando firma de $_documentoLabel…';
    });

    // Misma pausa que registro antes de consultar ZapSign.
    await Future<void>.delayed(const Duration(milliseconds: 3000));

    try {
      final token = FFAppState().zapsignToken;
      if (token.isEmpty) {
        throw Exception('Sin token de documento ZapSign');
      }

      final details = await GetDocumentDetailsCall.call(token: token);
      if (!(details.succeeded)) {
        throw Exception(
          GetDocumentDetailsCall.errorMessage(details.jsonBody) ??
              'No se pudo verificar la firma',
        );
      }

      final signedUrl = GetDocumentDetailsCall.signedFile(details.jsonBody);
      if (signedUrl == null || signedUrl.toString().isEmpty) {
        throw Exception(
          'El documento aún no aparece firmado. Completa la firma en ZapSign e intenta de nuevo.',
        );
      }

      final fase = FFAppState().creditoZapsignFase;
      final url = signedUrl.toString();

      if (fase == 'documentos') {
        await CreditoOfertaFirestoreService.guardarUrlsDocumentos(
          pagareUrl: url,
          autorizacionNominaUrl: url,
        );
        FFAppState().creditoZapsignFase = '';
        FFAppState().creditoOpenProcesoDisbursement = true;
        if (!mounted) return;
        context.goNamed(InvertirahorrosCopyCopyWidget.routeName);
        return;
      }

      if (fase == 'pagare') {
        await CreditoOfertaFirestoreService.guardarUrlsDocumentos(
          pagareUrl: url,
        );
        if (!mounted) return;
        setState(() {
          _mensaje = 'Pagaré firmado. Abriendo autorización de nómina…';
        });
        await CreditoZapsignService.iniciarFirmaAutorizacion();
        return;
      }

      if (fase == 'autorizacion') {
        await CreditoOfertaFirestoreService.guardarUrlsDocumentos(
          autorizacionNominaUrl: url,
        );
        FFAppState().creditoZapsignFase = '';
        FFAppState().creditoOpenProcesoDisbursement = true;
        if (!mounted) return;
        context.goNamed(InvertirahorrosCopyCopyWidget.routeName);
        return;
      }

      throw Exception('Fase de firma desconocida');
    } catch (e) {
      if (!mounted) return;
      final msg = e.toString().replaceFirst('Exception: ', '');
      setState(() {
        _error = msg;
        _procesando = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(msg),
          backgroundColor: FlutterFlowTheme.of(context).error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF006AD8), Color(0xFF002CE9)],
                begin: AlignmentDirectional(-1, 0),
                end: AlignmentDirectional(1, 0),
              ),
            ),
            padding: EdgeInsets.only(
              top: MediaQuery.paddingOf(context).top + 16,
              bottom: 16,
              left: 24,
              right: 24,
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/phone.png',
                  height: 28,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: AutoSizeText(
                    'FIRMA ELECTRÓNICA',
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily: 'Satoshi',
                          color: Colors.white,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (_procesando) ...[
                      FaIcon(
                        FontAwesomeIcons.fileSignature,
                        size: 48,
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                      const SizedBox(height: 16),
                      const CircularProgressIndicator(),
                      const SizedBox(height: 16),
                      Text(
                        _mensaje,
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _documentoLabel,
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'Satoshi',
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                      ),
                    ] else ...[
                      Text(
                        _error ?? 'No se completó la firma',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                      const SizedBox(height: 20),
                      FilledButton(
                        onPressed: () {
                          context.goNamed(
                            InvertirahorrosCopyCopyWidget.routeName,
                          );
                        },
                        child: const Text('Volver a Crédito'),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
