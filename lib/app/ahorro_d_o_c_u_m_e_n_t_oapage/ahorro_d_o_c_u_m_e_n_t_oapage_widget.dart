import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
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
      FFAppState().update(() {});
      _model.pdf2 = await actions.firstPDFCopy(
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
      );
      _model.pdfURL = _model.pdf2?.height?.toString();
      safeSetState(() {});
      _model.nomina = InstantTimer.periodic(
        duration: Duration(milliseconds: 60000),
        callback: (timer) async {
          FFAppState().lastAction = getCurrentTimestamp;
          safeSetState(() {});
        },
        startImmediately: true,
      );
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

  @override
  void dispose() {
    // On page dispose action.
    () async {
      FFAppState().lastAction = getCurrentTimestamp;
    }();

    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Material(
                color: Colors.transparent,
                elevation: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.network(
                        '',
                      ).image,
                    ),
                    gradient: LinearGradient(
                      colors: [Color(0xFF006AD8), Color(0xFF002CE9)],
                      stops: [0.0, 1.0],
                      begin: AlignmentDirectional(-1.0, 0.0),
                      end: AlignmentDirectional(1.0, 0),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 4.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 8.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          30.0, 0.0, 16.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.asset(
                                          'assets/images/edit_icon.png',
                                          width: 40.0,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 10.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 6.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF678EC9),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
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
                                  onTap: () async {
                                    context.safePop();
                                  },
                                  child: Container(
                                    width: 50.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(),
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
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (_model.pdf2 != null &&
                          (_model.pdf2?.bytes?.isNotEmpty ?? false))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 36.0, 20.0, 0.0),
                          child: FlutterFlowPdfViewer(
                            fileBytes: _model.pdf2?.bytes,
                            height: 400.0,
                            horizontalScroll: false,
                          ),
                        ),
                      if (_model.pdf2 == null ||
                          (_model.pdf2?.bytes?.isEmpty ?? true))
                        Flexible(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 40.0, 0.0, 0.0),
                            child: FaIcon(
                              FontAwesomeIcons.circleNotch,
                              color: FlutterFlowTheme.of(context).customColor4,
                              size: 40.0,
                            ).animateOnPageLoad(
                                animationsMap['iconOnPageLoadAnimation']!),
                          ),
                        ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 24.0, 0.0, 24.0),
                        child: AutoSizeText(
                          'Documento firmado electronicamente',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Satoshi',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 56.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    _model.service = await queryServicesRecordOnce(
                      queryBuilder: (servicesRecord) => servicesRecord.where(
                        'TypesOfProductName',
                        isEqualTo: valueOrDefault<String>(
                          FFAppState().typeOfProduct,
                          '-',
                        ),
                      ),
                      singleRecord: true,
                    ).then((s) => s.firstOrNull);

                    var ahorrosRecordReference = AhorrosRecord.collection.doc();
                    await ahorrosRecordReference.set(createAhorrosRecordData(
                      ea: valueOrDefault<double>(
                        _model.service?.ea,
                        0.0,
                      ),
                      fechacreacion: getCurrentTimestamp,
                      totalSavingValue: 0.0,
                      savingsType: valueOrDefault<String>(
                        _model.service?.typesOfProductName,
                        '-',
                      ),
                      tipoCuentaName: '-',
                      service: _model.service?.reference,
                      userName: valueOrDefault<String>(
                        currentUserDisplayName,
                        '-',
                      ),
                      userID: valueOrDefault<String>(
                        currentUserUid,
                        '-',
                      ),
                      userEmail: valueOrDefault<String>(
                        currentUserEmail,
                        '-',
                      ),
                      user: currentUserReference,
                      montoTotal: 0.0,
                      ahorrosDocPdf1: '',
                    ));
                    _model.ahorro1 = AhorrosRecord.getDocumentFromData(
                        createAhorrosRecordData(
                          ea: valueOrDefault<double>(
                            _model.service?.ea,
                            0.0,
                          ),
                          fechacreacion: getCurrentTimestamp,
                          totalSavingValue: 0.0,
                          savingsType: valueOrDefault<String>(
                            _model.service?.typesOfProductName,
                            '-',
                          ),
                          tipoCuentaName: '-',
                          service: _model.service?.reference,
                          userName: valueOrDefault<String>(
                            currentUserDisplayName,
                            '-',
                          ),
                          userID: valueOrDefault<String>(
                            currentUserUid,
                            '-',
                          ),
                          userEmail: valueOrDefault<String>(
                            currentUserEmail,
                            '-',
                          ),
                          user: currentUserReference,
                          montoTotal: 0.0,
                          ahorrosDocPdf1: '',
                        ),
                        ahorrosRecordReference);
                    _model.base64PDF = await actions.pdf2String(
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
                        valueOrDefault(
                            currentUserDocument?.ciudadExpedicion, ''),
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
                    );
                    _model.apiResultwkv = await InitiateSignatureCopyCall.call(
                      name: currentUserDisplayName,
                      pdfString: _model.base64PDF,
                      externalId: _model.ahorro1?.reference.id,
                      email: currentUserEmail,
                      redirectURL: 'alianza://alianza.com/modalCopyCopy2',
                      phone: currentPhoneNumber,
                    );

                    if ((_model.apiResultwkv?.succeeded ?? true)) {
                      FFAppState().zapsignToken =
                          InitiateSignatureCopyCall.documentToken(
                        (_model.apiResultwkv?.jsonBody ?? ''),
                      )!;
                      safeSetState(() {});
                      await PlaceSignatureInAhorroPDFsCall.call(
                        token: InitiateSignatureCopyCall.documentToken(
                          (_model.apiResultwkv?.jsonBody ?? ''),
                        ),
                        signerToken: InitiateSignatureCopyCall.signersToken(
                          (_model.apiResultwkv?.jsonBody ?? ''),
                        ),
                      );

                      await launchURL(InitiateSignatureCopyCall.signURL(
                        (_model.apiResultwkv?.jsonBody ?? ''),
                      )!);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            InitiateSignatureCopyCall.errorMessage(
                              (_model.apiResultwkv?.jsonBody ?? ''),
                            )!,
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor: FlutterFlowTheme.of(context).error,
                        ),
                      );
                    }

                    safeSetState(() {});
                  },
                  text: 'Firmar',
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 48.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).customColor4,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Satoshi',
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
