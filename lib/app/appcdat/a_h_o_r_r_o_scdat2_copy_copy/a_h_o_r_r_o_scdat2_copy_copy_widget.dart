import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'a_h_o_r_r_o_scdat2_copy_copy_model.dart';
export 'a_h_o_r_r_o_scdat2_copy_copy_model.dart';

class AHORROScdat2CopyCopyWidget extends StatefulWidget {
  const AHORROScdat2CopyCopyWidget({
    super.key,
    required this.cdat,
    this.pendienteretiro,
  });

  final CdatsRecord? cdat;
  final ConfirmacionretirosRecord? pendienteretiro;

  static String routeName = 'AHORROScdat2CopyCopy';
  static String routePath = '/aHORROScdat2CopyCopy';

  @override
  State<AHORROScdat2CopyCopyWidget> createState() =>
      _AHORROScdat2CopyCopyWidgetState();
}

class _AHORROScdat2CopyCopyWidgetState
    extends State<AHORROScdat2CopyCopyWidget> {
  late AHORROScdat2CopyCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AHORROScdat2CopyCopyModel());

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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
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
                                'Detalles de inversión',
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
                      ].divide(SizedBox(width: 4.0)),
                    ),
                  ),
                  if (widget!.cdat?.ea == 13.5)
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                1.0,
                                valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.02844,
                                  24.0,
                                ),
                                1.0,
                                0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 295.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: Image.network(
                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/zqbn4sr0wpp6/7dafa28437523521365d070c75f2b16f7fd0e227.png',
                                  ).image,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              functions.formatAmount(
                                                  valueOrDefault<double>(
                                                widget!.cdat?.inversion,
                                                0.0,
                                              )),
                                              '\$ 0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Text(
                                            'Inversión',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              functions.formatAmount(
                                                  valueOrDefault<double>(
                                                widget!.cdat?.saldoDisponible,
                                                0.0,
                                              )),
                                              '\$ 0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  color: Color(0xFF002CE9),
                                                  fontSize: 36.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                          ),
                                          Text(
                                            'Mi saldo',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                'Total a recibir',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  functions.formatAmount(
                                                      valueOrDefault<double>(
                                                    valueOrDefault<double>(
                                                          widget!
                                                              .cdat?.inversion,
                                                          0.0,
                                                        ) +
                                                        valueOrDefault<double>(
                                                          widget!
                                                              .cdat?.ganancias,
                                                          0.0,
                                                        ),
                                                    0.0,
                                                  )),
                                                  '\$ 0',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            width: 88.0,
                                            height: 28.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFEEF1FA),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Container(
                                                    width: 16.0,
                                                    height: 16.0,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: Image.asset(
                                                          'assets/images/Frame_(34).png',
                                                        ).image,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    '${valueOrDefault<String>(
                                                      widget!.cdat?.tiempo
                                                          ?.toString(),
                                                      '0',
                                                    )}meses',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ].divide(SizedBox(width: 7.0)),
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 30.0)),
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
                  if (widget!.cdat?.ea == 10.5)
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                1.0,
                                valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.02844,
                                  24.0,
                                ),
                                1.0,
                                0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 295.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: Image.network(
                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/bt3rs6whbdyn/88cfa7a75237cbffcb283166b3220d39a3282bb8.png',
                                  ).image,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              functions.formatAmount(
                                                  valueOrDefault<double>(
                                                widget!.cdat?.inversion,
                                                0.0,
                                              )),
                                              '\$ 0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Text(
                                            'Inversión',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              functions.formatAmount(
                                                  valueOrDefault<double>(
                                                widget!.cdat?.saldoDisponible,
                                                0.0,
                                              )),
                                              '\$ 0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  color: Color(0xFF002CE9),
                                                  fontSize: 36.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                          ),
                                          Text(
                                            'Mi saldo',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                'Total a recibir',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  functions.formatAmount(
                                                      valueOrDefault<double>(
                                                    valueOrDefault<double>(
                                                          widget!
                                                              .cdat?.inversion,
                                                          0.0,
                                                        ) +
                                                        valueOrDefault<double>(
                                                          widget!
                                                              .cdat?.ganancias,
                                                          0.0,
                                                        ),
                                                    0.0,
                                                  )),
                                                  '\$ 0',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            width: 88.0,
                                            height: 28.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFEEF1FA),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Container(
                                                    width: 16.0,
                                                    height: 16.0,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: Image.asset(
                                                          'assets/images/Frame_(34).png',
                                                        ).image,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    '${valueOrDefault<String>(
                                                      widget!.cdat?.tiempo
                                                          ?.toString(),
                                                      '0',
                                                    )}meses',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ].divide(SizedBox(width: 7.0)),
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 30.0)),
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
                  if ((widget!.cdat?.ea != 10.5) && (widget!.cdat?.ea != 13.5))
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                1.0,
                                valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.02844,
                                  24.0,
                                ),
                                1.0,
                                0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 295.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: Image.network(
                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/1h9oy8v8kq15/Group_138.png',
                                  ).image,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, -1.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                valueOrDefault<String>(
                                                  functions.formatAmount(
                                                      valueOrDefault<double>(
                                                    widget!.cdat?.inversion,
                                                    0.0,
                                                  )),
                                                  '\$ 0',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              Text(
                                                'Inversión',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                valueOrDefault<String>(
                                                  functions.formatAmount(
                                                      valueOrDefault<double>(
                                                    widget!
                                                        .cdat?.saldoDisponible,
                                                    0.0,
                                                  )),
                                                  '\$ 0',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color:
                                                              Color(0xFF002CE9),
                                                          fontSize: 36.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                        ),
                                              ),
                                              Text(
                                                'Mi saldo',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    'Total a recibir',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Text(
                                                    valueOrDefault<String>(
                                                      functions.formatAmount(
                                                          valueOrDefault<
                                                              double>(
                                                        valueOrDefault<double>(
                                                              widget!.cdat
                                                                  ?.inversion,
                                                              0.0,
                                                            ) +
                                                            valueOrDefault<
                                                                double>(
                                                              widget!.cdat
                                                                  ?.ganancias,
                                                              0.0,
                                                            ),
                                                        0.0,
                                                      )),
                                                      '\$ 0',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                width: 88.0,
                                                height: 28.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFEEF1FA),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Container(
                                                        width: 16.0,
                                                        height: 16.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: Image.asset(
                                                              'assets/images/Frame_(34).png',
                                                            ).image,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        '${valueOrDefault<String>(
                                                          widget!.cdat?.tiempo
                                                              ?.toString(),
                                                          '0',
                                                        )}meses',
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
                                                    ].divide(
                                                        SizedBox(width: 7.0)),
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 30.0)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        AlignmentDirectional(1.02, -0.51),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0,
                                          0.0,
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.04740,
                                            40.0,
                                          ),
                                          0.0),
                                      child: AutoSizeText(
                                        valueOrDefault<String>(
                                          '${valueOrDefault<String>(
                                            widget!.cdat?.ea?.toString(),
                                            '-',
                                          )}%E.A',
                                          '- - -',
                                        ),
                                        minFontSize: 8.0,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 11.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
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
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 0.35,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          'Detalle de inversión',
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          minFontSize: 16.0,
                          style: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: 'Satoshi',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.02370,
                                  20.0,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: Image.asset(
                                            'assets/images/Frame_(53).png',
                                            width: 20.0,
                                            height: 20.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        AutoSizeText(
                                          valueOrDefault<String>(
                                            dateTimeFormat(
                                              "d/M/y",
                                              widget!.cdat?.fechaApertura,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                            '-',
                                          ),
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          minFontSize: 10.0,
                                          style: FlutterFlowTheme.of(context)
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
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ].divide(SizedBox(width: 6.0)),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          14.0, 4.0, 0.0, 0.0),
                                      child: AutoSizeText(
                                        'Fecha de\n apertura',
                                        textAlign: TextAlign.start,
                                        maxLines: 2,
                                        minFontSize: 8.0,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: Image.asset(
                                                'assets/images/Vector_(31).png',
                                                width: 20.0,
                                                height: 20.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            AutoSizeText(
                                              '${valueOrDefault<String>(
                                                widget!.cdat?.tiempo
                                                    ?.toString(),
                                                '0',
                                              )} meses',
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              minFontSize: 10.0,
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
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ].divide(SizedBox(width: 6.0)),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, -1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 0.0),
                                            child: AutoSizeText(
                                              'Tiempo\n',
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              minFontSize: 8.0,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Satoshi',
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: Image.asset(
                                              'assets/images/Frame_(53).png',
                                              width: 20.0,
                                              height: 20.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          AutoSizeText(
                                            valueOrDefault<String>(
                                              dateTimeFormat(
                                                "d/M/y",
                                                widget!.cdat?.fechaFinalizacion,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              '-',
                                            ),
                                            textAlign: TextAlign.start,
                                            maxLines: 1,
                                            minFontSize: 10.0,
                                            style: FlutterFlowTheme.of(context)
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
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 6.0)),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            14.0, 4.0, 0.0, 0.0),
                                        child: AutoSizeText(
                                          'Fecha de \nfinalización',
                                          textAlign: TextAlign.start,
                                          maxLines: 2,
                                          minFontSize: 8.0,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ].addToStart(SizedBox(width: 12.0)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: Image.asset(
                                              'assets/images/Vector_(32).png',
                                              width: 20.0,
                                              height: 20.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          AutoSizeText(
                                            '-${functions.formatAmount(valueOrDefault<double>(
                                              widget!.cdat?.retefuenteMonto,
                                              0.0,
                                            ))}',
                                            textAlign: TextAlign.start,
                                            maxLines: 1,
                                            minFontSize: 10.0,
                                            style: FlutterFlowTheme.of(context)
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
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 6.0)),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Retefuente ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              TextSpan(
                                                text: valueOrDefault<String>(
                                                  valueOrDefault<double>(
                                                            widget!.cdat
                                                                ?.retefuenteporcentaje,
                                                            7.0,
                                                          ) ==
                                                          0.07
                                                      ? '7'
                                                      : '4',
                                                  '7',
                                                ),
                                                style: TextStyle(),
                                              ),
                                              TextSpan(
                                                text: '',
                                                style: TextStyle(),
                                              ),
                                              TextSpan(
                                                text: '%',
                                                style: TextStyle(),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: Image.asset(
                                              'assets/images/Vector_(32).png',
                                              width: 20.0,
                                              height: 20.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          AutoSizeText(
                                            '${valueOrDefault<String>(
                                              widget!.cdat?.ea?.toString(),
                                              '0',
                                            )} %',
                                            textAlign: TextAlign.start,
                                            maxLines: 1,
                                            minFontSize: 10.0,
                                            style: FlutterFlowTheme.of(context)
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
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 6.0)),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: AutoSizeText(
                                          'Efectiva Anual\n',
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          minFontSize: 8.0,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: Image.asset(
                                              'assets/images/Vector_(32).png',
                                              width: 20.0,
                                              height: 20.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        AutoSizeText(
                                          valueOrDefault<String>(
                                            functions.formatAmount(
                                                valueOrDefault<double>(
                                              widget!.cdat?.rendimiento,
                                              0.0,
                                            )),
                                            '-',
                                          ),
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          minFontSize: 10.0,
                                          style: FlutterFlowTheme.of(context)
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
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ].divide(SizedBox(width: 6.0)),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 0.0),
                                      child: AutoSizeText(
                                        'Rendimientos\n',
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        minFontSize: 8.0,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
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
            ],
          ),
        ),
      ),
    );
  }
}
