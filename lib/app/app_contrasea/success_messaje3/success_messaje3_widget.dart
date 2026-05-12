import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'success_messaje3_model.dart';
export 'success_messaje3_model.dart';

class SuccessMessaje3Widget extends StatefulWidget {
  const SuccessMessaje3Widget({super.key});

  @override
  State<SuccessMessaje3Widget> createState() => _SuccessMessaje3WidgetState();
}

class _SuccessMessaje3WidgetState extends State<SuccessMessaje3Widget> {
  late SuccessMessaje3Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SuccessMessaje3Model());

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
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
        child: Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(30.0, 20.0, 30.0, 30.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/Group_(5).png',
                    width: valueOrDefault<double>(
                      MediaQuery.sizeOf(context).width * 0.20513,
                      80.0,
                    ),
                    height: valueOrDefault<double>(
                      MediaQuery.sizeOf(context).height * 0.09480,
                      80.0,
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0.0,
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.02370,
                        20.0,
                      ),
                      0.0,
                      0.0),
                  child: AutoSizeText(
                    'Cambio exitoso',
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Satoshi',
                          fontSize: valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.02370,
                            20.0,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: AutoSizeText(
                    'Tu nueva contraseña fue creada con éxito.',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Satoshi',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.01896,
                            16.0,
                          ),
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0.0,
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.02844,
                        24.0,
                      ),
                      0.0,
                      0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      Navigator.pop(context);

                      context.goNamed(
                        LoginPagenewWidget.routeName,
                        extra: <String, dynamic>{
                          '__transition_info__': TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    text: 'Finalizar',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
