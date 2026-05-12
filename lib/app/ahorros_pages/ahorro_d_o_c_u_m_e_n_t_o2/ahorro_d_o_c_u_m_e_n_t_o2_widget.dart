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
import 'ahorro_d_o_c_u_m_e_n_t_o2_model.dart';
export 'ahorro_d_o_c_u_m_e_n_t_o2_model.dart';

class AhorroDOCUMENTO2Widget extends StatefulWidget {
  const AhorroDOCUMENTO2Widget({
    super.key,
    required this.cambioEmpresa5,
    this.ahorroActual5,
  });

  final bool? cambioEmpresa5;
  final DocumentReference? ahorroActual5;

  static String routeName = 'Ahorro_DOCUMENTO2';
  static String routePath = '/ahorroDOCUMENTO2';

  @override
  State<AhorroDOCUMENTO2Widget> createState() => _AhorroDOCUMENTO2WidgetState();
}

class _AhorroDOCUMENTO2WidgetState extends State<AhorroDOCUMENTO2Widget>
    with TickerProviderStateMixin {
  late AhorroDOCUMENTO2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AhorroDOCUMENTO2Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.empresaread =
          await EmpresaRecord.getDocumentOnce(FFAppState().companyRef!);
      _model.pdfffX = await actions.firstPDFCopyCopy2(
        'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/Alianza%20Pdf%20logo.png?alt=media&token=69805315-febc-43ef-9716-181c14efba26',
        'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/Alianza%20pdf%20logo%20design.png?alt=media&token=52460c6f-9061-42c0-8681-aa5dc3db4c7a',
        valueOrDefault<String>(
          FFAppState().typeOfProduct,
          '-',
        ),
        valueOrDefault<String>(
          dateTimeFormat(
            "d/M/y",
            getCurrentTimestamp,
            locale: FFLocalizations.of(context).languageCode,
          ),
          '--',
        ),
        valueOrDefault<String>(
          currentUserDisplayName,
          '-',
        ),
        valueOrDefault<String>(
          valueOrDefault(currentUserDocument?.tipoDocumento, ''),
          '-',
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
          '-',
        ),
        valueOrDefault<String>(
          valueOrDefault(currentUserDocument?.ciudad, ''),
          '--',
        ),
        valueOrDefault<String>(
          valueOrDefault(currentUserDocument?.barrio, ''),
          '--',
        ),
        valueOrDefault<String>(
          currentUserEmail,
          '--',
        ),
        valueOrDefault<String>(
          currentPhoneNumber,
          '--',
        ),
        '-',
        valueOrDefault<String>(
          currentUserDisplayName,
          '--',
        ),
        valueOrDefault<String>(
          valueOrDefault(currentUserDocument?.nit, ''),
          '--',
        ),
        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/98bwu2s3373e/64af4586-f309-4ab3-aa9d-db083b675bda.jpg',
        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/70tcb6sabncz/d0b34d06-f023-4b51-a1fa-249512acd7ff.jpg',
        valueOrDefault<String>(
          _model.empresaread?.razonsocial,
          '--',
        ),
        '-',
        valueOrDefault<String>(
          _model.empresaread?.nit,
          '--',
        ),
        valueOrDefault<String>(
          FFAppState().TipoContrato,
          '--',
        ),
        valueOrDefault<String>(
          FFAppState().UbicacionTrabajo,
          '--',
        ),
        valueOrDefault<String>(
          FFAppState().TotalsavingsAmount.toString(),
          '--',
        ),
        'Mensual',
      );
      _model.doca = InstantTimer.periodic(
        duration: Duration(milliseconds: 60000),
        callback: (timer) async {
          FFAppState().lastAction = getCurrentTimestamp;
          FFAppState().update(() {});
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
                      if (_model.pdfffX != null &&
                          (_model.pdfffX?.bytes?.isNotEmpty ?? false))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 36.0, 20.0, 0.0),
                          child: FlutterFlowPdfViewer(
                            fileBytes: _model.pdfffX?.bytes,
                            height: 400.0,
                            horizontalScroll: false,
                          ),
                        ),
                      if (_model.pdfffX == null ||
                          (_model.pdfffX?.bytes?.isEmpty ?? true))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 40.0, 0.0, 0.0),
                          child: FaIcon(
                            FontAwesomeIcons.circleNotch,
                            color: FlutterFlowTheme.of(context).customColor4,
                            size: 40.0,
                          ).animateOnPageLoad(
                              animationsMap['iconOnPageLoadAnimation']!),
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
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 56.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            _model.service = await queryServicesRecordOnce(
                              queryBuilder: (servicesRecord) =>
                                  servicesRecord.where(
                                'TypesOfProductName',
                                isEqualTo: valueOrDefault<String>(
                                  FFAppState().typeOfProduct,
                                  'Linea de Ahorro de nómina',
                                ),
                              ),
                              singleRecord: true,
                            ).then((s) => s.firstOrNull);

                            var ahorrosRecordReference =
                                AhorrosRecord.collection.doc();
                            await ahorrosRecordReference
                                .set(createAhorrosRecordData(
                              montoTotal: 0.0,
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
                              totalSavingsPreApproval: valueOrDefault<double>(
                                FFAppState().TotalsavingsAmount,
                                0.0,
                              ),
                              typeOfContact: valueOrDefault<String>(
                                FFAppState().TipoContrato,
                                'Seleccione la línea de ahorro',
                              ),
                              taxes: 0.0,
                              service: _model.service?.reference,
                              userEmail: valueOrDefault<String>(
                                currentUserEmail,
                                '-',
                              ),
                              userID: valueOrDefault<String>(
                                currentUserUid,
                                '-',
                              ),
                              userTelephoneNumber: valueOrDefault<String>(
                                currentPhoneNumber,
                                '-',
                              ),
                              companyNIT: valueOrDefault<String>(
                                FFAppState().companyNIT,
                                '-',
                              ),
                              compayName: valueOrDefault<String>(
                                FFAppState().NITFoundCompanyName,
                                '-',
                              ),
                              userName: valueOrDefault<String>(
                                currentUserDisplayName,
                                '-',
                              ),
                              company: FFAppState().companyRef,
                              userNIT: valueOrDefault<String>(
                                valueOrDefault(currentUserDocument?.id, ''),
                                '-',
                              ),
                              user: currentUserReference,
                              antiguedad: valueOrDefault<String>(
                                FFAppState().Antiguedad,
                                '-',
                              ),
                              ubicaciontrabajo: valueOrDefault<String>(
                                FFAppState().UbicacionTrabajo,
                                '-',
                              ),
                              salario: valueOrDefault<String>(
                                FFAppState().Salario,
                                '0',
                              ),
                              ahorrosDocPdf1: '',
                            ));
                            _model.ahorro2 = AhorrosRecord.getDocumentFromData(
                                createAhorrosRecordData(
                                  montoTotal: 0.0,
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
                                  totalSavingsPreApproval:
                                      valueOrDefault<double>(
                                    FFAppState().TotalsavingsAmount,
                                    0.0,
                                  ),
                                  typeOfContact: valueOrDefault<String>(
                                    FFAppState().TipoContrato,
                                    'Seleccione la línea de ahorro',
                                  ),
                                  taxes: 0.0,
                                  service: _model.service?.reference,
                                  userEmail: valueOrDefault<String>(
                                    currentUserEmail,
                                    '-',
                                  ),
                                  userID: valueOrDefault<String>(
                                    currentUserUid,
                                    '-',
                                  ),
                                  userTelephoneNumber: valueOrDefault<String>(
                                    currentPhoneNumber,
                                    '-',
                                  ),
                                  companyNIT: valueOrDefault<String>(
                                    FFAppState().companyNIT,
                                    '-',
                                  ),
                                  compayName: valueOrDefault<String>(
                                    FFAppState().NITFoundCompanyName,
                                    '-',
                                  ),
                                  userName: valueOrDefault<String>(
                                    currentUserDisplayName,
                                    '-',
                                  ),
                                  company: FFAppState().companyRef,
                                  userNIT: valueOrDefault<String>(
                                    valueOrDefault(currentUserDocument?.id, ''),
                                    '-',
                                  ),
                                  user: currentUserReference,
                                  antiguedad: valueOrDefault<String>(
                                    FFAppState().Antiguedad,
                                    '-',
                                  ),
                                  ubicaciontrabajo: valueOrDefault<String>(
                                    FFAppState().UbicacionTrabajo,
                                    '-',
                                  ),
                                  salario: valueOrDefault<String>(
                                    FFAppState().Salario,
                                    '0',
                                  ),
                                  ahorrosDocPdf1: '',
                                ),
                                ahorrosRecordReference);

                            await currentUserReference!
                                .update(createUserRecordData(
                              empresaref: FFAppState().companyRef,
                              empresanuevaahorro: FFAppState().companyRef,
                            ));
                            _model.empresareadfirma =
                                await EmpresaRecord.getDocumentOnce(
                                    currentUserDocument!.empresaref!);
                            _model.base64PDFd = await actions.firstPDFCopyCopy(
                              'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/Alianza%20Pdf%20logo.png?alt=media&token=69805315-febc-43ef-9716-181c14efba26',
                              'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/Alianza%20pdf%20logo%20design.png?alt=media&token=52460c6f-9061-42c0-8681-aa5dc3db4c7a',
                              valueOrDefault<String>(
                                FFAppState().typeOfProduct,
                                '-',
                              ),
                              valueOrDefault<String>(
                                dateTimeFormat(
                                  "d/M/y",
                                  getCurrentTimestamp,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                '-',
                              ),
                              valueOrDefault<String>(
                                currentUserDisplayName,
                                '-',
                              ),
                              valueOrDefault<String>(
                                valueOrDefault(
                                    currentUserDocument?.tipoDocumento, ''),
                                '-',
                              ),
                              valueOrDefault<String>(
                                valueOrDefault(currentUserDocument?.nit, ''),
                                '-',
                              ),
                              valueOrDefault<String>(
                                dateTimeFormat(
                                  "d/M/y",
                                  currentUserDocument?.fechaExpedicion,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                '-',
                              ),
                              valueOrDefault<String>(
                                valueOrDefault(
                                    currentUserDocument?.ciudadExpedicion, ''),
                                '-',
                              ),
                              valueOrDefault<String>(
                                valueOrDefault(
                                    currentUserDocument?.direccion, ''),
                                '-',
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
                                '-',
                              ),
                              valueOrDefault<String>(
                                currentPhoneNumber,
                                '-',
                              ),
                              '-',
                              valueOrDefault<String>(
                                currentUserDisplayName,
                                '-',
                              ),
                              valueOrDefault<String>(
                                valueOrDefault(currentUserDocument?.nit, ''),
                                '-',
                              ),
                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/98bwu2s3373e/64af4586-f309-4ab3-aa9d-db083b675bda.jpg',
                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/70tcb6sabncz/d0b34d06-f023-4b51-a1fa-249512acd7ff.jpg',
                              valueOrDefault<String>(
                                _model.empresareadfirma?.razonsocial,
                                '--',
                              ),
                              '--',
                              valueOrDefault<String>(
                                _model.empresareadfirma?.nit,
                                '--',
                              ),
                              valueOrDefault<String>(
                                FFAppState().TipoContrato,
                                '-',
                              ),
                              valueOrDefault<String>(
                                FFAppState().UbicacionTrabajo,
                                '-',
                              ),
                              valueOrDefault<String>(
                                FFAppState().TotalsavingsAmount.toString(),
                                ' -',
                              ),
                              'Mensual',
                            );
                            _model.apiResultwkv =
                                await InitiateSignatureCopyCopyCopyCall.call(
                              name: currentUserDisplayName,
                              pdfString: _model.base64PDFd,
                              externalId: _model.ahorro2?.reference.id,
                              email: currentUserEmail,
                              redirectURL:
                                  'alianza://alianza.com/modalCopyCopy2',
                              phone: currentPhoneNumber,
                            );

                            if ((_model.apiResultwkv?.succeeded ?? true)) {
                              FFAppState().zapsignToken =
                                  InitiateSignatureCopyCopyCopyCall
                                      .documentToken(
                                (_model.apiResultwkv?.jsonBody ?? ''),
                              )!;
                              safeSetState(() {});
                              await PlaceSignatureInCDATCall.call(
                                token: valueOrDefault<String>(
                                  InitiateSignatureCopyCopyCopyCall
                                      .documentToken(
                                    (_model.apiResultwkv?.jsonBody ?? ''),
                                  ),
                                  '-',
                                ),
                                signerToken: valueOrDefault<String>(
                                  InitiateSignatureCopyCopyCopyCall
                                      .signersToken(
                                    (_model.apiResultwkv?.jsonBody ?? ''),
                                  ),
                                  '-',
                                ),
                              );

                              await launchURL(
                                  InitiateSignatureCopyCopyCopyCall.signURL(
                                (_model.apiResultwkv?.jsonBody ?? ''),
                              )!);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    InitiateSignatureCopyCopyCopyCall
                                        .errorMessage(
                                      (_model.apiResultwkv?.jsonBody ?? ''),
                                    )!,
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).error,
                                ),
                              );
                            }

                            safeSetState(() {});
                          },
                          text: 'Firmar',
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 0.06,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).customColor4,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
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
            ],
          ),
        ),
      ),
    );
  }
}
