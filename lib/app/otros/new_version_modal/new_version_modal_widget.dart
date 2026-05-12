import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'new_version_modal_model.dart';
export 'new_version_modal_model.dart';

class NewVersionModalWidget extends StatefulWidget {
  const NewVersionModalWidget({super.key});

  @override
  State<NewVersionModalWidget> createState() => _NewVersionModalWidgetState();
}

class _NewVersionModalWidgetState extends State<NewVersionModalWidget> {
  late NewVersionModalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewVersionModalModel());

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
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/Group_127_(1).png',
                    width: 63.0,
                    height: valueOrDefault<double>(
                      MediaQuery.sizeOf(context).height * 0.12798,
                      108.0,
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    30.0,
                    valueOrDefault<double>(
                      MediaQuery.sizeOf(context).height * 0.01896,
                      16.0,
                    ),
                    30.0,
                    0.0),
                child: Text(
                  'Nueva versión disponible',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Satoshi',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.02370,
                          20.0,
                        ),
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    0.0,
                    6.0,
                    0.0,
                    valueOrDefault<double>(
                      MediaQuery.sizeOf(context).height * 0.03792,
                      32.0,
                    )),
                child: Text(
                  'Por favor, actualiza tu aplicación.',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Satoshi',
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
                    0.0,
                    0.0,
                    valueOrDefault<double>(
                      MediaQuery.sizeOf(context).height * 0.03792,
                      32.0,
                    )),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (isAndroid) {
                      await launchURL(
                          'https://play.google.com/store/apps/details?id=com.mycompany.alicard');
                    } else {
                      await launchURL(
                          'https://apps.apple.com/pe/app/alianza-capital/id6502927890');
                    }
                  },
                  text: 'Actualizar ahora',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 48.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFFFF6700),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Satoshi',
                          color: Colors.white,
                          fontSize: valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.01896,
                            16.0,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Color(0xFFF77E06),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
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
