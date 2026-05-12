import '/app/otros/app_eliminar/menu_new/menu_new_widget.dart';
import '/app/verificacion_component1/verificacion_component1_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_new_model.dart';
export 'home_new_model.dart';

class HomeNewWidget extends StatefulWidget {
  const HomeNewWidget({super.key});

  static String routeName = 'HomeNew';
  static String routePath = '/homeNew';

  @override
  State<HomeNewWidget> createState() => _HomeNewWidgetState();
}

class _HomeNewWidgetState extends State<HomeNewWidget> {
  late HomeNewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeNewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
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

                context.pushNamedAuth(
                    LoginPagenewWidget.routeName, context.mounted);

                _model.instantTimer?.cancel();
              }
            },
            startImmediately: false,
          );
        }),
      ]);
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

    return PopScope(
      canPop: false,
      child: Scaffold(
        key: scaffoldKey,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 60.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 265.0,
                        decoration: BoxDecoration(),
                        child: Stack(
                          children: [
                            Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 265.0,
                              child: custom_widgets.Video(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 265.0,
                                url:
                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/kea5macdj9xv/VIDEO_HOME_APP_ALIANZA.mp4',
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 40.0, 20.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AutoSizeText(
                                                'Hola,',
                                                textAlign: TextAlign.start,
                                                maxLines: 1,
                                                minFontSize: 8.0,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                        ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 50.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Flexible(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    6.0,
                                                                    0.0),
                                                        child:
                                                            AuthUserStreamWidget(
                                                          builder: (context) =>
                                                              AutoSizeText(
                                                            valueOrDefault<
                                                                String>(
                                                              currentUserDisplayName,
                                                              'Juan Sebastian',
                                                            ),
                                                            textAlign:
                                                                TextAlign.start,
                                                            maxLines: 2,
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
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    if (valueOrDefault(
                                                            currentUserDocument
                                                                ?.verificacionusuario,
                                                            '') !=
                                                        FFAppConstants
                                                            .verifcado)
                                                      AuthUserStreamWidget(
                                                        builder: (context) =>
                                                            Icon(
                                                          Icons
                                                              .verified_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customColor2,
                                                          size: 22.0,
                                                        ),
                                                      ),
                                                    if (valueOrDefault(
                                                            currentUserDocument
                                                                ?.verificacionusuario,
                                                            '') ==
                                                        FFAppConstants
                                                            .verifcado)
                                                      AuthUserStreamWidget(
                                                        builder: (context) =>
                                                            ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.asset(
                                                            'assets/images/Sin_titulo-5_1.png',
                                                            width: 20.0,
                                                            height: 20.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Image.asset(
                                              'assets/images/Frame_(19).png',
                                              width: 24.0,
                                              height: 24.0,
                                              fit: BoxFit.cover,
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                    AyudaWidget.routeName);
                                              },
                                              child: Image.asset(
                                                'assets/images/Frame_(20).png',
                                                width: 24.0,
                                                height: 24.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 16.0)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        StreamBuilder<List<CdatsRecord>>(
                                          stream: queryCdatsRecord(
                                            queryBuilder: (cdatsRecord) =>
                                                cdatsRecord
                                                    .where(
                                                      'Idusuario',
                                                      isEqualTo:
                                                          currentUserReference,
                                                    )
                                                    .where(
                                                      'Estado',
                                                      isEqualTo: 'Activo',
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
                                            List<CdatsRecord>
                                                containerCdatsRecordList =
                                                snapshot.data!;

                                            return Container(
                                              decoration: BoxDecoration(),
                                              child: StreamBuilder<
                                                  List<AhorrosRecord>>(
                                                stream: queryAhorrosRecord(
                                                  queryBuilder:
                                                      (ahorrosRecord) =>
                                                          ahorrosRecord
                                                              .where(
                                                                'user',
                                                                isEqualTo:
                                                                    currentUserReference,
                                                              )
                                                              .where(
                                                                'AhorrosDocPdf1',
                                                                isNotEqualTo:
                                                                    '',
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
                                                  List<AhorrosRecord>
                                                      textAhorrosRecordList =
                                                      snapshot.data!;

                                                  return AutoSizeText(
                                                    valueOrDefault<String>(
                                                      functions.formatAmount(
                                                          valueOrDefault<
                                                              double>(
                                                        valueOrDefault<double>(
                                                              functions.ahorroBenefitsTotal(
                                                                  textAhorrosRecordList
                                                                      .toList()),
                                                              0.0,
                                                            ) +
                                                            functions.sumarbeneficioscdat(
                                                                containerCdatsRecordList
                                                                    .toList(),
                                                                getCurrentTimestamp),
                                                        0.0,
                                                      )),
                                                      '\$ 0',
                                                    ),
                                                    textAlign:
                                                        TextAlign.justify,
                                                    maxLines: 1,
                                                    minFontSize: 30.0,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customColor4,
                                                          fontSize: 36.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 2.0, 0.0, 0.0),
                                          child: AutoSizeText(
                                            'Histórico de beneficios acumulados',
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            minFontSize: 8.0,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 4.0),
                                          child: AutoSizeText(
                                            'Esto sucede cuando tu dinero\nestá en Alianza',
                                            textAlign: TextAlign.center,
                                            maxLines: 3,
                                            minFontSize: 12.0,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
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
                      Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 16.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 138.0,
                                child: CarouselSlider(
                                  items: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/ddfa6282ac36147acb32aa6573fca0e6e521e2c8.png',
                                        width: 300.0,
                                        height: 115.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/Home-banner.jpg',
                                        width: 300.0,
                                        height: 115.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                  carouselController:
                                      _model.carouselController ??=
                                          CarouselSliderController(),
                                  options: CarouselOptions(
                                    initialPage: 1,
                                    viewportFraction: 0.8,
                                    disableCenter: true,
                                    enlargeCenterPage: true,
                                    enlargeFactor: 0.2,
                                    enableInfiniteScroll: false,
                                    scrollDirection: Axis.horizontal,
                                    autoPlay: false,
                                    onPageChanged: (index, _) =>
                                        _model.carouselCurrentIndex = index,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 20.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 7.0,
                                      height: 7.0,
                                      decoration: BoxDecoration(
                                        color:
                                            FlutterFlowTheme.of(context).fondo,
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                    ),
                                    Container(
                                      width: 7.0,
                                      height: 7.0,
                                      decoration: BoxDecoration(
                                        color:
                                            FlutterFlowTheme.of(context).fondo,
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                    ),
                                    Container(
                                      width: 7.0,
                                      height: 7.0,
                                      decoration: BoxDecoration(
                                        color:
                                            FlutterFlowTheme.of(context).fondo,
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 4.0)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 120.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Builder(
                                        builder: (context) => InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (valueOrDefault(
                                                        currentUserDocument
                                                            ?.verificationPDF,
                                                        '') ==
                                                    null ||
                                                valueOrDefault(
                                                        currentUserDocument
                                                            ?.verificationPDF,
                                                        '') ==
                                                    '') {
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child:
                                                        VerificacionComponent1Widget(),
                                                  );
                                                },
                                              );
                                            } else {
                                              _model.cuenta =
                                                  await queryAhorrosRecordCount(
                                                queryBuilder: (ahorrosRecord) =>
                                                    ahorrosRecord
                                                        .where(
                                                          'user',
                                                          isEqualTo:
                                                              currentUserReference,
                                                        )
                                                        .where(
                                                          'AhorrosDocPdf1',
                                                          isNotEqualTo: '',
                                                        ),
                                              );
                                              if (_model.cuenta! >= 1) {
                                                context.pushNamed(
                                                  AHORROSPage1Widget.routeName,
                                                  extra: <String, dynamic>{
                                                    '__transition_info__':
                                                        TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .rightToLeft,
                                                      duration: Duration(
                                                          milliseconds: 300),
                                                    ),
                                                  },
                                                );

                                                await currentUserReference!
                                                    .update(
                                                        createUserRecordData(
                                                  lastLogin:
                                                      getCurrentTimestamp,
                                                ));
                                              } else {
                                                context.pushNamed(
                                                    AhorroDeNominaPageInicioWidget
                                                        .routeName);
                                              }
                                            }

                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            width: 132.0,
                                            height: 132.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .customColor5,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/Group_73_(1).png',
                                                    width: 44.0,
                                                    height: 58.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 8.0, 10.0, 0.0),
                                                  child: AutoSizeText(
                                                    'Mis ahorros',
                                                    textAlign: TextAlign.center,
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
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            MsinversionescdatWidget.routeName,
                                            extra: <String, dynamic>{
                                              '__transition_info__':
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType
                                                        .rightToLeft,
                                                duration:
                                                    Duration(milliseconds: 500),
                                              ),
                                            },
                                          );
                                        },
                                        child: Container(
                                          width: 132.0,
                                          height: 132.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .customColor5,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/Frame_2609779.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 40.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Opacity(
                                          opacity: 0.3,
                                          child: Container(
                                            width: 132.0,
                                            height: 132.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .customColor5,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/Group_74.png',
                                                    width: 49.0,
                                                    height: 59.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 10.0,
                                                          10.0, 0.0),
                                                  child: AutoSizeText(
                                                    'Mis créditos',
                                                    textAlign: TextAlign.center,
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
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Opacity(
                                          opacity: 0.3,
                                          child: Container(
                                            width: 132.0,
                                            height: 132.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .customColor5,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/Group_76.png',
                                                    width: 52.0,
                                                    height: 52.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 10.0,
                                                          10.0, 0.0),
                                                  child: AutoSizeText(
                                                    'Fondo solidario',
                                                    textAlign: TextAlign.center,
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
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
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
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 80.0,
                  decoration: BoxDecoration(),
                  child: wrapWithModel(
                    model: _model.menuNewModel,
                    updateCallback: () => safeSetState(() {}),
                    child: MenuNewWidget(),
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
