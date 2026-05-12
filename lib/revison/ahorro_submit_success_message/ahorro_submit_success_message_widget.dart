import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ahorro_submit_success_message_model.dart';
export 'ahorro_submit_success_message_model.dart';

class AhorroSubmitSuccessMessageWidget extends StatefulWidget {
  const AhorroSubmitSuccessMessageWidget({super.key});

  @override
  State<AhorroSubmitSuccessMessageWidget> createState() =>
      _AhorroSubmitSuccessMessageWidgetState();
}

class _AhorroSubmitSuccessMessageWidgetState
    extends State<AhorroSubmitSuccessMessageWidget> {
  late AhorroSubmitSuccessMessageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AhorroSubmitSuccessMessageModel());

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
          height: 400.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondary,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.verified_outlined,
                color: FlutterFlowTheme.of(context).tertiary,
                size: 80.0,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30.0, 25.0, 30.0, 0.0),
                child: Text(
                  'El proceso de apertura\nde linea ahorro se a \nrealizado correctamente',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Satoshi',
                        color: Color(0xC4F1F4F8),
                        fontSize: 15.0,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w300,
                      ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: AlignmentDirectional(1.0, -1.0),
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);

                            context.goNamed(
                              AHORROSPage1Widget.routeName,
                              extra: <String, dynamic>{
                                '__transition_info__': TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                          text: 'Aceptar\n',
                          options: FFButtonOptions(
                            width: 180.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Colors.transparent,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Satoshi',
                                  color: Color(0xDEF77E05),
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Color(0x8BF77E05),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.only(),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(1.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 5.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.asset(
                              'assets/images/Captura_de_pantalla_2024-01-19_194723.png',
                              width: 15.0,
                              height: 15.0,
                              fit: BoxFit.cover,
                              alignment: Alignment(0.0, 0.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
