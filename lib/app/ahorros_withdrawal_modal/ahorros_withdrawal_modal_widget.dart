import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/sucess_mensaje_error/sucess_mensaje_error_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ahorros_withdrawal_modal_model.dart';
export 'ahorros_withdrawal_modal_model.dart';

class AhorrosWithdrawalModalWidget extends StatefulWidget {
  const AhorrosWithdrawalModalWidget({
    super.key,
    required this.ahorrosDoc,
  });

  final DocumentReference? ahorrosDoc;

  @override
  State<AhorrosWithdrawalModalWidget> createState() =>
      _AhorrosWithdrawalModalWidgetState();
}

class _AhorrosWithdrawalModalWidgetState
    extends State<AhorrosWithdrawalModalWidget> {
  late AhorrosWithdrawalModalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AhorrosWithdrawalModalModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        height: 328.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: Container(
                  width: 32.0,
                  height: 4.0,
                  decoration: BoxDecoration(
                    color: Color(0x80FFFFFF),
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: AutoSizeText(
                  'Solicitar código de autorización al correo electrónico',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Satoshi',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 68.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        valueOrDefault<String>(
                          functions.formatAmount(FFAppState().amount),
                          '0',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Satoshi',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      AutoSizeText(
                        'Monto a retirar',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Satoshi',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Builder(
                builder: (context) => Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 36.0, 0.0, 40.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      _model.otp = random_data.randomInteger(100000, 999999);
                      safeSetState(() {});
                      _model.ahorro = await AhorrosRecord.getDocumentOnce(
                          widget!.ahorrosDoc!);
                      if (functions.isGreaterThan(
                          FFAppState().amount,
                          _model.ahorro!.montoTotal -
                              _model.ahorro!.totalDeposits)) {
                        if (functions.isGreaterThan(
                            _model.ahorro!.montoTotal, FFAppState().amount)) {
                          await SendGridEmailOTPahorroCopyCall.call(
                            otpCode: _model.otp?.toString(),
                            name: currentUserDisplayName,
                            date: dateTimeFormat(
                              "EEEE d MMM y H:mm",
                              getCurrentTimestamp,
                              locale: FFLocalizations.of(context).languageCode,
                            ),
                            email: currentUserEmail,
                            ahorrosType: _model.ahorro?.savingsType,
                          );

                          context.pushNamed(
                            AhorroWithdrawalOTPWidget.routeName,
                            queryParameters: {
                              'ahorro': serializeParam(
                                widget!.ahorrosDoc,
                                ParamType.DocumentReference,
                              ),
                              'otp': serializeParam(
                                _model.otp,
                                ParamType.int,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              '__transition_info__': TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.rightToLeft,
                              ),
                            },
                          );

                          Navigator.pop(context);
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
                                  titulo: 'Error',
                                  descripcion:
                                      'No puedes retirar más que tu saldo.',
                                ),
                              );
                            },
                          );
                        }
                      }

                      safeSetState(() {});
                    },
                    text: 'Enviar código',
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
    );
  }
}
