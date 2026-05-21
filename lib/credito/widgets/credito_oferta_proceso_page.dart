import 'dart:async';

import '/credito/services/credito_documentos_service.dart';
import '/credito/services/credito_zapsign_service.dart';
import '/credito/widgets/credito_oferta_estado.dart';
import '/credito/widgets/credito_oferta_firestore_service.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/session_inactivity.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Pantalla completa: confirmación, carga, firma y desembolso (o solo rechazo).
/// Devuelve `true` si el usuario finalizó el desembolso correctamente.
class CreditoOfertaProcesoPage extends StatefulWidget {
  const CreditoOfertaProcesoPage({
    super.key,
    this.startWithReject = false,
    this.openAtSignDocuments = false,
    this.openAtDisbursement = false,
    this.montoPreAprobado = 12000000,
    this.cuotaMensual = 545000,
    this.plazoAprobadoMeses = 24,
  });

  /// Si es true, se muestra directamente la vista de oferta declinada (flujo "Rechazo").
  final bool startWithReject;

  /// Abre directamente en documentos por firmar (cap 3).
  final bool openAtSignDocuments;

  /// Abre directamente en datos de desembolso (tras firmar ambos PDF).
  final bool openAtDisbursement;

  /// Mismos valores que la tarjeta de inicio (`UserRecord` / [CreditoOfertaAdminFlow]).
  final int montoPreAprobado;
  final int cuotaMensual;
  final int plazoAprobadoMeses;

  @override
  State<CreditoOfertaProcesoPage> createState() => _CreditoOfertaProcesoPageState();
}

enum _ProcesoStep {
  acceptSummary,
  rejectedOffer,
  loadingDocuments,
  signDocuments,
  disbursementForm,
}

class _CreditoOfertaProcesoPageState extends State<CreditoOfertaProcesoPage> with SessionActivityOnInitMixin {
  static const String _kFont = 'Satoshi';
  /// Azul de marca en sección Crédito (oferta y flujo).
  static const Color _kBlue = Color(0xFF002CE9);
  static const Color _kOrange = Color(0xFFFF6700);

  /// Sustituir por la URL definitiva de términos (líneas de crédito).
  static const String _urlTerminosLineasCredito = '';

  /// Duración mínima de la pantalla de generación de documentos antes de firmas.
  static const Duration _loadingDocumentsDuration = Duration(seconds: 20);

  late _ProcesoStep _step;
  bool _ajusteChecked = false;
  bool _termsChecked = false;
  bool _doc1Checked = false;
  bool _doc2Checked = false;
  bool _firmandoDocumentacion = false;
  String _firmaCargaMensaje = '';
  double _progress = 0;
  Timer? _progressTimer;
  DateTime? _loadingStartedAt;

  late final TapGestureRecognizer _termsLinkRecognizer;

  String? _bankValue;
  String _accountType = 'Ahorros';
  final TextEditingController _accNum = TextEditingController();
  final TextEditingController _accConfirm = TextEditingController();

  @override
  void initState() {
    super.initState();
    _termsLinkRecognizer = TapGestureRecognizer()
      ..onTap = () async {
        if (_urlTerminosLineasCredito.isEmpty) return;
        await launchURL(_urlTerminosLineasCredito);
      };
    if (widget.openAtDisbursement) {
      _step = _ProcesoStep.disbursementForm;
    } else if (widget.openAtSignDocuments) {
      _step = _ProcesoStep.signDocuments;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        CreditoDocumentosService.asegurarDocumentos(
          montoPreAprobado: widget.montoPreAprobado,
          cuotaMensual: widget.cuotaMensual,
          plazoAprobadoMeses: widget.plazoAprobadoMeses,
        );
      });
    } else if (widget.startWithReject) {
      _step = _ProcesoStep.rejectedOffer;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        CreditoOfertaFirestoreService.registrarRechazoOferta();
      });
    } else {
      _step = _ProcesoStep.acceptSummary;
    }
  }

  @override
  void dispose() {
    _progressTimer?.cancel();
    _termsLinkRecognizer.dispose();
    _accNum.dispose();
    _accConfirm.dispose();
    super.dispose();
  }

  void _go(_ProcesoStep s) {
    setState(() => _step = s);
  }

  Future<void> _alert(String msg) async {
    if (!mounted) return;
    await showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          'Alianza',
          style: TextStyle(
            fontFamily: _kFont,
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: FlutterFlowTheme.of(ctx).primaryText,
          ),
        ),
        content: Text(
          msg,
          style: const TextStyle(fontFamily: _kFont, fontSize: 15, height: 1.4),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text(
              'OK',
              style: TextStyle(
                fontFamily: _kFont,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _startDocumentGeneration() {
    if (!_ajusteChecked || !_termsChecked) {
      _alert(
        'Por favor, acepta los términos y condiciones para continuar.',
      );
      return;
    }
    setState(() {
      _doc1Checked = false;
      _doc2Checked = false;
      _progress = 0;
      _loadingStartedAt = DateTime.now();
      _step = _ProcesoStep.loadingDocuments;
    });
    unawaited(
      CreditoDocumentosService.generarYCachear(
        montoPreAprobado: widget.montoPreAprobado,
        cuotaMensual: widget.cuotaMensual,
        plazoAprobadoMeses: widget.plazoAprobadoMeses,
      ),
    );
    _progressTimer?.cancel();
    _progressTimer = Timer.periodic(const Duration(milliseconds: 50), (t) {
      if (!mounted) return;
      final started = _loadingStartedAt;
      if (started == null) return;
      final elapsedMs =
          DateTime.now().difference(started).inMilliseconds.clamp(0, 1 << 30);
      final totalMs = _loadingDocumentsDuration.inMilliseconds;
      final pct = (elapsedMs / totalMs * 100).clamp(0.0, 100.0);
      setState(() => _progress = pct);
      if (elapsedMs >= totalMs) {
        t.cancel();
        if (mounted) _completeDocumentGeneration();
      }
    });
  }

  Future<void> _completeDocumentGeneration() async {
    try {
      await CreditoDocumentosService.asegurarDocumentos(
        montoPreAprobado: widget.montoPreAprobado,
        cuotaMensual: widget.cuotaMensual,
        plazoAprobadoMeses: widget.plazoAprobadoMeses,
      );
      await CreditoOfertaFirestoreService.registrarAceptacionYDocumentos(
        montoPreAprobado: widget.montoPreAprobado,
        cuotaMensual: widget.cuotaMensual,
        plazoAprobadoMeses: widget.plazoAprobadoMeses,
      );
    } catch (_) {
      if (mounted) {
        await _alert(
          'No pudimos registrar tu aceptación. Intenta de nuevo.',
        );
        if (mounted) _go(_ProcesoStep.acceptSummary);
      }
      return;
    }
    if (mounted) {
      Navigator.of(context).pop(CreditoOfertaEstado.popPendienteFirma);
    }
  }

  Future<void> _firmarDocumentacion() async {
    if (_firmandoDocumentacion) return;
    setState(() {
      _firmandoDocumentacion = true;
      _firmaCargaMensaje = 'Generando pagaré y autorización…';
    });
    try {
      await CreditoDocumentosService.generarYCachear(
        montoPreAprobado: widget.montoPreAprobado,
        cuotaMensual: widget.cuotaMensual,
        plazoAprobadoMeses: widget.plazoAprobadoMeses,
      );
      if (!mounted) return;
      setState(() => _firmaCargaMensaje =
          'Abriendo ZapSign (pagaré y autorización)…');
      await CreditoZapsignService.iniciarFirmaDocumentos();
    } catch (e) {
      if (mounted) {
        await _alert(
          e.toString().replaceFirst('Exception: ', ''),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _firmandoDocumentacion = false;
          _firmaCargaMensaje = '';
        });
      }
    }
  }

  Future<void> _finalizeProcess() async {
    final bank = _bankValue;
    final accNum = _accNum.text.trim();
    final accConfirm = _accConfirm.text.trim();
    if (bank == null || bank.isEmpty) {
      await _alert('Por favor selecciona un banco de la lista.');
      return;
    }
    if (accNum.isEmpty || accConfirm.isEmpty) {
      await _alert('Por favor ingresa y confirma tu número de cuenta.');
      return;
    }
    if (accNum != accConfirm) {
      await _alert('Los números de cuenta no coinciden. Por favor verifica.');
      return;
    }
    await CreditoOfertaFirestoreService.registrarEnDesembolso();
    await _alert('Proceso administrativo finalizado con éxito.');
    if (mounted) Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: KeyedSubtree(
            key: ValueKey(_step),
            child: _buildStep(context),
          ),
        ),
      ),
    );
  }

  Widget _buildStep(BuildContext context) {
    late final Widget inner;
    switch (_step) {
      case _ProcesoStep.acceptSummary:
        inner = _buildAcceptSummary(context);
        break;
      case _ProcesoStep.rejectedOffer:
        inner = _buildRejected(context);
        break;
      case _ProcesoStep.loadingDocuments:
        inner = _buildLoadingDocs(context);
        break;
      case _ProcesoStep.signDocuments:
        inner = _buildSignDocs(context);
        break;
      case _ProcesoStep.disbursementForm:
        inner = _buildDisbursement(context);
        break;
    }
    return _withStepTopInset(context, inner);
  }

  Widget _withStepTopInset(BuildContext context, Widget child) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        top: valueOrDefault<double>(
          MediaQuery.sizeOf(context).height * 0.07584,
          64.0,
        ),
      ),
      child: child,
    );
  }

  Widget _buildAcceptSummary(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _screenHeader(
            context,
            title: 'Confirmar solicitud',
            onBack: () => Navigator.of(context).maybePop(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFF0F0F0)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                    color: Colors.black.withOpacity(0.03),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _summaryRow(
                    'Mi monto aprobado',
                    functions.formatAmount(
                        widget.montoPreAprobado.toDouble()),
                    valueFontSize: 20,
                  ),
                  const Divider(height: 1),
                  _summaryRow(
                    'Cuota mensual',
                    functions.formatAmount(
                        widget.cuotaMensual.toDouble()),
                  ),
                  const Divider(height: 1),
                  _summaryRow(
                    'Plazo',
                    '${widget.plazoAprobadoMeses} meses',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _orangeCheckbox(
                        context,
                        value: _ajusteChecked,
                        onChanged: (v) =>
                            setState(() => _ajusteChecked = v ?? false),
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.only(start: 8.0),
                          child: Text(
                            'Comprendo que el valor de mi primera cuota tendrá un ajuste único por los días transcurridos desde el desembolso y costos de administración. A partir de la segunda cuota, el valor será el habitual.',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: _kFont,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                )
                                .copyWith(height: 1.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(height: 1),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _orangeCheckbox(
                        context,
                        value: _termsChecked,
                        onChanged: (v) =>
                            setState(() => _termsChecked = v ?? false),
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.only(start: 8.0),
                          child: RichText(
                            textScaler: MediaQuery.textScalerOf(context),
                            text: TextSpan(
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: _kFont,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  )
                                  .copyWith(height: 1.5),
                              children: [
                                TextSpan(
                                  text: 'Acepto los ',
                                  style: const TextStyle(
                                    fontFamily: _kFont,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: 'términos y condiciones',
                                  style: const TextStyle(
                                    fontFamily: _kFont,
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.underline,
                                  ),
                                  mouseCursor: SystemMouseCursors.click,
                                  recognizer: _termsLinkRecognizer,
                                ),
                                TextSpan(
                                  text:
                                      ' de las líneas de crédito aplicables a mi solicitud.',
                                  style: const TextStyle(
                                    fontFamily: _kFont,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _primaryOrangeButton(
              context,
              text: 'Continuar con firma de documentos',
              onPressed: _startDocumentGeneration,
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _summaryRow(
    String label,
    String value, {
    double? valueFontSize,
    Color? valueColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: _kFont,
              fontSize: 14,
              color: Colors.grey.shade600,
            ),
          ),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontFamily: _kFont,
                fontSize: valueFontSize ?? 16,
                fontWeight: FontWeight.w700,
                color: valueColor ?? const Color(0xFF202020),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRejected(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _screenHeader(
          context,
          onBack: () => Navigator.of(context).maybePop(),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFF9F5),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.cancel_outlined, size: 36, color: _kOrange),
                ),
                const SizedBox(height: 24),
                Text(
                  'Oferta declinada',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: _kFont,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF202020),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Has rechazado esta oferta de crédito. Si cambias de decisión más adelante, puedes volver a realizar la solicitud a través de la sección principal.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: _kFont,
                    fontSize: 14,
                    color: Colors.grey.shade600,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 32),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: _kBlue,
                    side: const BorderSide(color: _kBlue),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () => Navigator.of(context).maybePop(),
                  child: const Text(
                    'Volver al inicio',
                    style: const TextStyle(
                      fontFamily: _kFont,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoadingDocs(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
          child: Column(
            children: [
              Text(
                '${_progress.round()}%',
                style: const TextStyle(
                  fontFamily: _kFont,
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: _kBlue,
                ),
              ),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: _progress / 100,
                  minHeight: 8,
                  backgroundColor: const Color(0xFFEAEAEA),
                  valueColor: const AlwaysStoppedAnimation<Color>(_kBlue),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        SizedBox(
          width: 70,
          height: 70,
          child: CircularProgressIndicator(
            strokeWidth: 4,
            color: _kBlue,
            backgroundColor: const Color(0xFFF0F2FB),
          ),
        ),
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Creando pagarés, autorizaciones y demás documentos.',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: _kFont,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xFF202020),
              height: 1.3,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF9F5),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFFDE9DC)),
            ),
            child: Text(
              'Por favor, no cierre la app. Estamos trabajando para usted.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: _kFont,
                fontSize: 15,
                color: Colors.grey.shade700,
                height: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignDocs(BuildContext context) {
    final allDocs = _doc1Checked && _doc2Checked;
    final puedeFirmar = allDocs && !_firmandoDocumentacion;
    return Stack(
      children: [
        AbsorbPointer(
          absorbing: _firmandoDocumentacion,
          child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _screenHeader(
            context,
            title: 'Documentos por firmar',
            onBack: _firmandoDocumentacion
                ? () {}
                : () => Navigator.of(context).maybePop(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Selecciona ambos documentos. Se abrirán juntos en ZapSign (pagaré, carta de instrucciones y autorización de nómina).',
              style: TextStyle(
                fontFamily: _kFont,
                fontSize: 14,
                color: Colors.grey.shade600,
                height: 1.4,
              ),
            ),
          ),
          const SizedBox(height: 20),
          _docRow(
            checked: _doc1Checked,
            onChanged: (v) => setState(() => _doc1Checked = v ?? false),
            title: 'Pagaré y carta de instrucciones',
          ),
          const SizedBox(height: 12),
          _docRow(
            checked: _doc2Checked,
            onChanged: (v) => setState(() => _doc2Checked = v ?? false),
            title: 'Autorización de descuentos de nómina',
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _primaryOrangeButton(
              context,
              text: 'Firmar documentación',
              onPressed: puedeFirmar ? _firmarDocumentacion : null,
              isLoading: _firmandoDocumentacion,
              loadingText: 'Preparando firma…',
            ),
          ),
          if (_firmandoDocumentacion) ...[
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      color: _kBlue,
                      backgroundColor: const Color(0xFFF0F2FB),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    _firmaCargaMensaje,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: _kFont,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade800,
                      height: 1.35,
                    ),
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 24),
        ],
      ),
    ),
        ),
        if (_firmandoDocumentacion)
          Positioned.fill(
            child: ColoredBox(
              color: Colors.white.withValues(alpha: 0.55),
            ),
          ),
      ],
    );
  }

  Widget _docRow({
    required bool checked,
    required ValueChanged<bool?> onChanged,
    required String title,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => onChanged(!checked),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFF0F0F0)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                  color: Colors.black.withOpacity(0.02),
                ),
              ],
            ),
            child: Row(
              children: [
                _orangeCheckbox(
                  context,
                  value: checked,
                  onChanged: onChanged,
                ),
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F2FB),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.description_outlined, color: _kBlue),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontFamily: _kFont,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF202020),
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDisbursement(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _screenHeader(
            context,
            title: 'Datos de desembolso',
            onBack: () => Navigator.of(context).maybePop(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Por favor, indícanos dónde deseas que se deposite tu crédito aprobado.',
              style: TextStyle(
                fontFamily: _kFont,
                fontSize: 14,
                color: Colors.grey.shade600,
                height: 1.4,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Banco destino',
                  style: const TextStyle(
                    fontFamily: _kFont,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF404040),
                  ),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: _bankValue,
                  decoration: _inputDecoration(),
                  hint: const Text(
                    'Selecciona tu banco',
                    style: const TextStyle(
                      fontFamily: _kFont,
                      fontSize: 14,
                      color: Color(0xFF9E9E9E),
                    ),
                  ),
                  items: [
                    DropdownMenuItem(
                      value: 'bancolombia',
                      child: Text(
                        'Bancolombia',
                        style: const TextStyle(
                          fontFamily: _kFont,
                          fontSize: 14,
                          color: Color(0xFF202020),
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'davivienda',
                      child: Text(
                        'Davivienda',
                        style: const TextStyle(
                          fontFamily: _kFont,
                          fontSize: 14,
                          color: Color(0xFF202020),
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'bogota',
                      child: Text(
                        'Banco de Bogotá',
                        style: const TextStyle(
                          fontFamily: _kFont,
                          fontSize: 14,
                          color: Color(0xFF202020),
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'occidente',
                      child: Text(
                        'Banco de Occidente',
                        style: const TextStyle(
                          fontFamily: _kFont,
                          fontSize: 14,
                          color: Color(0xFF202020),
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'caja_social',
                      child: Text(
                        'Banco Caja Social',
                        style: const TextStyle(
                          fontFamily: _kFont,
                          fontSize: 14,
                          color: Color(0xFF202020),
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'bbva',
                      child: Text(
                        'BBVA Colombia',
                        style: const TextStyle(
                          fontFamily: _kFont,
                          fontSize: 14,
                          color: Color(0xFF202020),
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'scotiabank',
                      child: Text(
                        'Scotiabank Colpatria',
                        style: const TextStyle(
                          fontFamily: _kFont,
                          fontSize: 14,
                          color: Color(0xFF202020),
                        ),
                      ),
                    ),
                  ],
                  onChanged: (v) => setState(() => _bankValue = v),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Tipo de cuenta',
                  style: const TextStyle(
                    fontFamily: _kFont,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF404040),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F2FB),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: _toggleBtn(
                          label: 'Ahorros',
                          selected: _accountType == 'Ahorros',
                          onTap: () => setState(() => _accountType = 'Ahorros'),
                        ),
                      ),
                      Expanded(
                        child: _toggleBtn(
                          label: 'Corriente',
                          selected: _accountType == 'Corriente',
                          onTap: () => setState(() => _accountType = 'Corriente'),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Número de cuenta',
                  style: const TextStyle(
                    fontFamily: _kFont,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF404040),
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _accNum,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    fontFamily: _kFont,
                    fontSize: 15,
                    color: Color(0xFF202020),
                  ),
                  decoration: _inputDecoration().copyWith(
                    hintText: 'Digite su número de cuenta',
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Confirme número de cuenta',
                  style: const TextStyle(
                    fontFamily: _kFont,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF404040),
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _accConfirm,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    fontFamily: _kFont,
                    fontSize: 15,
                    color: Color(0xFF202020),
                  ),
                  decoration: _inputDecoration().copyWith(
                    hintText: 'Confirme su número de cuenta',
                  ),
                ),
                const SizedBox(height: 24),
                _primaryOrangeButton(
                  context,
                  text: 'Finalizar proceso administrativo',
                  onPressed: _finalizeProcess,
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      hintStyle: const TextStyle(
        fontFamily: _kFont,
        fontSize: 14,
        color: Color(0xFF9E9E9E),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFD0D0D0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFD0D0D0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _kBlue, width: 1.5),
      ),
    );
  }

  Widget _toggleBtn({
    required String label,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return Material(
      color: selected ? Colors.white : Colors.transparent,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontFamily: _kFont,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: selected ? _kBlue : Colors.grey.shade600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _orangeCheckbox(
    BuildContext context, {
    required bool value,
    required ValueChanged<bool?> onChanged,
  }) {
    final theme = FlutterFlowTheme.of(context);
    return Theme(
      data: ThemeData(
        checkboxTheme: CheckboxThemeData(
          visualDensity: VisualDensity.compact,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        unselectedWidgetColor: theme.alternate,
      ),
      child: Checkbox(
        value: value,
        onChanged: onChanged,
        side: BorderSide(
          width: 2,
          color: theme.alternate,
        ),
        activeColor: theme.customColor4,
        checkColor: theme.info,
      ),
    );
  }

  Widget _primaryOrangeButton(
    BuildContext context, {
    required String text,
    required VoidCallback? onPressed,
    bool isLoading = false,
    String loadingText = 'Procesando…',
  }) {
    final theme = FlutterFlowTheme.of(context);
    final enabled = onPressed != null && !isLoading;
    final showAsActive = onPressed != null;
    return SizedBox(
      width: double.infinity,
      height: 48.0,
      child: Material(
        color: showAsActive ? theme.customColor4 : const Color(0xFFE8E8E8),
        borderRadius: BorderRadius.circular(8.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: enabled ? onPressed : null,
          child: Center(
            child: isLoading
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        loadingText,
                        style: theme.titleSmall.override(
                          fontFamily: _kFont,
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                      ),
                    ],
                  )
                : Text(
                    text,
                    textAlign: TextAlign.center,
                    style: theme.titleSmall.override(
                      fontFamily: _kFont,
                      color: showAsActive
                          ? Colors.white
                          : const Color(0xFF9E9E9E),
                      letterSpacing: 0.0,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _screenHeader(
    BuildContext context, {
    String? title,
    required VoidCallback onBack,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 20, 16),
      child: Row(
        children: [
          IconButton(
            onPressed: onBack,
            icon: const Icon(Icons.arrow_back),
            color: const Color(0xFF202020),
          ),
          if (title != null)
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontFamily: _kFont,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF202020),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
