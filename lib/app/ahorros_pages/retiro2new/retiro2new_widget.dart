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
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'retiro2new_model.dart';
export 'retiro2new_model.dart';

class Retiro2newWidget extends StatefulWidget {
  const Retiro2newWidget({super.key});

  static String routeName = 'retiro2new';
  static String routePath = '/retiro2new';

  @override
  State<Retiro2newWidget> createState() => _Retiro2newWidgetState();
}

class _Retiro2newWidgetState extends State<Retiro2newWidget>
    with TickerProviderStateMixin {
  late Retiro2newModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Retiro2newModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
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
        List<AhorrosRecord> retiro2newAhorrosRecordList = snapshot.data!;

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
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 54.0, 0.0, 0.0),
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
                        'Transferir',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Satoshi',
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 34.0, 0.0, 0.0),
                    child: Text(
                      'Selecciona la cuenta a Transferir',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Satoshi',
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                  child: Builder(
                    builder: (context) {
                      final ahorros = retiro2newAhorrosRecordList
                          .where((e) =>
                              e.ahorrosDocPdf1 != null &&
                              e.ahorrosDocPdf1 != '')
                          .toList();

                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children:
                              List.generate(ahorros.length, (ahorrosIndex) {
                            final ahorrosItem = ahorros[ahorrosIndex];
                            return Opacity(
                              opacity: valueOrDefault<double>(
                                _model.seleccionado == ahorrosItem.reference
                                    ? 1.0
                                    : 0.5,
                                0.5,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.seleccionado = ahorrosItem.reference;
                                    _model.index = ahorrosIndex + 01;
                                    safeSetState(() {});
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.11848,
                                      100.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x1A262632),
                                          offset: Offset(
                                            0.0,
                                            2.0,
                                          ),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: valueOrDefault<Color>(
                                          _model.seleccionado != null
                                              ? FlutterFlowTheme.of(context)
                                                  .customColor4
                                              : FlutterFlowTheme.of(context)
                                                  .customColor5,
                                          FlutterFlowTheme.of(context)
                                              .customColor5,
                                        ),
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 14.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          if (ahorrosItem
                                                                  .reference !=
                                                              _model
                                                                  .seleccionado)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          14.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                              child: InkWell(
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
                                                                  _model.seleccionado =
                                                                      ahorrosItem
                                                                          .reference;
                                                                  _model.index =
                                                                      ahorrosIndex +
                                                                          01;
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 16.0,
                                                                  height: 16.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            24.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Color(
                                                                          0xB2262632),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          if (ahorrosItem
                                                                  .reference ==
                                                              _model
                                                                  .seleccionado)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          14.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                              child: InkWell(
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
                                                                  _model.seleccionado =
                                                                      ahorrosItem
                                                                          .reference;
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 16.0,
                                                                  height: 16.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            24.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Color(
                                                                          0xB0FF6700),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            2.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          100.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .customColor4,
                                                                        borderRadius:
                                                                            BorderRadius.circular(24.0),
                                                                        shape: BoxShape
                                                                            .rectangle,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Image.asset(
                                                                'assets/images/Group_3.png',
                                                                width: 14.0,
                                                                height: 20.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  ahorrosItem
                                                                      .savingsType,
                                                                  '- - -',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Satoshi',
                                                                      color: Color(
                                                                          0xFF002CE9),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 8.0)),
                                                          ),
                                                          AuthUserStreamWidget(
                                                            builder:
                                                                (context) =>
                                                                    Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                '# ${valueOrDefault(currentUserDocument?.nit, '')}-0${(ahorrosIndex + 1).toString()}',
                                                                '0',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Satoshi',
                                                                    color: Color(
                                                                        0xB2262632),
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    if (_model.transactionsTotal
                                                            ?.where((e) =>
                                                                e.ahorroid ==
                                                                ahorrosItem
                                                                    .reference
                                                                    .id)
                                                            .toList()
                                                            ?.firstOrNull
                                                            ?.total !=
                                                        null)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, 0.0),
                                                        child: Padding(
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
                                                                            _model.totalesAhorro
                                                                                .where((e) =>
                                                                                    e.ahorroid ==
                                                                                    valueOrDefault<String>(
                                                                                      ahorrosItem.reference.id,
                                                                                      '0',
                                                                                    ))
                                                                                .toList()
                                                                                .firstOrNull
                                                                                ?.total,
                                                                            0.0,
                                                                          ) -
                                                                          valueOrDefault<
                                                                              double>(
                                                                            _model.retirosAhorro.where((e) => e.ahorroid == ahorrosItem.reference.id).toList().firstOrNull?.total,
                                                                            0.0,
                                                                          ),
                                                                      0.0,
                                                                    ) +
                                                                    valueOrDefault<
                                                                        double>(
                                                                      functions.sumaTotal(ahorrosItem
                                                                          .transactions
                                                                          .map((e) =>
                                                                              e.taxedBenefit)
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
                                                                  fontSize:
                                                                      24.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w900,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    if (_model.transactionsTotal
                                                            ?.where((e) =>
                                                                e.ahorroid ==
                                                                ahorrosItem
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
                                          ],
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, -1.0),
                                          child: Image.asset(
                                            'assets/images/Frame_2085662540_(5).png',
                                            width: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context).width *
                                                  0.14872,
                                              58.0,
                                            ),
                                            height: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.02844,
                                              24.0,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).divide(SizedBox(height: 14.0)),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 52.0),
                  child: Text(
                    'El costo de transacción es \$ 0.000',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Satoshi',
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                if (_model.seleccionado != null)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 40.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if (_model.seleccionado != null) {
                          context.pushNamed(
                            Retiro2Widget.routeName,
                            queryParameters: {
                              'productRef': serializeParam(
                                _model.seleccionado,
                                ParamType.DocumentReference,
                              ),
                              'numero': serializeParam(
                                _model.index,
                                ParamType.int,
                              ),
                            }.withoutNulls,
                          );
                        } else {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Error!'),
                                content: Text('Seleccione un tipo de ahorro'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      text: 'Continuar',
                      options: FFButtonOptions(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 48.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).customColor4,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Satoshi',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
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
