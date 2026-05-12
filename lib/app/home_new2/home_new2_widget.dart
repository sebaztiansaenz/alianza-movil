import '/app/otros/animacionmenu/animacionmenu_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
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
import 'home_new2_model.dart';
export 'home_new2_model.dart';

class HomeNew2Widget extends StatefulWidget {
  const HomeNew2Widget({super.key});

  static String routeName = 'HomeNew2';
  static String routePath = '/homeNew2';

  @override
  State<HomeNew2Widget> createState() => _HomeNew2WidgetState();
}

class _HomeNew2WidgetState extends State<HomeNew2Widget>
    with TickerProviderStateMixin {
  late HomeNew2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeNew2Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
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
                  CierredeSesionWidget.routeName,
                  context.mounted,
                  extra: <String, dynamic>{
                    '__transition_info__': TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.fade,
                      duration: Duration(milliseconds: 0),
                    ),
                  },
                );

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
        Future(() async {
          FFAppState().isSavingAccountHave = valueOrDefault<bool>(
              currentUserDocument?.isHaveSavingAccount, false);
          FFAppState().lastAction = getCurrentTimestamp;
          safeSetState(() {});
          _model.ahorros127 = await queryAhorrosRecordOnce(
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
              _model.transactionsTotal = await actions.transactionsTotal(
                _model.ahorros127!.map((e) => e.reference.id).toList().toList(),
              );
              _model.total = _model.transactionsTotal;
              safeSetState(() {});
            }),
            Future(() async {
              _model.withdrawalTotal = await actions.withdrawalTotal(
                _model.ahorros127!.map((e) => e.reference.id).toList().toList(),
              );
              _model.withdrawals = _model.withdrawalTotal;
              safeSetState(() {});
            }),
          ]);
        }),
      ]);
    });

    animationsMap.addAll({
      'iconOnPageLoadAnimation1': AnimationInfo(
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
      'iconOnPageLoadAnimation2': AnimationInfo(
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
      'iconOnPageLoadAnimation3': AnimationInfo(
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
      'iconOnPageLoadAnimation4': AnimationInfo(
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
        List<AhorrosRecord> homeNew2AhorrosRecordList = snapshot.data!;

        return Scaffold(
          key: scaffoldKey,
          body: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0.0,
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.06636,
                        56.0,
                      ),
                      0.0,
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.07110,
                        60.0,
                      )),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    'Hola,',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          fontSize: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.01896,
                                            16.0,
                                          ),
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      AuthUserStreamWidget(
                                        builder: (context) => AutoSizeText(
                                          valueOrDefault<String>(
                                            currentUserDisplayName,
                                            '---',
                                          ),
                                          textAlign: TextAlign.start,
                                          maxLines: 2,
                                          minFontSize: 12.0,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                fontSize:
                                                    valueOrDefault<double>(
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.01896,
                                                  16.0,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      if (valueOrDefault(
                                              currentUserDocument
                                                  ?.verificacionusuario,
                                              '') ==
                                          FFAppConstants.verifcado)
                                        AuthUserStreamWidget(
                                          builder: (context) => Container(
                                            width: 19.0,
                                            height: 18.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              image: DecorationImage(
                                                fit: BoxFit.contain,
                                                image: Image.asset(
                                                  'assets/images/jgiQbl.tif_00000007428863547327307570000002203431535399969943_.png',
                                                ).image,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                ].divide(SizedBox(height: 2.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).width *
                                          0.12821,
                                      42.0,
                                    ),
                                    height: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.04977,
                                      42.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0x83EEF1FA),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/Vector_(61).png',
                                          width: 20.0,
                                          height: 19.0,
                                          fit: BoxFit.contain,
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
                                      GoRouter.of(context).prepareAuthEvent();
                                      await authManager.signOut();
                                      GoRouter.of(context)
                                          .clearRedirectLocation();

                                      context.goNamedAuth(
                                          OnboardingAppMovilWidget.routeName,
                                          context.mounted);
                                    },
                                    child: Container(
                                      width: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).width *
                                            0.12821,
                                        42.0,
                                      ),
                                      height: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.04977,
                                        42.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0x83EEF1FA),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Icon(
                                        Icons.logout_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 6.0)),
                              ),
                            ],
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
                            height: valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.30332,
                              256.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Container(
                              height: valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.28910,
                                244.0,
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16.0),
                                      child: Image.asset(
                                        'assets/images/8501f8b7eee7c6adce6f289160d2df982c0e157a.png',
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.30332,
                                          256.0,
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            StreamBuilder<List<CdatsRecord>>(
                                              stream: queryCdatsRecord(
                                                queryBuilder: (cdatsRecord) =>
                                                    cdatsRecord.where(
                                                  'Idusuario',
                                                  isEqualTo:
                                                      currentUserReference,
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
                                                  child: Padding(
                                                    padding: EdgeInsets.all(
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.01896,
                                                      16.0,
                                                    )),
                                                    child: StreamBuilder<
                                                        List<AhorrosRecord>>(
                                                      stream:
                                                          queryAhorrosRecord(
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
                                                      builder:
                                                          (context, snapshot) {
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
                                                            containerAhorrosRecordList =
                                                            snapshot.data!;

                                                        return Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  AutoSizeText(
                                                                    'Mi saldo',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Satoshi',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          fontSize:
                                                                              valueOrDefault<double>(
                                                                            MediaQuery.sizeOf(context).height *
                                                                                0.01659,
                                                                            14.0,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      if (_model
                                                                              .transactionsTotal !=
                                                                          null)
                                                                        AutoSizeText(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.formatAmount(valueOrDefault<double>(
                                                                                  functions.sumaTotal(containerCdatsRecordList.map((e) => e.saldoDisponible).toList()),
                                                                                  0.0,
                                                                                ) +
                                                                                valueOrDefault<double>(
                                                                                  valueOrDefault<double>(
                                                                                        valueOrDefault<double>(
                                                                                              _model.total,
                                                                                              0.0,
                                                                                            ) -
                                                                                            valueOrDefault<double>(
                                                                                              _model.withdrawals,
                                                                                              0.0,
                                                                                            ),
                                                                                        0.0,
                                                                                      ) +
                                                                                      valueOrDefault<double>(
                                                                                        functions.ahorroBenefitsTotal(containerAhorrosRecordList.toList()),
                                                                                        0.0,
                                                                                      ),
                                                                                  0.0,
                                                                                )),
                                                                            '00',
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.justify,
                                                                          maxLines:
                                                                              1,
                                                                          minFontSize:
                                                                              30.0,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Satoshi',
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                fontSize: valueOrDefault<double>(
                                                                                  MediaQuery.sizeOf(context).height * 0.04266,
                                                                                  36.0,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w900,
                                                                              ),
                                                                        ),
                                                                      if (_model
                                                                              .transactionsTotal ==
                                                                          null)
                                                                        FaIcon(
                                                                          FontAwesomeIcons
                                                                              .circleNotch,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          size:
                                                                              valueOrDefault<double>(
                                                                            MediaQuery.sizeOf(context).height *
                                                                                0.04266,
                                                                            36.0,
                                                                          ),
                                                                        ).animateOnPageLoad(
                                                                            animationsMap['iconOnPageLoadAnimation1']!),
                                                                    ],
                                                                  ),
                                                                ].divide(
                                                                    SizedBox(
                                                                        height:
                                                                            valueOrDefault<double>(
                                                                  MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.0095,
                                                                  8.0,
                                                                ))),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        valueOrDefault<
                                                                            double>(
                                                                          MediaQuery.sizeOf(context).height *
                                                                              0.01896,
                                                                          16.0,
                                                                        ),
                                                                        0.0,
                                                                        0.0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        CdatsRecord>>(
                                                                  stream:
                                                                      queryCdatsRecord(
                                                                    queryBuilder: (cdatsRecord) =>
                                                                        cdatsRecord
                                                                            .where(
                                                                              'Idusuario',
                                                                              isEqualTo: currentUserReference,
                                                                            )
                                                                            .where(
                                                                              'Estado',
                                                                              isEqualTo: 'Activo',
                                                                            ),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<CdatsRecord>
                                                                        containerCdatsRecordList =
                                                                        snapshot
                                                                            .data!;

                                                                    return Container(
                                                                      width: valueOrDefault<
                                                                          double>(
                                                                        MediaQuery.sizeOf(context).width *
                                                                            0.55897,
                                                                        218.0,
                                                                      ),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0x2FFFFFFF),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            4.0,
                                                                            12.0,
                                                                            4.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Icon(
                                                                                      Icons.trending_up,
                                                                                      color: Color(0xCDFFFFFF),
                                                                                      size: valueOrDefault<double>(
                                                                                        MediaQuery.sizeOf(context).height * 0.01659,
                                                                                        14.0,
                                                                                      ),
                                                                                    ),
                                                                                    AutoSizeText(
                                                                                      'Beneficios',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Satoshi',
                                                                                            color: Color(0xCDFFFFFF),
                                                                                            fontSize: valueOrDefault<double>(
                                                                                              MediaQuery.sizeOf(context).height * 0.01422,
                                                                                              12.0,
                                                                                            ),
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 8.0)),
                                                                                ),
                                                                                Icon(
                                                                                  Icons.arrow_forward_sharp,
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  size: valueOrDefault<double>(
                                                                                    MediaQuery.sizeOf(context).height * 0.01659,
                                                                                    14.0,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  if (_model.transactionsTotal != null)
                                                                                    StreamBuilder<List<AhorrosRecord>>(
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
                                                                                                valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                  FlutterFlowTheme.of(context).primary,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        }
                                                                                        List<AhorrosRecord> textAhorrosRecordList = snapshot.data!;

                                                                                        return AutoSizeText(
                                                                                          '+ ${valueOrDefault<String>(
                                                                                            functions.formatAmount(valueOrDefault<double>(
                                                                                              valueOrDefault<double>(
                                                                                                    functions.ahorroBenefitsTotal(textAhorrosRecordList.toList()),
                                                                                                    0.0,
                                                                                                  ) +
                                                                                                  functions.sumarbeneficioscdat(containerCdatsRecordList.toList(), getCurrentTimestamp),
                                                                                              0.0,
                                                                                            )),
                                                                                            '\$ 0',
                                                                                          )}',
                                                                                          minFontSize: 12.0,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Satoshi',
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                fontSize: valueOrDefault<double>(
                                                                                                  MediaQuery.sizeOf(context).height * 0.01896,
                                                                                                  16.0,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.bold,
                                                                                              ),
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  if (_model.transactionsTotal == null)
                                                                                    FaIcon(
                                                                                      FontAwesomeIcons.circleNotch,
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      size: valueOrDefault<double>(
                                                                                        MediaQuery.sizeOf(context).height * 0.01896,
                                                                                        16.0,
                                                                                      ),
                                                                                    ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation2']!),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          valueOrDefault<double>(
                                                                            MediaQuery.sizeOf(context).height *
                                                                                0.0095,
                                                                            8.0,
                                                                          ),
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width: valueOrDefault<
                                                                            double>(
                                                                          MediaQuery.sizeOf(context).width *
                                                                              0.26923,
                                                                          105.0,
                                                                        ),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0x2FFFFFFF),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(8.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              AutoSizeText(
                                                                                'Ahorros',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Satoshi',
                                                                                      color: Color(0xCDFFFFFF),
                                                                                      fontSize: valueOrDefault<double>(
                                                                                        MediaQuery.sizeOf(context).height * 0.01422,
                                                                                        12.0,
                                                                                      ),
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  if (_model.transactionsTotal != null)
                                                                                    AutoSizeText(
                                                                                      valueOrDefault<String>(
                                                                                        functions.formatAmount(valueOrDefault<double>(
                                                                                          valueOrDefault<double>(
                                                                                                valueOrDefault<double>(
                                                                                                      _model.total,
                                                                                                      0.0,
                                                                                                    ) -
                                                                                                    valueOrDefault<double>(
                                                                                                      _model.withdrawals,
                                                                                                      0.0,
                                                                                                    ),
                                                                                                0.0,
                                                                                              ) +
                                                                                              valueOrDefault<double>(
                                                                                                functions.ahorroBenefitsTotal(containerAhorrosRecordList.toList()),
                                                                                                0.0,
                                                                                              ),
                                                                                          0.0,
                                                                                        )),
                                                                                        '\$- - -',
                                                                                      ),
                                                                                      textAlign: TextAlign.justify,
                                                                                      maxLines: 1,
                                                                                      minFontSize: 10.0,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Satoshi',
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            fontSize: valueOrDefault<double>(
                                                                                              MediaQuery.sizeOf(context).height * 0.01896,
                                                                                              16.0,
                                                                                            ),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                    ),
                                                                                  if (_model.transactionsTotal == null)
                                                                                    FaIcon(
                                                                                      FontAwesomeIcons.circleNotch,
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      size: valueOrDefault<double>(
                                                                                        MediaQuery.sizeOf(context).height * 0.01896,
                                                                                        16.0,
                                                                                      ),
                                                                                    ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation3']!),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          valueOrDefault<double>(
                                                                            MediaQuery.sizeOf(context).height *
                                                                                0.0095,
                                                                            8.0,
                                                                          ),
                                                                          0.0,
                                                                          0.0),
                                                                      child: StreamBuilder<
                                                                          List<
                                                                              CdatsRecord>>(
                                                                        stream:
                                                                            queryCdatsRecord(
                                                                          queryBuilder: (cdatsRecord) =>
                                                                              cdatsRecord.where(
                                                                            'Idusuario',
                                                                            isEqualTo:
                                                                                currentUserReference,
                                                                          ),
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                          List<CdatsRecord>
                                                                              containerCdatsRecordList =
                                                                              snapshot.data!;

                                                                          return Container(
                                                                            width:
                                                                                valueOrDefault<double>(
                                                                              MediaQuery.sizeOf(context).width * 0.26923,
                                                                              105.0,
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0x2DFFFFFF),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsets.all(8.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(-0.7, 0.0),
                                                                                    child: AutoSizeText(
                                                                                      'Inversiones',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Satoshi',
                                                                                            color: Color(0xCDFFFFFF),
                                                                                            fontSize: valueOrDefault<double>(
                                                                                              MediaQuery.sizeOf(context).height * 0.01422,
                                                                                              12.0,
                                                                                            ),
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      if (_model.transactionsTotal != null)
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                            child: AutoSizeText(
                                                                                              valueOrDefault<String>(
                                                                                                functions.formatAmount(valueOrDefault<double>(
                                                                                                  functions.sumaTotal(containerCdatsRecordList
                                                                                                      .where((e) => e.estado == 'Activo')
                                                                                                      .toList()
                                                                                                      .map((e) => valueOrDefault<double>(
                                                                                                            e.inversion,
                                                                                                            0.0,
                                                                                                          ))
                                                                                                      .toList()),
                                                                                                  0.0,
                                                                                                )),
                                                                                                '\$ 0',
                                                                                              ),
                                                                                              textAlign: TextAlign.start,
                                                                                              maxLines: 1,
                                                                                              minFontSize: 10.0,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Satoshi',
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    fontSize: valueOrDefault<double>(
                                                                                                      MediaQuery.sizeOf(context).height * 0.01896,
                                                                                                      16.0,
                                                                                                    ),
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      if (_model.transactionsTotal == null)
                                                                                        FaIcon(
                                                                                          FontAwesomeIcons.circleNotch,
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          size: valueOrDefault<double>(
                                                                                            MediaQuery.sizeOf(context).height * 0.01896,
                                                                                            16.0,
                                                                                          ),
                                                                                        ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation4']!),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        8.0)),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 0.0, 16.0),
                                  child: AutoSizeText(
                                    'Mis productos',
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
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
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
                                              context.goNamed(
                                                Aperturaahorro1Widget.routeName,
                                                extra: <String, dynamic>{
                                                  '__transition_info__':
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 0),
                                                  ),
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
                                                    AHORROSPage1CopyCopyWidget
                                                        .routeName);

                                                await currentUserReference!
                                                    .update(
                                                        createUserRecordData(
                                                  lastLogin:
                                                      getCurrentTimestamp,
                                                ));
                                              } else {
                                                context.pushNamed(
                                                  Aperturaahorro1Widget
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
                                              }
                                            }

                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            width: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context).width *
                                                  0.31795,
                                              124.0,
                                            ),
                                            height: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.14694,
                                              124.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              border: Border.all(
                                                color: Color(0x1A262632),
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 18.0, 0.0, 18.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    child: Image.asset(
                                                      'assets/images/ee82e73be12c354baae85a6e1a277ffdce832f9a.gif',
                                                      width: valueOrDefault<
                                                          double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .width *
                                                            0.16410,
                                                        64.0,
                                                      ),
                                                      height: valueOrDefault<
                                                          double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .height *
                                                            0.07584,
                                                        64.0,
                                                      ),
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                  AutoSizeText(
                                                    'Ahorros',
                                                    textAlign: TextAlign.center,
                                                    maxLines: 1,
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
                                                                0.01896,
                                                            16.0,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ],
                                              ),
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
                                            HomeInversionesWidget.routeName,
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
                                          width: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width *
                                                0.31795,
                                            124.0,
                                          ),
                                          height: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.14694,
                                            124.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color: Color(0xFFFF6700),
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Stack(
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          2.0, 0.0, 0.0, 0.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    child: Image.asset(
                                                      'assets/images/Frame_2085662540_(1).png',
                                                      width: valueOrDefault<
                                                          double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .width *
                                                            0.13333,
                                                        52.0,
                                                      ),
                                                      height: valueOrDefault<
                                                          double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .height *
                                                            0.02607,
                                                        22.0,
                                                      ),
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsets.all(14.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.asset(
                                                          'assets/images/c816bba750a8ef7e040fff79292e2d9a95fc44d0.gif',
                                                          width: valueOrDefault<
                                                              double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.16410,
                                                            64.0,
                                                          ),
                                                          height:
                                                              valueOrDefault<
                                                                  double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.07584,
                                                            64.0,
                                                          ),
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                      AutoSizeText(
                                                        'Inversiones',
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLines: 1,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Satoshi',
                                                                  fontSize:
                                                                      valueOrDefault<
                                                                          double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.01896,
                                                                    16.0,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
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
                                      Container(
                                        width: valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).width *
                                              0.31795,
                                          124.0,
                                        ),
                                        height: valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.14694,
                                          124.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          border: Border.all(
                                            color: Color(0x1A262632),
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Opacity(
                                          opacity: 0.5,
                                          child: Padding(
                                            padding: EdgeInsets.all(14.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: Image.asset(
                                                    'assets/images/5c39701e93be4042342ad92bce7fb77b2240c42a.gif',
                                                    width:
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.16410,
                                                      64.0,
                                                    ),
                                                    height:
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.07584,
                                                      64.0,
                                                    ),
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: AutoSizeText(
                                                    'Créditos',
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
                                                                0.01896,
                                                            16.0,
                                                          ),
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
                                      Container(
                                        width: valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).width *
                                              0.31795,
                                          124.0,
                                        ),
                                        height: valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.14694,
                                          124.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          border: Border.all(
                                            color: Color(0x1A262632),
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Opacity(
                                          opacity: 0.5,
                                          child: Padding(
                                            padding: EdgeInsets.all(14.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: Image.asset(
                                                    'assets/images/43e3b215bd37bd2c4b397de6d369750b0a29616d.gif',
                                                    width:
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.16410,
                                                      64.0,
                                                    ),
                                                    height:
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.07584,
                                                      64.0,
                                                    ),
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: AutoSizeText(
                                                    ' Solidario',
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
                                                                0.01896,
                                                            16.0,
                                                          ),
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
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0,
                                      valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.03792,
                                        32.0,
                                      ),
                                      0.0,
                                      0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.12561,
                                      106.0,
                                    ),
                                    child: CarouselSlider(
                                      items: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 12.0, 0.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/a9ca60d495b428257aa23bed81a1d2099149867d.jpg',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 12.0, 0.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/b91d10ef813212d5bd3f6ae49d926e42dc1d884c_(1).png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 12.0, 0.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/3ccdcf9688cf76b5986f0be312281ee47a43c39f.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ],
                                      carouselController:
                                          _model.carouselController ??=
                                              CarouselSliderController(),
                                      options: CarouselOptions(
                                        initialPage: 1,
                                        viewportFraction: 0.7,
                                        disableCenter: true,
                                        enlargeCenterPage: false,
                                        enlargeFactor: 0.0,
                                        enableInfiniteScroll: true,
                                        scrollDirection: Axis.horizontal,
                                        autoPlay: true,
                                        autoPlayAnimationDuration:
                                            Duration(milliseconds: 800),
                                        autoPlayInterval: Duration(
                                            milliseconds: (800 + 4000)),
                                        autoPlayCurve: Curves.linear,
                                        pauseAutoPlayInFiniteScroll: true,
                                        onPageChanged: (index, _) =>
                                            _model.carouselCurrentIndex = index,
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
                ),
              ),
              if (responsiveVisibility(
                context: context,
                phone: false,
                desktop: false,
              ))
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: wrapWithModel(
                    model: _model.animacionmenuModel,
                    updateCallback: () => safeSetState(() {}),
                    updateOnChange: true,
                    child: AnimacionmenuWidget(),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
