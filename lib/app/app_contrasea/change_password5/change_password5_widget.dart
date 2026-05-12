import '/app/otros/success_messaje2/success_messaje2_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/sucess_mensaje/sucess_mensaje_widget.dart';
import '/pages/sucess_mensaje_error/sucess_mensaje_error_widget.dart';
import 'dart:ui';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'change_password5_model.dart';
export 'change_password5_model.dart';

class ChangePassword5Widget extends StatefulWidget {
  const ChangePassword5Widget({
    super.key,
    required this.codeOTP,
    required this.email,
    required this.nombre,
  });

  final int? codeOTP;
  final String? email;
  final String? nombre;

  static String routeName = 'ChangePassword5';
  static String routePath = '/changePassword5';

  @override
  State<ChangePassword5Widget> createState() => _ChangePassword5WidgetState();
}

class _ChangePassword5WidgetState extends State<ChangePassword5Widget> {
  late ChangePassword5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChangePassword5Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.otp = widget!.codeOTP;
      safeSetState(() {});
      _model.timerController.onStartTimer();
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Material(
              color: Colors.transparent,
              elevation: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.network(
                      '',
                    ).image,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      20.0,
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.07110,
                        60.0,
                      ),
                      20.0,
                      4.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Row(
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
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 10.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 4.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF002CE9),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 10.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 4.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF002CE9),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 10.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 4.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 10.0, 0.0, 0.0),
                          child: AutoSizeText(
                            'CÓDIGO DE VERIFICACIÓN',
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Satoshi',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.02133,
                                    18.0,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 8.0, 0.0, 0.0),
                          child: Text(
                            'Verifica tu bandeja de entrada y/o spam.',
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Satoshi',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.01659,
                                    14.0,
                                  ),
                                  letterSpacing: 0.0,
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
                            0.0),
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    'Hemos enviado un código de 6 dígitos a \n',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Satoshi',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.02370,
                                        20.0,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              TextSpan(
                                text: valueOrDefault<String>(
                                  widget!.email,
                                  '- - ',
                                ),
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).customColor4,
                                ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Satoshi',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.01896,
                                    16.0,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              30.0,
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.03318,
                                28.0,
                              ),
                              30.0,
                              0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              PinCodeTextField(
                                autoDisposeControllers: false,
                                appContext: context,
                                length: 6,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Satoshi',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                    ),
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                enableActiveFill: true,
                                autoFocus: true,
                                focusNode: _model.pinCodeFocusNode,
                                enablePinAutofill: false,
                                errorTextSpace: 16.0,
                                showCursor: true,
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                obscureText: false,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                pinTheme: PinTheme(
                                  fieldHeight: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.05688,
                                    48.0,
                                  ),
                                  fieldWidth: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).width * 0.12308,
                                    48.0,
                                  ),
                                  borderWidth: 2.0,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8.0),
                                    bottomRight: Radius.circular(8.0),
                                    topLeft: Radius.circular(8.0),
                                    topRight: Radius.circular(8.0),
                                  ),
                                  shape: PinCodeFieldShape.box,
                                  activeColor:
                                      FlutterFlowTheme.of(context).customColor5,
                                  inactiveColor:
                                      FlutterFlowTheme.of(context).customColor5,
                                  selectedColor: Color(0xFF002CE9),
                                  activeFillColor:
                                      FlutterFlowTheme.of(context).customColor5,
                                  inactiveFillColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                  selectedFillColor: Color(0x1FFFFFFF),
                                ),
                                controller: _model.pinCodeController,
                                onChanged: (_) {},
                                autovalidateMode: AutovalidateMode.disabled,
                                validator: _model.pinCodeControllerValidator
                                    .asValidator(context),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: AutoSizeText(
                              '¿No te llegó ningún código?',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Satoshi',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.01422,
                                      12.0,
                                    ),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Builder(
                                builder: (context) => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (_model.reintentar == true) {
                                      _model.otp = random_data.randomInteger(
                                          100001, 999999);
                                      safeSetState(() {});
                                      _model.apiResult1pv =
                                          await SendGridEmailResetOTPCall.call(
                                        name: widget!.nombre,
                                        email: widget!.email,
                                        otpCode: _model.otp?.toString(),
                                        date: dateTimeFormat(
                                          "d/M h:mm a",
                                          getCurrentTimestamp,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                      );

                                      if ((_model.apiResult1pv?.succeeded ??
                                          true)) {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 1.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(dialogContext)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: SucessMensajeWidget(
                                                  titulo: 'Código enviado!',
                                                  descripcion:
                                                      'Verifica tu bandeja de entrado y/o spam. ',
                                                ),
                                              ),
                                            );
                                          },
                                        );

                                        _model.reintentar = false;
                                        safeSetState(() {});
                                        _model.timerController.onResetTimer();

                                        _model.timerController.onStartTimer();
                                      }
                                    }

                                    safeSetState(() {});
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: AutoSizeText(
                                          'Reenviar código (',
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                color: valueOrDefault<Color>(
                                                  _model.reintentar == true
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                                ),
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
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 1.0),
                                        child: FlutterFlowTimer(
                                          initialTime:
                                              _model.timerInitialTimeMs,
                                          getDisplayTime: (value) =>
                                              StopWatchTimer.getDisplayTime(
                                            value,
                                            hours: false,
                                            minute: false,
                                            milliSecond: false,
                                          ),
                                          controller: _model.timerController,
                                          updateStateInterval:
                                              Duration(milliseconds: 1000),
                                          onChanged: (value, displayTime,
                                              shouldUpdate) {
                                            _model.timerMilliseconds = value;
                                            _model.timerValue = displayTime;
                                            if (shouldUpdate)
                                              safeSetState(() {});
                                          },
                                          onEnded: () async {
                                            _model.reintentar = true;
                                            safeSetState(() {});
                                          },
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Satoshi',
                                                color: valueOrDefault<Color>(
                                                  _model.reintentar == true
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                                ),
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
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: AutoSizeText(
                                          ')',
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                color: valueOrDefault<Color>(
                                                  _model.reintentar == true
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                                ),
                                                fontSize:
                                                    valueOrDefault<double>(
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.01422,
                                                  12.0,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 140.0,
                                child: Divider(
                                  height: 1.0,
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).tertiary,
                                ),
                              ),
                            ],
                          ),
                        ].divide(SizedBox(width: 8.0)),
                      ),
                      Builder(
                        builder: (context) => Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              30.0,
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.06636,
                                56.0,
                              ),
                              30.0,
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.06162,
                                52.0,
                              )),
                          child: FFButtonWidget(
                            onPressed: () async {
                              if ((_model.otp.toString() ==
                                      valueOrDefault<String>(
                                        _model.pinCodeController!.text,
                                        '0',
                                      )) &&
                                  (_model.pinCodeController!.text != null &&
                                      _model.pinCodeController!.text != '')) {
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: GestureDetector(
                                        onTap: () {
                                          FocusScope.of(dialogContext)
                                              .unfocus();
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: SuccessMessaje2Widget(),
                                      ),
                                    );
                                  },
                                );

                                await Future.delayed(
                                  Duration(
                                    milliseconds: 1000,
                                  ),
                                );

                                context.goNamed(
                                  ChangePassword6Widget.routeName,
                                  queryParameters: {
                                    'email': serializeParam(
                                      widget!.email,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    '__transition_info__': TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: GestureDetector(
                                        onTap: () {
                                          FocusScope.of(dialogContext)
                                              .unfocus();
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: SucessMensajeErrorWidget(
                                          titulo: 'Error',
                                          descripcion:
                                              'El código ingresado es incorrecto',
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }
                            },
                            text: 'Verificar',
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.05688,
                                48.0,
                              ),
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).customColor4,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Satoshi',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
