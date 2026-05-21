import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/session_inactivity.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tipodepersonacredito_model.dart';
export 'tipodepersonacredito_model.dart';

class TipodepersonacreditoWidget extends StatefulWidget {
  const TipodepersonacreditoWidget({super.key});

  static String routeName = 'tipodepersonacredito';
  static String routePath = '/tipodepersonacredito';

  @override
  State<TipodepersonacreditoWidget> createState() =>
      _TipodepersonacreditoWidgetState();
}

class _TipodepersonacreditoWidgetState
    extends State<TipodepersonacreditoWidget> with SessionActivityOnInitMixin {
  late TipodepersonacreditoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TipodepersonacreditoModel());

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
          padding: EdgeInsetsDirectional.fromSTEB(
              0.0,
              valueOrDefault<double>(
                MediaQuery.sizeOf(context).height * 0.07584,
                64.0,
              ),
              0.0,
              0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FlutterFlowIconButton(
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.arrow_back,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                  Text(
                    'Tipo de persona',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Satoshi',
                          fontSize: valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.02133,
                            18.0,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ].divide(SizedBox(width: 8.0)),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 4.0,
                  decoration: BoxDecoration(
                    color: Color(0x0C262632),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: valueOrDefault<double>(
                          MediaQuery.sizeOf(context).width * 0.08974,
                          35.0,
                        ),
                        height: 4.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF002CE9),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        20.0,
                        valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.03792,
                          32.0,
                        ),
                        20.0,
                        0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.18010,
                            152.0,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(16.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).customColor5,
                              width: 1.0,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).width * 0.13333,
                                  52.0,
                                ),
                                height: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.06162,
                                  52.0,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: Image.asset(
                                      'assets/images/Frame_2609938.png',
                                    ).image,
                                  ),
                                ),
                              ),
                              Text(
                                'Asalariado',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Satoshi',
                                      fontSize: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.01896,
                                        16.0,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ].divide(SizedBox(
                                height: valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.01896,
                              16.0,
                            ))),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.18010,
                            152.0,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(16.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).customColor5,
                              width: 1.0,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).width * 0.13333,
                                  52.0,
                                ),
                                height: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.06162,
                                  52.0,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: Image.asset(
                                      'assets/images/Frame_2609938_(1).png',
                                    ).image,
                                  ),
                                ),
                              ),
                              Text(
                                'Independiente',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Satoshi',
                                      fontSize: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.01896,
                                        16.0,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ].divide(SizedBox(
                                height: valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.01896,
                              16.0,
                            ))),
                          ),
                        ),
                      ].divide(SizedBox(
                          height: valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.01896,
                        16.0,
                      ))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        20.0,
                        valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.06162,
                          52.0,
                        ),
                        20.0,
                        0.0),
                    child: FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: 'Continuar',
                      options: FFButtonOptions(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 48.0,
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
