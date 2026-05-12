import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ahorro_de_nominaedit_sucess_model.dart';
export 'ahorro_de_nominaedit_sucess_model.dart';

class AhorroDeNominaeditSucessWidget extends StatefulWidget {
  const AhorroDeNominaeditSucessWidget({super.key});

  static String routeName = 'Ahorro_de_nominaeditSucess';
  static String routePath = '/ahorroDeNominaeditSucess';

  @override
  State<AhorroDeNominaeditSucessWidget> createState() =>
      _AhorroDeNominaeditSucessWidgetState();
}

class _AhorroDeNominaeditSucessWidgetState
    extends State<AhorroDeNominaeditSucessWidget> {
  late AhorroDeNominaeditSucessModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AhorroDeNominaeditSucessModel());

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
        backgroundColor: FlutterFlowTheme.of(context).fondo,
        body: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                FlutterFlowTheme.of(context).fondo,
                FlutterFlowTheme.of(context).secondary
              ],
              stops: [0.0, 1.0],
              begin: AlignmentDirectional(0.0, -1.0),
              end: AlignmentDirectional(0, 1.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/SIN_FONDO_1.png',
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0.0,
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.04740,
                        40.0,
                      ),
                      0.0,
                      0.0),
                  child: AutoSizeText(
                    '¡Tu cambio de ahorro se ha completado exitosamente!',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily: 'Satoshi',
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          fontSize: valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.02607,
                            22.0,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        0.0,
                        valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.02844,
                          24.0,
                        ),
                        0.0,
                        valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.05688,
                          48.0,
                        )),
                    child: AutoSizeText(
                      'Comienza a ahorrar con nosotros.',
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Satoshi',
                            fontSize: valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.01659,
                              14.0,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w300,
                          ),
                    ),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    context.goNamed(
                      AHORROSPage1CopyCopyWidget.routeName,
                      extra: <String, dynamic>{
                        '__transition_info__': TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  },
                  text: 'Entendido',
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: valueOrDefault<double>(
                      MediaQuery.sizeOf(context).height * 0.05688,
                      48.0,
                    ),
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).customColor4,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Satoshi',
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          fontSize: valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.01896,
                            16.0,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
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
