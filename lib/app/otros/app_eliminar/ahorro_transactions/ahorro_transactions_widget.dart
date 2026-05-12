import '/app/otros/animacionmenu/animacionmenu_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ahorro_transactions_model.dart';
export 'ahorro_transactions_model.dart';

class AhorroTransactionsWidget extends StatefulWidget {
  const AhorroTransactionsWidget({
    super.key,
    required this.ahorroDoc,
  });

  final AhorrosRecord? ahorroDoc;

  static String routeName = 'AhorroTransactions';
  static String routePath = '/ahorroTransactions';

  @override
  State<AhorroTransactionsWidget> createState() =>
      _AhorroTransactionsWidgetState();
}

class _AhorroTransactionsWidgetState extends State<AhorroTransactionsWidget> {
  late AhorroTransactionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AhorroTransactionsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
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

            context.pushNamedAuth(
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

    return StreamBuilder<List<TransactionsRecord>>(
      stream: queryTransactionsRecord(
        queryBuilder: (transactionsRecord) => transactionsRecord
            .where(
              'ahorrosId',
              isEqualTo: widget!.ahorroDoc?.reference.id,
            )
            .orderBy('firebaseDate', descending: true),
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
        List<TransactionsRecord> ahorroTransactionsTransactionsRecordList =
            snapshot.data!;

        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                child: SingleChildScrollView(
                  child: Column(
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
                            32.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 4.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.safePop();
                                },
                                child: Container(
                                  width: 28.0,
                                  height: 28.0,
                                  decoration: BoxDecoration(),
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                            AutoSizeText(
                              'Mis movimientos',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Satoshi',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      if (ahorroTransactionsTransactionsRecordList.length > 0)
                        Builder(
                          builder: (context) {
                            final months = functions
                                .monthsTillDate(
                                    ahorroTransactionsTransactionsRecordList
                                        .elementAtOrNull(
                                            ahorroTransactionsTransactionsRecordList
                                                    .length -
                                                1)!
                                        .firebaseDate!)
                                .toList();

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: months.length,
                              itemBuilder: (context, monthsIndex) {
                                final monthsItem = months[monthsIndex];
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 0.0, 0.0),
                                        child: AutoSizeText(
                                          valueOrDefault<String>(
                                            functions.isCurrentMonth(monthsItem)
                                                ? 'Este mes'
                                                : '${functions.monthInSpanish(monthsItem)} ${dateTimeFormat(
                                                    "y",
                                                    monthsItem,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  )}',
                                            '- - - ',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ),
                                    if (ahorroTransactionsTransactionsRecordList
                                            .where((e) =>
                                                functions.isSameMonthCopy(
                                                    e.firebaseDate!,
                                                    monthsItem))
                                            .toList()
                                            .length >
                                        0)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 24.0, 24.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final ahorroTransactionsVar =
                                                ahorroTransactionsTransactionsRecordList
                                                    .where((e) => functions
                                                        .isSameMonthCopy(
                                                            e.firebaseDate!,
                                                            monthsItem))
                                                    .toList();

                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  ahorroTransactionsVar.length,
                                              itemBuilder: (context,
                                                  ahorroTransactionsVarIndex) {
                                                final ahorroTransactionsVarItem =
                                                    ahorroTransactionsVar[
                                                        ahorroTransactionsVarIndex];
                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    if (ahorroTransactionsVarItem
                                                            .transactionType ==
                                                        'Withdrawal') {
                                                      context.pushNamed(
                                                        DetallesTransaccionRetiroWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'status':
                                                              serializeParam(
                                                            ahorroTransactionsVarItem
                                                                .status,
                                                            ParamType.String,
                                                          ),
                                                          'idTransaccion':
                                                              serializeParam(
                                                            valueOrDefault<
                                                                String>(
                                                              ahorroTransactionsVarItem
                                                                  .authorization,
                                                              '- - -',
                                                            ),
                                                            ParamType.String,
                                                          ),
                                                          'apellidosynombres':
                                                              serializeParam(
                                                            ahorroTransactionsVarItem
                                                                .userName,
                                                            ParamType.String,
                                                          ),
                                                          'monto':
                                                              serializeParam(
                                                            ahorroTransactionsVarItem
                                                                .amount,
                                                            ParamType.double,
                                                          ),
                                                          'fecha':
                                                              serializeParam(
                                                            ahorroTransactionsVarItem
                                                                .firebaseDate,
                                                            ParamType.DateTime,
                                                          ),
                                                          'whitInfo':
                                                              serializeParam(
                                                            ahorroTransactionsVarItem
                                                                .withdrawalInfo,
                                                            ParamType
                                                                .DataStruct,
                                                          ),
                                                          'typetransaction':
                                                              serializeParam(
                                                            ahorroTransactionsVarItem
                                                                .transactionType,
                                                            ParamType.String,
                                                          ),
                                                          'detalles':
                                                              serializeParam(
                                                            ahorroTransactionsVarItem
                                                                .message,
                                                            ParamType.String,
                                                          ),
                                                          'fecharetiro':
                                                              serializeParam(
                                                            ahorroTransactionsVarItem
                                                                .lastUpdated,
                                                            ParamType.DateTime,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          '__transition_info__':
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .rightToLeft,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    300),
                                                          ),
                                                        },
                                                      );
                                                    } else {
                                                      context.pushNamed(
                                                        DetallesTransaccionWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'status':
                                                              serializeParam(
                                                            ahorroTransactionsVarItem
                                                                .status,
                                                            ParamType.String,
                                                          ),
                                                          'idTransaccion':
                                                              serializeParam(
                                                            valueOrDefault<
                                                                String>(
                                                              ahorroTransactionsVarItem
                                                                  .authorization,
                                                              '- - -',
                                                            ),
                                                            ParamType.String,
                                                          ),
                                                          'apellidosynombres':
                                                              serializeParam(
                                                            ahorroTransactionsVarItem
                                                                .userName,
                                                            ParamType.String,
                                                          ),
                                                          'monto':
                                                              serializeParam(
                                                            ahorroTransactionsVarItem
                                                                .amount,
                                                            ParamType.double,
                                                          ),
                                                          'banco':
                                                              serializeParam(
                                                            ahorroTransactionsVarItem
                                                                .bank,
                                                            ParamType.String,
                                                          ),
                                                          'fecha':
                                                              serializeParam(
                                                            ahorroTransactionsVarItem
                                                                .firebaseDate,
                                                            ParamType.DateTime,
                                                          ),
                                                          'whitInfo':
                                                              serializeParam(
                                                            ahorroTransactionsVarItem
                                                                .withdrawalInfo,
                                                            ParamType
                                                                .DataStruct,
                                                          ),
                                                          'typetransaction':
                                                              serializeParam(
                                                            ahorroTransactionsVarItem
                                                                .transactionType,
                                                            ParamType.String,
                                                          ),
                                                          'detalles':
                                                              serializeParam(
                                                            ahorroTransactionsVarItem
                                                                .message,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          '__transition_info__':
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .rightToLeft,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    300),
                                                          ),
                                                        },
                                                      );
                                                    }
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  12.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Flexible(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    AutoSizeText(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        () {
                                                                          if ((ahorroTransactionsVarItem.transactionType == 'Depositado') &&
                                                                              (widget!.ahorroDoc!.totalSavingsPreApproval >
                                                                                  0.0)) {
                                                                            return 'Deposito Nómina';
                                                                          } else if (ahorroTransactionsVarItem.transactionType ==
                                                                              'Depositado') {
                                                                            return 'Deposito';
                                                                          } else {
                                                                            return 'Retiro';
                                                                          }
                                                                        }(),
                                                                        'PSE Nomina',
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Satoshi',
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                    AutoSizeText(
                                                                      '${dateTimeFormat(
                                                                        "d",
                                                                        ahorroTransactionsVarItem
                                                                            .firebaseDate,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )} ${functions.monthInSpanish(ahorroTransactionsVarItem.firebaseDate!)}',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Satoshi',
                                                                            color:
                                                                                Color(0xB2262632),
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          4.0)),
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    AutoSizeText(
                                                                      ahorroTransactionsVarItem.transactionType ==
                                                                              'Depositado'
                                                                          ? functions
                                                                              .formatAmount(ahorroTransactionsVarItem.amount)
                                                                          : '-${functions.formatAmount(ahorroTransactionsVarItem.amount)}',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .end,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Satoshi',
                                                                            color: ahorroTransactionsVarItem.transactionType == 'Depositado'
                                                                                ? FlutterFlowTheme.of(context).customColor4
                                                                                : FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                    AutoSizeText(
                                                                      () {
                                                                        if (ahorroTransactionsVarItem.status ==
                                                                            'APPROVED') {
                                                                          return 'Completado';
                                                                        } else if (ahorroTransactionsVarItem.status ==
                                                                            'PENDING') {
                                                                          return 'Pendiente';
                                                                        } else {
                                                                          return 'Rechazado';
                                                                        }
                                                                      }(),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .end,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Satoshi',
                                                                            color:
                                                                                Color(0xB2262632),
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          4.0)),
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
                                                                    .spaceBetween,
                                                            children: [
                                                              AutoSizeText(
                                                                'ID: #${valueOrDefault<String>(
                                                                  ahorroTransactionsVarItem
                                                                      .authorization,
                                                                  '- - -',
                                                                )}',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
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
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  AutoSizeText(
                                                                    'Ver detalles',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Satoshi',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                  Icon(
                                                                    Icons
                                                                        .keyboard_arrow_right,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 16.0,
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        4.0)),
                                                              ),
                                                            ],
                                                          ),
                                                          Divider(
                                                            thickness: 2.0,
                                                            color: Color(
                                                                0x4FD9D9D9),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 8.0)),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                    ],
                  ),
                ),
              ),
              if (responsiveVisibility(
                context: context,
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
      },
    );
  }
}
