import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mensajeconfirmacionempresas_model.dart';
export 'mensajeconfirmacionempresas_model.dart';

class MensajeconfirmacionempresasWidget extends StatefulWidget {
  const MensajeconfirmacionempresasWidget({super.key});

  @override
  State<MensajeconfirmacionempresasWidget> createState() =>
      _MensajeconfirmacionempresasWidgetState();
}

class _MensajeconfirmacionempresasWidgetState
    extends State<MensajeconfirmacionempresasWidget> {
  late MensajeconfirmacionempresasModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MensajeconfirmacionempresasModel());

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
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.85,
        height: MediaQuery.sizeOf(context).height * 0.35,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/Group_(21).png',
                  width: 72.0,
                  height: 71.0,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: AutoSizeText(
                  'Empresa registrada con éxito',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Satoshi',
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: AutoSizeText(
                  'En las próximas semanas nos contactaremos con la empresa para que puedas aperturar tus productos de nómina.',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Satoshi',
                        color: Color(0xB3262632),
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 28.0, 0.0, 10.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed(
                      HomeNewWidget.routeName,
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
                    height: MediaQuery.sizeOf(context).height * 0.05,
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
