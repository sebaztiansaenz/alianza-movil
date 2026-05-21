import '/app/ahorros_pages/depositoahorro1/depositoahorro1_widget.dart';
import '/app/otros/animacionmenu/animacionmenu_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'r_e_t_i_r_o2_copy2_model.dart';
export 'r_e_t_i_r_o2_copy2_model.dart';

class RETIRO2Copy2Widget extends StatefulWidget {
  const RETIRO2Copy2Widget({super.key});

  static String routeName = 'RETIRO2Copy2';
  static String routePath = '/rETIRO2Copy2';

  @override
  State<RETIRO2Copy2Widget> createState() => _RETIRO2Copy2WidgetState();
}

class _RETIRO2Copy2WidgetState extends State<RETIRO2Copy2Widget>
    with TickerProviderStateMixin {
  late RETIRO2Copy2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RETIRO2Copy2Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().lastAction = getCurrentTimestamp;
      safeSetState(() {});
      await Future.wait([
        Future(() async {
          FFAppState().isSavingAccountHave = valueOrDefault<bool>(
              currentUserDocument?.isHaveSavingAccount, false);
          FFAppState().lastAction = getCurrentTimestamp;
          safeSetState(() {});
          _model.ahorross = await queryAhorrosRecordOnce(
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
              _model.transactionsTotal = await actions.getTotalForAccount(
                _model.ahorross!.map((e) => e.reference.id).toList().toList(),
              );
              _model.totalesAhorro = _model.transactionsTotal!
                  .toList()
                  .cast<TotalDepositoAhorroStruct>();
              safeSetState(() {});
            }),
            Future(() async {
              _model.withdrawalTotal = await actions.withdrawalTotalAhorros(
                _model.ahorross!.map((e) => e.reference.id).toList().toList(),
              );
              _model.retirosAhorro = _model.withdrawalTotal!
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

    _model.amountTextController ??= TextEditingController();
    _model.amountFocusNode ??= FocusNode();

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
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<AhorrosRecord>>(
      stream: queryAhorrosRecord(
        queryBuilder: (ahorrosRecord) => ahorrosRecord.where(
          'user',
          isEqualTo: currentUserReference,
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
        List<AhorrosRecord> rETIRO2Copy2AhorrosRecordList = snapshot.data!;

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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 64.0, 0.0, 18.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FlutterFlowIconButton(
                              borderRadius: 8.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.arrow_back,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                context.safePop();
                              },
                            ),
                            Text(
                              'Invertir',
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
                      ),
                      Flexible(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.paddingOf(context).bottom + 32.0,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 17.0),
                                              child: Text(
                                                'Selecciona un ahorro',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Builder(
                                            builder: (context) {
                                              final ahorro1 =
                                                  rETIRO2Copy2AhorrosRecordList
                                                      .where((e) =>
                                                          e.ahorrosDocPdf1 !=
                                                              null &&
                                                          e.ahorrosDocPdf1 !=
                                                              '')
                                                      .toList();

                                              return SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      ahorro1.length,
                                                      (ahorro1Index) {
                                                    final ahorro1Item =
                                                        ahorro1[ahorro1Index];
                                                    return Opacity(
                                                      opacity: valueOrDefault<
                                                          double>(
                                                        _model.idcuenta ==
                                                                ahorro1Item
                                                                    .reference
                                                                    .id
                                                            ? 1.0
                                                            : 0.5,
                                                        1.0,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            _model.idcuenta =
                                                                ahorro1Item
                                                                    .reference
                                                                    .id;
                                                            _model.monto =
                                                                valueOrDefault<
                                                                    double>(
                                                              valueOrDefault<
                                                                      double>(
                                                                    valueOrDefault<
                                                                            double>(
                                                                          _model
                                                                              .totalesAhorro
                                                                              .where((e) => e.ahorroid == ahorro1Item.reference.id)
                                                                              .toList()
                                                                              .firstOrNull
                                                                              ?.total,
                                                                          0.0,
                                                                        ) -
                                                                        valueOrDefault<
                                                                            double>(
                                                                          _model
                                                                              .retirosAhorro
                                                                              .where((e) => e.ahorroid == ahorro1Item.reference.id)
                                                                              .toList()
                                                                              .firstOrNull
                                                                              ?.total,
                                                                          0.0,
                                                                        ),
                                                                    0.0,
                                                                  ) +
                                                                  valueOrDefault<
                                                                      double>(
                                                                    functions.sumaTotal(ahorro1Item
                                                                        .transactions
                                                                        .map((e) =>
                                                                            e.taxedBenefit)
                                                                        .toList()),
                                                                    0.0,
                                                                  ),
                                                              0.0,
                                                            );
                                                            _model.list =
                                                                valueOrDefault<
                                                                    int>(
                                                              ahorro1Index + 01,
                                                              0,
                                                            );
                                                            safeSetState(() {});
                                                          },
                                                          child: Container(
                                                            width: 295.0,
                                                            height: 112.0,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      4.0,
                                                                  color: Color(
                                                                      0x19262632),
                                                                  offset:
                                                                      Offset(
                                                                    0.0,
                                                                    2.0,
                                                                  ),
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                              border:
                                                                  Border.all(
                                                                color: _model.idcuenta !=
                                                                            null &&
                                                                        _model.idcuenta !=
                                                                            ''
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor4
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor5,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Stack(
                                                                  clipBehavior:
                                                                      Clip.none,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                                      child: Row(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment
                                                                                .start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                16.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize:
                                                                                  MainAxisSize.min,
                                                                              children: [
                                                                                if (_model.idcuenta != ahorro1Item.reference.id)
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      _model.idcuenta = ahorro1Item.reference.id;
                                                                                      _model.monto = valueOrDefault<double>(
                                                                                        valueOrDefault<double>(
                                                                                              valueOrDefault<double>(
                                                                                                    _model.totalesAhorro.where((e) => e.ahorroid == ahorro1Item.reference.id).toList().firstOrNull?.total,
                                                                                                    0.0,
                                                                                                  ) -
                                                                                                  valueOrDefault<double>(
                                                                                                    _model.retirosAhorro.where((e) => e.ahorroid == ahorro1Item.reference.id).toList().firstOrNull?.total,
                                                                                                    0.0,
                                                                                                  ),
                                                                                              0.0,
                                                                                            ) +
                                                                                            valueOrDefault<double>(
                                                                                              functions.sumaTotal(ahorro1Item.transactions.map((e) => e.taxedBenefit).toList()),
                                                                                              0.0,
                                                                                            ),
                                                                                        0.0,
                                                                                      );
                                                                                      _model.list = valueOrDefault<int>(
                                                                                        ahorro1Index + 01,
                                                                                        0,
                                                                                      );
                                                                                      safeSetState(() {});
                                                                                    },
                                                                                    child: Container(
                                                                                      width: 16.0,
                                                                                      height: 16.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        borderRadius: BorderRadius.circular(24.0),
                                                                                        border: Border.all(
                                                                                          color: Color(0xB2262632),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                if (_model.idcuenta == ahorro1Item.reference.id)
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      _model.idcuenta = ahorro1Item.reference.id;
                                                                                      safeSetState(() {});
                                                                                    },
                                                                                    child: Container(
                                                                                      width: 16.0,
                                                                                      height: 16.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        borderRadius: BorderRadius.circular(24.0),
                                                                                        border: Border.all(
                                                                                          color: Color(0xB0FF6700),
                                                                                          width: 1.0,
                                                                                        ),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(2.0),
                                                                                        child: Container(
                                                                                          width: 10.0,
                                                                                          height: 10.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).customColor4,
                                                                                            borderRadius: BorderRadius.circular(24.0),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                              width: 8.0),
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(
                                                                                  0.0,
                                                                                  16.0,
                                                                                  52.0,
                                                                                  0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Row(
                                                                                    children: [
                                                                                      Image.asset(
                                                                                        'assets/images/Group_3.png',
                                                                                        width: 14.0,
                                                                                        height: 20.0,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                      SizedBox(width: 8.0),
                                                                                      Expanded(
                                                                                        child: Text(
                                                                                          valueOrDefault<String>(
                                                                                            ahorro1Item.savingsType,
                                                                                            '- - -',
                                                                                          ),
                                                                                          maxLines: 2,
                                                                                          overflow: TextOverflow.ellipsis,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Satoshi',
                                                                                                color: Color(0xFF002CE9),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.bold,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  AuthUserStreamWidget(
                                                                                    builder: (context) => Text(
                                                                                      valueOrDefault<String>(
                                                                                        '# ${valueOrDefault(currentUserDocument?.nit, '')}-0${valueOrDefault<String>(
                                                                                          (ahorro1Index + 01).toString(),
                                                                                          '0',
                                                                                        )}',
                                                                                        '0',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Satoshi',
                                                                                            color: Color(0xB3262632),
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
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
                                                                    Positioned(
                                                                      top: 12.0,
                                                                      right: 12.0,
                                                                      child: Image.asset(
                                                                        'assets/images/Frame_2085662540_(5).png',
                                                                        width: 48.0,
                                                                        height: 20.0,
                                                                        fit: BoxFit.contain,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    if (_model
                                                                            .transactionsTotal
                                                                            ?.where((e) =>
                                                                                e.ahorroid ==
                                                                                ahorro1Item.reference.id)
                                                                            .toList()
                                                                            ?.firstOrNull
                                                                            ?.total !=
                                                                        null)
                                                                      Expanded(
                                                                        child: Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              14.0,
                                                                              0.0),
                                                                          child: Align(
                                                                            alignment: AlignmentDirectional.centerEnd,
                                                                            child: FittedBox(
                                                                              fit: BoxFit.scaleDown,
                                                                              alignment: Alignment.centerRight,
                                                                              child: Text(
                                                                                valueOrDefault<String>(
                                                                                  functions.formatAmount(valueOrDefault<double>(
                                                                                    valueOrDefault<double>(
                                                                                          valueOrDefault<double>(
                                                                                                _model.totalesAhorro.where((e) => e.ahorroid == ahorro1Item.reference.id).toList().firstOrNull?.total,
                                                                                                0.0,
                                                                                              ) -
                                                                                              valueOrDefault<double>(
                                                                                                _model.retirosAhorro.where((e) => e.ahorroid == ahorro1Item.reference.id).toList().firstOrNull?.total,
                                                                                                0.0,
                                                                                              ),
                                                                                          0.0,
                                                                                        ) +
                                                                                        valueOrDefault<double>(
                                                                                          functions.sumaTotal(ahorro1Item.transactions.map((e) => e.taxedBenefit).toList()),
                                                                                          0.0,
                                                                                        ),
                                                                                    0.0,
                                                                                  )),
                                                                                  '\$0',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Satoshi',
                                                                                      color: Color(0xFF002CE9),
                                                                                      fontSize: 24.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w900,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if (_model
                                                                            .transactionsTotal
                                                                            ?.where((e) =>
                                                                                e.ahorroid ==
                                                                                ahorro1Item.reference.id)
                                                                            .toList()
                                                                            ?.firstOrNull
                                                                            ?.total ==
                                                                        null)
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            14.0,
                                                                            0.0),
                                                                        child:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .circleNotch,
                                                                          color:
                                                                              Color(0xFF002CE9),
                                                                          size:
                                                                              24.0,
                                                                        ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation']!),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if ((_model.monto! >= 500000.0) &&
                                  (_model.monto !=
                                      9577777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777.0))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 62.0, 0.0, 0.0),
                                  child: StreamBuilder<List<ServicesRecord>>(
                                    stream: queryServicesRecord(
                                      queryBuilder: (servicesRecord) =>
                                          servicesRecord.where(
                                        'ServiceMainType',
                                        isEqualTo: 'CDAT',
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
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<ServicesRecord>
                                          containerServicesRecordList =
                                          snapshot.data!;

                                      return Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Tiempo de tu CDAT',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Satoshi',
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
                                                                  20.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final cdat =
                                                              containerServicesRecordList
                                                                  .map((e) => e)
                                                                  .toList();

                                                          return Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children:
                                                                List.generate(
                                                                    cdat.length,
                                                                    (cdatIndex) {
                                                              final cdatItem =
                                                                  cdat[
                                                                      cdatIndex];
                                                              return Expanded(
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                    cdatIndex > 0
                                                                        ? 8.0
                                                                        : 0.0,
                                                                    0.0,
                                                                    cdatIndex <
                                                                            cdat.length -
                                                                                1
                                                                        ? 8.0
                                                                        : 0.0,
                                                                    0.0,
                                                                  ),
                                                                  child: Opacity(
                                                                opacity:
                                                                    valueOrDefault<
                                                                        double>(
                                                                  _model.idcdat ==
                                                                          cdatItem
                                                                              .reference
                                                                              .id
                                                                      ? 1.0
                                                                      : 0.5,
                                                                  1.0,
                                                                ),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
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
                                                                    _model.ea =
                                                                        cdatItem
                                                                            .ea;
                                                                    _model.idcdat =
                                                                        cdatItem
                                                                            .reference
                                                                            .id;
                                                                    _model
                                                                        .tiempo = cdatItem.typesOfProductName ==
                                                                            '6 meses'
                                                                        ? '6'
                                                                        : '12';
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        66.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          _model.idcdat != null && _model.idcdat != ''
                                                                              ? FlutterFlowTheme.of(context).customColor4
                                                                              : FlutterFlowTheme.of(context).customColor5,
                                                                          FlutterFlowTheme.of(context)
                                                                              .customColor5,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              10.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              if (_model.idcdat != cdatItem.reference.id)
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    _model.ea = cdatItem.ea;
                                                                                    _model.tiempo = cdatItem.typesOfProductName == '6 meses' ? '6' : '12';
                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  child: Container(
                                                                                    width: 16.0,
                                                                                    height: 16.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      borderRadius: BorderRadius.circular(24.0),
                                                                                      border: Border.all(
                                                                                        color: Color(0xB2262632),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (_model.idcdat == cdatItem.reference.id)
                                                                                Container(
                                                                                  width: 16.0,
                                                                                  height: 16.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    borderRadius: BorderRadius.circular(24.0),
                                                                                    border: Border.all(
                                                                                      color: Color(0xB0FF6700),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.all(2.0),
                                                                                    child: Container(
                                                                                      width: 100.0,
                                                                                      height: 100.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).customColor4,
                                                                                        borderRadius: BorderRadius.circular(24.0),
                                                                                        shape: BoxShape.rectangle,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Text(
                                                                                  '${valueOrDefault<String>(
                                                                                    cdatItem.ea.toString(),
                                                                                    '-',
                                                                                  )} %',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Satoshi',
                                                                                        color: Color(0xFF002CE9),
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  valueOrDefault<String>(
                                                                                    cdatItem.typesOfProductName,
                                                                                    '- -',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Satoshi',
                                                                                        letterSpacing: 0.0,
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
                                                              ),
                                                                ),
                                                              );
                                                            }),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      40.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Monto a invertir',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Satoshi',
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                              ),
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Stack(
                                                                    children: [
                                                                      TextFormField(
                                                                        controller:
                                                                            _model.amountTextController,
                                                                        focusNode:
                                                                            _model.amountFocusNode,
                                                                        onChanged:
                                                                            (_) =>
                                                                                EasyDebounce.debounce(
                                                                          '_model.amountTextController',
                                                                          Duration(
                                                                              milliseconds: 100),
                                                                          () =>
                                                                              safeSetState(() {}),
                                                                        ),
                                                                        autofocus:
                                                                            false,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          isDense:
                                                                              true,
                                                                          labelStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Satoshi',
                                                                                color: FlutterFlowTheme.of(context).customColor5,
                                                                                fontSize: valueOrDefault<double>(
                                                                                  MediaQuery.sizeOf(context).height * 0.01896,
                                                                                  16.0,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          hintText:
                                                                              '0.0',
                                                                          hintStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Satoshi',
                                                                                color: FlutterFlowTheme.of(context).customColor5,
                                                                                fontSize: valueOrDefault<double>(
                                                                                  MediaQuery.sizeOf(context).height * 0.01896,
                                                                                  16.0,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          errorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          filled:
                                                                              true,
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).customColor5,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Satoshi',
                                                                              color: FlutterFlowTheme.of(context).customColor5,
                                                                              fontSize: valueOrDefault<double>(
                                                                                MediaQuery.sizeOf(context).height * 0.01896,
                                                                                16.0,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        keyboardType: const TextInputType
                                                                            .numberWithOptions(
                                                                            decimal:
                                                                                true),
                                                                        cursorColor:
                                                                            FlutterFlowTheme.of(context).customColor5,
                                                                        validator: _model
                                                                            .amountTextControllerValidator
                                                                            .asValidator(context),
                                                                        inputFormatters: [
                                                                          FilteringTextInputFormatter.allow(
                                                                              RegExp('^\\d*\\.?\\d{0,2}\$'))
                                                                        ],
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              12.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              functions.formatAmount(valueOrDefault<double>(
                                                                                double.tryParse(_model.amountTextController.text),
                                                                                0.0,
                                                                              )),
                                                                              '\$ 0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Satoshi',
                                                                                  fontSize: 18.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: RichText(
                                                                  textScaler: MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                                  text:
                                                                      TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text:
                                                                            'Disponible ',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Satoshi',
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                      TextSpan(
                                                                        text: valueOrDefault<
                                                                            String>(
                                                                          functions
                                                                              .formatAmount(valueOrDefault<double>(
                                                                            _model.monto,
                                                                            0.0,
                                                                          )),
                                                                          '\$ 0',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Satoshi',
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      )
                                                                    ],
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Satoshi',
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        if (_model.amountTextController
                                                                    .text !=
                                                                null &&
                                                            _model.amountTextController
                                                                    .text !=
                                                                '')
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        97.0,
                                                                        0.0,
                                                                        40.0),
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                await queryServicesRecordOnce(
                                                                  queryBuilder:
                                                                      (servicesRecord) =>
                                                                          servicesRecord
                                                                              .where(
                                                                    'ServiceMainType',
                                                                    isEqualTo:
                                                                        'CDAT',
                                                                  ),
                                                                  singleRecord:
                                                                      true,
                                                                ).then((s) => s
                                                                    .firstOrNull);
                                                                if (_model
                                                                        .monto! >=
                                                                    functions.stringtoDouble(_model
                                                                        .amountTextController
                                                                        .text)!) {
                                                                  if (functions.stringtoDouble(_model
                                                                          .amountTextController
                                                                          .text)! >=
                                                                      500000.0) {
                                                                    _model.retiro =
                                                                        [];
                                                                    safeSetState(
                                                                        () {});
                                                                    if (_model
                                                                            .tiempo ==
                                                                        '6') {
                                                                      _model.addToRetiro(
                                                                          RetiroscdatStruct(
                                                                        monto: valueOrDefault<
                                                                            double>(
                                                                          (valueOrDefault<double>(
                                                                                    ((double.parse(_model.amountTextController.text) / 100) * (((_model.ea!) / 12) * 6)),
                                                                                    0.0,
                                                                                  ) -
                                                                                  valueOrDefault<double>(
                                                                                    ((double.parse(_model.amountTextController.text) / 100) * (((_model.ea!) / 12) * 6)) * 0.04,
                                                                                    0.0,
                                                                                  )) /
                                                                              2,
                                                                          0.0,
                                                                        ),
                                                                        fecharetiro: functions.sumarmesess(
                                                                            getCurrentTimestamp,
                                                                            3),
                                                                      ));
                                                                      safeSetState(
                                                                          () {});
                                                                      _model.addToRetiro(
                                                                          RetiroscdatStruct(
                                                                        monto: valueOrDefault<
                                                                            double>(
                                                                          ((valueOrDefault<double>(
                                                                                        ((double.parse(_model.amountTextController.text) / 100) * (((_model.ea!) / 12) * 6)),
                                                                                        0.0,
                                                                                      ) -
                                                                                      valueOrDefault<double>(
                                                                                        ((double.parse(_model.amountTextController.text) / 100) * (((_model.ea!) / 12) * 6)) * 0.04,
                                                                                        0.0,
                                                                                      )) /
                                                                                  2) +
                                                                              double.parse(_model.amountTextController.text),
                                                                          0.0,
                                                                        ),
                                                                        fecharetiro: functions.sumarmesess(
                                                                            getCurrentTimestamp,
                                                                            6),
                                                                      ));
                                                                      safeSetState(
                                                                          () {});
                                                                    } else if (_model
                                                                            .tiempo ==
                                                                        '12') {
                                                                      _model.addToRetiro(
                                                                          RetiroscdatStruct(
                                                                        monto: valueOrDefault<
                                                                            double>(
                                                                          (valueOrDefault<double>(
                                                                                    ((double.parse(_model.amountTextController.text) / 100) * (_model.ea!)),
                                                                                    0.0,
                                                                                  ) -
                                                                                  valueOrDefault<double>(
                                                                                    ((double.parse(_model.amountTextController.text) / 100) * (((_model.ea!) / 12) * 12)) * 0.04,
                                                                                    0.0,
                                                                                  )) /
                                                                              4,
                                                                          0.0,
                                                                        ),
                                                                        fecharetiro: functions.sumarmesess(
                                                                            getCurrentTimestamp,
                                                                            3),
                                                                      ));
                                                                      safeSetState(
                                                                          () {});
                                                                      _model.addToRetiro(
                                                                          RetiroscdatStruct(
                                                                        monto: valueOrDefault<
                                                                            double>(
                                                                          (valueOrDefault<double>(
                                                                                    ((double.parse(_model.amountTextController.text) / 100) * (_model.ea!)),
                                                                                    0.0,
                                                                                  ) -
                                                                                  valueOrDefault<double>(
                                                                                    ((double.parse(_model.amountTextController.text) / 100) * (((_model.ea!) / 12) * 12)) * 0.04,
                                                                                    0.0,
                                                                                  )) /
                                                                              4,
                                                                          0.0,
                                                                        ),
                                                                        fecharetiro: functions.sumarmesess(
                                                                            getCurrentTimestamp,
                                                                            6),
                                                                      ));
                                                                      safeSetState(
                                                                          () {});
                                                                      _model.addToRetiro(
                                                                          RetiroscdatStruct(
                                                                        monto: valueOrDefault<
                                                                            double>(
                                                                          (valueOrDefault<double>(
                                                                                    ((double.parse(_model.amountTextController.text) / 100) * (_model.ea!)),
                                                                                    0.0,
                                                                                  ) -
                                                                                  valueOrDefault<double>(
                                                                                    ((double.parse(_model.amountTextController.text) / 100) * (((_model.ea!) / 12) * 12)) * 0.04,
                                                                                    0.0,
                                                                                  )) /
                                                                              4,
                                                                          0.0,
                                                                        ),
                                                                        fecharetiro: functions.sumarmesess(
                                                                            getCurrentTimestamp,
                                                                            9),
                                                                      ));
                                                                      safeSetState(
                                                                          () {});
                                                                      _model.addToRetiro(
                                                                          RetiroscdatStruct(
                                                                        monto: valueOrDefault<
                                                                            double>(
                                                                          ((valueOrDefault<double>(
                                                                                        ((double.parse(_model.amountTextController.text) / 100) * (_model.ea!)),
                                                                                        0.0,
                                                                                      ) -
                                                                                      valueOrDefault<double>(
                                                                                        ((double.parse(_model.amountTextController.text) / 100) * (((_model.ea!) / 12) * 12)) * 0.04,
                                                                                        0.0,
                                                                                      )) /
                                                                                  4) +
                                                                              double.parse(_model.amountTextController.text),
                                                                          0.0,
                                                                        ),
                                                                        fecharetiro: functions.sumarmesess(
                                                                            getCurrentTimestamp,
                                                                            12),
                                                                      ));
                                                                      safeSetState(
                                                                          () {});
                                                                    }

                                                                    context
                                                                        .pushNamed(
                                                                      AHORROScdat2CopyCopyCopyWidget
                                                                          .routeName,
                                                                      queryParameters:
                                                                          {
                                                                        'cdatahorro':
                                                                            serializeParam(
                                                                          _model
                                                                              .retiro,
                                                                          ParamType
                                                                              .DataStruct,
                                                                          isList:
                                                                              true,
                                                                        ),
                                                                        'inversion':
                                                                            serializeParam(
                                                                          double.tryParse(_model
                                                                              .amountTextController
                                                                              .text),
                                                                          ParamType
                                                                              .double,
                                                                        ),
                                                                        'tiempo':
                                                                            serializeParam(
                                                                          _model
                                                                              .tiempo,
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'ea':
                                                                            serializeParam(
                                                                          _model
                                                                              .ea,
                                                                          ParamType
                                                                              .double,
                                                                        ),
                                                                        'ahorro':
                                                                            serializeParam(
                                                                          rETIRO2Copy2AhorrosRecordList
                                                                              .where((e) => e.reference.id == _model.idcuenta)
                                                                              .toList()
                                                                              .firstOrNull
                                                                              ?.reference,
                                                                          ParamType
                                                                              .DocumentReference,
                                                                        ),
                                                                        'lista':
                                                                            serializeParam(
                                                                          _model
                                                                              .list,
                                                                          ParamType
                                                                              .int,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  } else {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'La inversión debe ser mayor a \$500.000.',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).secondary,
                                                                      ),
                                                                    );
                                                                  }
                                                                } else {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Saldo seleccionado insuficiente',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                        ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                    ),
                                                                  );
                                                                }
                                                              },
                                                              text: 'Simular',
                                                              options:
                                                                  FFButtonOptions(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: 48.0,
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                iconPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .customColor4,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Satoshi',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                elevation: 0.0,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
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
                                      );
                                    },
                                  ),
                                ),
                              if ((_model.monto! < 500000.0) &&
                                  (_model.monto !=
                                      9577777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777.0))
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 62.0, 0.0, 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'El monto mínimo de inversión es\n de \$500.000. Deposita en tu \ncuenta para continuar.',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 44.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model.ahorro =
                                                    await queryAhorrosRecordOnce(
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
                                                );
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
                                                          doc: _model.ahorro
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

                                                safeSetState(() {});
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
                                                        fit: BoxFit.cover,
                                                        image: Image.asset(
                                                          'assets/images/Frame_2609937.png',
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
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  desktop: false,
                ))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
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
      },
    );
  }
}
