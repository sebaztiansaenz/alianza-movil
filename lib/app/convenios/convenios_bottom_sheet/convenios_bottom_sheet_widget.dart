import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'convenios_bottom_sheet_model.dart';
export 'convenios_bottom_sheet_model.dart';

class ConveniosBottomSheetWidget extends StatefulWidget {
  const ConveniosBottomSheetWidget({super.key});

  @override
  State<ConveniosBottomSheetWidget> createState() =>
      _ConveniosBottomSheetWidgetState();
}

class _ConveniosBottomSheetWidgetState
    extends State<ConveniosBottomSheetWidget> {
  late ConveniosBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConveniosBottomSheetModel());

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
      child: SafeArea(
        child: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/Frame_(32).png',
                      width: 36.0,
                      height: 36.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: AutoSizeText(
                    'Próximamente ampliaremos nuestros convenios y servicios',
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    minFontSize: 16.0,
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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: AutoSizeText(
                    'Sigue disfrutando de nuestros otros servicios.',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    minFontSize: 10.0,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Satoshi',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 12.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    text: 'Aceptar',
                    options: FFButtonOptions(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.055,
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
