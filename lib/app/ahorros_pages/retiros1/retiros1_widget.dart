import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'retiros1_model.dart';
export 'retiros1_model.dart';

class Retiros1Widget extends StatefulWidget {
  const Retiros1Widget({super.key});

  @override
  State<Retiros1Widget> createState() => _Retiros1WidgetState();
}

class _Retiros1WidgetState extends State<Retiros1Widget> {
  late Retiros1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Retiros1Model());

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
        width: MediaQuery.sizeOf(context).width * 1.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                  child: Container(
                    width: 32.0,
                    height: 4.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).customColor5,
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 28.0, 0.0, 0.0),
                  child: Image.asset(
                    'assets/images/Frame_98_(1).png',
                    width: 36.0,
                    height: valueOrDefault<double>(
                      MediaQuery.sizeOf(context).height * 0.03792,
                      32.0,
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: AutoSizeText(
                    'Método para Transferir',
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    minFontSize: 16.0,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Satoshi',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.02370,
                            20.0,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 30.0),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Navigator.pop(context);

                          context.pushNamed(
                            Retiro2newWidget.routeName,
                            extra: <String, dynamic>{
                              '__transition_info__': TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 300),
                              ),
                            },
                          );
                        },
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 76.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            border: Border.all(
                              color: Color(0xFFEEF1FA),
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                14.0, 0.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 48.0,
                                  height: 48.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.asset(
                                        'assets/images/Frame_2085662547_(4).png',
                                      ).image,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      bottomLeft: Radius.circular(8.0),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            AutoSizeText(
                                              'Transferencia bancaria',
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              minFontSize: 12.0,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Satoshi',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        Flexible(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Flexible(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 4.0, 0.0),
                                                  child: AutoSizeText(
                                                    'Banco y billeteras 1-3 diás hábiles.',
                                                    textAlign: TextAlign.start,
                                                    maxLines: 2,
                                                    minFontSize: 8.0,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          fontSize:
                                                              valueOrDefault<
                                                                  double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.01422,
                                                            12.0,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image.asset(
                                      'assets/images/Frame_2085662540_(6).png',
                                      width: 50.0,
                                      height: 22.0,
                                      fit: BoxFit.cover,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      color: Color(0xC9262632),
                                      size: 16.0,
                                    ),
                                  ].divide(SizedBox(height: 8.0)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Opacity(
                        opacity: 0.5,
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 76.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            border: Border.all(
                              color: Color(0xFFEEF1FA),
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                14.0, 0.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 48.0,
                                  height: 48.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.asset(
                                        'assets/images/Frame_2085662547_(5).png',
                                      ).image,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      bottomLeft: Radius.circular(8.0),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            AutoSizeText(
                                              'Envío por llaves',
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              minFontSize: 12.0,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Satoshi',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        Flexible(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Flexible(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 4.0, 0.0),
                                                  child: AutoSizeText(
                                                    'Envía a otros bancos o billeteras.',
                                                    textAlign: TextAlign.start,
                                                    maxLines: 2,
                                                    minFontSize: 8.0,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          fontSize:
                                                              valueOrDefault<
                                                                  double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.01422,
                                                            12.0,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image.asset(
                                      'assets/images/Frame_2085662540_(7).png',
                                      width: 93.0,
                                      height: 22.0,
                                      fit: BoxFit.cover,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      color: Color(0xC9262632),
                                      size: 16.0,
                                    ),
                                  ].divide(SizedBox(height: 8.0)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Opacity(
                        opacity: 0.5,
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 76.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            border: Border.all(
                              color: Color(0xFFEEF1FA),
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                14.0, 0.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 48.0,
                                  height: 48.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.asset(
                                        'assets/images/Frame_2085662547_(6).png',
                                      ).image,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      bottomLeft: Radius.circular(8.0),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            AutoSizeText(
                                              'Entre mis cuentas',
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              minFontSize: 12.0,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Satoshi',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        Flexible(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Flexible(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 4.0, 0.0),
                                                  child: AutoSizeText(
                                                    'Texto secundario.',
                                                    textAlign: TextAlign.start,
                                                    maxLines: 2,
                                                    minFontSize: 8.0,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          fontSize:
                                                              valueOrDefault<
                                                                  double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.01422,
                                                            12.0,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image.asset(
                                      'assets/images/Frame_2085662540_(7).png',
                                      width: 93.0,
                                      height: 22.0,
                                      fit: BoxFit.cover,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      color: Color(0xC9262632),
                                      size: 16.0,
                                    ),
                                  ].divide(SizedBox(height: 8.0)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Opacity(
                        opacity: 0.5,
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 76.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            border: Border.all(
                              color: Color(0xFFEEF1FA),
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                14.0, 0.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 48.0,
                                  height: 48.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.asset(
                                        'assets/images/Frame_2085662547_(7).png',
                                      ).image,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      bottomLeft: Radius.circular(8.0),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            AutoSizeText(
                                              'Amigos Alianza',
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              minFontSize: 12.0,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Satoshi',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        Flexible(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Flexible(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 4.0, 0.0),
                                                  child: AutoSizeText(
                                                    'Entre usuarios Alianza Capital.',
                                                    textAlign: TextAlign.start,
                                                    maxLines: 2,
                                                    minFontSize: 8.0,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          fontSize:
                                                              valueOrDefault<
                                                                  double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.01422,
                                                            12.0,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image.asset(
                                      'assets/images/Frame_2085662540_(7).png',
                                      width: 93.0,
                                      height: 22.0,
                                      fit: BoxFit.cover,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      color: Color(0xC9262632),
                                      size: 16.0,
                                    ),
                                  ].divide(SizedBox(height: 8.0)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 16.0)),
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
