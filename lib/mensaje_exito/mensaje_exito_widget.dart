import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mensaje_exito_model.dart';
export 'mensaje_exito_model.dart';

class MensajeExitoWidget extends StatefulWidget {
  const MensajeExitoWidget({super.key});

  static String routeName = 'mensajeExito';
  static String routePath = '/mensajeExito';

  @override
  State<MensajeExitoWidget> createState() => _MensajeExitoWidgetState();
}

class _MensajeExitoWidgetState extends State<MensajeExitoWidget> {
  late MensajeExitoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MensajeExitoModel());

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
              Image.asset(
                'assets/images/Group_(2).png',
                width: 90.0,
                height: 87.0,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 56.0),
                child: Text(
                  'SU LÍNEA DE AHORRO HA SIDO CREADA EXITOSAMENTE',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Satoshi',
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  context.pushNamed(
                    AHORROSPage1CopyWidget.routeName,
                    extra: <String, dynamic>{
                      '__transition_info__': TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.bottomToTop,
                      ),
                    },
                  );
                },
                text: 'Ir al inicio',
                options: FFButtonOptions(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 48.0,
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0xFFFF6700),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Satoshi',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
