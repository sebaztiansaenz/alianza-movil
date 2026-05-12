import '/app/ahorros_pages/banks/banks_widget.dart';
import '/app/ahorros_pages/nuevodepositoahorro/nuevodepositoahorro_widget.dart';
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
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'depositoahorro2_model.dart';
export 'depositoahorro2_model.dart';

class Depositoahorro2Widget extends StatefulWidget {
  const Depositoahorro2Widget({
    super.key,
    required this.ahorro,
    required this.list,
  });

  final AhorrosRecord? ahorro;
  final int? list;

  static String routeName = 'depositoahorro2';
  static String routePath = '/depositoahorro2';

  @override
  State<Depositoahorro2Widget> createState() => _Depositoahorro2WidgetState();
}

class _Depositoahorro2WidgetState extends State<Depositoahorro2Widget>
    with TickerProviderStateMixin {
  late Depositoahorro2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Depositoahorro2Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().lastAction = getCurrentTimestamp;
      _model.psetimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 60000),
        callback: (timer) async {
          FFAppState().bankName = '';
          safeSetState(() {});
          FFAppState().isSavingAccountHave = valueOrDefault<bool>(
              currentUserDocument?.isHaveSavingAccount, false);
          FFAppState().lastAction = getCurrentTimestamp;
          safeSetState(() {});
          _model.ahorros = await queryAhorrosRecordOnce(
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
                _model.ahorros!.map((e) => e.reference.id).toList().toList(),
              );
              _model.total = _model.transactionsTotal!
                  .toList()
                  .cast<TotalDepositoAhorroStruct>();
              safeSetState(() {});
            }),
            Future(() async {
              _model.withdrawalTotal = await actions.withdrawalTotalAhorros(
                _model.ahorros!.map((e) => e.reference.id).toList().toList(),
              );
              _model.withdrawals = _model.withdrawalTotal!
                  .toList()
                  .cast<TotalRetiroAhorroStruct>();
              safeSetState(() {});
            }),
          ]);
        },
        startImmediately: true,
      );
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
    // On page dispose action.
    () async {
      FFAppState().lastAction = getCurrentTimestamp;
    }();

    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<AhorrosRecord>(
      stream: AhorrosRecord.getDocument(widget!.ahorro!.reference),
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

        final depositoahorro2AhorrosRecord = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 54.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 18.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FlutterFlowIconButton(
                                    borderRadius: 8.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      context.safePop();
                                    },
                                  ),
                                  Text(
                                    'PSE',
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
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 20.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 295.0,
                                          height: 98.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x1B262632),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color: Color(0xFFFF6700),
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Stack(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
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
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                8.0,
                                                                                0.0),
                                                                            child:
                                                                                Image.asset(
                                                                              'assets/images/Group_3.png',
                                                                              width: 14.0,
                                                                              height: 20.0,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              depositoahorro2AhorrosRecord.savingsType,
                                                                              '202',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Satoshi',
                                                                                  color: Color(0xFF002CE9),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      AuthUserStreamWidget(
                                                                        builder:
                                                                            (context) =>
                                                                                Text(
                                                                          '#${valueOrDefault(currentUserDocument?.nit, '')}-0${widget!.list?.toString()}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Satoshi',
                                                                                color: Color(0xB3262632),
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1.0,
                                                                      -1.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/Frame_2085662540_(5).png',
                                                                width: 54.0,
                                                                height: 22.0,
                                                                fit:
                                                                    BoxFit.fill,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    if (_model.transactionsTotal
                                                            ?.where((e) =>
                                                                e.ahorroid ==
                                                                depositoahorro2AhorrosRecord
                                                                    .reference
                                                                    .id)
                                                            .toList()
                                                            ?.firstOrNull
                                                            ?.total !=
                                                        null)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    14.0,
                                                                    0.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            functions.formatAmount(
                                                                valueOrDefault<
                                                                    double>(
                                                              valueOrDefault<
                                                                      double>(
                                                                    valueOrDefault<
                                                                            double>(
                                                                          _model
                                                                              .total
                                                                              .where((e) =>
                                                                                  e.ahorroid ==
                                                                                  valueOrDefault<String>(
                                                                                    depositoahorro2AhorrosRecord.reference.id,
                                                                                    '0',
                                                                                  ))
                                                                              .toList()
                                                                              .firstOrNull
                                                                              ?.total,
                                                                          0.0,
                                                                        ) -
                                                                        valueOrDefault<
                                                                            double>(
                                                                          _model
                                                                              .withdrawals
                                                                              .where((e) =>
                                                                                  e.ahorroid ==
                                                                                  valueOrDefault<String>(
                                                                                    depositoahorro2AhorrosRecord.reference.id,
                                                                                    '0',
                                                                                  ))
                                                                              .toList()
                                                                              .firstOrNull
                                                                              ?.total,
                                                                          0.0,
                                                                        ),
                                                                    0.0,
                                                                  ) +
                                                                  valueOrDefault<
                                                                      double>(
                                                                    functions.sumaTotal(depositoahorro2AhorrosRecord
                                                                        .transactions
                                                                        .map((e) =>
                                                                            valueOrDefault<double>(
                                                                              e.taxedBenefit,
                                                                              0.0,
                                                                            ))
                                                                        .toList()),
                                                                    0.0,
                                                                  ),
                                                              0.0,
                                                            )),
                                                            '\$0',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Satoshi',
                                                                color: Color(
                                                                    0xFF002CE9),
                                                                fontSize: 24.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900,
                                                              ),
                                                        ),
                                                      ),
                                                    if (_model.transactionsTotal
                                                            ?.where((e) =>
                                                                e.ahorroid ==
                                                                depositoahorro2AhorrosRecord
                                                                    .reference
                                                                    .id)
                                                            .toList()
                                                            ?.firstOrNull
                                                            ?.total ==
                                                        null)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    14.0,
                                                                    0.0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons
                                                              .circleNotch,
                                                          color:
                                                              Color(0xFF002CE9),
                                                          size: 24.0,
                                                        ).animateOnPageLoad(
                                                            animationsMap[
                                                                'iconOnPageLoadAnimation']!),
                                                      ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 14.0)),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0,
                                  valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.03792,
                                    32.0,
                                  ),
                                  0.0,
                                  0.0),
                              child: Text(
                                'El costo de transacción es \$ 0.000',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Satoshi',
                                      color: Color(0xB2262632),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 36.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: SingleChildScrollView(
                                    primary: false,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0,
                                                  0.0,
                                                  24.0,
                                                  valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.02370,
                                                    20.0,
                                                  )),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 8.0),
                                                  child: AutoSizeText(
                                                    'Bancos',
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
                                                              FontWeight.w600,
                                                        ),
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
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    enableDrag: false,
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
                                                          child: Container(
                                                            height: 780.0,
                                                            child:
                                                                BanksWidget(),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height:
                                                      valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.05688,
                                                    48.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor5,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Flexible(
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              FFAppState()
                                                                  .bankName,
                                                              'Selecciona el banco',
                                                            ),
                                                            textAlign:
                                                                TextAlign.start,
                                                            maxLines: 2,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Satoshi',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
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
                                                                ),
                                                          ),
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .keyboard_arrow_down,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, -1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 0.0, 8.0),
                                            child: AutoSizeText(
                                              'Valor a depositar',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Satoshi',
                                                    color: Color(0xFF262632),
                                                    fontSize:
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.01659,
                                                      14.0,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              child: TextFormField(
                                                controller:
                                                    _model.amountTextController,
                                                focusNode:
                                                    _model.amountFocusNode,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.amountTextController',
                                                  Duration(milliseconds: 100),
                                                  () => safeSetState(() {}),
                                                ),
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Satoshi',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customColor5,
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
                                                            FontWeight.w300,
                                                      ),
                                                  hintText: '0.0',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Satoshi',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customColor5,
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
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .customColor5,
                                                  hoverColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .customColor5,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customColor5,
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
                                                        ),
                                                keyboardType:
                                                    const TextInputType
                                                        .numberWithOptions(
                                                        decimal: true),
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor5,
                                                validator: _model
                                                    .amountTextControllerValidator
                                                    .asValidator(context),
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .allow(RegExp(
                                                          '^\\d*\\.?\\d{0,2}\$'))
                                                ],
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 6.0, 0.0, 0.0),
                                                child: AutoSizeText(
                                                  valueOrDefault<String>(
                                                    functions.formatAmount(
                                                        valueOrDefault<double>(
                                                      double.tryParse(_model
                                                          .amountTextController
                                                          .text),
                                                      0.0,
                                                    )),
                                                    '\$0',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Satoshi',
                                                        fontSize: 24.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        if (_model.invalidAmount)
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 8.0, 0.0, 8.0),
                                              child: AutoSizeText(
                                                'Valor de depósito no se encuentra en rango especificado',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          fontSize:
                                                              valueOrDefault<
                                                                  double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.01422,
                                                            12.0,
                                                          ),
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, -1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 8.0, 0.0, 0.0),
                                            child: AutoSizeText(
                                              'Deposita desde \$30.000 hasta \$10.000.000',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Satoshi',
                                                    fontSize:
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.01422,
                                                      12.0,
                                                    ),
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0,
                                                    valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.02370,
                                                      20.0,
                                                    ),
                                                    20.0,
                                                    valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.04740,
                                                      40.0,
                                                    )),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                if ((functions.stringtoDouble(_model
                                                            .amountTextController
                                                            .text)! >=
                                                        30000.0) &&
                                                    (functions.stringtoDouble(_model
                                                            .amountTextController
                                                            .text)! <=
                                                        10000000.0)) {
                                                  _model.transactions =
                                                      await queryTransactionsRecordOnce(
                                                    queryBuilder:
                                                        (transactionsRecord) =>
                                                            transactionsRecord
                                                                .where(
                                                                  'status',
                                                                  isEqualTo:
                                                                      'PENDING',
                                                                )
                                                                .where(
                                                                  'buyerId',
                                                                  isEqualTo:
                                                                      currentUserUid,
                                                                ),
                                                  );
                                                  FFAppState().userAccounts =
                                                      [];
                                                  safeSetState(() {});
                                                  if (_model.transactions!
                                                          .length >
                                                      0) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Sesión de pago pendiente'),
                                                          content: Text(
                                                              'Tienes una sesión de pago pendiente, vuelve a intentarlo más tarde si no tienes acceso a esa sesión.'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child:
                                                                  Text('Bueno'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  } else {
                                                    FFAppState()
                                                        .addToUserAccounts(
                                                            AhorrosAccountsStruct(
                                                      ahorrosID: FFAppState()
                                                          .statementTypeRef
                                                          ?.id,
                                                      amount: double.tryParse(
                                                          _model
                                                              .amountTextController
                                                              .text),
                                                    ));
                                                    FFAppState()
                                                            .paymentReference =
                                                        '${FFAppState().statementTypeRef?.id}-${random_data.randomString(
                                                      8,
                                                      11,
                                                      true,
                                                      true,
                                                      true,
                                                    )}';
                                                    safeSetState(() {});
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      context: context,
                                                      builder: (context) {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    context)
                                                                .unfocus();
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                NuevodepositoahorroWidget(
                                                              amount: double
                                                                  .parse(_model
                                                                      .amountTextController
                                                                      .text),
                                                              ahorro: widget!
                                                                  .ahorro!,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  }
                                                } else {
                                                  _model.invalidAmount = true;
                                                  safeSetState(() {});
                                                }

                                                safeSetState(() {});
                                              },
                                              text: 'Continuar',
                                              options: FFButtonOptions(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: valueOrDefault<double>(
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.05688,
                                                  48.0,
                                                ),
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor4,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
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
                                                                0.01896,
                                                            16.0,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
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
