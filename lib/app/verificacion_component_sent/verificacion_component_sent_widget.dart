import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'verificacion_component_sent_model.dart';
export 'verificacion_component_sent_model.dart';

class VerificacionComponentSentWidget extends StatefulWidget {
  const VerificacionComponentSentWidget({super.key});

  @override
  State<VerificacionComponentSentWidget> createState() =>
      _VerificacionComponentSentWidgetState();
}

class _VerificacionComponentSentWidgetState
    extends State<VerificacionComponentSentWidget> {
  late VerificacionComponentSentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerificacionComponentSentModel());

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
        padding: EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 25.0, 0.0),
        child: Container(
          width: double.infinity,
          height: 400.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondary,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: AlignmentDirectional(1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 20.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.goNamed(HomeNewWidget.routeName);
                    },
                    child: Icon(
                      Icons.close,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      size: 32.0,
                    ),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Image.asset(
                  'assets/images/decorated_check.png',
                  width: 68.0,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30.0, 25.0, 30.0, 0.0),
                child: Text(
                  'SU PROCESO DE VINICULACION Y/O AFILIACION HA SIDO EXITOSO',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Satoshi',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w300,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30.0, 25.0, 30.0, 25.0),
                child: Text(
                  '\"GRACIAS POR VERIFICARCE\"',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Satoshi',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        fontSize: 11.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w300,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 44.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional(1.0, -1.0),
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 2.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.goNamed(HomeNewWidget.routeName);
                              },
                              text: 'Ir al inicio',
                              options: FFButtonOptions(
                                width: 160.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Colors.transparent,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Satoshi',
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: Color(0x8BF77E05),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.only(),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 5.0, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Image.asset(
                                'assets/images/Captura_de_pantalla_2024-01-19_194723.png',
                                width: 15.0,
                                height: 15.0,
                                fit: BoxFit.cover,
                                alignment: Alignment(0.0, 0.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
