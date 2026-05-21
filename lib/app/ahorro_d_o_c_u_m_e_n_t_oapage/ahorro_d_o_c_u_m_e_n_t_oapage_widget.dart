import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'ahorro_d_o_c_u_m_e_n_t_oapage_model.dart';
export 'ahorro_d_o_c_u_m_e_n_t_oapage_model.dart';

class AhorroDOCUMENTOapageWidget extends StatefulWidget {
  const AhorroDOCUMENTOapageWidget({super.key});

  static String routeName = 'Ahorro_DOCUMENTOapage';
  static String routePath = '/ahorroDOCUMENTOapage';

  @override
  State<AhorroDOCUMENTOapageWidget> createState() =>
      _AhorroDOCUMENTOapageWidgetState();
}

class _AhorroDOCUMENTOapageWidgetState extends State<AhorroDOCUMENTOapageWidget>
    with TickerProviderStateMixin {
  late AhorroDOCUMENTOapageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AhorroDOCUMENTOapageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _loadPdf();
    });

    animationsMap.addAll({
      'iconOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 850.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  Future<void> _loadPdf() async {
    if (!mounted) {
      return;
    }
    _model.isLoadingPdf = true;
    _model.pdfError = null;
    _model.pdf2 = null;
    safeSetState(() {});

    // Evita carrera con resize del viewport en web (ViewInsets negativos).
    if (kIsWeb) {
      await Future<void>.delayed(const Duration(milliseconds: 400));
      if (!mounted) {
        return;
      }
    }

    try {
      final pdf = await Future<FFUploadedFile>(() => actions.firstPDFCopy(
            'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/Alianza%20Pdf%20logo.png?alt=media&token=69805315-febc-43ef-9716-181c14efba26',
            'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/Alianza%20pdf%20logo%20design.png?alt=media&token=52460c6f-9061-42c0-8681-aa5dc3db4c7a',
            FFAppState().typeOfProduct,
            dateTimeFormat(
              "d/M/y",
              getCurrentTimestamp,
              locale: FFLocalizations.of(context).languageCode,
            ),
            currentUserDisplayName,
            valueOrDefault<String>(
              valueOrDefault(currentUserDocument?.tipoDocumento, ''),
              '--',
            ),
            valueOrDefault<String>(
              valueOrDefault(currentUserDocument?.nit, ''),
              '-',
            ),
            valueOrDefault<String>(
              dateTimeFormat(
                "d/M/y",
                currentUserDocument?.fechaExpedicion,
                locale: FFLocalizations.of(context).languageCode,
              ),
              '-',
            ),
            valueOrDefault<String>(
              valueOrDefault(currentUserDocument?.ciudadExpedicion, ''),
              '-',
            ),
            valueOrDefault<String>(
              valueOrDefault(currentUserDocument?.direccion, ''),
              '- -',
            ),
            valueOrDefault<String>(
              valueOrDefault(currentUserDocument?.ciudad, ''),
              '-',
            ),
            valueOrDefault<String>(
              valueOrDefault(currentUserDocument?.barrio, ''),
              '-',
            ),
            valueOrDefault<String>(
              currentUserEmail,
              '--',
            ),
            valueOrDefault<String>(
              currentPhoneNumber,
              '-',
            ),
            '-',
            valueOrDefault<String>(
              currentUserDisplayName,
              '- -',
            ),
            valueOrDefault<String>(
              valueOrDefault(currentUserDocument?.nit, ''),
              '-',
            ),
            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/98bwu2s3373e/64af4586-f309-4ab3-aa9d-db083b675bda.jpg',
            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/70tcb6sabncz/d0b34d06-f023-4b51-a1fa-249512acd7ff.jpg',
            '-',
            '-',
            '-',
            '-',
            '-',
            '-',
            '-',
          )).timeout(const Duration(seconds: 90));

      if (!mounted) {
        return;
      }

      if (pdf.bytes == null || pdf.bytes!.isEmpty) {
        _model.pdfError = 'No se pudo generar el documento.';
      } else {
        _model.pdf2 = pdf;
        debugPrint(
            'PDF generado: ${pdf.bytes!.lengthInBytes} bytes (web=$kIsWeb)');
      }
    } on TimeoutException {
      _model.pdfError =
          'La generación del documento tardó demasiado. Intenta de nuevo.';
    } catch (e, stack) {
      _model.pdfError = 'Error al generar el documento. Intenta de nuevo.';
      debugPrint('firstPDFCopy error: $e\n$stack');
    } finally {
      _model.isLoadingPdf = false;
      _scheduleRebuild();
    }
  }

  void _scheduleRebuild() {
    if (!mounted) {
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        safeSetState(() {});
      }
    });
  }

  void _goBack() {
    final navigator = Navigator.of(context);
    if (navigator.canPop()) {
      navigator.pop();
      return;
    }
    context.go('/');
  }

  void _showMessage(String message, {bool isError = false}) {
    if (!mounted) {
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            color: FlutterFlowTheme.of(context).primaryText,
          ),
        ),
        duration: const Duration(milliseconds: 5000),
        backgroundColor: isError
            ? FlutterFlowTheme.of(context).error
            : FlutterFlowTheme.of(context).success,
      ),
    );
  }

  Future<void> _openZapsignSignUrl(String url) async {
    final uri = Uri.parse(url);
    final canOpen = await canLaunchUrl(uri);
    if (!canOpen) {
      throw Exception('No se puede abrir la URL de Zapsign');
    }
    if (kIsWeb) {
      await launchUrl(uri, webOnlyWindowName: '_blank');
    } else {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _handleFirmar() async {
    if (_model.pdf2?.bytes == null || _model.pdf2!.bytes!.isEmpty) {
      _showMessage('Espera a que el documento termine de generarse.', isError: true);
      return;
    }

    _model.isSigning = true;
    safeSetState(() {});

    try {
      _model.service = await queryServicesRecordOnce(
        queryBuilder: (servicesRecord) => servicesRecord.where(
          'TypesOfProductName',
          isEqualTo: valueOrDefault<String>(
            FFAppState().typeOfProduct,
            'Linea de Ahorro con Propósito',
          ),
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);

      if (_model.service == null) {
        _showMessage(
          'No se encontró el servicio "${FFAppState().typeOfProduct}" en Firestore.',
          isError: true,
        );
        return;
      }

      final ahorrosRecordReference = AhorrosRecord.collection.doc();
      await ahorrosRecordReference.set(createAhorrosRecordData(
        ea: valueOrDefault<double>(_model.service?.ea, 0.0),
        fechacreacion: getCurrentTimestamp,
        totalSavingValue: 0.0,
        savingsType: valueOrDefault<String>(
          _model.service?.typesOfProductName,
          FFAppState().typeOfProduct,
        ),
        tipoCuentaName: '-',
        service: _model.service?.reference,
        userName: valueOrDefault<String>(currentUserDisplayName, '-'),
        userID: valueOrDefault<String>(currentUserUid, '-'),
        userEmail: valueOrDefault<String>(currentUserEmail, '-'),
        user: currentUserReference,
        montoTotal: 0.0,
        ahorrosDocPdf1: '',
      ));

      _model.ahorro1 = AhorrosRecord.getDocumentFromData(
        createAhorrosRecordData(
          ea: valueOrDefault<double>(_model.service?.ea, 0.0),
          fechacreacion: getCurrentTimestamp,
          totalSavingValue: 0.0,
          savingsType: valueOrDefault<String>(
            _model.service?.typesOfProductName,
            FFAppState().typeOfProduct,
          ),
          tipoCuentaName: '-',
          service: _model.service?.reference,
          userName: valueOrDefault<String>(currentUserDisplayName, '-'),
          userID: valueOrDefault<String>(currentUserUid, '-'),
          userEmail: valueOrDefault<String>(currentUserEmail, '-'),
          user: currentUserReference,
          montoTotal: 0.0,
          ahorrosDocPdf1: '',
        ),
        ahorrosRecordReference,
      );

      final phoneDigits =
          (currentPhoneNumber).replaceAll(RegExp(r'\D'), '');
      _model.base64PDF = base64Encode(_model.pdf2!.bytes!);

      debugPrint('Enviando documento a Zapsign (${_model.pdf2!.bytes!.lengthInBytes} bytes)...');

      _model.apiResultwkv = await InitiateSignatureCopyCall.call(
        name: currentUserDisplayName,
        pdfString: _model.base64PDF,
        externalId: _model.ahorro1?.reference.id,
        email: currentUserEmail,
        redirectURL: 'alianza://alianza.com/modalCopyCopy2',
        phone: phoneDigits.isNotEmpty ? phoneDigits : '3000000000',
      );

      final responseBody = _model.apiResultwkv?.jsonBody;
      final succeeded = _model.apiResultwkv?.succeeded ?? false;

      if (!succeeded) {
        final errorMsg = InitiateSignatureCopyCall.errorMessage(responseBody) ??
            'Error al conectar con Zapsign (${_model.apiResultwkv?.statusCode})';
        debugPrint('Zapsign error: $responseBody');
        _showMessage(errorMsg, isError: true);
        return;
      }

      final signUrl = InitiateSignatureCopyCall.signURL(responseBody);
      final documentToken = InitiateSignatureCopyCall.documentToken(responseBody);
      final signerToken = InitiateSignatureCopyCall.signersToken(responseBody);

      if (signUrl == null || signUrl.isEmpty) {
        debugPrint('Zapsign sin sign_url: $responseBody');
        _showMessage('Zapsign no devolvió el enlace de firma.', isError: true);
        return;
      }

      if (documentToken != null && documentToken.isNotEmpty) {
        FFAppState().zapsignToken = documentToken;
      }

      if (documentToken != null &&
          documentToken.isNotEmpty &&
          signerToken != null &&
          signerToken.isNotEmpty) {
        await PlaceSignatureInAhorroPDFsCall.call(
          token: documentToken,
          signerToken: signerToken,
        );
      }

      debugPrint('Abriendo Zapsign: $signUrl');
      await _openZapsignSignUrl(signUrl);
      _showMessage('Se abrió Zapsign para firmar el documento.');
    } catch (e, stack) {
      debugPrint('Firmar error: $e\n$stack');
      _showMessage('Error al firmar: $e', isError: true);
    } finally {
      _model.isSigning = false;
      safeSetState(() {});
    }
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    final hasPdf =
        _model.pdf2 != null && (_model.pdf2?.bytes?.isNotEmpty ?? false);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Material(
                color: Colors.transparent,
                elevation: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF006AD8), Color(0xFF002CE9)],
                      stops: [0.0, 1.0],
                      begin: AlignmentDirectional(-1.0, 0.0),
                      end: AlignmentDirectional(1.0, 0),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 4.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 8.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              30.0, 0.0, 16.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(0.0),
                                        child: Image.asset(
                                          'assets/images/edit_icon.png',
                                          width: 40.0,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-1.0, 0.0),
                                    child: Text(
                                      FFAppState().typeOfProduct,
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 10.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 6.0,
                            decoration: const BoxDecoration(
                              color: Color(0xFF678EC9),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 18.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: _goBack,
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (hasPdf)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 36.0, 20.0, 0.0),
                          child: FlutterFlowPdfViewer(
                            fileBytes: _model.pdf2?.bytes,
                            height: 400.0,
                            horizontalScroll: false,
                          ),
                        ),
                      if (_model.isLoadingPdf)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 40.0, 0.0, 0.0),
                          child: FaIcon(
                            FontAwesomeIcons.circleNotch,
                            color:
                                FlutterFlowTheme.of(context).customColor4,
                            size: 40.0,
                          ).animateOnPageLoad(
                              animationsMap['iconOnPageLoadAnimation']!),
                        ),
                      if (!_model.isLoadingPdf &&
                          _model.pdfError != null &&
                          !hasPdf)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 40.0, 20.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                _model.pdfError!,
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Satoshi',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              const SizedBox(height: 12.0),
                              FFButtonWidget(
                                onPressed: () async {
                                  await _loadPdf();
                                },
                                text: 'Reintentar',
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  color: FlutterFlowTheme.of(context)
                                      .customColor4,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Satoshi',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        letterSpacing: 0.0,
                                      ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 24.0, 0.0, 24.0),
                        child: AutoSizeText(
                          'Documento firmado electronicamente',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Satoshi',
                                color: FlutterFlowTheme.of(context)
                                    .secondaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    20.0, 0.0, 20.0, 56.0),
                child: FFButtonWidget(
                  onPressed: (!hasPdf || _model.isLoadingPdf || _model.isSigning)
                      ? null
                      : _handleFirmar,
                  showLoadingIndicator: true,
                  text: _model.isSigning ? 'Procesando...' : 'Firmar',
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 48.0,
                    padding: EdgeInsetsDirectional.zero,
                    iconPadding: EdgeInsetsDirectional.zero,
                    color: FlutterFlowTheme.of(context).customColor4,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Satoshi',
                          color: FlutterFlowTheme.of(context)
                              .secondaryBackground,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
