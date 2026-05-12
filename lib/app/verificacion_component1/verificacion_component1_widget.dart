import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'verificacion_component1_model.dart';
export 'verificacion_component1_model.dart';

class VerificacionComponent1Widget extends StatefulWidget {
  const VerificacionComponent1Widget({super.key});

  @override
  State<VerificacionComponent1Widget> createState() =>
      _VerificacionComponent1WidgetState();
}

class _VerificacionComponent1WidgetState
    extends State<VerificacionComponent1Widget> {
  late VerificacionComponent1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerificacionComponent1Model());

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
            gradient: LinearGradient(
              colors: [Color(0xFF006AD8), Color(0xFF0B35B8)],
              stops: [0.0, 0.8],
              begin: AlignmentDirectional(0.0, -1.0),
              end: AlignmentDirectional(0, 1.0),
            ),
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
                      Navigator.pop(context);
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
                  'Para tener una experiencia completa de nuestros servicios debes completar tu vinculacion y/o afiliacion',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Satoshi',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w300,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30.0, 25.0, 30.0, 0.0),
                child: Text(
                  '¿Deseas hacerlo ahora?',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Satoshi',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30.0, 4.0, 30.0, 25.0),
                child: Text(
                  'Tiempo de la vinculacion 3 min.',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Satoshi',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w300,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
                child: Stack(
                  alignment: AlignmentDirectional(1.0, -1.0),
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        context.goNamed(RegistroVinculacionWidget.routeName);
                      },
                      text: 'Iniciar ahora',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 48.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).tertiary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Satoshi',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Color(0xFFF77E06),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.only(),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1.0, -1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: Image.asset(
                            'assets/images/Vector_1.png',
                            width: 15.0,
                            height: 15.0,
                            fit: BoxFit.cover,
                            alignment: Alignment(1.0, -1.0),
                          ),
                        ),
                      ),
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
