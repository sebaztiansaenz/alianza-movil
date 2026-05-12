import '/app/appcdat/ahorro_compontent1_cdat/ahorro_compontent1_cdat_widget.dart';
import '/app/otros/animacionmenu/animacionmenu_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
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
import 'ahorro_withdrawal_o_t_pcdat_model.dart';
export 'ahorro_withdrawal_o_t_pcdat_model.dart';

class AhorroWithdrawalOTPcdatWidget extends StatefulWidget {
  const AhorroWithdrawalOTPcdatWidget({
    super.key,
    required this.cdat,
    required this.otp,
    required this.bank,
    required this.retiro,
  });

  final CdatsRecord? cdat;
  final int? otp;
  final BankAccountsRecord? bank;
  final CdatsRecord? retiro;

  static String routeName = 'AhorroWithdrawalOTPcdat';
  static String routePath = '/ahorroWithdrawalcdat';

  @override
  State<AhorroWithdrawalOTPcdatWidget> createState() =>
      _AhorroWithdrawalOTPcdatWidgetState();
}

class _AhorroWithdrawalOTPcdatWidgetState
    extends State<AhorroWithdrawalOTPcdatWidget> {
  late AhorroWithdrawalOTPcdatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AhorroWithdrawalOTPcdatModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.otp = widget!.otp;
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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            FlutterFlowTheme.of(context).fondo,
                            Color(0xFF002CE9)
                          ],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(0.0, -1.0),
                          end: AlignmentDirectional(0, 1.0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  4.0, 20.0, 4.0, 36.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                      Icons.arrow_back_sharp,
                                      color: Color(0xD7FFFFFF),
                                      size: 24.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: AutoSizeText(
                                      'Código de autorización',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 4.0),
                              child: Container(
                                width: double.infinity,
                                height: 48.0,
                                decoration: BoxDecoration(
                                  color: Color(0x29FFFFFF),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: Image.asset(
                                              'assets/images/profile.png',
                                              width: 24.0,
                                              height: 24.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          AuthUserStreamWidget(
                                            builder: (context) => AutoSizeText(
                                              valueOrDefault<String>(
                                                currentUserDisplayName,
                                                '---',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Satoshi',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 10.0)),
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: Container(
                                width: double.infinity,
                                height: 48.0,
                                decoration: BoxDecoration(
                                  color: Color(0x29FFFFFF),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: Image.asset(
                                              'assets/images/iconnn.png',
                                              width: 24.0,
                                              height: 24.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          AuthUserStreamWidget(
                                            builder: (context) => AutoSizeText(
                                              valueOrDefault<String>(
                                                valueOrDefault(
                                                    currentUserDocument?.id,
                                                    ''),
                                                '---',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Satoshi',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 10.0)),
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
                    Container(
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Form(
                                key: _model.formKey,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .customColor5,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              AutoSizeText(
                                                valueOrDefault<String>(
                                                  functions.formatAmount(
                                                      valueOrDefault<double>(
                                                    widget!
                                                        .cdat?.saldoDisponible,
                                                    0.0,
                                                  )),
                                                  '0',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          fontSize: 24.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              AutoSizeText(
                                                'Monto a retirar',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 0.0, 4.0, 20.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 32.0, 0.0, 8.0),
                                              child: AutoSizeText(
                                                'Hemos enviado un código de 6\n dígitos a tu correo electrónico',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 8.0),
                                              child: AutoSizeText(
                                                'Verifica tu bandeja de entrado y/o spam.',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: PinCodeTextField(
                                                autoDisposeControllers: false,
                                                appContext: context,
                                                length: 6,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                enableActiveFill: true,
                                                autoFocus: false,
                                                focusNode:
                                                    _model.pinCodeFocusNode,
                                                enablePinAutofill: false,
                                                errorTextSpace: 16.0,
                                                showCursor: true,
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                obscureText: false,
                                                keyboardType:
                                                    TextInputType.number,
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly
                                                ],
                                                pinTheme: PinTheme(
                                                  fieldHeight: 48.0,
                                                  fieldWidth: 48.0,
                                                  borderWidth: 1.0,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(8.0),
                                                    bottomRight:
                                                        Radius.circular(8.0),
                                                    topLeft:
                                                        Radius.circular(8.0),
                                                    topRight:
                                                        Radius.circular(8.0),
                                                  ),
                                                  shape: PinCodeFieldShape.box,
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .customColor5,
                                                  inactiveColor:
                                                      Color(0xFFEEF1FA),
                                                  selectedColor:
                                                      Color(0xFF002CE9),
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
                                                controller:
                                                    _model.pinCodeController,
                                                onChanged: (_) {},
                                                autovalidateMode:
                                                    AutovalidateMode.disabled,
                                                validator: _model
                                                    .pinCodeControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 0.0),
                                                  child: AutoSizeText(
                                                    '¿No te llegó ningún código?',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        if (_model.reenviar) {
                                                          _model.otp =
                                                              random_data
                                                                  .randomInteger(
                                                                      100000,
                                                                      999999);
                                                          safeSetState(() {});
                                                          await SendGridEmailOTPCDATCall
                                                              .call(
                                                            imageURL:
                                                                'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/2c6f7b6002e921d88fea7625edb1d76ab1d5946ee2876f9d7329e8a89c35ace1287a70f4e8629e0a806e52e9d0317f070c357651a2011501d29eb29bb84dfcce5f1a003ef66086b450b1d88bb2928e790b73d36d700d0919a8f5f2c0edf9b87ad482a6b8.webp?alt=media&token=9d10cd74-7c9c-4967-a5f1-0aed5564796f',
                                                            name:
                                                                currentUserDisplayName,
                                                            date:
                                                                dateTimeFormat(
                                                              "d/M/y",
                                                              getCurrentTimestamp,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            otpCode: _model.otp
                                                                ?.toString(),
                                                            email:
                                                                currentUserEmail,
                                                            cdat: 'CDAT',
                                                          );
                                                        }
                                                      },
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: AutoSizeText(
                                                              'Reenviar código (',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Satoshi',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 1.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                              child:
                                                                  FlutterFlowTimer(
                                                                initialTime: _model
                                                                    .timerInitialTimeMs,
                                                                getDisplayTime:
                                                                    (value) =>
                                                                        StopWatchTimer
                                                                            .getDisplayTime(
                                                                  value,
                                                                  hours: false,
                                                                  minute: false,
                                                                  milliSecond:
                                                                      false,
                                                                ),
                                                                controller: _model
                                                                    .timerController,
                                                                updateStateInterval:
                                                                    Duration(
                                                                        milliseconds:
                                                                            1000),
                                                                onChanged: (value,
                                                                    displayTime,
                                                                    shouldUpdate) {
                                                                  _model.timerMilliseconds =
                                                                      value;
                                                                  _model.timerValue =
                                                                      displayTime;
                                                                  if (shouldUpdate)
                                                                    safeSetState(
                                                                        () {});
                                                                },
                                                                onEnded:
                                                                    () async {
                                                                  _model.reenviar =
                                                                      true;
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Satoshi',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
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
                                                            child: AutoSizeText(
                                                              ')',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Satoshi',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 140.0,
                                                      child: Divider(
                                                        height: 1.0,
                                                        thickness: 2.0,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 52.0, 20.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      if (_model.formKey.currentState == null ||
                                          !_model.formKey.currentState!
                                              .validate()) {
                                        return;
                                      }
                                      if (_model.pinCodeController!.text ==
                                          _model.otp.toString()) {
                                        _model.codigo =
                                            await queryCodigosRecordOnce(
                                          singleRecord: true,
                                        ).then((s) => s.firstOrNull);
                                        unawaited(
                                          () async {
                                            await ConfirmacionretirosRecord
                                                    .createDoc(
                                                        widget!.cdat!.reference)
                                                .set({
                                              ...createConfirmacionretirosRecordData(
                                                usuariosid:
                                                    widget!.cdat?.idusuario,
                                                estados: 'pendiente',
                                                numbredebanco:
                                                    widget!.bank?.bankName,
                                                tipodecuenta:
                                                    widget!.bank?.accountType,
                                                cuentanumero:
                                                    widget!.bank?.accountNumber,
                                                monto: valueOrDefault<double>(
                                                  widget!.cdat?.saldoDisponible,
                                                  0.0,
                                                ),
                                                id: _model
                                                    .codigo?.codigoretiroscdat,
                                                tipodeoperacion: 'retiro',
                                                nitusuario:
                                                    valueOrDefault<String>(
                                                  widget!
                                                      .retiro?.documentousuario,
                                                  '0',
                                                ),
                                                nombreusuario: widget!
                                                    .retiro?.nombreusuario,
                                                idCDAT: widget!.cdat?.idCdat,
                                                emailusuario: currentUserEmail,
                                                celusuario: currentPhoneNumber,
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'fechaSolicitud': FieldValue
                                                      .serverTimestamp(),
                                                  'fecharetiro': FieldValue
                                                      .serverTimestamp(),
                                                },
                                              ),
                                            });
                                          }(),
                                        );

                                        await _model.codigo!.reference.update({
                                          ...mapToFirestore(
                                            {
                                              'codigoretiroscdat':
                                                  FieldValue.increment(1),
                                            },
                                          ),
                                        });

                                        await widget!.cdat!.reference
                                            .update(createCdatsRecordData(
                                          saldoDisponible: 0.0,
                                        ));
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
                                                    AhorroCompontent1CdatWidget(
                                                  cdatssss:
                                                      widget!.cdat!.reference,
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Incorrecto',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
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
                                    text: 'Retirar',
                                    options: FFButtonOptions(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 48.0,
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
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(8.0),
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
              if (responsiveVisibility(
                context: context,
                phone: false,
                desktop: false,
              ))
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: wrapWithModel(
                    model: _model.animacionmenuModel,
                    updateCallback: () => safeSetState(() {}),
                    child: AnimacionmenuWidget(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
