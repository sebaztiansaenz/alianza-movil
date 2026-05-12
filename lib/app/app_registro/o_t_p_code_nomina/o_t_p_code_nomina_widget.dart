import '/app/otros/success_messaje2/success_messaje2_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'o_t_p_code_nomina_model.dart';
export 'o_t_p_code_nomina_model.dart';

class OTPCodeNominaWidget extends StatefulWidget {
  const OTPCodeNominaWidget({
    super.key,
    required this.code,
    this.email,
    this.nomina,
    this.ahorroref,
    this.nuevomontoahorro,
  });

  final String? code;
  final String? email;
  final bool? nomina;
  final DocumentReference? ahorroref;
  final double? nuevomontoahorro;

  @override
  State<OTPCodeNominaWidget> createState() => _OTPCodeNominaWidgetState();
}

class _OTPCodeNominaWidgetState extends State<OTPCodeNominaWidget> {
  late OTPCodeNominaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OTPCodeNominaModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onStartTimer();
      _model.otpcode = widget!.code;
      safeSetState(() {});
    });

    _model.pinCodeFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                  child: Container(
                    width: 32.0,
                    height: 4.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).customColor5,
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                  child: Image.asset(
                    'assets/images/Frame_(15).png',
                    width: 36.0,
                    height: 36.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: AutoSizeText(
                    'Hemos enviado un código de 6 dígitos a tu correo electrónico',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily: 'Satoshi',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: AutoSizeText(
                    'Verifica tu bandeja de entrado y/o spam.',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Satoshi',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: PinCodeTextField(
                    autoDisposeControllers: false,
                    appContext: context,
                    length: 6,
                    textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Satoshi',
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                        ),
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    enableActiveFill: true,
                    autoFocus: true,
                    focusNode: _model.pinCodeFocusNode,
                    enablePinAutofill: false,
                    errorTextSpace: 16.0,
                    showCursor: true,
                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    pinTheme: PinTheme(
                      fieldHeight: 48.0,
                      fieldWidth: 48.0,
                      borderWidth: 2.0,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                      shape: PinCodeFieldShape.box,
                      activeColor: FlutterFlowTheme.of(context).customColor5,
                      inactiveColor: FlutterFlowTheme.of(context).customColor5,
                      selectedColor: Color(0xFF002CE9),
                      activeFillColor:
                          FlutterFlowTheme.of(context).customColor5,
                      inactiveFillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      selectedFillColor: Color(0x1FFFFFFF),
                    ),
                    controller: _model.pinCodeController,
                    onChanged: (_) {},
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator:
                        _model.pinCodeControllerValidator.asValidator(context),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: AutoSizeText(
                        '¿No te llegó ningún código?',
                        style: FlutterFlowTheme.of(context)
                            .titleMedium
                            .override(
                              fontFamily: 'Satoshi',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
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
                              _model.otpcode = random_data
                                  .randomInteger(100001, 999999)
                                  .toString();
                              safeSetState(() {});
                              _model.apiResultxl4 =
                                  await SendGridEmailOTPEditNominaCall.call(
                                name: currentUserDisplayName,
                                date: dateTimeFormat(
                                  "d/M h:mm a",
                                  getCurrentTimestamp,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                otpCode: _model.otpcode,
                                email: currentUserEmail,
                              );

                              if ((_model.apiResultxl4?.succeeded ?? true)) {
                                _model.reintentar = false;
                                safeSetState(() {});
                                _model.timerController.onResetTimer();

                                _model.timerController.onStartTimer();
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 1.0)
                                          .resolve(Directionality.of(context)),
                                      child: SucessMensajeWidget(
                                        titulo: 'Código reenviado!',
                                        descripcion:
                                            'Verifica tu bandeja de entrado y/o spam.',
                                      ),
                                    );
                                  },
                                );
                              } else {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Error!',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).error,
                                  ),
                                );
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
                                                ? FlutterFlowTheme.of(context)
                                                    .primaryText
                                                : FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: FlutterFlowTimer(
                                    initialTime: _model.timerInitialTimeMs,
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
                                    onChanged:
                                        (value, displayTime, shouldUpdate) {
                                      _model.timerMilliseconds = value;
                                      _model.timerValue = displayTime;
                                      if (shouldUpdate) safeSetState(() {});
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
                                                ? FlutterFlowTheme.of(context)
                                                    .primaryText
                                                : FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                          fontSize: 14.0,
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
                                                ? FlutterFlowTheme.of(context)
                                                    .primaryText
                                                : FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                          fontSize: 14.0,
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
                          width: 140.0,
                          child: Divider(
                            height: 1.0,
                            thickness: 2.0,
                            color: FlutterFlowTheme.of(context).customColor4,
                          ),
                        ),
                      ],
                    ),
                  ].divide(SizedBox(width: 8.0)),
                ),
                Builder(
                  builder: (context) => Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 36.0, 0.0, 40.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if (_model.pinCodeController!.text == _model.otpcode) {
                          if (widget!.nomina == true) {
                            await widget!.ahorroref!
                                .update(createAhorrosRecordData(
                              totalSavingsPreApproval: widget!.nuevomontoahorro,
                            ));

                            context.pushNamed(
                                AhorroDeNominaeditSucessWidget.routeName);
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
                                  child: SuccessMessaje2Widget(),
                                );
                              },
                            );

                            await Future.delayed(
                              Duration(
                                milliseconds: 1000,
                              ),
                            );

                            context.pushNamed(
                              REGISTRO5MainWidget.routeName,
                              extra: <String, dynamic>{
                                '__transition_info__': TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          }
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
                                child: SucessMensajeErrorWidget(
                                  titulo: 'Error!',
                                  descripcion:
                                      'Código de validación es incorrecto',
                                ),
                              );
                            },
                          );
                        }
                      },
                      text: 'Continuar',
                      options: FFButtonOptions(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 48.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).customColor4,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
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
    );
  }
}
