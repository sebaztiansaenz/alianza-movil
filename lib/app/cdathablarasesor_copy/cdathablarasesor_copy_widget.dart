import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cdathablarasesor_copy_model.dart';
export 'cdathablarasesor_copy_model.dart';

class CdathablarasesorCopyWidget extends StatefulWidget {
  const CdathablarasesorCopyWidget({super.key});

  @override
  State<CdathablarasesorCopyWidget> createState() =>
      _CdathablarasesorCopyWidgetState();
}

class _CdathablarasesorCopyWidgetState
    extends State<CdathablarasesorCopyWidget> {
  late CdathablarasesorCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CdathablarasesorCopyModel());

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
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: AlignmentDirectional(1.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      child: Icon(
                        FFIcons.kclose,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 28.0, 0.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/image_2.png',
                    width: 274.0,
                    height: 177.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: AutoSizeText(
                  'Click aquí para hablar\n con un asesor',
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 48.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await launchURL(
                        'https://api.whatsapp.com/send?phone=573157792999&text=Hola%2C%20quiero%20aperturar%20mi%20CDAT.');
                  },
                  text: 'Hablar con un asesor',
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
