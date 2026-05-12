import '/app/ahorros_pages/banks/banks_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ahorro_depositar_model.dart';
export 'ahorro_depositar_model.dart';

class AhorroDepositarWidget extends StatefulWidget {
  const AhorroDepositarWidget({super.key});

  static String routeName = 'Ahorro_Depositar';
  static String routePath = '/ahorroDepositar';

  @override
  State<AhorroDepositarWidget> createState() => _AhorroDepositarWidgetState();
}

class _AhorroDepositarWidgetState extends State<AhorroDepositarWidget> {
  late AhorroDepositarModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AhorroDepositarModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().bankName = '';
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

    _model.amountTextController ??= TextEditingController();
    _model.amountFocusNode ??= FocusNode();
    _model.amountFocusNode!.addListener(
      () async {
        safeSetState(() {});
      },
    );
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
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondary,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/Group_19_(1).png',
                    ).image,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0.0,
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.07110,
                        60.0,
                      ),
                      0.0,
                      0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 1.0, 0.0, 0.0),
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(),
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
                                          color: Color(0xD7FFFFFF),
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: AutoSizeText(
                                        'PSE',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .height *
                                                    0.02133,
                                                18.0,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 20.0, 24.0, 4.0),
                          child: Container(
                            height: valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.05688,
                              48.0,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0x1AFFFFFF),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  14.0, 0.0, 14.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 12.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/profile.png',
                                        width: 24.0,
                                        height: 24.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  AuthUserStreamWidget(
                                    builder: (context) => AutoSizeText(
                                      valueOrDefault<String>(
                                        currentUserDisplayName,
                                        'Unset',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
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
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 4.0),
                          child: Container(
                            height: valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.05688,
                              48.0,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0x1AFFFFFF),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  14.0, 0.0, 14.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 12.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/iconnn.png',
                                        width: 24.0,
                                        height: 24.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  AuthUserStreamWidget(
                                    builder: (context) => AutoSizeText(
                                      valueOrDefault<String>(
                                        valueOrDefault(
                                            currentUserDocument?.nit, ''),
                                        'Unset',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
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
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 4.0),
                          child: Container(
                            height: valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.05688,
                              48.0,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0x1AFFFFFF),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  14.0, 0.0, 14.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 12.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/Frame.png',
                                        width: 24.0,
                                        height: 24.0,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: AutoSizeText(
                                      valueOrDefault<String>(
                                        currentUserEmail,
                                        'Unset',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
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
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0,
                                valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.01896,
                                  16.0,
                                ),
                                0.0,
                                10.0),
                            child: Text(
                              'Pago protegido por',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Satoshi',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
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
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 8.0),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/LOGO-pse-blanco.png',
                                  height: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.05688,
                                    48.0,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 16.0),
                          child: AutoSizeText(
                            'El costo de transacción es \$0.0',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Satoshi',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.01659,
                                    14.0,
                                  ),
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 16.0),
                          child: SingleChildScrollView(
                            primary: false,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0,
                                      0.0,
                                      24.0,
                                      valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.02370,
                                        20.0,
                                      )),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, -1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 8.0),
                                          child: AutoSizeText(
                                            'Bancos',
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
                                                  fontWeight: FontWeight.w600,
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
                                            enableDrag: false,
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
                                                  child: Container(
                                                    height: 780.0,
                                                    child: BanksWidget(),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.05688,
                                            48.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .customColor5,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  valueOrDefault<String>(
                                                    FFAppState().bankName,
                                                    'Selecciona el banco',
                                                  ).maybeHandleOverflow(
                                                    maxChars: 10,
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Satoshi',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
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
                                                ),
                                                Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 0.0, 8.0),
                                    child: AutoSizeText(
                                      'Valor a depositar',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            color: Color(0xFF262632),
                                            fontSize: valueOrDefault<double>(
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.amountTextController,
                                    focusNode: _model.amountFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.amountTextController',
                                      Duration(milliseconds: 2000),
                                      () async {
                                        safeSetState(() {});
                                      },
                                    ),
                                    onFieldSubmitted: (_) async {
                                      safeSetState(() {});
                                    },
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            fontSize: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.01896,
                                              16.0,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                      hintText: '0.0',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.01896,
                                              16.0,
                                            ),
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .customColor5,
                                    ),
                                    style: FlutterFlowTheme.of(context)
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
                                        ),
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                            decimal: true),
                                    validator: _model
                                        .amountTextControllerValidator
                                        .asValidator(context),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('^\\d*\\.?\\d{0,2}\$'))
                                    ],
                                  ),
                                ),
                                if (_model.invalidAmount)
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, -1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 8.0, 0.0, 8.0),
                                      child: AutoSizeText(
                                        'Valor de depósito no se encuentra en rango especificado',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              fontSize: valueOrDefault<double>(
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
                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 8.0, 0.0, 0.0),
                                    child: AutoSizeText(
                                      'Deposita desde \$30.000 hasta \$10.000.000',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            fontSize: valueOrDefault<double>(
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
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0,
                                        valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.06636,
                                          56.0,
                                        ),
                                        0.0,
                                        8.0),
                                    child: AutoSizeText(
                                      valueOrDefault<String>(
                                        functions.formatAmount(
                                            valueOrDefault<double>(
                                          double.tryParse(
                                              _model.amountTextController.text),
                                          0.0,
                                        )),
                                        '\$0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            fontSize: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.03318,
                                              28.0,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0,
                                        valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.02370,
                                          20.0,
                                        ),
                                        20.0,
                                        valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.04740,
                                          40.0,
                                        )),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if ((functions.stringtoDouble(_model
                                                    .amountTextController
                                                    .text)! >=
                                                10000.0) &&
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
                                                          isEqualTo: 'PENDING',
                                                        )
                                                        .where(
                                                          'buyerId',
                                                          isEqualTo:
                                                              currentUserUid,
                                                        ),
                                          );
                                          FFAppState().userAccounts = [];
                                          safeSetState(() {});
                                          if (_model.transactions!.length > 0) {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
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
                                                      child: Text('Bueno'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          } else {
                                            FFAppState().addToUserAccounts(
                                                AhorrosAccountsStruct(
                                              ahorrosID: FFAppState()
                                                  .statementTypeRef
                                                  ?.id,
                                              amount: double.tryParse(_model
                                                  .amountTextController.text),
                                            ));
                                            FFAppState().paymentReference =
                                                '${FFAppState().statementTypeRef?.id}-${random_data.randomString(
                                              8,
                                              11,
                                              true,
                                              true,
                                              true,
                                            )}';
                                            safeSetState(() {});
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
                                            MediaQuery.sizeOf(context).width *
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
                                              color:
                                                  FlutterFlowTheme.of(context)
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
            ],
          ),
        ),
      ),
    );
  }
}
