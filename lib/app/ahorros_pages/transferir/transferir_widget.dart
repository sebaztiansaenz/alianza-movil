import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'transferir_model.dart';
export 'transferir_model.dart';

class TransferirWidget extends StatefulWidget {
  const TransferirWidget({super.key});

  @override
  State<TransferirWidget> createState() => _TransferirWidgetState();
}

class _TransferirWidgetState extends State<TransferirWidget> {
  late TransferirModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransferirModel());

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
        height: 250.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
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
                  width: 32.0,
                  height: 4.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).customColor5,
                    borderRadius: BorderRadius.circular(2.0),
                  ),
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
                  'Pronto podrás transferir a tu tarjeta u otro usuario de Alianza',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: AutoSizeText(
                  'Sigue disfrutando de nuestros servicios',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Satoshi',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.01659,
                          14.0,
                        ),
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 40.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  text: 'Aceptar',
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 48.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).customColor4,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Satoshi',
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
    );
  }
}
