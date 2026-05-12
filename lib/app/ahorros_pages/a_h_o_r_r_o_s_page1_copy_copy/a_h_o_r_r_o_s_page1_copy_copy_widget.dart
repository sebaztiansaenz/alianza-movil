import '/app/ahorros_pages/depositoahorro1/depositoahorro1_widget.dart';
import '/app/ahorros_pages/retiros1/retiros1_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'a_h_o_r_r_o_s_page1_copy_copy_model.dart';
export 'a_h_o_r_r_o_s_page1_copy_copy_model.dart';

class AHORROSPage1CopyCopyWidget extends StatefulWidget {
  const AHORROSPage1CopyCopyWidget({super.key});

  static String routeName = 'AHORRO_SPage1CopyCopy';
  static String routePath = '/aHORROSPage1CopyCopy';

  @override
  State<AHORROSPage1CopyCopyWidget> createState() =>
      _AHORROSPage1CopyCopyWidgetState();
}

class _AHORROSPage1CopyCopyWidgetState extends State<AHORROSPage1CopyCopyWidget>
    with TickerProviderStateMixin {
  late AHORROSPage1CopyCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AHORROSPage1CopyCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          FFAppState().isSavingAccountHave = valueOrDefault<bool>(
              currentUserDocument?.isHaveSavingAccount, false);
          FFAppState().lastAction = getCurrentTimestamp;
          safeSetState(() {});
          _model.ahorrosQuery = await queryAhorrosRecordOnce(
            queryBuilder: (ahorrosRecord) => ahorrosRecord
                .where(
                  'AhorrosDocPdf1',
                  isNotEqualTo: '',
                )
                .where(
                  'user',
                  isEqualTo: currentUserReference,
                ),
          );
          await Future.wait([
            Future(() async {
              _model.depositosAhorrosTotal = await actions.getTotalForAccount(
                _model.ahorrosQuery!
                    .map((e) => valueOrDefault<String>(
                          e.reference.id,
                          '0',
                        ))
                    .toList()
                    .toList(),
              );
              _model.totalesAhorro = _model.depositosAhorrosTotal!
                  .toList()
                  .cast<TotalDepositoAhorroStruct>();
              _model.totalCargado = true;
              safeSetState(() {});
            }),
            Future(() async {
              _model.withdrawalTotalAhorros =
                  await actions.withdrawalTotalAhorros(
                _model.ahorrosQuery!
                    .map((e) => valueOrDefault<String>(
                          e.reference.id,
                          '0',
                        ))
                    .toList()
                    .toList(),
              );
              _model.retirosAhorro = _model.withdrawalTotalAhorros!
                  .toList()
                  .cast<TotalRetiroAhorroStruct>();
              safeSetState(() {});
            }),
          ]);
        }),
        Future(() async {
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
        }),
        Future(() async {
          unawaited(
            () async {
              await currentUserReference!.update(createUserRecordData(
                lastLogin: getCurrentTimestamp,
              ));
            }(),
          );
          _model.version = await queryVersionRecordOnce(
            singleRecord: true,
          ).then((s) => s.firstOrNull);
          _model.actualizar = await actions.getVersion1();
          if (isAndroid == true) {
            if (_model.actualizar != _model.version?.versionAndroid) {
              context.goNamedAuth(VersionWidget.routeName, context.mounted);
            }
          } else {
            if (_model.version?.veriontesfligth != true) {
              if (_model.actualizar != _model.version?.versionCurrent) {
                context.goNamedAuth(VersionWidget.routeName, context.mounted);
              }
            }
          }
        }),
      ]);
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
      'columnOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.bounceOut,
            delay: 1400.0.ms,
            duration: 1110.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.1, 1.2),
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

    return StreamBuilder<List<AhorrosRecord>>(
      stream: queryAhorrosRecord(
        queryBuilder: (ahorrosRecord) => ahorrosRecord
            .where(
              'user',
              isEqualTo: currentUserReference,
            )
            .where(
              'AhorrosDocPdf1',
              isNotEqualTo: '',
            ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<AhorrosRecord> aHORROSPage1CopyCopyAhorrosRecordList =
            snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Container(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      StreamBuilder<List<CdatsRecord>>(
                        stream: queryCdatsRecord(
                          queryBuilder: (cdatsRecord) => cdatsRecord.where(
                            'Idusuario',
                            isEqualTo: currentUserReference,
                          ),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<CdatsRecord> containerCdatsRecordList =
                              snapshot.data!;

                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 30.0,
                                  color: Colors.transparent,
                                  offset: Offset(
                                    0.0,
                                    2.0,
                                  ),
                                )
                              ],
                            ),
                            child: StreamBuilder<List<AhorrosRecord>>(
                              stream: queryAhorrosRecord(
                                queryBuilder: (ahorrosRecord) => ahorrosRecord
                                    .where(
                                      'user',
                                      isEqualTo: currentUserReference,
                                    )
                                    .where(
                                      'AhorrosDocPdf1',
                                      isNotEqualTo: '',
                                    ),
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<AhorrosRecord> containerAhorrosRecordList =
                                    snapshot.data!;

                                return Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 30.0,
                                        color: Colors.transparent,
                                        offset: Offset(
                                          0.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0,
                                                  valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.07584,
                                                    64.0,
                                                  ),
                                                  0.0,
                                                  21.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Hola,',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  AuthUserStreamWidget(
                                                    builder: (context) => Text(
                                                      valueOrDefault<String>(
                                                        currentUserDisplayName,
                                                        '- - -',
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
                                                  ),
                                                ].divide(SizedBox(height: 2.0)),
                                              ),
                                              Flexible(
                                                child: Container(
                                                  width: valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.27179,
                                                    106.0,
                                                  ),
                                                  height:
                                                      valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.04147,
                                                    35.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF002CE9),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 18.0,
                                                          height: 18.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            image:
                                                                DecorationImage(
                                                              fit: BoxFit
                                                                  .contain,
                                                              image:
                                                                  Image.asset(
                                                                'assets/images/Frame_(36).png',
                                                              ).image,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: AutoSizeText(
                                                            valueOrDefault<
                                                                String>(
                                                              functions.formatAmount(
                                                                  valueOrDefault<
                                                                      double>(
                                                                functions.sumarbeneficioscdat(
                                                                        containerCdatsRecordList
                                                                            .toList(),
                                                                        getCurrentTimestamp) +
                                                                    valueOrDefault<
                                                                        double>(
                                                                      functions.ahorroBenefitsTotal(
                                                                          containerAhorrosRecordList
                                                                              .toList()),
                                                                      0.0,
                                                                    ),
                                                                0.0,
                                                              )),
                                                              '\$ 0',
                                                            ),
                                                            minFontSize: 10.0,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Satoshi',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  fontSize:
                                                                      valueOrDefault<
                                                                          double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.01659,
                                                                    14.0,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 8.0)),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.scaleDown,
                                          alignment: AlignmentDirectional.centerStart,
                                          child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              width: 209.0,
                                              height: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .height *
                                                    0.06162,
                                                52.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor5,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        100.0),
                                                border: Border.all(
                                                  color: Color(0xFFE8EBF3),
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(4.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: 100.0,
                                                      height: valueOrDefault<
                                                          double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .height *
                                                            0.05214,
                                                        44.0,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFFD4D9E9),
                                                        ),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          'Ahorro',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Satoshi',
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          InvertirahorrosCopyCopyWidget
                                                              .routeName,
                                                          extra: <String,
                                                              dynamic>{
                                                            '__transition_info__':
                                                                TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .fade,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      0),
                                                            ),
                                                          },
                                                        );
                                                      },
                                                      child: Container(
                                                        width: 100.0,
                                                        height: valueOrDefault<
                                                            double>(
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .height *
                                                              0.05214,
                                                          44.0,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customColor5,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      24.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .customColor5,
                                                          ),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            'Crédito',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Satoshi',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  MisinversionesWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'cdat': serializeParam(
                                                      containerCdatsRecordList
                                                          .where((e) =>
                                                              e.reference.id !=
                                                                  null &&
                                                              e.reference.id !=
                                                                  '')
                                                          .toList()
                                                          .firstOrNull,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'cdat':
                                                        containerCdatsRecordList
                                                            .where((e) =>
                                                                e.reference
                                                                        .id !=
                                                                    null &&
                                                                e.reference
                                                                        .id !=
                                                                    '')
                                                            .toList()
                                                            .firstOrNull,
                                                    '__transition_info__':
                                                        TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                      duration: Duration(
                                                          milliseconds: 0),
                                                    ),
                                                  },
                                                );
                                              },
                                              child: Container(
                                                width: 133.0,
                                                height: valueOrDefault<double>(
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.06162,
                                                  52.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                  border: Border.all(
                                                    color: Color(0x3FFF6700),
                                                    width: 1.5,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 20.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 20.0,
                                                        height: 20.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          image:
                                                              DecorationImage(
                                                            fit: BoxFit.contain,
                                                            image: Image.asset(
                                                              'assets/images/Frame_2085664384.png',
                                                            ).image,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        'Inversión',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Satoshi',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 8.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                      Flexible(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0,
                                      valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.02844,
                                        24.0,
                                      ),
                                      0.0,
                                      0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 20.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            AutoSizeText(
                                              'Mis líneas',
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
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            FutureBuilder<int>(
                                              future: queryServicesRecordCount(
                                                queryBuilder:
                                                    (servicesRecord) =>
                                                        servicesRecord.where(
                                                  'ServiceMainType',
                                                  isEqualTo: 'Ahorros',
                                                ),
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
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                int containerCount =
                                                    snapshot.data!;

                                                return Container(
                                                  decoration: BoxDecoration(),
                                                  child: Visibility(
                                                    visible: functions
                                                            .hasLineaRestringida(
                                                                aHORROSPage1CopyCopyAhorrosRecordList
                                                                    .toList()) ==
                                                        false,
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        FFAppState()
                                                            .typeOfProduct = '';
                                                        FFAppState()
                                                            .TipoContrato = '';
                                                        FFAppState().Salario =
                                                            '';
                                                        FFAppState()
                                                            .Antiguedad = '';
                                                        safeSetState(() {});

                                                        context.pushNamed(
                                                          Aperturaahorro1Widget
                                                              .routeName,
                                                          extra: <String,
                                                              dynamic>{
                                                            '__transition_info__':
                                                                TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .rightToLeft,
                                                            ),
                                                          },
                                                        );
                                                      },
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Icon(
                                                            Icons.add,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .customColor4,
                                                            size:
                                                                valueOrDefault<
                                                                    double>(
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.02370,
                                                              20.0,
                                                            ),
                                                          ),
                                                          AutoSizeText(
                                                            'Aperturar línea',
                                                            textAlign:
                                                                TextAlign.end,
                                                            maxLines: 1,
                                                            minFontSize: 10.0,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Satoshi',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .customColor4,
                                                                  fontSize:
                                                                      valueOrDefault<
                                                                          double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.01659,
                                                                    14.0,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 4.0)),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      Builder(
                                        builder: (context) {
                                          final lineahorro =
                                              aHORROSPage1CopyCopyAhorrosRecordList
                                                  .where((e) =>
                                                      e.ahorrosDocPdf1 !=
                                                          null &&
                                                      e.ahorrosDocPdf1 != '')
                                                  .toList();

                                          return Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            child: CarouselSlider.builder(
                                              itemCount: lineahorro.length,
                                              itemBuilder: (context,
                                                  lineahorroIndex, _) {
                                                final lineahorroItem =
                                                    lineahorro[lineahorroIndex];
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Container(
                                                        height: valueOrDefault<
                                                            double>(
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .height *
                                                              0.226,
                                                          191.0,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                        child: Stack(
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Container(
                                                                  height:
                                                                      valueOrDefault<
                                                                          double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.17773,
                                                                    150.0,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    gradient:
                                                                        LinearGradient(
                                                                      colors: [
                                                                        Color(
                                                                            0xFF3357EE),
                                                                        Color(
                                                                            0xFF002CE9)
                                                                      ],
                                                                      stops: [
                                                                        0.0,
                                                                        1.0
                                                                      ],
                                                                      begin: AlignmentDirectional(
                                                                          0.0,
                                                                          -1.0),
                                                                      end: AlignmentDirectional(
                                                                          0,
                                                                          1.0),
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              16.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              16.0),
                                                                    ),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                14.0,
                                                                                14.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Image.asset(
                                                                                  'assets/images/Group_3_(1).png',
                                                                                  height: valueOrDefault<double>(
                                                                                    MediaQuery.sizeOf(context).height * 0.02370,
                                                                                    20.0,
                                                                                  ),
                                                                                  fit: BoxFit.contain,
                                                                                ),
                                                                                AutoSizeText(
                                                                                  lineahorroItem.savingsType,
                                                                                  textAlign: TextAlign.start,
                                                                                  maxLines: 2,
                                                                                  minFontSize: 10.0,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Satoshi',
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        fontSize: valueOrDefault<double>(
                                                                                          MediaQuery.sizeOf(context).height * 0.01659,
                                                                                          14.0,
                                                                                        ),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 8.0)),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(14.0, 6.0, 0.0, 0.0),
                                                                              child: AuthUserStreamWidget(
                                                                                builder: (context) => Text(
                                                                                  valueOrDefault<String>(
                                                                                    '# ${valueOrDefault<String>(
                                                                                      valueOrDefault(currentUserDocument?.nit, ''),
                                                                                      '#1118123413-01',
                                                                                    )}-0${valueOrDefault<String>(
                                                                                      (lineahorroIndex + 01).toString(),
                                                                                      '#1118123413-01',
                                                                                    )}',
                                                                                    '#1118123413-01',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Satoshi',
                                                                                        color: Color(0xCFFFFFFF),
                                                                                        fontSize: valueOrDefault<double>(
                                                                                          MediaQuery.sizeOf(context).height * 0.01422,
                                                                                          12.0,
                                                                                        ),
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            1.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              4.0,
                                                                              14.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(
                                                                                      14.0,
                                                                                      0.0,
                                                                                      0.0,
                                                                                      valueOrDefault<double>(
                                                                                        MediaQuery.sizeOf(context).height * 0.01422,
                                                                                        12.0,
                                                                                      )),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                                                        children: [
                                                                                          if (_model.totalCargado == true)
                                                                                            AutoSizeText(
                                                                                              valueOrDefault<String>(
                                                                                                functions.formatAmount(valueOrDefault<double>(
                                                                                                  valueOrDefault<double>(
                                                                                                        valueOrDefault<double>(
                                                                                                              _model.totalesAhorro.where((e) => e.ahorroid == lineahorroItem.reference.id).toList().firstOrNull?.total,
                                                                                                              0.0,
                                                                                                            ) -
                                                                                                            valueOrDefault<double>(
                                                                                                              _model.retirosAhorro.where((e) => e.ahorroid == lineahorroItem.reference.id).toList().firstOrNull?.total,
                                                                                                              0.0,
                                                                                                            ),
                                                                                                        0.0,
                                                                                                      ) +
                                                                                                      valueOrDefault<double>(
                                                                                                        functions.sumaTotal(lineahorroItem.transactions
                                                                                                            .map((e) => valueOrDefault<double>(
                                                                                                                  e.taxedBenefit,
                                                                                                                  0.0,
                                                                                                                ))
                                                                                                            .toList()),
                                                                                                        0.0,
                                                                                                      ),
                                                                                                  0.0,
                                                                                                )),
                                                                                                '\$ 0',
                                                                                              ),
                                                                                              textAlign: TextAlign.justify,
                                                                                              maxLines: 1,
                                                                                              minFontSize: 18.0,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Satoshi',
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    fontSize: valueOrDefault<double>(
                                                                                                      MediaQuery.sizeOf(context).height * 0.02844,
                                                                                                      24.0,
                                                                                                    ),
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w900,
                                                                                                  ),
                                                                                            ),
                                                                                          if (_model.totalCargado == false)
                                                                                            FaIcon(
                                                                                              FontAwesomeIcons.circleNotch,
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              size: valueOrDefault<double>(
                                                                                                MediaQuery.sizeOf(context).height * 0.02844,
                                                                                                24.0,
                                                                                              ),
                                                                                            ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation']!),
                                                                                        ],
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                                                        children: [
                                                                                          Text(
                                                                                            'Beneficios: ',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Satoshi',
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  fontSize: valueOrDefault<double>(
                                                                                                    MediaQuery.sizeOf(context).height * 0.01422,
                                                                                                    12.0,
                                                                                                  ),
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                          Text(
                                                                                            valueOrDefault<String>(
                                                                                              functions.formatAmount(valueOrDefault<double>(
                                                                                                functions.sumaTotal(lineahorroItem.transactions.map((e) => e.taxedBenefit).toList()),
                                                                                                0.0,
                                                                                              )),
                                                                                              '\$ 0',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Satoshi',
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  fontSize: valueOrDefault<double>(
                                                                                                    MediaQuery.sizeOf(context).height * 0.01422,
                                                                                                    12.0,
                                                                                                  ),
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                if (lineahorroItem.savingsType != 'Linea de Ahorro de nómina')
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(14.0, 0.0, 0.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                                                      children: [
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(1.0, 0.0),
                                                                                          child: InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              context.pushNamed(
                                                                                                Depositoahorro2Widget.routeName,
                                                                                                queryParameters: {
                                                                                                  'ahorro': serializeParam(
                                                                                                    lineahorroItem,
                                                                                                    ParamType.Document,
                                                                                                  ),
                                                                                                  'list': serializeParam(
                                                                                                    lineahorroIndex + 01,
                                                                                                    ParamType.int,
                                                                                                  ),
                                                                                                }.withoutNulls,
                                                                                                extra: <String, dynamic>{
                                                                                                  'ahorro': lineahorroItem,
                                                                                                },
                                                                                              );
                                                                                            },
                                                                                            child: Container(
                                                                                              width: valueOrDefault<double>(
                                                                                                MediaQuery.sizeOf(context).width * 0.12308,
                                                                                                48.0,
                                                                                              ),
                                                                                              height: valueOrDefault<double>(
                                                                                                MediaQuery.sizeOf(context).height * 0.05688,
                                                                                                48.0,
                                                                                              ),
                                                                                              decoration: BoxDecoration(
                                                                                                image: DecorationImage(
                                                                                                  fit: BoxFit.contain,
                                                                                                  image: Image.asset(
                                                                                                    'assets/images/Frame_2609937_(10).png',
                                                                                                  ).image,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                                              0.0,
                                                                                              0.0,
                                                                                              0.0,
                                                                                              valueOrDefault<double>(
                                                                                                MediaQuery.sizeOf(context).height * 0.01422,
                                                                                                12.0,
                                                                                              )),
                                                                                          child: Text(
                                                                                            'Depositar',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Satoshi',
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  fontSize: valueOrDefault<double>(
                                                                                                    MediaQuery.sizeOf(context).height * 0.01422,
                                                                                                    12.0,
                                                                                                  ),
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 6.0)),
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
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height:
                                                                      valueOrDefault<
                                                                          double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.04740,
                                                                    40.0,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    gradient:
                                                                        LinearGradient(
                                                                      colors: [
                                                                        Color(
                                                                            0x19EEF1FA),
                                                                        Color(
                                                                            0xFFEEF1FA)
                                                                      ],
                                                                      stops: [
                                                                        0.0,
                                                                        1.0
                                                                      ],
                                                                      begin: AlignmentDirectional(
                                                                          0.0,
                                                                          -1.0),
                                                                      end: AlignmentDirectional(
                                                                          0,
                                                                          1.0),
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              16.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              16.0),
                                                                    ),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Color(
                                                                          0xFFEEF1FA),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            6.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(14.0, 0.0, 0.0, 0.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  context.pushNamed(
                                                                                    UnderDevelopmentWidget.routeName,
                                                                                    extra: <String, dynamic>{
                                                                                      '__transition_info__': TransitionInfo(
                                                                                        hasTransition: true,
                                                                                        transitionType: PageTransitionType.rightToLeft,
                                                                                      ),
                                                                                    },
                                                                                  );
                                                                                },
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(0.0),
                                                                                  child: Image.asset(
                                                                                    'assets/images/Frame_2085662765.png',
                                                                                    width: valueOrDefault<double>(
                                                                                      MediaQuery.sizeOf(context).width * 0.23846,
                                                                                      93.0,
                                                                                    ),
                                                                                    height: valueOrDefault<double>(
                                                                                      MediaQuery.sizeOf(context).height * 0.01659,
                                                                                      14.0,
                                                                                    ),
                                                                                    fit: BoxFit.contain,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              14.0,
                                                                              0.0),
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              _model.list = lineahorroIndex + 01;
                                                                              safeSetState(() {});

                                                                              context.pushNamed(
                                                                                AhorroMainPageCopyWidget.routeName,
                                                                                queryParameters: {
                                                                                  'ahoro': serializeParam(
                                                                                    lineahorroItem,
                                                                                    ParamType.Document,
                                                                                  ),
                                                                                  'list': serializeParam(
                                                                                    _model.list,
                                                                                    ParamType.int,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                                extra: <String, dynamic>{
                                                                                  'ahoro': lineahorroItem,
                                                                                  '__transition_info__': TransitionInfo(
                                                                                    hasTransition: true,
                                                                                    transitionType: PageTransitionType.rightToLeft,
                                                                                    duration: Duration(milliseconds: 300),
                                                                                  ),
                                                                                },
                                                                              );
                                                                            },
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Text(
                                                                                  'Ver más',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Satoshi',
                                                                                        color: Color(0xFFFF6700),
                                                                                        fontSize: valueOrDefault<double>(
                                                                                          MediaQuery.sizeOf(context).height * 0.01422,
                                                                                          12.0,
                                                                                        ),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                                Icon(
                                                                                  Icons.arrow_forward_sharp,
                                                                                  color: Color(0xFFFF6700),
                                                                                  size: valueOrDefault<double>(
                                                                                    MediaQuery.sizeOf(context).height * 0.02370,
                                                                                    20.0,
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 4.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1.0,
                                                                      -1.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0.0),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/Frame_2085662540.png',
                                                                  width:
                                                                      valueOrDefault<
                                                                          double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.14872,
                                                                    58.0,
                                                                  ),
                                                                  height:
                                                                      valueOrDefault<
                                                                          double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.02844,
                                                                    24.0,
                                                                  ),
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                              carouselController: _model
                                                      .carouselController ??=
                                                  CarouselSliderController(),
                                              options: CarouselOptions(
                                                initialPage: max(
                                                    0,
                                                    min(0,
                                                        lineahorro.length - 1)),
                                                viewportFraction: 0.75,
                                                disableCenter: true,
                                                enlargeCenterPage: true,
                                                enlargeFactor: 0.28,
                                                enableInfiniteScroll: false,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                autoPlay: false,
                                                onPageChanged: (index, _) =>
                                                    _model.carouselCurrentIndex =
                                                        index,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      StreamBuilder<List<AhorrosRecord>>(
                                        stream: queryAhorrosRecord(
                                          queryBuilder: (ahorrosRecord) =>
                                              ahorrosRecord
                                                  .where(
                                                    'user',
                                                    isEqualTo:
                                                        currentUserReference,
                                                  )
                                                  .where(
                                                    'AhorrosDocPdf1',
                                                    isEqualTo: '',
                                                  ),
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
                                          List<AhorrosRecord>
                                              containerAhorrosRecordList =
                                              snapshot.data!;

                                          return Container(
                                            decoration: BoxDecoration(),
                                            child: Visibility(
                                              visible: (functions
                                                          .hasAhorrosPendientes(
                                                              containerAhorrosRecordList
                                                                  .toList()) ==
                                                      true) &&
                                                  (aHORROSPage1CopyCopyAhorrosRecordList
                                                          .length ==
                                                      0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'Procesando tu línea de ahorro…',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Text(
                                                    'Un momento por favor',
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
                                          );
                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            63.0,
                                            valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.04266,
                                              36.0,
                                            ),
                                            63.0,
                                            0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  useSafeArea: true,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(context)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            Depositoahorro1Widget(
                                                          doc: _model
                                                              .ahorrosQuery
                                                              ?.where((e) =>
                                                                  e.reference
                                                                          .id !=
                                                                      null &&
                                                                  e.reference
                                                                          .id !=
                                                                      '')
                                                              .toList()
                                                              ?.firstOrNull,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width:
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.13333,
                                                      52.0,
                                                    ),
                                                    height:
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.06162,
                                                      52.0,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFEEF1FA),
                                                      image: DecorationImage(
                                                        fit: BoxFit.contain,
                                                        image: Image.asset(
                                                          'assets/images/Frame_2609937_(11).png',
                                                        ).image,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFEEF1FA),
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    'Depositar',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
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
                                                ].divide(SizedBox(height: 8.0)),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  useSafeArea: true,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(context)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child: Retiros1Widget(),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width:
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.13333,
                                                      52.0,
                                                    ),
                                                    height:
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.06162,
                                                      52.0,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFEEF1FA),
                                                      image: DecorationImage(
                                                        fit: BoxFit.contain,
                                                        image: Image.asset(
                                                          'assets/images/Frame_2609937_(1).png',
                                                        ).image,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFEEF1FA),
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    'Transferir',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
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
                                                ].divide(SizedBox(height: 8.0)),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  InvertirahorrosWidget
                                                      .routeName,
                                                  extra: <String, dynamic>{
                                                    '__transition_info__':
                                                        TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .rightToLeft,
                                                    ),
                                                  },
                                                );
                                              },
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width:
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.13333,
                                                      52.0,
                                                    ),
                                                    height:
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.06162,
                                                      52.0,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        fit: BoxFit.contain,
                                                        image: Image.asset(
                                                          'assets/images/Frame_2609937_(12).png',
                                                        ).image,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                  ),
                                                  Text(
                                                    'Invertir',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
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
                                                ].divide(SizedBox(height: 8.0)),
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'columnOnPageLoadAnimation']!),
                                          ].divide(SizedBox(width: 44.0)),
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0,
                                                    valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.02844,
                                                      24.0,
                                                    ),
                                                    0.0,
                                                    120.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Novedades',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
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
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0,
                                                          valueOrDefault<
                                                              double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.01896,
                                                            16.0,
                                                          ),
                                                          0.0,
                                                          0.0),
                                                  child: SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  valueOrDefault<
                                                                      double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.02370,
                                                                    20.0,
                                                                  ),
                                                                  0.0,
                                                                  0.0,
                                                                  valueOrDefault<
                                                                      double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.02844,
                                                                    24.0,
                                                                  )),
                                                          child: StreamBuilder<
                                                              List<
                                                                  CdatsRecord>>(
                                                            stream:
                                                                queryCdatsRecord(
                                                              queryBuilder:
                                                                  (cdatsRecord) =>
                                                                      cdatsRecord
                                                                          .where(
                                                                'Idusuario',
                                                                isEqualTo:
                                                                    currentUserReference,
                                                              ),
                                                              singleRecord:
                                                                  true,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
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
                                                              List<CdatsRecord>
                                                                  containerCdatsRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              // Return an empty Container when the item does not exist.
                                                              if (snapshot.data!
                                                                  .isEmpty) {
                                                                return Container();
                                                              }
                                                              final containerCdatsRecord =
                                                                  containerCdatsRecordList
                                                                          .isNotEmpty
                                                                      ? containerCdatsRecordList
                                                                          .first
                                                                      : null;

                                                              return InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    InvertirahorrosCopyWidget
                                                                        .routeName,
                                                                    queryParameters:
                                                                        {
                                                                      'cdat':
                                                                          serializeParam(
                                                                        containerCdatsRecord,
                                                                        ParamType
                                                                            .Document,
                                                                      ),
                                                                    }.withoutNulls,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      'cdat':
                                                                          containerCdatsRecord,
                                                                    },
                                                                  );
                                                                },
                                                                child:
                                                                    Container(
                                                                  width:
                                                                      valueOrDefault<
                                                                          double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.52051,
                                                                    203.0,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            25.0,
                                                                        color: Color(
                                                                            0x0E000000),
                                                                        offset:
                                                                            Offset(
                                                                          0.0,
                                                                          12.0,
                                                                        ),
                                                                        spreadRadius:
                                                                            0.0,
                                                                      )
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .customColor5,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                  ),
                                                                  child: Stack(
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.all(valueOrDefault<double>(
                                                                          MediaQuery.sizeOf(context).height *
                                                                              0.01659,
                                                                          14.0,
                                                                        )),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Container(
                                                                              width: valueOrDefault<double>(
                                                                                MediaQuery.sizeOf(context).width * 0.11282,
                                                                                44.0,
                                                                              ),
                                                                              height: valueOrDefault<double>(
                                                                                MediaQuery.sizeOf(context).height * 0.05214,
                                                                                44.0,
                                                                              ),
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                image: DecorationImage(
                                                                                  fit: BoxFit.cover,
                                                                                  image: Image.network(
                                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/mbd8ebcwajow/Frame_2085662547_(8).png',
                                                                                  ).image,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(
                                                                                  0.0,
                                                                                  valueOrDefault<double>(
                                                                                    MediaQuery.sizeOf(context).height * 0.01896,
                                                                                    16.0,
                                                                                  ),
                                                                                  0.0,
                                                                                  0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    'Apertura tu CDAT digital',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Satoshi',
                                                                                          fontSize: valueOrDefault<double>(
                                                                                            MediaQuery.sizeOf(context).height * 0.01659,
                                                                                            14.0,
                                                                                          ),
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    'Tasas hasta del 13.5% E.A',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Satoshi',
                                                                                          color: Color(0xB2262632),
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ].divide(SizedBox(height: 4.0)),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            1.0,
                                                                            -1.0),
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/Frame_2085662540_(10).png',
                                                                          width:
                                                                              68.0,
                                                                          height:
                                                                              18.0,
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                        Opacity(
                                                          opacity: 0.5,
                                                          child: Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    valueOrDefault<
                                                                        double>(
                                                                      MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.02370,
                                                                      20.0,
                                                                    ),
                                                                    0.0,
                                                                    0.0,
                                                                    valueOrDefault<
                                                                        double>(
                                                                      MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.02844,
                                                                      24.0,
                                                                    )),
                                                            child: Container(
                                                              width:
                                                                  valueOrDefault<
                                                                      double>(
                                                                MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.52051,
                                                                203.0,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        25.0,
                                                                    color: Color(
                                                                        0x0E000000),
                                                                    offset:
                                                                        Offset(
                                                                      0.0,
                                                                      12.0,
                                                                    ),
                                                                    spreadRadius:
                                                                        0.0,
                                                                  )
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .customColor5,
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              child: Stack(
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsets.all(
                                                                        valueOrDefault<
                                                                            double>(
                                                                      MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.01659,
                                                                      14.0,
                                                                    )),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              valueOrDefault<double>(
                                                                            MediaQuery.sizeOf(context).width *
                                                                                0.11282,
                                                                            44.0,
                                                                          ),
                                                                          height:
                                                                              valueOrDefault<double>(
                                                                            MediaQuery.sizeOf(context).height *
                                                                                0.05214,
                                                                            44.0,
                                                                          ),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            image:
                                                                                DecorationImage(
                                                                              fit: BoxFit.contain,
                                                                              image: Image.asset(
                                                                                'assets/images/Frame_2085662547_(19).png',
                                                                              ).image,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              valueOrDefault<double>(
                                                                                MediaQuery.sizeOf(context).height * 0.01896,
                                                                                16.0,
                                                                              ),
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              Text(
                                                                                'Compra tu SOAT',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Satoshi',
                                                                                      fontSize: valueOrDefault<double>(
                                                                                        MediaQuery.sizeOf(context).height * 0.01659,
                                                                                        14.0,
                                                                                      ),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                'Asegurárandote en el camino',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Satoshi',
                                                                                      color: Color(0xB2262632),
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ].divide(SizedBox(height: 4.0)),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1.0,
                                                                            -1.0),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/Frame_2085662540_(14).png',
                                                                      width:
                                                                          68.0,
                                                                      height:
                                                                          18.0,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Opacity(
                                                          opacity: 0.5,
                                                          child: Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    valueOrDefault<
                                                                        double>(
                                                                      MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.02370,
                                                                      20.0,
                                                                    ),
                                                                    0.0,
                                                                    0.0,
                                                                    valueOrDefault<
                                                                        double>(
                                                                      MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.02844,
                                                                      24.0,
                                                                    )),
                                                            child: Container(
                                                              width:
                                                                  valueOrDefault<
                                                                      double>(
                                                                MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.52051,
                                                                203.0,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        25.0,
                                                                    color: Color(
                                                                        0x0E000000),
                                                                    offset:
                                                                        Offset(
                                                                      0.0,
                                                                      12.0,
                                                                    ),
                                                                    spreadRadius:
                                                                        0.0,
                                                                  )
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .customColor5,
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              child: Stack(
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsets.all(
                                                                        valueOrDefault<
                                                                            double>(
                                                                      MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.01659,
                                                                      14.0,
                                                                    )),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              valueOrDefault<double>(
                                                                            MediaQuery.sizeOf(context).width *
                                                                                0.11282,
                                                                            44.0,
                                                                          ),
                                                                          height:
                                                                              valueOrDefault<double>(
                                                                            MediaQuery.sizeOf(context).height *
                                                                                0.05214,
                                                                            44.0,
                                                                          ),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            image:
                                                                                DecorationImage(
                                                                              fit: BoxFit.contain,
                                                                              image: Image.asset(
                                                                                'assets/images/Frame_2085662547_(20).png',
                                                                              ).image,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              valueOrDefault<double>(
                                                                                MediaQuery.sizeOf(context).height * 0.01896,
                                                                                16.0,
                                                                              ),
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              Text(
                                                                                'Asegura tu carro',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Satoshi',
                                                                                      fontSize: valueOrDefault<double>(
                                                                                        MediaQuery.sizeOf(context).height * 0.01659,
                                                                                        14.0,
                                                                                      ),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                'Protege tu patrimonio.',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Satoshi',
                                                                                      color: Color(0xB2262632),
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ].divide(SizedBox(height: 4.0)),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1.0,
                                                                            -1.0),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/Frame_2085662540_(14).png',
                                                                      width:
                                                                          68.0,
                                                                      height:
                                                                          18.0,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Opacity(
                                                          opacity: 0.5,
                                                          child: Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    valueOrDefault<
                                                                        double>(
                                                                      MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.02370,
                                                                      20.0,
                                                                    ),
                                                                    0.0,
                                                                    0.0,
                                                                    valueOrDefault<
                                                                        double>(
                                                                      MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.02844,
                                                                      24.0,
                                                                    )),
                                                            child: Container(
                                                              width:
                                                                  valueOrDefault<
                                                                      double>(
                                                                MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.52051,
                                                                203.0,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        25.0,
                                                                    color: Color(
                                                                        0x0E000000),
                                                                    offset:
                                                                        Offset(
                                                                      0.0,
                                                                      12.0,
                                                                    ),
                                                                    spreadRadius:
                                                                        0.0,
                                                                  )
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .customColor5,
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              child: Stack(
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsets.all(
                                                                        valueOrDefault<
                                                                            double>(
                                                                      MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.01659,
                                                                      14.0,
                                                                    )),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              10.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                24.0,
                                                                            height:
                                                                                24.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFF3F5F7),
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                            ),
                                                                            child:
                                                                                Image.asset(
                                                                              'assets/images/Frame_(41).png',
                                                                              width: 12.0,
                                                                              height: 12.0,
                                                                              fit: BoxFit.contain,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              valueOrDefault<double>(
                                                                                MediaQuery.sizeOf(context).height * 0.01896,
                                                                                16.0,
                                                                              ),
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              Text(
                                                                                'Cotiza tu viaje',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Satoshi',
                                                                                      fontSize: valueOrDefault<double>(
                                                                                        MediaQuery.sizeOf(context).height * 0.01659,
                                                                                        14.0,
                                                                                      ),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                child: Text(
                                                                                  'La próxima aventura inicia aquí.',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Satoshi',
                                                                                        color: Color(0xB2262632),
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(height: 4.0)),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1.0,
                                                                            -1.0),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/Frame_2085662540_(14).png',
                                                                      width:
                                                                          68.0,
                                                                      height:
                                                                          18.0,
                                                                      fit: BoxFit
                                                                          .contain,
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
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: valueOrDefault<double>(
                      MediaQuery.sizeOf(context).width * 1.00,
                      393.0,
                    ),
                    height: valueOrDefault<double>(
                      MediaQuery.sizeOf(context).height * 0.948,
                      800.0,
                    ),
                    child: custom_widgets.DraggableFloatingButton(
                      width: valueOrDefault<double>(
                        MediaQuery.sizeOf(context).width * 1.00,
                        393.0,
                      ),
                      height: valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.948,
                        800.0,
                      ),
                      onPressed: () async {
                        context.pushNamed(
                          AyudaWidget.routeName,
                          extra: <String, dynamic>{
                            '__transition_info__': TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                    ),
                  ),
                  Container(
                    width: valueOrDefault<double>(
                      MediaQuery.sizeOf(context).width * 1.00,
                      393.0,
                    ),
                    height: valueOrDefault<double>(
                      MediaQuery.sizeOf(context).height * 1,
                      852.0,
                    ),
                    child: custom_widgets.FloatingNavBar(
                      width: valueOrDefault<double>(
                        MediaQuery.sizeOf(context).width * 1.00,
                        393.0,
                      ),
                      height: valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 1,
                        852.0,
                      ),
                      onLeftPressed: () async {
                        context.pushNamed(
                          ConveniosWidget.routeName,
                          extra: <String, dynamic>{
                            '__transition_info__': TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                      onCenterPressed: () async {
                        context.pushNamed(
                          AHORROSPage1CopyCopyWidget.routeName,
                          extra: <String, dynamic>{
                            '__transition_info__': TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                      onRightPressed: () async {
                        context.pushNamed(
                          Perfil01Widget.routeName,
                          extra: <String, dynamic>{
                            '__transition_info__': TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
