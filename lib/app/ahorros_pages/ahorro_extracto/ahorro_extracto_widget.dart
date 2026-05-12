import '/app/ahorros_pages/ahorro_options/ahorro_options_widget.dart';
import '/app/otros/animacionmenu/animacionmenu_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ahorro_extracto_model.dart';
export 'ahorro_extracto_model.dart';

class AhorroExtractoWidget extends StatefulWidget {
  const AhorroExtractoWidget({
    super.key,
    required this.productDoc,
  });

  final AhorrosRecord? productDoc;

  static String routeName = 'AHORRO_EXTRACTO';
  static String routePath = '/ahorroExtracto';

  @override
  State<AhorroExtractoWidget> createState() => _AhorroExtractoWidgetState();
}

class _AhorroExtractoWidgetState extends State<AhorroExtractoWidget> {
  late AhorroExtractoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AhorroExtractoModel());

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
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 440.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 40.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0,
                                      valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.07110,
                                        60.0,
                                      ),
                                      0.0,
                                      0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.safePop();
                                            },
                                            child: Icon(
                                              Icons.arrow_back,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 28.0,
                                            ),
                                          ),
                                          AutoSizeText(
                                            'Descargar extractos',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  fontSize:
                                                      valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.02133,
                                                    18.0,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                      Container(
                                        height: 40.0,
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
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
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
                                                        AhorroOptionsWidget(),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              AutoSizeText(
                                                'Otros',
                                                textAlign: TextAlign.end,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 0.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {},
                                                  child: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .customColor4,
                                                    size: 24.0,
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0,
                                      valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.07110,
                                        60.0,
                                      ),
                                      0.0,
                                      0.0),
                                  child: Icon(
                                    FFIcons.kfileText2,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.07110,
                                      60.0,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 0.0),
                                    child: StreamBuilder<AhorrosRecord>(
                                      stream: AhorrosRecord.getDocument(
                                          FFAppState().statementTypeRef!),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
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

                                        final textAhorrosRecord =
                                            snapshot.data!;

                                        return AutoSizeText(
                                          'Extracto${textAhorrosRecord.savingsType}',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                fontSize:
                                                    valueOrDefault<double>(
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.02370,
                                                  20.0,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 15.0, 0.0, 0.0),
                                  child: AutoSizeText(
                                    'Los extractos se descargaran automaticamente\na tu dispositivo y se enviaran a su correo electronico',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          fontSize: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.01540,
                                            13.0,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 32.0, 0.0, 0.0),
                                    child: AutoSizeText(
                                      'Año',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.01659,
                                              14.0,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 46.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x0E26320A),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(6.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Builder(
                                        builder: (context) {
                                          final years = functions
                                              .yearsTillDate(
                                                  currentUserDocument!
                                                      .createdTime!)
                                              .toList();

                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                years.length, (yearsIndex) {
                                              final yearsItem =
                                                  years[yearsIndex];
                                              return Expanded(
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    _model.year = yearsItem;
                                                    safeSetState(() {});
                                                  },
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: BoxDecoration(
                                                      color: _model.year ==
                                                              yearsItem
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: AutoSizeText(
                                                      valueOrDefault<String>(
                                                        yearsItem,
                                                        'Unset',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Satoshi',
                                                            color: _model
                                                                        .year ==
                                                                    yearsItem
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground
                                                                : FlutterFlowTheme.of(
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
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }).divide(SizedBox(width: 6.0)),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 32.0, 0.0, 0.0),
                                    child: AutoSizeText(
                                      'Mes',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.01659,
                                              14.0,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller: _model.monthsValueController ??=
                                        FormFieldController<String>(
                                      _model.monthsValue ??= '',
                                    ),
                                    options: List<String>.from([
                                      '1',
                                      '2',
                                      '3',
                                      '4',
                                      '5',
                                      '6',
                                      '7',
                                      '8',
                                      '9',
                                      '10',
                                      '11',
                                      '12'
                                    ]),
                                    optionLabels: [
                                      'Enero',
                                      'Febrero',
                                      'Marzo',
                                      'Abril',
                                      'Mayo',
                                      'Junio',
                                      'Julio',
                                      'Agosto',
                                      ' Setiembre',
                                      'Octubre',
                                      'Noviembre',
                                      'Diciembre'
                                    ],
                                    onChanged: (val) => safeSetState(
                                        () => _model.monthsValue = val),
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 48.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.01896,
                                            16.0,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    hintText: 'Seleccione el mes',
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 25.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .customColor5,
                                    elevation: 2.0,
                                    borderColor: Color(0x4CFFFFFF),
                                    borderWidth: 1.0,
                                    borderRadius: 8.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 4.0, 12.0, 4.0),
                                    hidesUnderline: true,
                                    isOverButton: false,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0,
                                      valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.05688,
                                        48.0,
                                      ),
                                      0.0,
                                      valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.06162,
                                        52.0,
                                      )),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      _model.validateCopy = true;
                                      if (_model.formKey.currentState == null ||
                                          !_model.formKey.currentState!
                                              .validate()) {
                                        _model.validateCopy = false;
                                      }
                                      if (functions.before5th(
                                                  _model.monthsValue!,
                                                  _model.year) ==
                                              null ||
                                          functions.before5th(
                                                  _model.monthsValue!,
                                                  _model.year) ==
                                              '') {
                                        if (_model.validateCopy!) {
                                          _model.isLoading = true;
                                          safeSetState(() {});
                                          if (FFAppState().statementTypeRef !=
                                              null) {
                                            _model.ahorrosAccountCopy =
                                                await AhorrosRecord
                                                    .getDocumentOnce(
                                                        FFAppState()
                                                            .statementTypeRef!);
                                            _model.transactions =
                                                await queryTransactionsRecordOnce(
                                              queryBuilder:
                                                  (transactionsRecord) =>
                                                      transactionsRecord
                                                          .where(
                                                            'ahorrosId',
                                                            isEqualTo: widget!
                                                                .productDoc
                                                                ?.reference
                                                                .id,
                                                          )
                                                          .where(
                                                            'status',
                                                            isEqualTo:
                                                                'APPROVED',
                                                          ),
                                            );
                                            _model.accountStatementCopy =
                                                await actions.bankStatementPDF(
                                              currentUserDisplayName,
                                              valueOrDefault(
                                                  currentUserDocument?.id, ''),
                                              () {
                                                if (_model.monthsValue == '1') {
                                                  return 'January';
                                                } else if (_model.monthsValue ==
                                                    '2') {
                                                  return 'February';
                                                } else if (_model.monthsValue ==
                                                    '3') {
                                                  return 'March';
                                                } else if (_model.monthsValue ==
                                                    '4') {
                                                  return 'April';
                                                } else if (_model.monthsValue ==
                                                    '5') {
                                                  return 'May';
                                                } else if (_model.monthsValue ==
                                                    '6') {
                                                  return 'June';
                                                } else if (_model.monthsValue ==
                                                    '7') {
                                                  return 'July';
                                                } else if (_model.monthsValue ==
                                                    '8') {
                                                  return 'Augusto';
                                                } else if (_model.monthsValue ==
                                                    '9') {
                                                  return 'September';
                                                } else if (_model.monthsValue ==
                                                    '10') {
                                                  return 'October';
                                                } else if (_model.monthsValue ==
                                                    '11') {
                                                  return 'November';
                                                } else {
                                                  return 'December';
                                                }
                                              }(),
                                              _model.ahorrosAccountCopy!
                                                  .savingsType,
                                              '01-${_model.ahorrosAccountCopy?.ahorroSeriesNumber?.toString()}',
                                              formatNumber(
                                                functions
                                                    .filterByDate(
                                                        functions
                                                            .filterTransactions(
                                                                _model
                                                                    .ahorrosAccountCopy!
                                                                    .transactions
                                                                    .toList(),
                                                                'Depositado',
                                                                'Solicitado')
                                                            .toList(),
                                                        _model.year,
                                                        _model.monthsValue!)
                                                    .firstOrNull!
                                                    .totalBefore,
                                                formatType: FormatType.custom,
                                                format: '.##',
                                                locale: '',
                                              ),
                                              formatNumber(
                                                functions
                                                    .filterByDate(
                                                        functions
                                                            .filterTransactions(
                                                                _model
                                                                    .ahorrosAccountCopy!
                                                                    .transactions
                                                                    .toList(),
                                                                'Depositado',
                                                                'Solicitado')
                                                            .toList(),
                                                        _model.year,
                                                        _model.monthsValue!)
                                                    .lastOrNull!
                                                    .totalAfter,
                                                formatType: FormatType.custom,
                                                format: '.##',
                                                locale: '',
                                              ),
                                              formatNumber(
                                                functions.sumaTotal(functions
                                                    .filterByDate(
                                                        functions
                                                            .filterTransactions(
                                                                _model
                                                                    .ahorrosAccountCopy!
                                                                    .transactions
                                                                    .toList(),
                                                                'Depositado',
                                                                'Solicitado')
                                                            .toList(),
                                                        _model.year,
                                                        _model.monthsValue!)
                                                    .map((e) => e.taxedBenefit)
                                                    .toList()),
                                                formatType: FormatType.custom,
                                                format: '0.00',
                                                locale: '',
                                              ),
                                              formatNumber(
                                                functions.sumaTotal(functions
                                                    .filterByDate(
                                                        functions
                                                            .filterTransactions(
                                                                _model
                                                                    .ahorrosAccountCopy!
                                                                    .transactions
                                                                    .toList(),
                                                                'Depositado',
                                                                'Solicitado')
                                                            .toList(),
                                                        _model.year,
                                                        _model.monthsValue!)
                                                    .map((e) => e.tax)
                                                    .toList()),
                                                formatType: FormatType.custom,
                                                format: '0.00',
                                                locale: '',
                                              ),
                                              _model.transactions!
                                                  .where((e) =>
                                                      functions.isSamePeriod(
                                                          _model.year,
                                                          _model.monthsValue!,
                                                          e.firebaseDate!))
                                                  .toList(),
                                            );
                                            if (_model.accountStatementCopy !=
                                                    null &&
                                                (_model.accountStatementCopy
                                                        ?.bytes?.isNotEmpty ??
                                                    false)) {
                                              _model.didStatementSendCopy =
                                                  await actions.sendPDF(
                                                currentUserEmail,
                                                _model.accountStatementCopy!,
                                              );
                                              if (!_model
                                                  .didStatementSendCopy!) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Failed to send statement.',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .error,
                                                  ),
                                                );
                                              }
                                              _model.isLoading = false;
                                              safeSetState(() {});
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Failed to generate statement.',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .error,
                                                ),
                                              );
                                              _model.isLoading = false;
                                              safeSetState(() {});
                                            }
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Select Ahorros type',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                              ),
                                            );
                                            _model.isLoading = false;
                                            safeSetState(() {});
                                          }
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Fill dropdowm fields',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                            ),
                                          );
                                        }
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              functions.before5th(
                                                  _model.monthsValue!,
                                                  _model.year)!,
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .error,
                                          ),
                                        );
                                      }

                                      safeSetState(() {});
                                    },
                                    text: 'Descargar',
                                    icon: Icon(
                                      Icons.file_download_outlined,
                                      size: 15.0,
                                    ),
                                    options: FFButtonOptions(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.05688,
                                        48.0,
                                      ),
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .customColor4,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Satoshi',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.01896,
                                              16.0,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
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
      ),
    );
  }
}
