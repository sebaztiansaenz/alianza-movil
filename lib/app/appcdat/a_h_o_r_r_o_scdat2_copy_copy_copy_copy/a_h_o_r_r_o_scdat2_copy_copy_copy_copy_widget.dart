import '/app/detallesinversioncdat_copy2/detallesinversioncdat_copy2_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'a_h_o_r_r_o_scdat2_copy_copy_copy_copy_model.dart';
export 'a_h_o_r_r_o_scdat2_copy_copy_copy_copy_model.dart';

class AHORROScdat2CopyCopyCopyCopyWidget extends StatefulWidget {
  const AHORROScdat2CopyCopyCopyCopyWidget({
    super.key,
    required this.inversion,
    required this.tiempo,
    required this.ea,
    required this.cdatahorro,
    required this.ahorro,
    required this.lista,
  });

  final double? inversion;
  final String? tiempo;
  final double? ea;
  final List<RetiroscdatStruct>? cdatahorro;
  final DocumentReference? ahorro;
  final int? lista;

  static String routeName = 'AHORROScdat2CopyCopyCopyCopy';
  static String routePath = '/aHORROScdat2CopyCopyCopyCopy';

  @override
  State<AHORROScdat2CopyCopyCopyCopyWidget> createState() =>
      _AHORROScdat2CopyCopyCopyCopyWidgetState();
}

class _AHORROScdat2CopyCopyCopyCopyWidgetState
    extends State<AHORROScdat2CopyCopyCopyCopyWidget> {
  late AHORROScdat2CopyCopyCopyCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AHORROScdat2CopyCopyCopyCopyModel());

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
        body: Column(
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
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                            ),
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget!.tiempo == '6')
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0,
                            valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.02844,
                              24.0,
                            ),
                            0.0,
                            0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 290.0,
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
                                alignment: AlignmentDirectional(0.01, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      2.0, 0.0, 2.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
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
                                                  valueOrDefault<String>(
                                                    functions.formatAmount(
                                                        valueOrDefault<double>(
                                                      widget!.inversion,
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
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                functions.formatAmount(
                                                    valueOrDefault<double>(
                                                  ((((widget!.inversion!) /
                                                              100) *
                                                          (((widget!.ea!) /
                                                                  12) *
                                                              6))) -
                                                      valueOrDefault<double>(
                                                        (((widget!.inversion!) /
                                                                    100) *
                                                                (((widget!.ea!) /
                                                                        12) *
                                                                    6)) *
                                                            0.04,
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
                                        flex: 3,
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
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
                                                          valueOrDefault<
                                                              double>(
                                                        (widget!.inversion!) +
                                                            valueOrDefault<
                                                                double>(
                                                              ((((widget!.inversion!) /
                                                                          100) *
                                                                      (((widget!.ea!) /
                                                                              12) *
                                                                          6))) -
                                                                  valueOrDefault<
                                                                      double>(
                                                                    (((widget!.inversion!) /
                                                                                100) *
                                                                            (((widget!.ea!) / 12) *
                                                                                6)) *
                                                                        0.04,
                                                                    0.0,
                                                                  ),
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
                                                            image: Image.asset(
                                                              'assets/images/Frame_(34).png',
                                                            ).image,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        '${widget!.tiempo}meses',
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
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(1.02, -0.51),
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
                                  child: Text(
                                    valueOrDefault<String>(
                                      '${widget!.ea?.toString()}%E.A',
                                      '- - -',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: FlutterFlowTheme.of(context)
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
                    if (widget!.tiempo != '6')
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0,
                            valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.02844,
                              24.0,
                            ),
                            0.0,
                            0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 290.0,
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
                                alignment: AlignmentDirectional(0.01, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      2.0, 0.0, 2.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
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
                                                  valueOrDefault<String>(
                                                    functions.formatAmount(
                                                        valueOrDefault<double>(
                                                      widget!.inversion,
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
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                functions.formatAmount(
                                                    valueOrDefault<double>(
                                                  ((((widget!.inversion!) /
                                                              100) *
                                                          (((widget!.ea!) /
                                                                  12) *
                                                              12))) -
                                                      valueOrDefault<double>(
                                                        (((widget!.inversion!) /
                                                                    100) *
                                                                (((widget!.ea!) /
                                                                        12) *
                                                                    12)) *
                                                            0.04,
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
                                        flex: 3,
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
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
                                                          valueOrDefault<
                                                              double>(
                                                        (widget!.inversion!) +
                                                            valueOrDefault<
                                                                double>(
                                                              ((((widget!.inversion!) /
                                                                          100) *
                                                                      (((widget!.ea!) /
                                                                              12) *
                                                                          12))) -
                                                                  valueOrDefault<
                                                                      double>(
                                                                    (((widget!.inversion!) /
                                                                                100) *
                                                                            (((widget!.ea!) / 12) *
                                                                                12)) *
                                                                        0.04,
                                                                    0.0,
                                                                  ),
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
                                                            image: Image.asset(
                                                              'assets/images/Frame_(34).png',
                                                            ).image,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        '${widget!.tiempo}meses',
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
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(1.02, -0.51),
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
                                  child: Text(
                                    valueOrDefault<String>(
                                      '${widget!.ea?.toString()}%E.A',
                                      '- - -',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: FlutterFlowTheme.of(context)
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
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Column(
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
                                      return GestureDetector(
                                        onTap: () {
                                          FocusScope.of(context).unfocus();
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child:
                                              DetallesinversioncdatCopy2Widget(
                                            tiempo: widget!.tiempo!,
                                            inversion: widget!.inversion!,
                                            ea: widget!.ea!,
                                            cdatahorro: RetiroscdatStruct(),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Ver mas detalles',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          6.0, 0.0, 0.0, 0.0),
                                      child: Icon(
                                        Icons.arrow_forward,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 32.0, 2.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Theme(
                                      data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                        ),
                                        unselectedWidgetColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                      ),
                                      child: Checkbox(
                                        value: _model.checkboxValue1 ??= false,
                                        onChanged: (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue1 = newValue!);
                                        },
                                        side: (FlutterFlowTheme.of(context)
                                                    .primaryText !=
                                                null)
                                            ? BorderSide(
                                                width: 2,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText!,
                                              )
                                            : null,
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .customColor4,
                                        checkColor: FlutterFlowTheme.of(context)
                                            .customColor5,
                                      ),
                                    ),
                                    Flexible(
                                      child: RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text:
                                                  'Confirmo que he leido y acepto el reglamento de',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Satoshi',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                            TextSpan(
                                              text: '\n',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Satoshi',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            TextSpan(
                                              text: 'CDAT',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.0,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Theme(
                                      data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                        ),
                                        unselectedWidgetColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                      ),
                                      child: Checkbox(
                                        value: _model.checkboxValue2 ??= false,
                                        onChanged: (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue2 = newValue!);
                                        },
                                        side: (FlutterFlowTheme.of(context)
                                                    .primaryText !=
                                                null)
                                            ? BorderSide(
                                                width: 2,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText!,
                                              )
                                            : null,
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .customColor4,
                                        checkColor: FlutterFlowTheme.of(context)
                                            .customColor5,
                                      ),
                                    ),
                                    Flexible(
                                      child: RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text:
                                                  'Acepto politicas de Origen de Recursos, ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Satoshi',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                            TextSpan(
                                              text:
                                                  '\nDeclaraciones y Autorizaciones.\n',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Satoshi',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            TextSpan(
                                              text: 'Ver políticas',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.0,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if ((_model.checkboxValue1 == true) &&
                                  (_model.checkboxValue2 == true))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 56.0, 0.0, 55.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      context.pushNamed(
                                        VersionCopyWidget.routeName,
                                        queryParameters: {
                                          'inversion': serializeParam(
                                            widget!.inversion,
                                            ParamType.double,
                                          ),
                                          'ahorro': serializeParam(
                                            widget!.ahorro,
                                            ParamType.DocumentReference,
                                          ),
                                          'cdatahorro': serializeParam(
                                            widget!.cdatahorro,
                                            ParamType.DataStruct,
                                            isList: true,
                                          ),
                                          'tiempo': serializeParam(
                                            widget!.tiempo,
                                            ParamType.String,
                                          ),
                                          'ea': serializeParam(
                                            widget!.ea,
                                            ParamType.double,
                                          ),
                                          'lista': serializeParam(
                                            widget!.lista,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          '__transition_info__': TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.rightToLeft,
                                          ),
                                        },
                                      );
                                    },
                                    text: 'Aperturar CDAT',
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
