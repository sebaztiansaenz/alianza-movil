import '/app/otros/animacionmenu/animacionmenu_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/pages/sucess_mensaje/sucess_mensaje_widget.dart';
import '/pages/sucess_mensaje_error/sucess_mensaje_error_widget.dart';
import 'dart:async';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ahorro_withdrawal_o_t_p_model.dart';
export 'ahorro_withdrawal_o_t_p_model.dart';

class AhorroWithdrawalOTPWidget extends StatefulWidget {
  const AhorroWithdrawalOTPWidget({
    super.key,
    required this.ahorro,
    required this.otp,
  });

  final DocumentReference? ahorro;
  final int? otp;

  static String routeName = 'AhorroWithdrawalOTP';
  static String routePath = '/ahorroWithdrawalOTP';

  @override
  State<AhorroWithdrawalOTPWidget> createState() =>
      _AhorroWithdrawalOTPWidgetState();
}

class _AhorroWithdrawalOTPWidgetState extends State<AhorroWithdrawalOTPWidget> {
  late AhorroWithdrawalOTPModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AhorroWithdrawalOTPModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          _model.otp = widget!.otp;
          _model.isUnique = false;
          safeSetState(() {});
          FFAppState().lastAction = getCurrentTimestamp;
          safeSetState(() {});
          while (!_model.isUnique) {
            _model.count = await queryTransactionsRecordCount(
              queryBuilder: (transactionsRecord) => transactionsRecord.where(
                'authorization',
                isEqualTo: _model.cusCode,
              ),
            );
            if (_model.count! > 0) {
              _model.cusCode =
                  random_data.randomInteger(5000000, 5999999).toString();
              safeSetState(() {});
            } else {
              _model.isUnique = true;
              safeSetState(() {});
            }

            _model.timerController.onStartTimer();
          }
        }),
        Future(() async {
          FFAppState().lastAction = getCurrentTimestamp;
          safeSetState(() {});
          _model.timerController.onStartTimer();
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

    _model.pinCodeFocusNode ??= FocusNode();

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

    return StreamBuilder<BankAccountsRecord>(
      stream: BankAccountsRecord.getDocument(FFAppState().selectedBank!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
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

        final ahorroWithdrawalOTPBankAccountsRecord = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            body: Stack(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          child: Material(
                            color: Colors.transparent,
                            elevation: 0.0,
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 54.0, 0.0, 0.0),
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
                                          'Código de autorización',
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
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 32.0, 0.0, 0.0),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Form(
                                                key: _model.formKey,
                                                autovalidateMode:
                                                    AutovalidateMode.disabled,
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    0.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .customColor5,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child:
                                                                      AutoSizeText(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      functions.formatAmount(
                                                                          FFAppState()
                                                                              .amount),
                                                                      '0',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Satoshi',
                                                                          fontSize:
                                                                              valueOrDefault<double>(
                                                                            MediaQuery.sizeOf(context).height *
                                                                                0.02844,
                                                                            24.0,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w900,
                                                                        ),
                                                                  ),
                                                                ),
                                                                AutoSizeText(
                                                                  'Monto a retirar',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Satoshi',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            valueOrDefault<double>(
                                                                          MediaQuery.sizeOf(context).height *
                                                                              0.01659,
                                                                          14.0,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    12.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: Color(
                                                                    0x1A262632),
                                                                offset: Offset(
                                                                  0.0,
                                                                  2.0,
                                                                ),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .customColor5,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    14.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                AuthUserStreamWidget(
                                                                  builder:
                                                                      (context) =>
                                                                          Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      currentUserDisplayName,
                                                                      '- - -',
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Satoshi',
                                                                          fontSize:
                                                                              valueOrDefault<double>(
                                                                            MediaQuery.sizeOf(context).height *
                                                                                0.01896,
                                                                            16.0,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                valueOrDefault<String>(
                                                                                  ahorroWithdrawalOTPBankAccountsRecord.bankName,
                                                                                  '- - -',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Satoshi',
                                                                                      fontSize: valueOrDefault<double>(
                                                                                        MediaQuery.sizeOf(context).height * 0.01659,
                                                                                        14.0,
                                                                                      ),
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                'Banco',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Satoshi',
                                                                                      color: Color(0xB3262632),
                                                                                      fontSize: valueOrDefault<double>(
                                                                                        MediaQuery.sizeOf(context).height * 0.01422,
                                                                                        12.0,
                                                                                      ),
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                12.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  valueOrDefault<String>(
                                                                                    ahorroWithdrawalOTPBankAccountsRecord.accountNumber,
                                                                                    '- - -',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Satoshi',
                                                                                        fontSize: valueOrDefault<double>(
                                                                                          MediaQuery.sizeOf(context).height * 0.01659,
                                                                                          14.0,
                                                                                        ),
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  'Número de cuenta',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Satoshi',
                                                                                        color: Color(0xB3262632),
                                                                                        fontSize: valueOrDefault<double>(
                                                                                          MediaQuery.sizeOf(context).height * 0.01422,
                                                                                          12.0,
                                                                                        ),
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              ahorroWithdrawalOTPBankAccountsRecord.accountType,
                                                                              '- - -',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Satoshi',
                                                                                  fontSize: valueOrDefault<double>(
                                                                                    MediaQuery.sizeOf(context).height * 0.01659,
                                                                                    14.0,
                                                                                  ),
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            'Tipo de cuenta',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Satoshi',
                                                                                  color: Color(0xB3262632),
                                                                                  fontSize: valueOrDefault<double>(
                                                                                    MediaQuery.sizeOf(context).height * 0.01422,
                                                                                    12.0,
                                                                                  ),
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height:
                                                                      16.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    20.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          32.0,
                                                                          0.0,
                                                                          8.0),
                                                              child:
                                                                  AutoSizeText(
                                                                'Hemos enviado un código de 6 dígitos a',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Satoshi',
                                                                      fontSize:
                                                                          valueOrDefault<
                                                                              double>(
                                                                        MediaQuery.sizeOf(context).height *
                                                                            0.02370,
                                                                        20.0,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                              child:
                                                                  AutoSizeText(
                                                                valueOrDefault<
                                                                    String>(
                                                                  currentUserEmail,
                                                                  '- - -',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
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
                                                                        MediaQuery.sizeOf(context).height *
                                                                            0.01896,
                                                                        16.0,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                              child:
                                                                  AutoSizeText(
                                                                'Verifica tu bandeja de entrado y/o spam.',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
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
                                                                        MediaQuery.sizeOf(context).height *
                                                                            0.01659,
                                                                        14.0,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
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
                                                              child:
                                                                  PinCodeTextField(
                                                                autoDisposeControllers:
                                                                    false,
                                                                appContext:
                                                                    context,
                                                                length: 6,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Satoshi',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                enableActiveFill:
                                                                    true,
                                                                autoFocus:
                                                                    false,
                                                                focusNode: _model
                                                                    .pinCodeFocusNode,
                                                                enablePinAutofill:
                                                                    false,
                                                                errorTextSpace:
                                                                    16.0,
                                                                showCursor:
                                                                    true,
                                                                cursorColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                obscureText:
                                                                    false,
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                inputFormatters: [
                                                                  FilteringTextInputFormatter
                                                                      .digitsOnly
                                                                ],
                                                                pinTheme:
                                                                    PinTheme(
                                                                  fieldHeight:
                                                                      valueOrDefault<
                                                                          double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.05688,
                                                                    48.0,
                                                                  ),
                                                                  fieldWidth:
                                                                      valueOrDefault<
                                                                          double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.12308,
                                                                    48.0,
                                                                  ),
                                                                  borderWidth:
                                                                      1.0,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            8.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            8.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            8.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            8.0),
                                                                  ),
                                                                  shape:
                                                                      PinCodeFieldShape
                                                                          .box,
                                                                  activeColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .customColor5,
                                                                  inactiveColor:
                                                                      Color(
                                                                          0xFFEEF1FA),
                                                                  selectedColor:
                                                                      Color(
                                                                          0xFF002CE9),
                                                                  activeFillColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .customColor5,
                                                                  inactiveFillColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                  selectedFillColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                ),
                                                                controller: _model
                                                                    .pinCodeController,
                                                                onChanged:
                                                                    (_) {},
                                                                autovalidateMode:
                                                                    AutovalidateMode
                                                                        .disabled,
                                                                validator: _model
                                                                    .pinCodeControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      AutoSizeText(
                                                                    '¿No te llegó ningún código?',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Satoshi',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              valueOrDefault<double>(
                                                                            MediaQuery.sizeOf(context).height *
                                                                                0.01659,
                                                                            14.0,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Builder(
                                                                      builder:
                                                                          (context) =>
                                                                              InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          if (_model
                                                                              .reenviar) {
                                                                            _model.otp =
                                                                                random_data.randomInteger(100000, 999999);
                                                                            safeSetState(() {});
                                                                            _model.apiResulteml =
                                                                                await SendGridEmailOTPahorroCopyCall.call(
                                                                              name: currentUserDisplayName,
                                                                              date: dateTimeFormat(
                                                                                "d/M/y",
                                                                                getCurrentTimestamp,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ),
                                                                              otpCode: _model.otp?.toString(),
                                                                              email: currentUserEmail,
                                                                              ahorrosType: _model.ahorro?.savingsType,
                                                                            );

                                                                            _model.timerController.onStopTimer();
                                                                            _model.timerController.onResetTimer();

                                                                            _model.reenviar =
                                                                                false;
                                                                            safeSetState(() {});
                                                                            await showDialog(
                                                                              context: context,
                                                                              builder: (dialogContext) {
                                                                                return Dialog(
                                                                                  elevation: 0,
                                                                                  insetPadding: EdgeInsets.zero,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                  child: GestureDetector(
                                                                                    onTap: () {
                                                                                      FocusScope.of(dialogContext).unfocus();
                                                                                      FocusManager.instance.primaryFocus?.unfocus();
                                                                                    },
                                                                                    child: SucessMensajeWidget(
                                                                                      titulo: 'Código reenviado!',
                                                                                      descripcion: 'Verifica tu bandeja de entrado y/o spam.',
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );

                                                                            _model.timerController.onStartTimer();
                                                                          }

                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.end,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                              child: AutoSizeText(
                                                                                'Reenviar código (',
                                                                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                      fontFamily: 'Satoshi',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontSize: valueOrDefault<double>(
                                                                                        MediaQuery.sizeOf(context).height * 0.01659,
                                                                                        14.0,
                                                                                      ),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 1.0),
                                                                              child: FlutterFlowTimer(
                                                                                initialTime: _model.timerInitialTimeMs,
                                                                                getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
                                                                                  value,
                                                                                  hours: false,
                                                                                  minute: false,
                                                                                  milliSecond: false,
                                                                                ),
                                                                                controller: _model.timerController,
                                                                                updateStateInterval: Duration(milliseconds: 1000),
                                                                                onChanged: (value, displayTime, shouldUpdate) {
                                                                                  _model.timerMilliseconds = value;
                                                                                  _model.timerValue = displayTime;
                                                                                  if (shouldUpdate) safeSetState(() {});
                                                                                },
                                                                                onEnded: () async {
                                                                                  _model.reenviar = true;
                                                                                  safeSetState(() {});
                                                                                },
                                                                                textAlign: TextAlign.start,
                                                                                style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                      fontFamily: 'Satoshi',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontSize: valueOrDefault<double>(
                                                                                        MediaQuery.sizeOf(context).height * 0.01659,
                                                                                        14.0,
                                                                                      ),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                              child: AutoSizeText(
                                                                                ')',
                                                                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                      fontFamily: 'Satoshi',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontSize: valueOrDefault<double>(
                                                                                        MediaQuery.sizeOf(context).height * 0.01659,
                                                                                        14.0,
                                                                                      ),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width:
                                                                          140.0,
                                                                      child:
                                                                          Divider(
                                                                        height:
                                                                            1.0,
                                                                        thickness:
                                                                            2.0,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Builder(
                                                  builder: (context) => Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                24.0,
                                                                valueOrDefault<
                                                                    double>(
                                                                  MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.05688,
                                                                  48.0,
                                                                ),
                                                                24.0,
                                                                0.0),
                                                    child: AuthUserStreamWidget(
                                                      builder: (context) =>
                                                          FutureBuilder<int>(
                                                        future:
                                                            queryTransactionsRecordCount(
                                                          queryBuilder:
                                                              (transactionsRecord) =>
                                                                  transactionsRecord
                                                                      .where(
                                                                        'ahorrosId',
                                                                        isEqualTo: _model
                                                                            .ahorro
                                                                            ?.reference
                                                                            .id,
                                                                      )
                                                                      .where(
                                                                        'empresaId',
                                                                        isEqualTo: currentUserDocument
                                                                            ?.empresaref
                                                                            ?.id,
                                                                      )
                                                                      .where(
                                                                        'transactionType',
                                                                        isEqualTo:
                                                                            'Depositado',
                                                                      )
                                                                      .where(
                                                                        'status',
                                                                        isEqualTo:
                                                                            'APPROVED',
                                                                      ),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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
                                                          int buttonCount =
                                                              snapshot.data!;

                                                          return FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              var _shouldSetState =
                                                                  false;
                                                              if (_model.formKey
                                                                          .currentState ==
                                                                      null ||
                                                                  !_model
                                                                      .formKey
                                                                      .currentState!
                                                                      .validate()) {
                                                                return;
                                                              }
                                                              _model.ahorro =
                                                                  await AhorrosRecord
                                                                      .getDocumentOnce(
                                                                          widget!
                                                                              .ahorro!);
                                                              _shouldSetState =
                                                                  true;
                                                              if (_model
                                                                      .pinCodeController!
                                                                      .text ==
                                                                  _model.otp
                                                                      .toString()) {
                                                                unawaited(
                                                                  () async {
                                                                    await TransactionsRecord
                                                                        .collection
                                                                        .doc()
                                                                        .set(
                                                                            createTransactionsRecordData(
                                                                          amount:
                                                                              FFAppState().amount,
                                                                          currency:
                                                                              'COP',
                                                                          status:
                                                                              'PENDING',
                                                                          firebaseDate:
                                                                              getCurrentTimestamp,
                                                                          transactionType:
                                                                              'Withdrawal',
                                                                          withdrawalInfo:
                                                                              createWithdrawalInfoStruct(
                                                                            bankName:
                                                                                ahorroWithdrawalOTPBankAccountsRecord.bankName,
                                                                            accountType:
                                                                                ahorroWithdrawalOTPBankAccountsRecord.accountType,
                                                                            accountNumber:
                                                                                ahorroWithdrawalOTPBankAccountsRecord.accountNumber,
                                                                            clearUnsetFields:
                                                                                false,
                                                                            create:
                                                                                true,
                                                                          ),
                                                                          ahorrosId: _model
                                                                              .ahorro
                                                                              ?.reference
                                                                              .id,
                                                                          userRef:
                                                                              currentUserReference,
                                                                          userName:
                                                                              currentUserDisplayName,
                                                                          amountFromTotal:
                                                                              FFAppState().amount,
                                                                          lastUpdated:
                                                                              getCurrentTimestamp,
                                                                          amountFromSavings:
                                                                              0.0,
                                                                          ahorrosRef: _model
                                                                              .ahorro
                                                                              ?.reference,
                                                                          empresaId: (buttonCount > 0) && (currentUserDocument?.empresaref?.id != null && currentUserDocument?.empresaref?.id != '')
                                                                              ? currentUserDocument?.empresaref?.id
                                                                              : '',
                                                                          subPayment:
                                                                              true,
                                                                          authorization:
                                                                              _model.cusCode,
                                                                          userIdNumber: valueOrDefault(
                                                                              currentUserDocument?.id,
                                                                              ''),
                                                                          userEmail:
                                                                              currentUserEmail,
                                                                          userPhone:
                                                                              currentPhoneNumber,
                                                                          savingtipe: _model
                                                                              .ahorro
                                                                              ?.savingsType,
                                                                        ));
                                                                  }(),
                                                                );
                                                                unawaited(
                                                                  () async {
                                                                    await _model
                                                                        .ahorro!
                                                                        .reference
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'montoTotal':
                                                                              FieldValue.increment(-(FFAppState().amount)),
                                                                        },
                                                                      ),
                                                                    });
                                                                  }(),
                                                                );
                                                              } else {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Dialog(
                                                                      elevation:
                                                                          0,
                                                                      insetPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          FocusScope.of(dialogContext)
                                                                              .unfocus();
                                                                          FocusManager
                                                                              .instance
                                                                              .primaryFocus
                                                                              ?.unfocus();
                                                                        },
                                                                        child:
                                                                            SucessMensajeErrorWidget(
                                                                          titulo:
                                                                              'Error',
                                                                          descripcion:
                                                                              'Código OTP incorrecto.',
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );

                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                                return;
                                                              }

                                                              context.goNamed(
                                                                ModalCopyCopyWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'ahorro':
                                                                      serializeParam(
                                                                    _model
                                                                        .ahorro
                                                                        ?.reference,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                  'bank':
                                                                      serializeParam(
                                                                    ahorroWithdrawalOTPBankAccountsRecord
                                                                        .reference,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  '__transition_info__':
                                                                      TransitionInfo(
                                                                    hasTransition:
                                                                        true,
                                                                    transitionType:
                                                                        PageTransitionType
                                                                            .fade,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            0),
                                                                  ),
                                                                },
                                                              );

                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                            },
                                                            text: 'Retirar',
                                                            options:
                                                                FFButtonOptions(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              height:
                                                                  valueOrDefault<
                                                                      double>(
                                                                MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.05688,
                                                                48.0,
                                                              ),
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .customColor4,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Satoshi',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        fontSize:
                                                                            valueOrDefault<double>(
                                                                          MediaQuery.sizeOf(context).height *
                                                                              0.01896,
                                                                          16.0,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                          );
                                                        },
                                                      ),
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
                        ),
                      ],
                    ),
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
