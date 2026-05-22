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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'retiro2new_copy_copy_model.dart';
export 'retiro2new_copy_copy_model.dart';

class Retiro2newCopyCopyWidget extends StatefulWidget {
  const Retiro2newCopyCopyWidget({super.key});

  static String routeName = 'retiro2newCopyCopy';
  static String routePath = '/retiro2newCopyCopy';

  @override
  State<Retiro2newCopyCopyWidget> createState() =>
      _Retiro2newCopyCopyWidgetState();
}

class _Retiro2newCopyCopyWidgetState extends State<Retiro2newCopyCopyWidget>
    with TickerProviderStateMixin {
  late Retiro2newCopyCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Retiro2newCopyCopyModel());

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
                    .map((e) => e.reference.id)
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
                    .map((e) => e.reference.id)
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
        singleRecord: true,
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
        List<AhorrosRecord> retiro2newCopyCopyAhorrosRecordList =
            snapshot.data!;
        final retiro2newCopyCopyAhorrosRecord =
            retiro2newCopyCopyAhorrosRecordList.isNotEmpty
                ? retiro2newCopyCopyAhorrosRecordList.first
                : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 120.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Opacity(
                          opacity: 0.5,
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            constraints: const BoxConstraints(
                              minHeight: 112.0,
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
                                color:
                                    FlutterFlowTheme.of(context).customColor5,
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
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  14.0, 14.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Image.asset(
                                                        'assets/images/Group_3.png',
                                                        width: 14.0,
                                                        height: 20.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                      Text(
                                                        'Línea de ahorro Nomina',
                                                        style:
                                                            FlutterFlowTheme.of(
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
                                                    ].divide(
                                                        SizedBox(width: 8.0)),
                                                  ),
                                                  AuthUserStreamWidget(
                                                    builder: (context) => Text(
                                                      valueOrDefault<String>(
                                                        '# ${valueOrDefault(currentUserDocument?.nit, '')}-01',
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
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        if (_model.depositosAhorrosTotal
                                                ?.where((e) =>
                                                    e.ahorroid ==
                                                    retiro2newCopyCopyAhorrosRecord
                                                        ?.reference.id)
                                                .toList()
                                                ?.firstOrNull
                                                ?.total !=
                                            null)
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 14.0, 0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  functions.formatAmount(
                                                      valueOrDefault<double>(
                                                    valueOrDefault<double>(
                                                          valueOrDefault<
                                                                  double>(
                                                                _model
                                                                    .totalesAhorro
                                                                    .where((e) =>
                                                                        e.ahorroid ==
                                                                        valueOrDefault<String>(
                                                                          retiro2newCopyCopyAhorrosRecord
                                                                              ?.reference
                                                                              .id,
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
                                                                    .retirosAhorro
                                                                    .where((e) =>
                                                                        e.ahorroid ==
                                                                        valueOrDefault<String>(
                                                                          retiro2newCopyCopyAhorrosRecord
                                                                              ?.reference
                                                                              .id,
                                                                          '0',
                                                                        ))
                                                                    .toList()
                                                                    .firstOrNull
                                                                    ?.total,
                                                                0.0,
                                                              ),
                                                          0.0,
                                                        ) +
                                                        valueOrDefault<double>(
                                                          functions.sumaTotal(
                                                              retiro2newCopyCopyAhorrosRecord!
                                                                  .transactions
                                                                  .map((e) =>
                                                                      valueOrDefault<
                                                                          double>(
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
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color:
                                                              Color(0xFF002CE9),
                                                          fontSize: 24.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        if (_model.depositosAhorrosTotal
                                                ?.where((e) =>
                                                    e.ahorroid ==
                                                    retiro2newCopyCopyAhorrosRecord
                                                        ?.reference.id)
                                                .toList()
                                                ?.firstOrNull
                                                ?.total ==
                                            null)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 14.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.circleNotch,
                                              color: Color(0xFF002CE9),
                                              size: 24.0,
                                            ).animateOnPageLoad(animationsMap[
                                                'iconOnPageLoadAnimation']!),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1.0, -1.0),
                                  child: Image.asset(
                                    'assets/images/Frame_2085662540_(5).png',
                                    width: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).width *
                                          0.14872,
                                      58.0,
                                    ),
                                    height: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
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
                      ].divide(SizedBox(height: 14.0)),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 30.0, 20.0, 32.0),
                    child: Text(
                      'Para depositar por PSE y empezar a ahorrar, debes aperturar una línea de ahorro diferente a Nomina.',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Satoshi',
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 52.0),
                    child: Text(
                      '¿Deseas continuar?',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Satoshi',
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.safePop();
                            },
                            text: 'Regresar',
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 48.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Satoshi',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).customColor5,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed(
                                Aperturaahorro1Widget.routeName,
                                extra: <String, dynamic>{
                                  '__transition_info__': TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.rightToLeft,
                                  ),
                                },
                              );
                            },
                            text: 'Sí, aperturar',
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 48.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).customColor4,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Satoshi',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(width: 12.0)),
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
