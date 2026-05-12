import '/app/appcdat/cdatretiros/cdatretiros_widget.dart';
import '/app/otros/animacionmenu/animacionmenu_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/pages/sucess_mensaje_error/sucess_mensaje_error_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'a_h_o_r_r_o_scdat2_model.dart';
export 'a_h_o_r_r_o_scdat2_model.dart';

class AHORROScdat2Widget extends StatefulWidget {
  const AHORROScdat2Widget({
    super.key,
    required this.cdat,
    this.pendienteretiro,
  });

  final CdatsRecord? cdat;
  final ConfirmacionretirosRecord? pendienteretiro;

  static String routeName = 'AHORROScdat2';
  static String routePath = '/aHORROScdat2';

  @override
  State<AHORROScdat2Widget> createState() => _AHORROScdat2WidgetState();
}

class _AHORROScdat2WidgetState extends State<AHORROScdat2Widget> {
  late AHORROScdat2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AHORROScdat2Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
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
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        20.0,
                        valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.07110,
                          60.0,
                        ),
                        20.0,
                        0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 8.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.safePop();
                                    },
                                    child: Icon(
                                      Icons.arrow_back_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ),
                              AutoSizeText(
                                'CDAT',
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                minFontSize: 14.0,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Satoshi',
                                      fontSize: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.02133,
                                        18.0,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      lineHeight: 1.0,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/Group_91.png',
                            width: 80.0,
                            height: valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.02844,
                              24.0,
                            ),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ].divide(SizedBox(width: 4.0)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        20.0,
                        valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.02844,
                          24.0,
                        ),
                        20.0,
                        0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.16,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Container(
                              height: MediaQuery.sizeOf(context).height * 0.14,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    FlutterFlowTheme.of(context).fondo,
                                    Color(0xFF002CE9)
                                  ],
                                  stops: [0.0, 1.0],
                                  begin: AlignmentDirectional(0.03, -1.0),
                                  end: AlignmentDirectional(-0.03, 1.0),
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.14,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.asset(
                                      'assets/images/Frame_2609784_(1).png',
                                    ).image,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0,
                                      valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.01422,
                                        12.0,
                                      ),
                                      0.0,
                                      0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      StreamBuilder<List<RetirosCdatRecord>>(
                                        stream: queryRetirosCdatRecord(
                                          singleRecord: true,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<RetirosCdatRecord>
                                              textRetirosCdatRecordList =
                                              snapshot.data!;
                                          // Return an empty Container when the item does not exist.
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }
                                          final textRetirosCdatRecord =
                                              textRetirosCdatRecordList
                                                      .isNotEmpty
                                                  ? textRetirosCdatRecordList
                                                      .first
                                                  : null;

                                          return AutoSizeText(
                                            valueOrDefault<String>(
                                              functions.formatAmount(
                                                  valueOrDefault<double>(
                                                widget!.cdat?.saldoDisponible,
                                                0.0,
                                              )),
                                              '\$0',
                                            ),
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            minFontSize: 18.0,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  fontSize:
                                                      valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.02844,
                                                    24.0,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          );
                                        },
                                      ),
                                      AutoSizeText(
                                        'Mi saldo',
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        minFontSize: 10.0,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .height *
                                                    0.01659,
                                                14.0,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.02370,
                                              20.0,
                                            ),
                                            valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.02370,
                                              20.0,
                                            ),
                                            valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.02370,
                                              20.0,
                                            ),
                                            12.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              CdatdetalleretiroWidget.routeName,
                                              queryParameters: {
                                                'cdats': serializeParam(
                                                  widget!.cdat,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'cdats': widget!.cdat,
                                              },
                                            );
                                          },
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.03792,
                                              32.0,
                                            ),
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color(0xFF3157CE),
                                                  Color(0xFF1B7ADC)
                                                ],
                                                stops: [0.0, 1.0],
                                                begin: AlignmentDirectional(
                                                    0.34, -1.0),
                                                end: AlignmentDirectional(
                                                    -0.34, 1.0),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              shape: BoxShape.rectangle,
                                            ),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  CdatdetalleretiroWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'cdats': serializeParam(
                                                      widget!.cdat,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'cdats': widget!.cdat,
                                                  },
                                                );
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  AutoSizeText(
                                                    '',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color:
                                                              Color(0x00262632),
                                                          fontSize: 8.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w100,
                                                        ),
                                                  ),
                                                  AutoSizeText(
                                                    'Detalles de inversión',
                                                    textAlign: TextAlign.center,
                                                    maxLines: 1,
                                                    minFontSize: 10.0,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize:
                                                              valueOrDefault<
                                                                  double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.01659,
                                                            14.0,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                  Icon(
                                                    Icons
                                                        .keyboard_arrow_right_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    size: 24.0,
                                                  ),
                                                ],
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
                          ),
                          Align(
                            alignment: AlignmentDirectional(1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 12.0, 0.0),
                              child: Container(
                                width: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).width * 0.08974,
                                  35.0,
                                ),
                                height: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.06636,
                                  56.0,
                                ),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.asset(
                                      'assets/images/path1320_(1).png',
                                    ).image,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 3.0, 0.0, 0.0),
                                      child: AutoSizeText(
                                        '${valueOrDefault<String>(
                                          widget!.cdat?.ea?.toString(),
                                          '0',
                                        )} %',
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        minFontSize: 8.0,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                    AutoSizeText(
                                      'E.A',
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      minFontSize: 6.0,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.0095,
                                              8.0,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
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
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0,
                            valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.02370,
                              20.0,
                            ),
                            20.0,
                            0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Builder(
                                  builder: (context) => InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (valueOrDefault<double>(
                                            widget!.cdat?.saldoDisponible,
                                            0.0,
                                          ) >
                                          0.0) {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          useSafeArea: true,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: CdatretirosWidget(
                                                  cdatsss: widget!.cdat,
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(dialogContext)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: SucessMensajeErrorWidget(
                                                  titulo: 'Error!',
                                                  descripcion:
                                                      'No tienes saldo disponible',
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      }
                                    },
                                    child: Container(
                                      height: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.09480,
                                        80.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEEF1FA),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 1.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(1.0),
                                              child: Image.asset(
                                                'assets/images/Frame_98_(2).png',
                                                width: 30.0,
                                                height: 28.0,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            AutoSizeText(
                                              'Retirar',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Satoshi',
                                                    fontSize:
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.01659,
                                                      14.0,
                                                    ),
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.09480,
                                    80.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEF1FA),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(1.0),
                                        child: Image.asset(
                                          'assets/images/Group_94_(1).png',
                                          width: 30.0,
                                          height: 28.0,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      AutoSizeText(
                                        'Transferir',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              fontSize: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .height *
                                                    0.01659,
                                                14.0,
                                              ),
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ].divide(SizedBox(height: 4.0)),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.09480,
                                  80.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEF1FA),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(1.0),
                                      child: Image.asset(
                                        'assets/images/Group_95_(1).png',
                                        width: 30.0,
                                        height: 28.0,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    AutoSizeText(
                                      'Certificado',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            fontSize: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.01659,
                                              14.0,
                                            ),
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ].divide(SizedBox(height: 4.0)),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(
                              width: valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.01422,
                            12.0,
                          ))),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        20.0,
                        valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.03792,
                          32.0,
                        ),
                        20.0,
                        32.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          MovimientoscdatWidget.routeName,
                          queryParameters: {
                            'cdat': serializeParam(
                              widget!.cdat,
                              ParamType.Document,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            'cdat': widget!.cdat,
                          },
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 48.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).customColor5,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              14.0, 0.0, 14.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: Image.asset(
                                      'assets/images/Frame_(54).png',
                                      width: 24.0,
                                      height: 24.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  AutoSizeText(
                                    'Mis movimientos',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          fontSize: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.01659,
                                            14.0,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 8.0)),
                              ),
                              Icon(
                                Icons.chevron_right,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEF1FA),
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: Color(0xFFEEF1FA),
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(),
                                  child: Image.asset(
                                    'assets/images/Group_93_(1).png',
                                    width: 32.0,
                                    height: 32.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      70.0, 8.0, 70.0, 0.0),
                                  child: AutoSizeText(
                                    'Inicia tu planificación financiera',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: Color(0xFF0B35B8),
                                          fontSize: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.01896,
                                            16.0,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 8.0, 20.0, 0.0),
                                  child: Text(
                                    'Simula tus proyecciones financieras y proyecta tus rendimientos con Alianza Capital',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.01659,
                                            14.0,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 24.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () {
                                      print('Button pressed ...');
                                    },
                                    text: 'Iniciar ahora',
                                    options: FFButtonOptions(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 48.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .customColor4,
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
                ],
              ),
            ),
            if (responsiveVisibility(
              context: context,
              desktop: false,
            ))
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: wrapWithModel(
                  model: _model.animacionmenuModel,
                  updateCallback: () => safeSetState(() {}),
                  child: AnimacionmenuWidget(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
