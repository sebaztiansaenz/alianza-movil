import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'version_model.dart';
export 'version_model.dart';

class VersionWidget extends StatefulWidget {
  const VersionWidget({super.key});

  static String routeName = 'version';
  static String routePath = '/version';

  @override
  State<VersionWidget> createState() => _VersionWidgetState();
}

class _VersionWidgetState extends State<VersionWidget> {
  late VersionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VersionModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Image.asset(
                    'assets/images/Group_127_(1).png',
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Text(
                  'Nueva versión disponible',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Satoshi',
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Text(
                  'Por favor, actualiza tu aplicación.',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Satoshi',
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
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
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 48.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFFFF6700),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Satoshi',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 0.0,
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
