import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sieliminar_model.dart';
export 'sieliminar_model.dart';

class SieliminarWidget extends StatefulWidget {
  const SieliminarWidget({super.key});

  @override
  State<SieliminarWidget> createState() => _SieliminarWidgetState();
}

class _SieliminarWidgetState extends State<SieliminarWidget> {
  late SieliminarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SieliminarModel());

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
          width: 380.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      FFIcons.kclose,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.asset(
                      'assets/images/Group_13.png',
                      width: 80.0,
                      height: 80.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Text(
                    'Tu cuenta ha sido eliminada',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Satoshi',
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 56.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    text: 'Aceptar',
                    options: FFButtonOptions(
                      width: MediaQuery.sizeOf(context).width * 10.0,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
