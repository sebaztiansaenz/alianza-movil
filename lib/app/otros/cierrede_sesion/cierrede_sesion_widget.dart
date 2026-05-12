import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cierrede_sesion_model.dart';
export 'cierrede_sesion_model.dart';

class CierredeSesionWidget extends StatefulWidget {
  const CierredeSesionWidget({super.key});

  static String routeName = 'cierredeSesion';
  static String routePath = '/cierredeSesion';

  @override
  State<CierredeSesionWidget> createState() => _CierredeSesionWidgetState();
}

class _CierredeSesionWidgetState extends State<CierredeSesionWidget> {
  late CierredeSesionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CierredeSesionModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        key: scaffoldKey,
        body: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                'Hemos notado que llevas \nun tiempo inactivo.',
                textAlign: TextAlign.center,
                minFontSize: 12.0,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Satoshi',
                      fontSize: valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.01896,
                        16.0,
                      ),
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    0.0,
                    valueOrDefault<double>(
                      MediaQuery.sizeOf(context).height * 0.05214,
                      44.0,
                    ),
                    0.0,
                    valueOrDefault<double>(
                      MediaQuery.sizeOf(context).height * 0.06636,
                      56.0,
                    )),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/g2764.png',
                    width: 108.0,
                    height: 108.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              AutoSizeText(
                'Por tu seguridad',
                minFontSize: 10.0,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Satoshi',
                      color: Color(0xB2262632),
                      fontSize: valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.01659,
                        14.0,
                      ),
                      letterSpacing: 0.0,
                    ),
              ),
              AutoSizeText(
                'Cerramos tu sesión',
                minFontSize: 20.0,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Satoshi',
                      fontSize: valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.02844,
                        24.0,
                      ),
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    20.0,
                    valueOrDefault<double>(
                      MediaQuery.sizeOf(context).height * 0.06636,
                      56.0,
                    ),
                    20.0,
                    0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.goNamed(
                      LoginPagenewWidget.routeName,
                      extra: <String, dynamic>{
                        '__transition_info__': TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  },
                  text: 'Iniciar Sesión',
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: valueOrDefault<double>(
                      MediaQuery.sizeOf(context).height * 0.05688,
                      48.0,
                    ),
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
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
