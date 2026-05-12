import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'c_d_a_t_component01_model.dart';
export 'c_d_a_t_component01_model.dart';

class CDATComponent01Widget extends StatefulWidget {
  const CDATComponent01Widget({super.key});

  @override
  State<CDATComponent01Widget> createState() => _CDATComponent01WidgetState();
}

class _CDATComponent01WidgetState extends State<CDATComponent01Widget> {
  late CDATComponent01Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CDATComponent01Model());

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
        width: double.infinity,
        height: 420.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 20.0, 12.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.close,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Image.asset(
                  'assets/images/Frame2.png',
                  width: 40.0,
                  height: 40.0,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Text(
                  '¡CALCULA TU RENTABILIDAD!',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Satoshi',
                        fontSize: 12.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: Text(
                    'Selecciona el plazo',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Satoshi',
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).tertiary,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '6 meses',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Satoshi',
                              color: FlutterFlowTheme.of(context).secondary,
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                      SizedBox(
                        height: 200.0,
                        child: VerticalDivider(
                          thickness: 2.0,
                          color: FlutterFlowTheme.of(context).secondary,
                        ),
                      ),
                      Text(
                        '12 meses',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Satoshi',
                              color: FlutterFlowTheme.of(context).secondary,
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                  child: Text(
                    '¿Cuanto dinero deseas invertir?',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Satoshi',
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
              SliderTheme(
                data: SliderThemeData(
                  showValueIndicator: ShowValueIndicator.always,
                ),
                child: Slider(
                  activeColor: FlutterFlowTheme.of(context).secondary,
                  inactiveColor: FlutterFlowTheme.of(context).alternate,
                  min: 0.0,
                  max: 10.0,
                  value: _model.sliderValue ??= 5.0,
                  label: _model.sliderValue?.toStringAsFixed(2),
                  onChanged: (newValue) {
                    newValue = double.parse(newValue.toStringAsFixed(2));
                    safeSetState(() => _model.sliderValue = newValue);
                  },
                ),
              ),
              Container(
                width: 120.0,
                height: 30.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                        child: Text(
                          '10.000.000',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Satoshi',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ),
                    Container(
                      width: 120.0,
                      height: 3.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondary,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional(1.0, -1.0),
                      children: [
                        FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: 'Continuar',
                          options: FFButtonOptions(
                            width: 160.0,
                            height: 30.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Colors.white,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Satoshi',
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).tertiary,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.only(),
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
                                'assets/images/27.png',
                                width: 15.0,
                                height: 15.0,
                                fit: BoxFit.cover,
                                alignment: Alignment(1.0, -1.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
