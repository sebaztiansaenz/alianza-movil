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
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pas4cdat_model.dart';
export 'pas4cdat_model.dart';

class Pas4cdatWidget extends StatefulWidget {
  const Pas4cdatWidget({
    super.key,
    required this.cdats,
  });

  final CdatsRecord? cdats;

  static String routeName = 'pas4cdat';
  static String routePath = '/pas4cdat';

  @override
  State<Pas4cdatWidget> createState() => _Pas4cdatWidgetState();
}

class _Pas4cdatWidgetState extends State<Pas4cdatWidget>
    with TickerProviderStateMixin {
  late Pas4cdatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Pas4cdatModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.retiross = await queryRetirosCdatRecordOnce(
        parent: widget!.cdats?.reference,
        queryBuilder: (retirosCdatRecord) =>
            retirosCdatRecord.orderBy('Fecharetiro'),
      );
      _model.pdfcdat = await actions.generateCDATSinglePage(
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
          valueOrDefault(currentUserDocument?.telefono1, ''),
          '-',
        ),
        valueOrDefault<String>(
          valueOrDefault(currentUserDocument?.telefono2, ''),
          '-',
        ),
        valueOrDefault<String>(
          functions.formatAmount(valueOrDefault<double>(
            widget!.cdats?.inversion,
            0.0,
          )),
          '0',
        ),
        valueOrDefault<String>(
          widget!.cdats?.ea?.toString(),
          '-',
        ),
        valueOrDefault<String>(
          widget!.cdats?.tiempo?.toString(),
          '-',
        ),
        valueOrDefault<String>(
          dateTimeFormat(
            "d/M/y",
            widget!.cdats?.fechaApertura,
            locale: FFLocalizations.of(context).languageCode,
          ),
          '-',
        ),
        valueOrDefault<String>(
          dateTimeFormat(
            "d/M/y",
            widget!.cdats?.fechaFinalizacion,
            locale: FFLocalizations.of(context).languageCode,
          ),
          '-',
        ),
        valueOrDefault<String>(
          functions.formatAmount(widget!.cdats!.rendimiento),
          '-',
        ),
        valueOrDefault<String>(
          functions.formatAmount(widget!.cdats!.retefuenteMonto),
          '-',
        ),
        valueOrDefault<String>(
          functions.formatAmount(widget!.cdats!.ganancias),
          '-',
        ),
        valueOrDefault<String>(
          functions.formatAmount(valueOrDefault<double>(
            valueOrDefault<double>(
                  widget!.cdats?.inversion,
                  0.0,
                ) +
                valueOrDefault<double>(
                  widget!.cdats?.ganancias,
                  0.0,
                ),
            0.0,
          )),
          '-',
        ),
        valueOrDefault<String>(
          functions.formatAmount(_model.retiross!.elementAtOrNull(0)!.monto),
          '-',
        ),
        valueOrDefault<String>(
          functions.formatAmount(_model.retiross!.elementAtOrNull(1)!.monto),
          '-',
        ),
        valueOrDefault<String>(
          widget!.cdats?.tiempo == 12
              ? valueOrDefault<String>(
                  functions
                      .formatAmount(_model.retiross!.elementAtOrNull(2)!.monto),
                  '-',
                )
              : '0',
          '0',
        ),
        valueOrDefault<String>(
          widget!.cdats?.tiempo == 12
              ? valueOrDefault<String>(
                  functions
                      .formatAmount(_model.retiross!.elementAtOrNull(3)!.monto),
                  '-',
                )
              : '0',
          '0',
        ),
        'APERTURA DE CDAT',
        valueOrDefault<String>(
          functions.formatAmount(valueOrDefault<double>(
            widget!.cdats?.inversion,
            0.0,
          )),
          '0',
        ),
        valueOrDefault<String>(
          widget!.cdats?.origenrecursos,
          '-',
        ),
        valueOrDefault<String>(
          widget!.cdats?.tiempo?.toString(),
          '6',
        ),
        valueOrDefault<String>(
          widget!.cdats?.observaciones,
          ' -',
        ),
      );
      _model.cdat = InstantTimer.periodic(
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
          child: SingleChildScrollView(
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
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 4.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
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
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.safePop();
                                        },
                                        child: Icon(
                                          Icons.arrow_back,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: AutoSizeText(
                                          'Firma CDAT',
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 10.0)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (_model.pdfcdat != null &&
                    (_model.pdfcdat?.bytes?.isNotEmpty ?? false))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 36.0, 20.0, 0.0),
                    child: FlutterFlowPdfViewer(
                      fileBytes: _model.pdfcdat?.bytes,
                      height: 400.0,
                      horizontalScroll: false,
                    ),
                  ),
                if (_model.pdfcdat == null ||
                    (_model.pdfcdat?.bytes?.isEmpty ?? true))
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                        child: FaIcon(
                          FontAwesomeIcons.circleNotch,
                          color: FlutterFlowTheme.of(context).customColor4,
                          size: 40.0,
                        ).animateOnPageLoad(
                            animationsMap['iconOnPageLoadAnimation']!),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Text(
                          'Tu documento se está cargando',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Satoshi',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ],
                  ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
                  child: AutoSizeText(
                    'Documento firmado electronicamente',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Satoshi',
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 56.0, 20.0, 50.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      _model.base64PDFd2 = await actions.cdatStringPdf(
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
                          valueOrDefault(currentUserDocument?.telefono1, ''),
                          '-',
                        ),
                        valueOrDefault<String>(
                          valueOrDefault(currentUserDocument?.telefono2, ''),
                          '-',
                        ),
                        valueOrDefault<String>(
                          functions.formatAmount(valueOrDefault<double>(
                            widget!.cdats?.inversion,
                            0.0,
                          )),
                          '-',
                        ),
                        valueOrDefault<String>(
                          '${valueOrDefault<String>(
                            widget!.cdats?.ea?.toString(),
                            '-',
                          )} %',
                          '-',
                        ),
                        valueOrDefault<String>(
                          widget!.cdats?.tiempo?.toString(),
                          '-',
                        ),
                        valueOrDefault<String>(
                          dateTimeFormat(
                            "d/M/y",
                            widget!.cdats?.fechaApertura,
                            locale: FFLocalizations.of(context).languageCode,
                          ),
                          '-',
                        ),
                        valueOrDefault<String>(
                          dateTimeFormat(
                            "d/M/y",
                            widget!.cdats?.fechaFinalizacion,
                            locale: FFLocalizations.of(context).languageCode,
                          ),
                          '-',
                        ),
                        valueOrDefault<String>(
                          functions.formatAmount(widget!.cdats!.rendimiento),
                          '-',
                        ),
                        valueOrDefault<String>(
                          functions
                              .formatAmount(widget!.cdats!.retefuenteMonto),
                          '-',
                        ),
                        functions.formatAmount(widget!.cdats!.ganancias),
                        functions.formatAmount(widget!.cdats!.inversion +
                            widget!.cdats!.ganancias),
                        functions.formatAmount(
                            _model.retiross!.elementAtOrNull(0)!.monto),
                        functions.formatAmount(
                            _model.retiross!.elementAtOrNull(1)!.monto),
                        valueOrDefault<String>(
                          widget!.cdats?.tiempo == 12
                              ? valueOrDefault<String>(
                                  functions.formatAmount(_model.retiross!
                                      .elementAtOrNull(2)!
                                      .monto),
                                  '-',
                                )
                              : '0',
                          '0',
                        ),
                        valueOrDefault<String>(
                          widget!.cdats?.tiempo == 12
                              ? valueOrDefault<String>(
                                  functions.formatAmount(_model.retiross!
                                      .elementAtOrNull(3)!
                                      .monto),
                                  '-',
                                )
                              : '0',
                          '0',
                        ),
                        'APERTURA DE CDAT',
                        functions.formatAmount(valueOrDefault<double>(
                          widget!.cdats?.inversion,
                          0.0,
                        )),
                        widget!.cdats!.origenrecursos,
                        widget!.cdats!.tiempo.toString(),
                        widget!.cdats!.observaciones,
                      );
                      _model.apiResultwkv = await CDATFirmaZapsignCall.call(
                        name: currentUserDisplayName,
                        pdfString: _model.base64PDFd2,
                        externalId: widget!.cdats?.reference.id,
                        email: currentUserEmail,
                        redirectURL: 'alianza://alianza.com/pas5firmacdat',
                        phone:
                            valueOrDefault(currentUserDocument?.telefono1, ''),
                      );

                      if ((_model.apiResultwkv?.succeeded ?? true)) {
                        FFAppState().appstateCDAT =
                            CDATFirmaZapsignCall.documentToken(
                          (_model.apiResultwkv?.jsonBody ?? ''),
                        )!;
                        safeSetState(() {});
                        await PlaceSignatureInCDATCall.call(
                          token: CDATFirmaZapsignCall.documentToken(
                            (_model.apiResultwkv?.jsonBody ?? ''),
                          ),
                          signerToken: CDATFirmaZapsignCall.signersToken(
                            (_model.apiResultwkv?.jsonBody ?? ''),
                          ),
                        );

                        await launchURL(CDATFirmaZapsignCall.signURL(
                          (_model.apiResultwkv?.jsonBody ?? ''),
                        )!);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              CDATFirmaZapsignCall.errorMessage(
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
                      height: MediaQuery.sizeOf(context).height * 0.06,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).customColor4,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
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
      ),
    );
  }
}
