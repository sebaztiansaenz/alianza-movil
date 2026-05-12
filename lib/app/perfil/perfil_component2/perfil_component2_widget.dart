import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'perfil_component2_model.dart';
export 'perfil_component2_model.dart';

class PerfilComponent2Widget extends StatefulWidget {
  const PerfilComponent2Widget({super.key});

  @override
  State<PerfilComponent2Widget> createState() => _PerfilComponent2WidgetState();
}

class _PerfilComponent2WidgetState extends State<PerfilComponent2Widget> {
  late PerfilComponent2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PerfilComponent2Model());

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
          height: 360.0,
          decoration: BoxDecoration(
            color: Color(0xFF3657A1),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/checkk_icon.png',
                  width: 72.0,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30.0, 25.0, 30.0, 0.0),
                child: AutoSizeText(
                  'DATOS ACTUALIZADOS',
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  minFontSize: 14.0,
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Satoshi',
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                child: Container(
                  width: 100.0,
                  height: 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).tertiary,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                child: AutoSizeText(
                  'Tus datos han sido actualizados con éxito.',
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  minFontSize: 10.0,
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Satoshi',
                        color: Color(0xB9F1F4F8),
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w300,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 0.0),
                child: Stack(
                  alignment: AlignmentDirectional(1.0, -1.0),
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        context.goNamed(Perfil03Widget.routeName);
                      },
                      text: 'Finalizar',
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
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).tertiary,
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
