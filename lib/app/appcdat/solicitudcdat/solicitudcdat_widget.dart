import '/app/otros/animacionmenu/animacionmenu_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'solicitudcdat_model.dart';
export 'solicitudcdat_model.dart';

class SolicitudcdatWidget extends StatefulWidget {
  const SolicitudcdatWidget({
    super.key,
    required this.cdats,
  });

  final CdatsRecord? cdats;

  static String routeName = 'solicitudcdat';
  static String routePath = '/solicitudcdat';

  @override
  State<SolicitudcdatWidget> createState() => _SolicitudcdatWidgetState();
}

class _SolicitudcdatWidgetState extends State<SolicitudcdatWidget> {
  late SolicitudcdatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SolicitudcdatModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.ciudadbf = await actions.getJson(
        'https://opensheet.elk.sh/1VMxcLvCSOE0czms4r-mcd4HYsFneFx0lN6GZ2__hqoU/CIUDADES',
      );
      FFAppState().gsheets = _model.ciudadbf!;
      FFAppState().lastAction = getCurrentTimestamp;
      safeSetState(() {});
      FFAppState().lastAction = getCurrentTimestamp;
      safeSetState(() {});
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 10000),
        callback: (timer) async {
          if (functions.past5Mins(FFAppState().lastAction!)) {
            GoRouter.of(context).prepareAuthEvent();
            await authManager.signOut();
            GoRouter.of(context).clearRedirectLocation();

            context.goNamedAuth(
                CierredeSesionWidget.routeName, context.mounted);

            _model.instantTimer?.cancel();
          }
        },
        startImmediately: false,
      );
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 54.0, 0.0, 20.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 0.0, 0.0),
                                  child: InkWell(
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
                                ),
                                AutoSizeText(
                                  'Solicitud',
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  minFontSize: 14.0,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Satoshi',
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ].divide(SizedBox(width: 8.0)),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    46.0, 32.0, 46.0, 0.0),
                                child: AutoSizeText(
                                  'Estás a unos pasos de tu próxima inversión',
                                  textAlign: TextAlign.center,
                                  maxLines: 3,
                                  minFontSize: 18.0,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Satoshi',
                                        fontSize: 24.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 28.0, 20.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 36.0,
                                        height: 36.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF002CE9),
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                        child: Icon(
                                          Icons.check,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          size: 20.0,
                                        ),
                                      ),
                                      Container(
                                        width: 1.6,
                                        height: 76.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF002CE9),
                                        ),
                                      ),
                                      Container(
                                        width: 36.0,
                                        height: 36.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF002CE9),
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                        child: Icon(
                                          Icons.check,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          size: 24.0,
                                        ),
                                      ),
                                      Container(
                                        width: 1.6,
                                        height: 76.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF002CE9),
                                        ),
                                      ),
                                      Container(
                                        width: 36.0,
                                        height: 36.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF002CE9),
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                        child: Icon(
                                          Icons.check,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          size: 20.0,
                                        ),
                                      ),
                                      Container(
                                        width: 1.6,
                                        height: 76.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF002CE9),
                                        ),
                                      ),
                                      Container(
                                        width: 36.0,
                                        height: 36.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          border: Border.all(
                                            color: Color(0xFF002CE9),
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: AutoSizeText(
                                            '4',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  color: Color(0xFF002CE9),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            14.0, 0.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 6.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  AutoSizeText(
                                                    valueOrDefault<String>(
                                                      functions.formatAmount(
                                                          valueOrDefault<
                                                              double>(
                                                        widget!
                                                            .cdats?.inversion,
                                                        0.0,
                                                      )),
                                                      '0',
                                                    ),
                                                    textAlign: TextAlign.start,
                                                    maxLines: 1,
                                                    minFontSize: 16.0,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: AutoSizeText(
                                                      'Define tu monto de inversión',
                                                      textAlign:
                                                          TextAlign.start,
                                                      maxLines: 1,
                                                      minFontSize: 10.0,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Satoshi',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(height: 6.0)),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    AutoSizeText(
                                                      'Transferencia y/o depósito',
                                                      textAlign:
                                                          TextAlign.start,
                                                      maxLines: 1,
                                                      minFontSize: 14.0,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Satoshi',
                                                            fontSize: 20.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  2.0,
                                                                  0.0),
                                                      child: AutoSizeText(
                                                        'Podrás transferir y/o depositar desde cualquier entidad financiera en Colombia.',
                                                        textAlign:
                                                            TextAlign.start,
                                                        maxLines: 2,
                                                        minFontSize: 10.0,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Satoshi',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 6.0)),
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                AutoSizeText(
                                                  'Estado de aprobación',
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  minFontSize: 14.0,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Satoshi',
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: AutoSizeText(
                                                    'Tu firma será 100% digital.',
                                                    textAlign: TextAlign.start,
                                                    maxLines: 1,
                                                    minFontSize: 10.0,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 6.0)),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    AutoSizeText(
                                                      'Firmar documentación',
                                                      textAlign:
                                                          TextAlign.start,
                                                      maxLines: 1,
                                                      minFontSize: 14.0,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Satoshi',
                                                            color: Color(
                                                                0xFF002CE9),
                                                            fontSize: 20.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                    AutoSizeText(
                                                      'Tu firma será 100% digital.',
                                                      textAlign:
                                                          TextAlign.start,
                                                      maxLines: 1,
                                                      minFontSize: 10.0,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Satoshi',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 6.0)),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 44.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 110.0, 20.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  context.pushNamed(
                                    NuevaaperturacdatWidget.routeName,
                                    queryParameters: {
                                      'cdats': serializeParam(
                                        widget!.cdats,
                                        ParamType.Document,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'cdats': widget!.cdats,
                                      '__transition_info__': TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.rightToLeft,
                                        duration: Duration(milliseconds: 500),
                                      ),
                                    },
                                  );
                                },
                                text: 'Firmar ahora',
                                options: FFButtonOptions(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.06,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color:
                                      FlutterFlowTheme.of(context).customColor4,
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
            if (responsiveVisibility(
              context: context,
              phone: false,
              desktop: false,
            ))
              wrapWithModel(
                model: _model.animacionmenuModel,
                updateCallback: () => safeSetState(() {}),
                child: AnimacionmenuWidget(),
              ),
          ],
        ),
      ),
    );
  }
}
