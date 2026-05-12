import '/app/ahorros_pages/transferir/transferir_widget.dart';
import '/app/depositar_retiro_bottom_sheet_ahorro/depositar_retiro_bottom_sheet_ahorro_widget.dart';
import '/app/nominamodaleditar/nominamodaleditar_widget.dart';
import '/app/otros/animacionmenu/animacionmenu_widget.dart';
import '/app/otros/retiros/retiros_widget.dart';
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
import 'ahorro_main_page_model.dart';
export 'ahorro_main_page_model.dart';

class AhorroMainPageWidget extends StatefulWidget {
  const AhorroMainPageWidget({
    super.key,
    this.ahoro,
  });

  final AhorrosRecord? ahoro;

  static String routeName = 'Ahorro_Main_Page';
  static String routePath = '/ahorroMainPage';

  @override
  State<AhorroMainPageWidget> createState() => _AhorroMainPageWidgetState();
}

class _AhorroMainPageWidgetState extends State<AhorroMainPageWidget> {
  late AhorroMainPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AhorroMainPageModel());

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

            context.goNamedAuth(
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
              isEqualTo: widget!.ahoro?.reference.id,
            )
            .where(
              'transactionType',
              isEqualTo: 'Depositado',
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
        List<TransactionsRecord> ahorroMainPageTransactionsRecordList =
            snapshot.data!;

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
                            MediaQuery.sizeOf(context).height * 0.07584,
                            64.0,
                          ),
                          20.0,
                          0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 10.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.safePop();
                                      },
                                      child: Icon(
                                        Icons.arrow_back_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: AutoSizeText(
                                    valueOrDefault<String>(
                                      widget!.ahoro?.savingsType,
                                      'Ahorro con propósito',
                                    ),
                                    textAlign: TextAlign.start,
                                    maxLines: 2,
                                    minFontSize: 14.0,
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
                                          lineHeight: 1.0,
                                        ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 3.0)),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/Group_91.png',
                              width: valueOrDefault<double>(
                                MediaQuery.sizeOf(context).width * 0.15385,
                                60.0,
                              ),
                              height: valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.02844,
                                24.0,
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ].divide(SizedBox(width: 4.0)),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0,
                            valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.02844,
                              24.0,
                            ),
                            20.0,
                            0.0),
                        child: StreamBuilder<List<TransactionsRecord>>(
                          stream: queryTransactionsRecord(
                            queryBuilder: (transactionsRecord) =>
                                transactionsRecord
                                    .where(
                                      'ahorrosId',
                                      isEqualTo: widget!.ahoro?.reference.id,
                                    )
                                    .where(
                                      'transactionType',
                                      isEqualTo: 'Withdrawal',
                                    )
                                    .where(
                                      'status',
                                      isNotEqualTo: 'REJECTED',
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
                            List<TransactionsRecord>
                                containerTransactionsRecordList =
                                snapshot.data!;

                            return Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.10428,
                                88.0,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    child: Container(
                                      height: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.19487,
                                        76.0,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 1.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.08887,
                                            75.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.asset(
                                                'assets/images/Frame_2609784_(1).png',
                                              ).image,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 3.0, 0.0, 0.0),
                                                child: AutoSizeText(
                                                  valueOrDefault<String>(
                                                    functions.formatAmount(
                                                        (valueOrDefault<double>(
                                                                  functions.sumaTotal(
                                                                      ahorroMainPageTransactionsRecordList
                                                                          .where((e) =>
                                                                              e.status ==
                                                                              'APPROVED')
                                                                          .toList()
                                                                          .map((e) =>
                                                                              valueOrDefault<double>(
                                                                                e.amount,
                                                                                0.0,
                                                                              ))
                                                                          .toList()),
                                                                  0.0,
                                                                ) -
                                                                valueOrDefault<
                                                                    double>(
                                                                  functions.sumaTotal(containerTransactionsRecordList
                                                                      .map((e) =>
                                                                          e.amount)
                                                                      .toList()),
                                                                  0.0,
                                                                )) +
                                                            functions.sumaTotal(
                                                                widget!.ahoro!
                                                                    .transactions
                                                                    .map((e) =>
                                                                        e.taxedBenefit)
                                                                    .toList())),
                                                    '\$0',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
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
                                                              0.02844,
                                                          24.0,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                              Text(
                                                'Mi saldo',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
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
                                                                0.01659,
                                                            14.0,
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
                                  if (widget!.ahoro?.service != null)
                                    Align(
                                      alignment:
                                          AlignmentDirectional(1.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 12.0, 0.0),
                                        child: StreamBuilder<ServicesRecord>(
                                          stream: ServicesRecord.getDocument(
                                              widget!.ahoro!.service!),
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

                                            final containerServicesRecord =
                                                snapshot.data!;

                                            return Container(
                                              width: 35.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: Image.asset(
                                                    'assets/images/path1320_(1).png',
                                                  ).image,
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 0.0,
                                                                4.0, 0.0),
                                                    child: AutoSizeText(
                                                      valueOrDefault<String>(
                                                        '${formatNumber(
                                                          widget!.ahoro?.ea,
                                                          formatType:
                                                              FormatType.custom,
                                                          format: '0.##',
                                                          locale: '',
                                                        )}%',
                                                        '9%',
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 1,
                                                      minFontSize: 10.0,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Satoshi',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 0.0,
                                                                4.0, 0.0),
                                                    child: AutoSizeText(
                                                      'E.A',
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 1,
                                                      minFontSize: 6.0,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Satoshi',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            fontSize: 8.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0,
                                valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.01896,
                                  16.0,
                                ),
                                20.0,
                                0.0),
                            child: AuthUserStreamWidget(
                              builder: (context) =>
                                  StreamBuilder<List<AhorrosRecord>>(
                                stream: queryAhorrosRecord(
                                  queryBuilder: (ahorrosRecord) =>
                                      ahorrosRecord.where(
                                    'UserID',
                                    isEqualTo: valueOrDefault(
                                        currentUserDocument?.id, ''),
                                  ),
                                  singleRecord: true,
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
                                  List<AhorrosRecord>
                                      containerAhorrosRecordList =
                                      snapshot.data!;
                                  final containerAhorrosRecord =
                                      containerAhorrosRecordList.isNotEmpty
                                          ? containerAhorrosRecordList.first
                                          : null;

                                  return Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: Color(0xFFEEF1FA),
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                ' ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              AutoSizeText(
                                                'Histórico',
                                                textAlign: TextAlign.center,
                                                maxLines: 1,
                                                minFontSize: 10.0,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
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
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model.abrirhistorico =
                                                      !_model.abrirhistorico;
                                                  safeSetState(() {});
                                                },
                                                child: Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (_model.abrirhistorico)
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 0.0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height: 1.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x45EEF1FA),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          AutoSizeText(
                                                            valueOrDefault<
                                                                String>(
                                                              functions.formatAmount(
                                                                  valueOrDefault<
                                                                      double>(
                                                                functions.sumaTotal(
                                                                    ahorroMainPageTransactionsRecordList
                                                                        .where((e) =>
                                                                            e.status ==
                                                                            'APPROVED')
                                                                        .toList()
                                                                        .map((e) =>
                                                                            valueOrDefault<double>(
                                                                              e.amount,
                                                                              0.0,
                                                                            ))
                                                                        .toList()),
                                                                0.0,
                                                              )),
                                                              '\$0',
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                            maxLines: 1,
                                                            minFontSize: 10.0,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Satoshi',
                                                                  color: Color(
                                                                      0xFF002CE9),
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
                                                          AutoSizeText(
                                                            'Ahorrado',
                                                            textAlign: TextAlign
                                                                .center,
                                                            maxLines: 1,
                                                            minFontSize: 8.0,
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
                                                                        0.01422,
                                                                    12.0,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          AutoSizeText(
                                                            valueOrDefault<
                                                                String>(
                                                              functions.formatAmount(
                                                                  functions.sumaTotal(widget!
                                                                      .ahoro!
                                                                      .transactions
                                                                      .map((e) =>
                                                                          e.taxedBenefit)
                                                                      .toList())),
                                                              '\$0',
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                            maxLines: 1,
                                                            minFontSize: 10.0,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Satoshi',
                                                                  color: Color(
                                                                      0xFF002CE9),
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
                                                          AutoSizeText(
                                                            'Beneficios',
                                                            textAlign: TextAlign
                                                                .center,
                                                            maxLines: 1,
                                                            minFontSize: 8.0,
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
                                                                        0.01422,
                                                                    12.0,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 8.0)),
                                                ),
                                              ),
                                            ],
                                          ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 32.0, 20.0, 0.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  if (((widget!.ahoro?.savingsType ==
                                              'Linea de Ahorro de nómina') ||
                                          (widget!.ahoro?.savingsType ==
                                              'Linea de Ahorro de nómina')) &&
                                      (widget!.ahoro?.company != null))
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
                                                child: NominamodaleditarWidget(
                                                  monto: widget!.ahoro!
                                                      .totalSavingsPreApproval,
                                                  ahorroref:
                                                      widget!.ahoro!.reference,
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 0.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Container(
                                          width: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width *
                                                0.20513,
                                            80.0,
                                          ),
                                          height: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.09480,
                                            80.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .customColor5,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: Image.asset(
                                                  'assets/images/Group_73_(1).png',
                                                  width: 24.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
                                                  child: AutoSizeText(
                                                    'Mi ahorro',
                                                    textAlign: TextAlign.center,
                                                    maxLines: 1,
                                                    minFontSize: 10.0,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
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
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 4.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if ((widget!.ahoro?.savingsType !=
                                          'Linea de Ahorro de nómina') &&
                                      (widget!.ahoro?.savingsType !=
                                          'Ahorro de nómina'))
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (valueOrDefault(
                                                    currentUserDocument
                                                        ?.ingresos,
                                                    '') !=
                                                null &&
                                            valueOrDefault(
                                                    currentUserDocument
                                                        ?.ingresos,
                                                    '') !=
                                                '') {
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
                                                  child:
                                                      DepositarRetiroBottomSheetAhorroWidget(
                                                    ahorrosRef: widget!
                                                        .ahoro!.reference,
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));

                                          FFAppState().statementTypeRef =
                                              widget!.ahoro?.reference;
                                          FFAppState().update(() {});
                                        } else {
                                          context.pushNamed(
                                            FinancialInformationWidget
                                                .routeName,
                                            extra: <String, dynamic>{
                                              '__transition_info__':
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType
                                                        .rightToLeft,
                                                duration:
                                                    Duration(milliseconds: 300),
                                              ),
                                            },
                                          );

                                          FFAppState().statementTypeRef =
                                              widget!.ahoro?.reference;
                                          FFAppState().update(() {});
                                        }
                                      },
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 0.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Container(
                                          width: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width *
                                                0.20513,
                                            80.0,
                                          ),
                                          height: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.09480,
                                            80.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .customColor5,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: Image.asset(
                                                  'assets/images/Group_96.png',
                                                  width: 24.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: AutoSizeText(
                                                    'Depositar',
                                                    textAlign: TextAlign.center,
                                                    maxLines: 1,
                                                    minFontSize: 10.0,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
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
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 4.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if ((widget!.ahoro?.company == null) &&
                                      (widget!.ahoro?.savingsType ==
                                          'Linea de Ahorro de nómina'))
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          AhorroDeNominaPageWidget.routeName,
                                          queryParameters: {
                                            'cambioEmpresa': serializeParam(
                                              true,
                                              ParamType.bool,
                                            ),
                                            'ahorroActual': serializeParam(
                                              widget!.ahoro?.reference,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 0.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Container(
                                          width: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width *
                                                0.20513,
                                            80.0,
                                          ),
                                          height: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.09480,
                                            80.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .customColor5,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    child: Image.asset(
                                                      'assets/images/Vector_(56).png',
                                                      width: 28.0,
                                                      fit: BoxFit.contain,
                                                      alignment:
                                                          Alignment(0.0, 1.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
                                                  child: AutoSizeText(
                                                    'Empresa',
                                                    textAlign: TextAlign.center,
                                                    maxLines: 1,
                                                    minFontSize: 10.0,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
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
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 4.0)),
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
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        useSafeArea: true,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: RetirosWidget(
                                                ahorroref: widget!.ahoro,
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 0.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Container(
                                        width: valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).width *
                                              0.20513,
                                          80.0,
                                        ),
                                        height: valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.09480,
                                          80.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .customColor5,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: Image.asset(
                                                  'assets/images/Frame_98.png',
                                                  width: 29.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: AutoSizeText(
                                                  'Retirar',
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                  minFontSize: 10.0,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Satoshi',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
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
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
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
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        useSafeArea: true,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: TransferirWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 0.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Container(
                                        width: valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).width *
                                              0.20513,
                                          80.0,
                                        ),
                                        height: valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.09480,
                                          80.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
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
                                                  BorderRadius.circular(0.0),
                                              child: Image.asset(
                                                'assets/images/Group_94.png',
                                                width: 24.0,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 0.0),
                                                child: AutoSizeText(
                                                  'Transferir',
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                  minFontSize: 10.0,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Satoshi',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
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
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
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
                                        AhorroExtractoWidget.routeName,
                                        queryParameters: {
                                          'productDoc': serializeParam(
                                            widget!.ahoro,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'productDoc': widget!.ahoro,
                                        },
                                      );

                                      FFAppState().statementTypeRef =
                                          widget!.ahoro?.reference;
                                      safeSetState(() {});
                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 0.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Container(
                                        width: valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).width *
                                              0.20513,
                                          80.0,
                                        ),
                                        height: valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.09480,
                                          80.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .customColor5,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: Image.asset(
                                                'assets/images/Group_95.png',
                                                width: 24.0,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 0.0),
                                                child: AutoSizeText(
                                                  'Extractos',
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                  minFontSize: 10.0,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Satoshi',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
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
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                            ),
                          ),
                          if ((widget!.ahoro?.company == null) &&
                              (widget!.ahoro?.savingsType ==
                                  'Linea de Ahorro de nómina'))
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 12.0, 20.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x0DFF6700),
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: Color(0x0DFF6700),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AutoSizeText(
                                          'No estás vinculado a ninguna empresa:',
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          minFontSize: 8.0,
                                          style: FlutterFlowTheme.of(context)
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
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        AutoSizeText(
                                          'Tus ahorros seguirán aumentando al 9% EA. Puedes vincularte de nuevo si tu empresa tiene un convenio con Alianza o transferir a una nueva cuenta para que puedas depositar y seguir ahorrando.',
                                          textAlign: TextAlign.start,
                                          minFontSize: 8.0,
                                          style: FlutterFlowTheme.of(context)
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
                                      ].divide(SizedBox(height: 8.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0,
                                valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.03792,
                                  32.0,
                                ),
                                20.0,
                                valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.03792,
                                  32.0,
                                )),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  AhorroTransactionsWidget.routeName,
                                  queryParameters: {
                                    'ahorroDoc': serializeParam(
                                      widget!.ahoro,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'ahorroDoc': widget!.ahoro,
                                    '__transition_info__': TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.rightToLeft,
                                      duration: Duration(milliseconds: 300),
                                    ),
                                  },
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                height: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.05688,
                                  48.0,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      FlutterFlowTheme.of(context).customColor5,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      14.0, 0.0, 14.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: Image.asset(
                                              'assets/images/Frame_(54).png',
                                              width: 24.0,
                                              height: 24.0,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          AutoSizeText(
                                            'Mis movimientos',
                                            textAlign: TextAlign.start,
                                            maxLines: 1,
                                            minFontSize: 10.0,
                                            style: FlutterFlowTheme.of(context)
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
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                      Icon(
                                        Icons.chevron_right,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
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
                  ],
                ),
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  desktop: false,
                ))
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: wrapWithModel(
                        model: _model.animacionmenuModel,
                        updateCallback: () => safeSetState(() {}),
                        child: AnimacionmenuWidget(),
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
