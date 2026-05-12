import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ahorro_compontent1_cdat_model.dart';
export 'ahorro_compontent1_cdat_model.dart';

class AhorroCompontent1CdatWidget extends StatefulWidget {
  const AhorroCompontent1CdatWidget({
    super.key,
    required this.cdatssss,
  });

  final DocumentReference? cdatssss;

  @override
  State<AhorroCompontent1CdatWidget> createState() =>
      _AhorroCompontent1CdatWidgetState();
}

class _AhorroCompontent1CdatWidgetState
    extends State<AhorroCompontent1CdatWidget> {
  late AhorroCompontent1CdatModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AhorroCompontent1CdatModel());

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
          height: 323.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/Alianza_success.png',
                        width: 72.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          20.0, 15.0, 20.0, 24.0),
                      child: AutoSizeText(
                        'Su solicitud esta en proceso de 24 a 48 horas serán depositados sus fondos. ',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'Satoshi',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);

                            context
                                .pushNamed(MsinversionescdatWidget.routeName);
                          },
                          text: 'Aceptar\n',
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 48.0,
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
                  ].divide(SizedBox(height: 16.0)),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 24.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(MsinversionescdatWidget.routeName);
                    },
                    child: Icon(
                      Icons.cancel_outlined,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
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
