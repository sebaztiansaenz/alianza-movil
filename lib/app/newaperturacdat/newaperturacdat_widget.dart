import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'newaperturacdat_model.dart';
export 'newaperturacdat_model.dart';

class NewaperturacdatWidget extends StatefulWidget {
  const NewaperturacdatWidget({super.key});

  @override
  State<NewaperturacdatWidget> createState() => _NewaperturacdatWidgetState();
}

class _NewaperturacdatWidgetState extends State<NewaperturacdatWidget> {
  late NewaperturacdatModel _model;

  /// Cierra el [showDialog]. [navigatedAway] = true si ya se fue a otra pantalla.
  void _closeModal({bool navigatedAway = false}) {
    final navigator = Navigator.of(context, rootNavigator: true);
    if (navigator.canPop()) {
      navigator.pop(navigatedAway);
    }
  }

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewaperturacdatModel());

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
        width: valueOrDefault<double>(
          MediaQuery.sizeOf(context).width * 0.89744,
          350.0,
        ),
        height: valueOrDefault<double>(
          MediaQuery.sizeOf(context).height * 0.60072,
          507.0,
        ),
        decoration: BoxDecoration(
          color: Color(0xFFEEF1FA),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 18.0, 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      _closeModal();
                    },
                    child: Container(
                      width: 24.0,
                      height: 24.0,
                      decoration: BoxDecoration(),
                      child: Container(
                        width: valueOrDefault<double>(
                          MediaQuery.sizeOf(context).width * 0.04872,
                          19.0,
                        ),
                        height: 19.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(100.0),
                          border: Border.all(
                            color: Color(0xFF262632),
                          ),
                        ),
                        child: Icon(
                          Icons.close,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 15.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: valueOrDefault<double>(
                              MediaQuery.sizeOf(context).width * 0.81282,
                              317.0,
                            ),
                            height: valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.30569,
                              258.0,
                            ),
                            decoration: BoxDecoration(),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/Rectangle.png',
                                      width: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).width *
                                            0.82051,
                                        320.0,
                                      ),
                                      height: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.29147,
                                        246.0,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1.35, -1.03),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 19.0, 16.0, 4.0),
                                    child: Container(
                                      width: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).width *
                                            0.34103,
                                        133.0,
                                      ),
                                      height: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.10665,
                                        90.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0xFF002CE9),
                                        image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: Image.asset(
                                            'assets/images/Frame_2085662612.png',
                                          ).image,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1.09, 0.99),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 24.0, 16.0, 4.0),
                                    child: Container(
                                      width: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).width *
                                            0.27949,
                                        109.0,
                                      ),
                                      height: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.15522,
                                        131.0,
                                      ),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: Image.asset(
                                            'assets/images/Frame_2085662615.png',
                                          ).image,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: AutoSizeText(
                          '¡APERTURA TU CDAT!',
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          minFontSize: 18.0,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Satoshi',
                                color: Color(0xFF002CE9),
                                fontSize: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.02844,
                                  24.0,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w900,
                              ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: AutoSizeText(
                            '¡Tu futuro comienza hoy!',
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            minFontSize: 10.0,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Satoshi',
                                  fontSize: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.01659,
                                    14.0,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      18.0,
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.04266,
                        36.0,
                      ),
                      0.0,
                      0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      _closeModal(navigatedAway: true);
                      if (!context.mounted) return;
                      context.goNamed(
                        MisinversionesWidget.routeName,
                        extra: <String, dynamic>{
                          '__transition_info__': TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.rightToLeft,
                          ),
                        },
                      );
                    },
                    text: 'Aperturar ahora',
                    options: FFButtonOptions(
                      width: 318.0,
                      height: valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.05688,
                        48.0,
                      ),
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFF002CE9),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Satoshi',
                                color: Colors.white,
                                fontSize: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.01659,
                                  14.0,
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
          ),
        ),
      ),
    );
  }
}
