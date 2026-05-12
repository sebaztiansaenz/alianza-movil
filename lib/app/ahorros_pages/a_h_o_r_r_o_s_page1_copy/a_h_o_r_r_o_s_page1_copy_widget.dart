import '/app/ahorros_pages/depositoahorro1/depositoahorro1_widget.dart';
import '/app/ahorros_pages/retiros1/retiros1_widget.dart';
import '/app/otros/animacionmenu/animacionmenu_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'a_h_o_r_r_o_s_page1_copy_model.dart';
export 'a_h_o_r_r_o_s_page1_copy_model.dart';

class AHORROSPage1CopyWidget extends StatefulWidget {
  const AHORROSPage1CopyWidget({super.key});

  static String routeName = 'AHORRO_SPage1Copy';
  static String routePath = '/aHORROSPage1Copy';

  @override
  State<AHORROSPage1CopyWidget> createState() => _AHORROSPage1CopyWidgetState();
}

class _AHORROSPage1CopyWidgetState extends State<AHORROSPage1CopyWidget>
    with TickerProviderStateMixin {
  late AHORROSPage1CopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AHORROSPage1CopyModel());

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
                          '-',
                        ))
                    .toList()
                    .toList(),
              );
              _model.totalesAhorro = _model.depositosAhorrosTotal!
                  .toList()
                  .cast<TotalDepositoAhorroStruct>();
              safeSetState(() {});
            }),
            Future(() async {
              _model.withdrawalTotalAhorros =
                  await actions.withdrawalTotalAhorros(
                _model.ahorrosQuery!
                    .map((e) => valueOrDefault<String>(
                          e.reference.id,
                          '-',
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
        List<AhorrosRecord> aHORROSPage1CopyAhorrosRecordList = snapshot.data!;

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
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          20.0,
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.06636,
                            56.0,
                          ),
                          20.0,
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.02844,
                            24.0,
                          )),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 24.0,
                                height: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.02844,
                                  24.0,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(HomeNew2Widget.routeName);
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.02844,
                                      24.0,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                'Mis ahorros',
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
                                    ),
                              ),
                            ].divide(SizedBox(width: 8.0)),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).width * 0.10769,
                                  42.0,
                                ),
                                height: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.04977,
                                  42.0,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: Image.asset(
                                      'assets/images/Frame_(2).png',
                                    ).image,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
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
                                  GoRouter.of(context).clearRedirectLocation();

                                  context.goNamedAuth(
                                    OnboardingAppMovilWidget.routeName,
                                    context.mounted,
                                    extra: <String, dynamic>{
                                      '__transition_info__': TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );
                                },
                                child: Container(
                                  width: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).width * 0.10769,
                                    42.0,
                                  ),
                                  height: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.04977,
                                    42.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0x80EEF1FA),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Icon(
                                    Icons.logout_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.02370,
                                      20.0,
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 6.0)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.09480,
                          80.0,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF002CE9),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.01659,
                            14.0,
                          )),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Image.asset(
                                  'assets/images/monedas_(1).gif',
                                  width: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).width * 0.09231,
                                    36.0,
                                  ),
                                  height: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.04266,
                                    36.0,
                                  ),
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    valueOrDefault<String>(
                                      functions
                                          .formatAmount(valueOrDefault<double>(
                                        functions.ahorroBenefitsTotal(
                                            aHORROSPage1CopyAhorrosRecordList
                                                .toList()),
                                        0.0,
                                      )),
                                      '\$ 12.000',
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    minFontSize: 30.0,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.02370,
                                            20.0,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  AutoSizeText(
                                    'Rentabilidad generada',
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    minFontSize: 8.0,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          fontSize: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.01422,
                                            12.0,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ],
                              ),
                            ].divide(SizedBox(width: 16.0)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.02844,
                            24.0,
                          ),
                          0.0,
                          0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
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
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      FutureBuilder<int>(
                                        future: queryServicesRecordCount(
                                          queryBuilder: (servicesRecord) =>
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
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          int containerCount = snapshot.data!;

                                          return Container(
                                            decoration: BoxDecoration(),
                                            child: Visibility(
                                              visible:
                                                  aHORROSPage1CopyAhorrosRecordList
                                                          .length <
                                                      3,
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  FFAppState().typeOfProduct =
                                                      '';
                                                  FFAppState().TipoContrato =
                                                      '';
                                                  FFAppState().Salario = '';
                                                  FFAppState().Antiguedad = '';
                                                  safeSetState(() {});

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
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Icon(
                                                      Icons.add,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor4,
                                                      size: valueOrDefault<
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
                                                      textAlign: TextAlign.end,
                                                      maxLines: 1,
                                                      minFontSize: 10.0,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                                  MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.01659,
                                                                  14.0,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 4.0)),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0,
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.01896,
                                            16.0,
                                          ),
                                          0.0,
                                          40.0),
                                      child: Builder(
                                        builder: (context) {
                                          final containerVar =
                                              aHORROSPage1CopyAhorrosRecordList
                                                  .where((e) =>
                                                      e.ahorrosDocPdf1 !=
                                                          null &&
                                                      e.ahorrosDocPdf1 != '')
                                                  .toList();

                                          return SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: List.generate(
                                                  containerVar.length,
                                                  (containerVarIndex) {
                                                final containerVarItem =
                                                    containerVar[
                                                        containerVarIndex];
                                                return Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                4.0, 0.0),
                                                    child: StreamBuilder<
                                                        List<
                                                            TransactionsRecord>>(
                                                      stream:
                                                          queryTransactionsRecord(
                                                        queryBuilder:
                                                            (transactionsRecord) =>
                                                                transactionsRecord
                                                                    .where(
                                                                      'ahorrosId',
                                                                      isEqualTo:
                                                                          containerVarItem
                                                                              .reference
                                                                              .id,
                                                                    )
                                                                    .where(
                                                                      'transactionType',
                                                                      isEqualTo:
                                                                          'Withdrawal',
                                                                    )
                                                                    .where(
                                                                      'status',
                                                                      isNotEqualTo:
                                                                          'REJECTED',
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
                                                        List<TransactionsRecord>
                                                            containerTransactionsRecordList =
                                                            snapshot.data!;

                                                        return Container(
                                                          width: valueOrDefault<
                                                              double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.89744,
                                                            295.0,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0xFFEEF1FA),
                                                            ),
                                                          ),
                                                          child: Stack(
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
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
                                                                            14.0,
                                                                            14.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Image.asset(
                                                                              'assets/images/Group_3.png',
                                                                              height: valueOrDefault<double>(
                                                                                MediaQuery.sizeOf(context).height * 0.02370,
                                                                                20.0,
                                                                              ),
                                                                              fit: BoxFit.contain,
                                                                            ),
                                                                            AutoSizeText(
                                                                              valueOrDefault<String>(
                                                                                containerVarItem.savingsType,
                                                                                'Línea de ahorro Nomina',
                                                                              ),
                                                                              textAlign: TextAlign.start,
                                                                              maxLines: 2,
                                                                              minFontSize: 10.0,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Satoshi',
                                                                                    color: Color(0xFF002CE9),
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
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              14.0,
                                                                              6.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              AuthUserStreamWidget(
                                                                            builder: (context) =>
                                                                                Text(
                                                                              valueOrDefault<String>(
                                                                                '# ${valueOrDefault<String>(
                                                                                  valueOrDefault(currentUserDocument?.nit, ''),
                                                                                  '#1118123413-01',
                                                                                )}-0${valueOrDefault<String>(
                                                                                  (containerVarIndex + 01).toString(),
                                                                                  '#1118123413-01',
                                                                                )}',
                                                                                '#1118123413-01',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Satoshi',
                                                                                    color: Color(0xB2262632),
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
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          14.0,
                                                                          14.0),
                                                                      child: StreamBuilder<
                                                                          List<
                                                                              TransactionsRecord>>(
                                                                        stream:
                                                                            queryTransactionsRecord(
                                                                          queryBuilder: (transactionsRecord) => transactionsRecord
                                                                              .where(
                                                                                'ahorrosId',
                                                                                isEqualTo: containerVarItem.reference.id,
                                                                              )
                                                                              .orderBy('firebaseDate', descending: true),
                                                                          singleRecord:
                                                                              true,
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
                                                                          List<TransactionsRecord>
                                                                              containerTransactionsRecordList =
                                                                              snapshot.data!;
                                                                          final containerTransactionsRecord = containerTransactionsRecordList.isNotEmpty
                                                                              ? containerTransactionsRecordList.first
                                                                              : null;

                                                                          return Container(
                                                                            height:
                                                                                valueOrDefault<double>(
                                                                              MediaQuery.sizeOf(context).height * 0.05925,
                                                                              50.0,
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            alignment:
                                                                                AlignmentDirectional(1.0, 0.0),
                                                                            child:
                                                                                Stack(
                                                                              children: [
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                      children: [
                                                                                        if (_model.totalesAhorro.where((e) => e.ahorroid == containerVarItem.reference.id).toList().firstOrNull?.total != null)
                                                                                          AutoSizeText(
                                                                                            valueOrDefault<String>(
                                                                                              functions.formatAmount(valueOrDefault<double>(
                                                                                                valueOrDefault<double>(
                                                                                                      valueOrDefault<double>(
                                                                                                            _model.totalesAhorro.where((e) => e.ahorroid == containerVarItem.reference.id).toList().firstOrNull?.total,
                                                                                                            0.0,
                                                                                                          ) -
                                                                                                          valueOrDefault<double>(
                                                                                                            _model.retirosAhorro.where((e) => e.ahorroid == containerVarItem.reference.id).toList().firstOrNull?.total,
                                                                                                            0.0,
                                                                                                          ),
                                                                                                      0.0,
                                                                                                    ) +
                                                                                                    valueOrDefault<double>(
                                                                                                      functions.sumaTotal(containerVarItem.transactions
                                                                                                          .map((e) => valueOrDefault<double>(
                                                                                                                e.taxedBenefit,
                                                                                                                0.0,
                                                                                                              ))
                                                                                                          .toList()),
                                                                                                      0.0,
                                                                                                    ),
                                                                                                0.0,
                                                                                              )),
                                                                                              '\$ 200.028',
                                                                                            ),
                                                                                            textAlign: TextAlign.justify,
                                                                                            maxLines: 1,
                                                                                            minFontSize: 18.0,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Satoshi',
                                                                                                  color: Color(0xFF002CE9),
                                                                                                  fontSize: valueOrDefault<double>(
                                                                                                    MediaQuery.sizeOf(context).height * 0.02844,
                                                                                                    24.0,
                                                                                                  ),
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w900,
                                                                                                ),
                                                                                          ),
                                                                                        if (_model.totalesAhorro.where((e) => e.ahorroid == containerVarItem.reference.id).toList().firstOrNull?.total == null)
                                                                                          FaIcon(
                                                                                            FontAwesomeIcons.circleNotch,
                                                                                            color: Color(0xFF002CE9),
                                                                                            size: valueOrDefault<double>(
                                                                                              MediaQuery.sizeOf(context).height * 0.02844,
                                                                                              24.0,
                                                                                            ),
                                                                                          ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation']!),
                                                                                      ],
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Beneficios: ',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Satoshi',
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
                                                                                              functions.sumaTotal(containerVarItem.transactions
                                                                                                  .map((e) => valueOrDefault<double>(
                                                                                                        e.taxedBenefit,
                                                                                                        0.0,
                                                                                                      ))
                                                                                                  .toList()),
                                                                                              0.0,
                                                                                            )),
                                                                                            '\$ 5.000',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Satoshi',
                                                                                                color: Color(0xFF002CE9),
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
                                                                                if (containerVarItem.savingsType == 'Linea de Ahorro Los Mejores')
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(14.0, 12.0, 0.0, 0.0),
                                                                                    child: Image.asset(
                                                                                      'assets/images/image_2105.png',
                                                                                      width: 62.0,
                                                                                      height: 34.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    height: valueOrDefault<
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
                                                                            Radius.circular(16.0),
                                                                        bottomRight:
                                                                            Radius.circular(16.0),
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
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
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
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                _model.list = containerVarIndex + 01;
                                                                                safeSetState(() {});

                                                                                context.pushNamed(
                                                                                  AhorroMainPageCopyWidget.routeName,
                                                                                  queryParameters: {
                                                                                    'ahoro': serializeParam(
                                                                                      containerVarItem,
                                                                                      ParamType.Document,
                                                                                    ),
                                                                                    'list': serializeParam(
                                                                                      _model.list,
                                                                                      ParamType.int,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                  extra: <String, dynamic>{
                                                                                    'ahoro': containerVarItem,
                                                                                    '__transition_info__': TransitionInfo(
                                                                                      hasTransition: true,
                                                                                      transitionType: PageTransitionType.rightToLeft,
                                                                                      duration: Duration(milliseconds: 300),
                                                                                    ),
                                                                                  },
                                                                                );
                                                                              },
                                                                              child: Row(
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
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0.0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/Frame_2085662540.png',
                                                                    width: valueOrDefault<
                                                                        double>(
                                                                      MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.14872,
                                                                      58.0,
                                                                    ),
                                                                    height: valueOrDefault<
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
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                );
                                              }),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      63.0,
                                      valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
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
                                                  child: Depositoahorro1Widget(
                                                    doc: _model.ahorrosQuery
                                                        ?.where((e) =>
                                                            e.reference.id !=
                                                                null &&
                                                            e.reference.id !=
                                                                '')
                                                        .toList()
                                                        ?.firstOrNull,
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .width *
                                                    0.13333,
                                                52.0,
                                              ),
                                              height: valueOrDefault<double>(
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
                                                    'assets/images/Frame_2609937.png',
                                                  ).image,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: Color(0xFFEEF1FA),
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
                                          ].divide(SizedBox(height: 8.0)),
                                        ),
                                      ),
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
                                                  child: Retiros1Widget(),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .width *
                                                    0.13333,
                                                52.0,
                                              ),
                                              height: valueOrDefault<double>(
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
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: Color(0xFFEEF1FA),
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
                                          ].divide(SizedBox(height: 8.0)),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            InvertirahorrosWidget.routeName,
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
                                              width: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .width *
                                                    0.13333,
                                                52.0,
                                              ),
                                              height: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .height *
                                                    0.06162,
                                                52.0,
                                              ),
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.contain,
                                                  image: Image.network(
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/rqysws4zl590/Frame_2609937_(9).png',
                                                  ).image,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
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
                                          ].divide(SizedBox(height: 8.0)),
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'columnOnPageLoadAnimation']!),
                                    ].divide(SizedBox(width: 44.0)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0,
                                      valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.06636,
                                        56.0,
                                      ),
                                      20.0,
                                      0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        HomeInversionesWidget.routeName,
                                        extra: <String, dynamic>{
                                          '__transition_info__': TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.rightToLeft,
                                          ),
                                        },
                                      );
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12.0),
                                      child: Image.asset(
                                        'assets/images/Frame_2085662699.png',
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.09480,
                                          80.0,
                                        ),
                                        fit: BoxFit.contain,
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
                  tablet: false,
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
      },
    );
  }
}
