import '/app/appcdat/detallesinversioncdat/detallesinversioncdat_widget.dart';
import '/app/otros/animacionmenu/animacionmenu_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
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
import 'nuevaaperturacdat_model.dart';
export 'nuevaaperturacdat_model.dart';

class NuevaaperturacdatWidget extends StatefulWidget {
  const NuevaaperturacdatWidget({
    super.key,
    required this.cdats,
  });

  final CdatsRecord? cdats;

  static String routeName = 'nuevaaperturacdat';
  static String routePath = '/nuevaaperturacdat';

  @override
  State<NuevaaperturacdatWidget> createState() =>
      _NuevaaperturacdatWidgetState();
}

class _NuevaaperturacdatWidgetState extends State<NuevaaperturacdatWidget> {
  late NuevaaperturacdatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NuevaaperturacdatModel());

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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: Stack(
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ),
                          AutoSizeText(
                            'Firmar CDAT',
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            minFontSize: 14.0,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Satoshi',
                                  fontSize: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.02133,
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
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if ((widget!.cdats?.ea != 10.5) &&
                          (widget!.cdats?.ea != 13.5))
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 24.0, 0.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 285.0,
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
                                      alignment:
                                          AlignmentDirectional(0.01, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  valueOrDefault<String>(
                                                    functions.formatAmount(
                                                        valueOrDefault<double>(
                                                      widget!.cdats?.inversion,
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
                                                Text(
                                                  'Inversión',
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                                      widget!.cdats?.ganancias,
                                                      0.0,
                                                    )),
                                                    '\$ 0',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                                  'Ganancias',
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Total a recibir',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Satoshi',
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        functions.formatAmount(
                                                            valueOrDefault<
                                                                double>(
                                                          valueOrDefault<
                                                                  double>(
                                                                widget!.cdats
                                                                    ?.ganancias,
                                                                0.0,
                                                              ) +
                                                              valueOrDefault<
                                                                  double>(
                                                                widget!.cdats
                                                                    ?.inversion,
                                                                0.0,
                                                              ),
                                                          0.0,
                                                        )),
                                                        '\$ 0',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Satoshi',
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 16.0,
                                                          height: 16.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            image:
                                                                DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image:
                                                                  Image.asset(
                                                                'assets/images/Frame_(34).png',
                                                              ).image,
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          '${valueOrDefault<String>(
                                                            widget!
                                                                .cdats?.tiempo
                                                                ?.toString(),
                                                            '- - - ',
                                                          )}meses',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.04740,
                                              40.0,
                                            ),
                                            0.0),
                                        child: AutoSizeText(
                                          '${valueOrDefault<String>(
                                            widget!.cdats?.ea?.toString(),
                                            '- - -',
                                          )}% E.A',
                                          minFontSize: 8.0,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
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
                          ],
                        ),
                      if (widget!.cdats?.ea == 13.5)
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 24.0, 0.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 280.0,
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
                                  alignment: AlignmentDirectional(0.01, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                functions.formatAmount(
                                                    valueOrDefault<double>(
                                                  widget!.cdats?.inversion,
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
                                                  widget!.cdats?.ganancias,
                                                  0.0,
                                                )),
                                                '\$ 0',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
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
                                              'Ganancias',
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
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
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
                                                        valueOrDefault<double>(
                                                      valueOrDefault<double>(
                                                            widget!.cdats
                                                                ?.ganancias,
                                                            0.0,
                                                          ) +
                                                          valueOrDefault<
                                                              double>(
                                                            widget!.cdats
                                                                ?.inversion,
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
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                        widget!.cdats?.tiempo
                                                            ?.toString(),
                                                        '- - - ',
                                                      )}meses',
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
                              ),
                            ),
                          ],
                        ),
                      if (widget!.cdats?.ea == 10.5)
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 24.0, 0.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 280.0,
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
                                  alignment: AlignmentDirectional(0.01, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                functions.formatAmount(
                                                    valueOrDefault<double>(
                                                  widget!.cdats?.inversion,
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
                                                  widget!.cdats?.ganancias,
                                                  0.0,
                                                )),
                                                '\$ 0',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
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
                                              'Ganancias',
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
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
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
                                                        valueOrDefault<double>(
                                                      valueOrDefault<double>(
                                                            widget!.cdats
                                                                ?.ganancias,
                                                            0.0,
                                                          ) +
                                                          valueOrDefault<
                                                              double>(
                                                            widget!.cdats
                                                                ?.inversion,
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
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                        widget!.cdats?.tiempo
                                                            ?.toString(),
                                                        '- - - ',
                                                      )}meses',
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
                              ),
                            ),
                          ],
                        ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                useSafeArea: true,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: DetallesinversioncdatWidget(
                                      cdat: widget!.cdats!,
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Detalles de inversión',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Satoshi',
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                FlutterFlowIconButton(
                                  borderRadius: 8.0,
                                  buttonSize: 30.0,
                                  icon: Icon(
                                    Icons.arrow_forward,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 16.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 24.0, 20.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AutoSizeText(
                                  'Disponibilidad de retiros aticipados',
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  minFontSize: 8.0,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Satoshi',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                AutoSizeText(
                                  functions.formatAmount(valueOrDefault<double>(
                                    widget!.cdats?.ganancias,
                                    0.0,
                                  )),
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  minFontSize: 10.0,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Satoshi',
                                        color: Color(0xFFFF6700),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color:
                                      FlutterFlowTheme.of(context).customColor5,
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: StreamBuilder<List<RetirosCdatRecord>>(
                                  stream: queryRetirosCdatRecord(
                                    parent: widget!.cdats?.reference,
                                    queryBuilder: (retirosCdatRecord) =>
                                        retirosCdatRecord
                                            .orderBy('Fecharetiro'),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<RetirosCdatRecord>
                                        columnRetirosCdatRecordList =
                                        snapshot.data!;

                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(
                                          columnRetirosCdatRecordList.length,
                                          (columnIndex) {
                                        final columnRetirosCdatRecord =
                                            columnRetirosCdatRecordList[
                                                columnIndex];
                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                AutoSizeText(
                                                  valueOrDefault<String>(
                                                    dateTimeFormat(
                                                      "d/M/y",
                                                      columnRetirosCdatRecord
                                                          .fecharetiro,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                    '-',
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  minFontSize: 10.0,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Satoshi',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                AutoSizeText(
                                                  'Anticipo ${(columnIndex + 1).toString()}',
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  minFontSize: 8.0,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Satoshi',
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ].divide(SizedBox(height: 4.0)),
                                            ),
                                            AutoSizeText(
                                              valueOrDefault<String>(
                                                functions.formatAmount(
                                                    columnRetirosCdatRecord
                                                        .monto),
                                                '0',
                                              ),
                                              textAlign: TextAlign.end,
                                              maxLines: 1,
                                              minFontSize: 10.0,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Satoshi',
                                                    color: Color(0xFF002CE9),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ],
                                        );
                                      }).divide(SizedBox(height: 24.0)),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, 1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 40.0, 0.0, 40.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.instantTimer?.cancel();

                                  context.pushNamed(
                                    Pas4cdatWidget.routeName,
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
                                child: Container(
                                  decoration: BoxDecoration(),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, -1.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 52.0,
                                          height: 52.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            image: DecorationImage(
                                              fit: BoxFit.contain,
                                              image: Image.network(
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/ayooa4c198aq/Frame_2609937_(8).png',
                                              ).image,
                                            ),
                                          ),
                                        ),
                                        AutoSizeText(
                                          'Firmar',
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          minFontSize: 10.0,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ].divide(SizedBox(height: 8.0)),
                                    ),
                                  ),
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
            ],
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
    );
  }
}
