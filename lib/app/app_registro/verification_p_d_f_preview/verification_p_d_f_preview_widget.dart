import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'verification_p_d_f_preview_model.dart';
export 'verification_p_d_f_preview_model.dart';

class VerificationPDFPreviewWidget extends StatefulWidget {
  const VerificationPDFPreviewWidget({super.key});

  static String routeName = 'verificationPDFPreview';
  static String routePath = '/verificationPDFPreview';

  @override
  State<VerificationPDFPreviewWidget> createState() =>
      _VerificationPDFPreviewWidgetState();
}

class _VerificationPDFPreviewWidgetState
    extends State<VerificationPDFPreviewWidget> with TickerProviderStateMixin {
  late VerificationPDFPreviewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerificationPDFPreviewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.pdfOutput = await actions.createUpdatedPDFUploadedFile(
        currentUserDisplayName,
        valueOrDefault(currentUserDocument?.genero, ''),
        dateTimeFormat(
          "d/M/y",
          currentUserDocument!.fechaNacimiento!,
          locale: FFLocalizations.of(context).languageCode,
        ),
        valueOrDefault(currentUserDocument?.ciudadNacimiento, ''),
        valueOrDefault(currentUserDocument?.tipoDocumento, ''),
        valueOrDefault(currentUserDocument?.nit, ''),
        dateTimeFormat(
          "d/M/y",
          currentUserDocument!.fechaExpedicion!,
          locale: FFLocalizations.of(context).languageCode,
        ),
        valueOrDefault(currentUserDocument?.ciudadExpedicion, ''),
        valueOrDefault(currentUserDocument?.direccion, ''),
        valueOrDefault(currentUserDocument?.ciudad, ''),
        valueOrDefault(currentUserDocument?.barrio, ''),
        currentUserEmail,
        valueOrDefault(currentUserDocument?.telefono1, ''),
        valueOrDefault(currentUserDocument?.telefono1, ''),
        valueOrDefault<bool>(currentUserDocument?.flgPPE, false),
        valueOrDefault<bool>(currentUserDocument?.flgRelativesPPE, false),
        valueOrDefault(currentUserDocument?.relativeFullname, ''),
        valueOrDefault(currentUserDocument?.relativeId, ''),
        (currentUserDocument?.fundsSource?.toList() ?? [])
            .contains(MoneySources.Salario.name),
        (currentUserDocument?.fundsSource?.toList() ?? [])
            .contains(MoneySources.Pension.name),
        (currentUserDocument?.fundsSource?.toList() ?? [])
            .contains(FFAppConstants.Honorarios),
        (currentUserDocument?.fundsSource?.toList() ?? [])
            .contains(MoneySources.Otros.name),
        valueOrDefault(currentUserDocument?.digiteOtrasFuentes, ''),
      );

      FFAppState().update(() {});
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
        backgroundColor: Color(0xFF0B35B8),
        body: Form(
          key: _model.formKey,
          autovalidateMode: AutovalidateMode.disabled,
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
                    padding: EdgeInsetsDirectional.fromSTEB(
                        0.0,
                        valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.07110,
                          60.0,
                        ),
                        0.0,
                        4.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0,
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.01422,
                                12.0,
                              ),
                              8.0,
                              0.0),
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
                                          20.0, 0.0, 12.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.asset(
                                          'assets/images/edit_icon.png',
                                          height: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.03792,
                                            32.0,
                                          ),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: AutoSizeText(
                                      'AFILIACIÓN Y/O VINCULACIÓN',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.02133,
                                              18.0,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 20.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: Image.asset(
                                      'assets/images/Group_(10).png',
                                      width: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).width *
                                            0.07179,
                                        28.0,
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
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
                                    width: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).width *
                                          0.12821,
                                      50.0,
                                    ),
                                    height: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.05925,
                                      50.0,
                                    ),
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
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.04266,
                                      36.0,
                                    ),
                                    height: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.04266,
                                      36.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .customColor4,
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Icon(
                                      Icons.check_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      size: 24.0,
                                    ),
                                  ),
                                  Container(
                                    width: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.04266,
                                      36.0,
                                    ),
                                    height: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.04266,
                                      36.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .customColor4,
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Icon(
                                      Icons.check_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      size: 24.0,
                                    ),
                                  ),
                                  Container(
                                    width: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.04266,
                                      36.0,
                                    ),
                                    height: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.04266,
                                      36.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .customColor4,
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Icon(
                                      Icons.check_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      size: 24.0,
                                    ),
                                  ),
                                  Container(
                                    width: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.04266,
                                      36.0,
                                    ),
                                    height: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.04266,
                                      36.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      '4',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.01659,
                                              14.0,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                  Container(
                                    width: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.04266,
                                      36.0,
                                    ),
                                    height: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.04266,
                                      36.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0x1FFFFFFF),
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      '5',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            fontSize: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.01659,
                                              14.0,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 4.0)),
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
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (_model.pdfOutput != null &&
                            (_model.pdfOutput?.bytes?.isNotEmpty ?? false))
                          FlutterFlowPdfViewer(
                            fileBytes: _model.pdfOutput?.bytes,
                            height: valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.46919,
                              396.0,
                            ),
                            horizontalScroll: false,
                          ),
                        if (_model.pdfOutput == null ||
                            (_model.pdfOutput?.bytes?.isEmpty ?? true))
                          Flexible(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: FaIcon(
                                FontAwesomeIcons.circleNotch,
                                color:
                                    FlutterFlowTheme.of(context).customColor4,
                                size: 40.0,
                              ).animateOnPageLoad(
                                  animationsMap['iconOnPageLoadAnimation']!),
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: AutoSizeText(
                            'Documento firmado electronicamente',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Satoshi',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.01659,
                                    14.0,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0,
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.06636,
                                56.0,
                              ),
                              0.0,
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.04266,
                                36.0,
                              )),
                          child: FFButtonWidget(
                            onPressed: () async {
                              _model.pdfBase64Copy =
                                  await actions.createUpdatedPDF(
                                currentUserDisplayName,
                                valueOrDefault(currentUserDocument?.genero, ''),
                                dateTimeFormat(
                                  "d/M/y",
                                  currentUserDocument!.fechaNacimiento!,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                valueOrDefault(
                                    currentUserDocument?.ciudadNacimiento, ''),
                                valueOrDefault(
                                    currentUserDocument?.tipoDocumento, ''),
                                valueOrDefault(currentUserDocument?.nit, ''),
                                dateTimeFormat(
                                  "d/M/y",
                                  currentUserDocument!.fechaExpedicion!,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                valueOrDefault(
                                    currentUserDocument?.ciudadExpedicion, ''),
                                valueOrDefault(
                                    currentUserDocument?.direccion, ''),
                                valueOrDefault(currentUserDocument?.ciudad, ''),
                                valueOrDefault(currentUserDocument?.barrio, ''),
                                currentUserEmail,
                                valueOrDefault(
                                    currentUserDocument?.telefono1, ''),
                                valueOrDefault(
                                    currentUserDocument?.telefono1, ''),
                                valueOrDefault<bool>(
                                    currentUserDocument?.flgPPE, false),
                                valueOrDefault<bool>(
                                    currentUserDocument?.flgRelativesPPE,
                                    false),
                                valueOrDefault(
                                    currentUserDocument?.relativeFullname, ''),
                                valueOrDefault(
                                    currentUserDocument?.relativeId, ''),
                                (currentUserDocument?.fundsSource?.toList() ??
                                        [])
                                    .contains(MoneySources.Salario.name),
                                (currentUserDocument?.fundsSource?.toList() ??
                                        [])
                                    .contains(MoneySources.Pension.name),
                                (currentUserDocument?.fundsSource?.toList() ??
                                        [])
                                    .contains(FFAppConstants.Honorarios),
                                (currentUserDocument?.fundsSource?.toList() ??
                                        [])
                                    .contains(MoneySources.Otros.name),
                                valueOrDefault(
                                    currentUserDocument?.digiteOtrasFuentes,
                                    ''),
                              );
                              _model.apiResultfxjCopy =
                                  await InitiateSignatureCall.call(
                                name: currentUserDisplayName,
                                pdfString: _model.pdfBase64Copy,
                                externalId: currentUserUid,
                                email: currentUserEmail,
                                phone: valueOrDefault(
                                    currentUserDocument?.telefono1, ''),
                                redirectURL:
                                    'alianza://alianza.com/intermissionZapsign',
                              );

                              if ((_model.apiResultfxjCopy?.succeeded ??
                                  true)) {
                                FFAppState().zapsignToken =
                                    InitiateSignatureCall.documentToken(
                                  (_model.apiResultfxjCopy?.jsonBody ?? ''),
                                )!;
                                safeSetState(() {});
                                await PlaceSignatureInVerificationPDFCall.call(
                                  token: InitiateSignatureCall.documentToken(
                                    (_model.apiResultfxjCopy?.jsonBody ?? ''),
                                  ),
                                  signerToken:
                                      InitiateSignatureCall.signersToken(
                                    (_model.apiResultfxjCopy?.jsonBody ?? ''),
                                  ),
                                );

                                await launchURL(InitiateSignatureCall.signURL(
                                  (_model.apiResultfxjCopy?.jsonBody ?? ''),
                                )!);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      InitiateSignatureCall.errorMessage(
                                        (_model.apiResultfxjCopy?.jsonBody ??
                                            ''),
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
                              height: 48.0,
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
                                    fontSize: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.01896,
                                      16.0,
                                    ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
