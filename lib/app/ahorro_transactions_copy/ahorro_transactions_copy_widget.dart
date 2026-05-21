import '/app/otros/animacionmenu/animacionmenu_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ahorro_transactions_copy_model.dart';
export 'ahorro_transactions_copy_model.dart';

class AhorroTransactionsCopyWidget extends StatefulWidget {
  const AhorroTransactionsCopyWidget({
    super.key,
    required this.ahorroDoc,
  });

  final AhorrosRecord? ahorroDoc;

  static String routeName = 'AhorroTransactionsCopy';
  static String routePath = '/ahorroTransactionsCopy';

  @override
  State<AhorroTransactionsCopyWidget> createState() =>
      _AhorroTransactionsCopyWidgetState();
}

class _AhorroTransactionsCopyWidgetState
    extends State<AhorroTransactionsCopyWidget> {
  late AhorroTransactionsCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AhorroTransactionsCopyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  DateTime? _oldestTransactionDate(List<TransactionsRecord> transactions) {
    for (var i = transactions.length - 1; i >= 0; i--) {
      final date = transactions[i].firebaseDate;
      if (date != null) {
        return date;
      }
    }
    return null;
  }

  bool _isTransactionInMonth(
    TransactionsRecord record,
    DateTime month,
  ) {
    final date = record.firebaseDate;
    if (date == null) {
      return false;
    }
    return functions.isSameMonthCopy(date, month);
  }

  @override
  Widget build(BuildContext context) {
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
        List<TransactionsRecord> ahorroTransactionsCopyTransactionsRecordList =
            snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: AutoSizeText(
                'Mis movimientos',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Satoshi',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.02133,
                        18.0,
                      ),
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 24.0, 24.0, 0.0),
                            child: StreamBuilder<List<TransactionsRecord>>(
                              stream: queryTransactionsRecord(
                                queryBuilder: (transactionsRecord) =>
                                    transactionsRecord.where(
                                  'ahorrosId',
                                  isEqualTo: widget!.ahorroDoc?.reference.id,
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
                                List<TransactionsRecord>
                                    listViewTransactionsRecordList =
                                    snapshot.data!;

                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      listViewTransactionsRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewTransactionsRecord =
                                        listViewTransactionsRecordList[
                                            listViewIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 12.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    AutoSizeText(
                                                      listViewTransactionsRecord
                                                                  .transactionType ==
                                                              'Depositado'
                                                          ? 'PSE'
                                                          : valueOrDefault<String>(
                                                              listViewTransactionsRecord
                                                                  .withdrawalInfo
                                                                  .bankName,
                                                              'Débito',
                                                            ),
                                                      textAlign:
                                                          TextAlign.start,
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
                                                    AutoSizeText(
                                                      listViewTransactionsRecord
                                                                  .firebaseDate !=
                                                              null
                                                          ? '${dateTimeFormat(
                                                              "d",
                                                              listViewTransactionsRecord
                                                                  .firebaseDate,
                                                              locale: FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                            )} ${functions.monthInSpanish(listViewTransactionsRecord.firebaseDate!)}'
                                                          : '-',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Satoshi',
                                                            color: Color(
                                                                0xB2262632),
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 4.0)),
                                                ),
                                              ),
                                              Flexible(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    AutoSizeText(
                                                      listViewTransactionsRecord
                                                                  .transactionType ==
                                                              'Depositado'
                                                          ? formatNumber(
                                                              listViewTransactionsRecord
                                                                  .amount,
                                                              formatType:
                                                                  FormatType
                                                                      .custom,
                                                              format: '0.00',
                                                              locale: '',
                                                            )
                                                          : '-${formatNumber(
                                                              listViewTransactionsRecord
                                                                  .amount,
                                                              formatType:
                                                                  FormatType
                                                                      .custom,
                                                              format: '0.00',
                                                              locale: '',
                                                            )}',
                                                      textAlign: TextAlign.end,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Satoshi',
                                                            color: listViewTransactionsRecord
                                                                        .transactionType ==
                                                                    'Depositado'
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                    AutoSizeText(
                                                      () {
                                                        if (listViewTransactionsRecord
                                                                .status ==
                                                            'APPROVED') {
                                                          return 'Completado';
                                                        } else if (listViewTransactionsRecord
                                                                .status ==
                                                            'PENDING') {
                                                          return 'Pendiente';
                                                        } else {
                                                          return 'Fallido';
                                                        }
                                                      }(),
                                                      textAlign: TextAlign.end,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Satoshi',
                                                            color: Color(
                                                                0xB2262632),
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 4.0)),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            thickness: 2.0,
                                            color: Color(0x4FD9D9D9),
                                          ),
                                        ].divide(SizedBox(height: 8.0)),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          Builder(
                            builder: (context) {
                              final oldestDate = _oldestTransactionDate(
                                ahorroTransactionsCopyTransactionsRecordList,
                              );
                              if (oldestDate == null) {
                                return const SizedBox.shrink();
                              }
                              final months =
                                  functions.monthsTillDate(oldestDate).toList();

                              return ListView.builder(
                                padding: EdgeInsets.zero,
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 0.0, 0.0),
                                          child: AutoSizeText(
                                            functions.isCurrentMonth(monthsItem)
                                                ? 'Este mes'
                                                : '${functions.monthInSpanish(monthsItem)} ${dateTimeFormat(
                                                    "y",
                                                    monthsItem,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  )}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 24.0, 24.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final ahorroTransactionsVar =
                                                ahorroTransactionsCopyTransactionsRecordList
                                                    .where((e) =>
                                                        _isTransactionInMonth(
                                                            e, monthsItem))
                                                    .toList();

                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  ahorroTransactionsVar.length,
                                              itemBuilder: (context,
                                                  ahorroTransactionsVarIndex) {
                                                final ahorroTransactionsVarItem =
                                                    ahorroTransactionsVar[
                                                        ahorroTransactionsVarIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 12.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
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
                                                                  ahorroTransactionsVarItem
                                                                              .transactionType ==
                                                                          'Depositado'
                                                                      ? 'PSE'
                                                                      : valueOrDefault<String>(
                                                                          ahorroTransactionsVarItem
                                                                              .withdrawalInfo
                                                                              .bankName,
                                                                          'Débito',
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
                                                                  ahorroTransactionsVarItem.firebaseDate !=
                                                                          null
                                                                      ? '${dateTimeFormat(
                                                                          "d",
                                                                          ahorroTransactionsVarItem
                                                                              .firebaseDate,
                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                        )} ${functions.monthInSpanish(ahorroTransactionsVarItem.firebaseDate!)}'
                                                                      : '-',
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
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 4.0)),
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
                                                                  ahorroTransactionsVarItem
                                                                              .transactionType ==
                                                                          'Depositado'
                                                                      ? formatNumber(
                                                                          ahorroTransactionsVarItem
                                                                              .amount,
                                                                          formatType:
                                                                              FormatType.custom,
                                                                          format:
                                                                              '0.00',
                                                                          locale:
                                                                              '',
                                                                        )
                                                                      : '-${formatNumber(
                                                                          ahorroTransactionsVarItem
                                                                              .amount,
                                                                          formatType:
                                                                              FormatType.custom,
                                                                          format:
                                                                              '0.00',
                                                                          locale:
                                                                              '',
                                                                        )}',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Satoshi',
                                                                        color: ahorroTransactionsVarItem.transactionType ==
                                                                                'Depositado'
                                                                            ? FlutterFlowTheme.of(context).tertiary
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
                                                                    if (ahorroTransactionsVarItem
                                                                            .status ==
                                                                        'APPROVED') {
                                                                      return 'Completado';
                                                                    } else if (ahorroTransactionsVarItem
                                                                            .status ==
                                                                        'PENDING') {
                                                                      return 'Pendiente';
                                                                    } else {
                                                                      return 'Fallido';
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
                                                                        color: Color(
                                                                            0xB2262632),
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 4.0)),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Divider(
                                                        thickness: 2.0,
                                                        color:
                                                            Color(0x4FD9D9D9),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 8.0)),
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
                    phone: false,
                  ))
                    wrapWithModel(
                      model: _model.animacionmenuModel,
                      updateCallback: () => safeSetState(() {}),
                      child: AnimacionmenuWidget(),
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
