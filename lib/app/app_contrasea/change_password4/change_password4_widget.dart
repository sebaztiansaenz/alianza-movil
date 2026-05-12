import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/sucess_mensaje_error/sucess_mensaje_error_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'change_password4_model.dart';
export 'change_password4_model.dart';

class ChangePassword4Widget extends StatefulWidget {
  const ChangePassword4Widget({
    super.key,
    this.nombre,
    required this.email,
  });

  final String? nombre;
  final String? email;

  @override
  State<ChangePassword4Widget> createState() => _ChangePassword4WidgetState();
}

class _ChangePassword4WidgetState extends State<ChangePassword4Widget> {
  late ChangePassword4Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChangePassword4Model());

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
        width: MediaQuery.sizeOf(context).width * 1.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 35.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0.0,
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.02844,
                        24.0,
                      ),
                      0.0,
                      0.0),
                  child: Container(
                    width: valueOrDefault<double>(
                      MediaQuery.sizeOf(context).width * 0.08205,
                      32.0,
                    ),
                    height: 4.0,
                    decoration: BoxDecoration(
                      color: Color(0x2626321A),
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: AutoSizeText(
                    'Hola,',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Satoshi',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.01896,
                            16.0,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                  child: AutoSizeText(
                    valueOrDefault<String>(
                      widget!.nombre,
                      'Nombre',
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Satoshi',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 24.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                  child: AutoSizeText(
                    'Tu correo registrado es:',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Satoshi',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.01896,
                            16.0,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0.0,
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.01422,
                        12.0,
                      ),
                      0.0,
                      0.0),
                  child: AutoSizeText(
                    valueOrDefault<String>(
                      functions.ocultaremail(widget!.email!),
                      'Correo electrónico',
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Satoshi',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.01896,
                            16.0,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0.0,
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.01422,
                        12.0,
                      ),
                      0.0,
                      0.0),
                  child: AutoSizeText(
                    'Hemos enviado un código de seguridad para restablecer tu contraseña.',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Satoshi',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.01896,
                            16.0,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
                Builder(
                  builder: (context) => Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        0.0,
                        valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.06636,
                          56.0,
                        ),
                        0.0,
                        valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.01422,
                          12.0,
                        )),
                    child: FFButtonWidget(
                      onPressed: () async {
                        _model.codeOTP =
                            random_data.randomInteger(100001, 999999);
                        safeSetState(() {});
                        _model.apiResult1pv =
                            await SendGridEmailResetOTPCall.call(
                          name: widget!.nombre,
                          email: widget!.email,
                          otpCode: _model.codeOTP?.toString(),
                        );

                        if ((_model.apiResult1pv?.succeeded ?? true)) {
                          context.pushNamed(
                            ChangePassword5Widget.routeName,
                            queryParameters: {
                              'codeOTP': serializeParam(
                                _model.codeOTP,
                                ParamType.int,
                              ),
                              'email': serializeParam(
                                widget!.email,
                                ParamType.String,
                              ),
                              'nombre': serializeParam(
                                widget!.nombre,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              '__transition_info__': TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.rightToLeft,
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
                                child: SucessMensajeErrorWidget(
                                  titulo: 'Error',
                                  descripcion: 'No se pudo enviar código!',
                                ),
                              );
                            },
                          );
                        }

                        safeSetState(() {});
                      },
                      text: 'Enviar código',
                      options: FFButtonOptions(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.05688,
                          48.0,
                        ),
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
                                  fontSize: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.01896,
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
    );
  }
}
