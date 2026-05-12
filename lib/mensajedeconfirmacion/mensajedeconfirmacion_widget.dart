import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mensajedeconfirmacion_model.dart';
export 'mensajedeconfirmacion_model.dart';

class MensajedeconfirmacionWidget extends StatefulWidget {
  const MensajedeconfirmacionWidget({super.key});

  static String routeName = 'MENSAJEDECONFIRMACION';
  static String routePath = '/mensajedeconfirmacion';

  @override
  State<MensajedeconfirmacionWidget> createState() =>
      _MensajedeconfirmacionWidgetState();
}

class _MensajedeconfirmacionWidgetState
    extends State<MensajedeconfirmacionWidget> {
  late MensajedeconfirmacionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MensajedeconfirmacionModel());

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
        body: Container(
          decoration: BoxDecoration(),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.network(
                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/zdqf3cclqd9m/Frame_(24).png',
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 56.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        '¡Tú cuenta ha sido eliminada!',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Satoshi',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        'Puedes agregar o eliminar las que quieras.',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Satoshi',
                              color: Color(0xB2262632),
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 120.0),
                  child: FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Aceptar',
                    options: FFButtonOptions(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 48.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).customColor4,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Satoshi',
                                color: Colors.white,
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
