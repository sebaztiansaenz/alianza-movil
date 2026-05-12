import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'depositar_retiro_bottom_sheet_ahorro_model.dart';
export 'depositar_retiro_bottom_sheet_ahorro_model.dart';

class DepositarRetiroBottomSheetAhorroWidget extends StatefulWidget {
  const DepositarRetiroBottomSheetAhorroWidget({
    super.key,
    required this.ahorrosRef,
  });

  final DocumentReference? ahorrosRef;

  @override
  State<DepositarRetiroBottomSheetAhorroWidget> createState() =>
      _DepositarRetiroBottomSheetAhorroWidgetState();
}

class _DepositarRetiroBottomSheetAhorroWidgetState
    extends State<DepositarRetiroBottomSheetAhorroWidget> {
  late DepositarRetiroBottomSheetAhorroModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => DepositarRetiroBottomSheetAhorroModel());

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
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    0.0,
                    valueOrDefault<double>(
                      MediaQuery.sizeOf(context).height * 0.02844,
                      24.0,
                    ),
                    0.0,
                    0.0),
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
                padding: EdgeInsetsDirectional.fromSTEB(
                    0.0,
                    valueOrDefault<double>(
                      MediaQuery.sizeOf(context).height * 0.03792,
                      32.0,
                    ),
                    0.0,
                    0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/Frame_(45).png',
                    width: 32.0,
                    height: 32.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: AutoSizeText(
                  'Método para depositar',
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
                padding: EdgeInsetsDirectional.fromSTEB(
                    0.0,
                    valueOrDefault<double>(
                      MediaQuery.sizeOf(context).height * 0.02370,
                      20.0,
                    ),
                    0.0,
                    valueOrDefault<double>(
                      MediaQuery.sizeOf(context).height * 0.07110,
                      60.0,
                    )),
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          0.0,
                          0.0,
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.01896,
                            16.0,
                          )),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.09006,
                          76.0,
                        ),
                        decoration: BoxDecoration(),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.option = 'PSE';
                            safeSetState(() {});
                            await Future.delayed(
                              Duration(
                                milliseconds: 1000,
                              ),
                            );
                            Navigator.pop(context);

                            context.pushNamed(
                              AhorroDepositarWidget.routeName,
                              extra: <String, dynamic>{
                                '__transition_info__': TransitionInfo(
                                  hasTransition: true,
                                  transitionType:
                                      PageTransitionType.rightToLeft,
                                ),
                              },
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 86.0,
                                height: 76.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF002CE9),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8.0),
                                    bottomLeft: Radius.circular(8.0),
                                  ),
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.all(valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.01896,
                                    16.0,
                                  )),
                                  child: Image.asset(
                                    'assets/images/Group_118.png',
                                    width: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).width *
                                          0.15385,
                                      60.0,
                                    ),
                                    height: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.02370,
                                      20.0,
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 0.0, 0.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 76.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .customColor5,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(8.0),
                                        bottomRight: Radius.circular(8.0),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 8.0, 12.0, 8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              AutoSizeText(
                                                'Depósita por PSE',
                                                textAlign: TextAlign.start,
                                                maxLines: 1,
                                                minFontSize: 12.0,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          fontSize:
                                                              valueOrDefault<
                                                                  double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.01896,
                                                            16.0,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              Icon(
                                                Icons.keyboard_arrow_right,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: AutoSizeText(
                                                  'Deposita desde otros bancos o billeteras.',
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
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF44AB5C),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 2.0, 4.0, 2.0),
                                                  child: AutoSizeText(
                                                    'Gratis',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize:
                                                              valueOrDefault<
                                                                  double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.01185,
                                                            10.0,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.09006,
                        76.0,
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 86.0,
                                  height: 76.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x41002CE9),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      bottomLeft: Radius.circular(8.0),
                                    ),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.all(valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.01896,
                                      16.0,
                                    )),
                                    child: Image.asset(
                                      'assets/images/Group_119.png',
                                      width: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).width *
                                            0.15385,
                                        60.0,
                                      ),
                                      height: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.02370,
                                        20.0,
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 76.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x4EEEF1FA),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(8.0),
                                          bottomRight: Radius.circular(8.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 8.0, 12.0, 8.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                AutoSizeText(
                                                  'Depositar con llaves',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Satoshi',
                                                        color:
                                                            Color(0x67262632),
                                                        fontSize:
                                                            valueOrDefault<
                                                                double>(
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .height *
                                                              0.01896,
                                                          16.0,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: AutoSizeText(
                                                    'Deposita desde otros bancos o billeteras.',
                                                    textAlign: TextAlign.start,
                                                    maxLines: 2,
                                                    minFontSize: 8.0,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color:
                                                              Color(0x59262632),
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
                                                Opacity(
                                                  opacity: 0.5,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF44AB5C),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  2.0,
                                                                  4.0,
                                                                  2.0),
                                                      child: AutoSizeText(
                                                        'Gratis',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Satoshi',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  fontSize:
                                                                      valueOrDefault<
                                                                          double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.01185,
                                                                    10.0,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 8.0, 0.0),
                              child: Image.asset(
                                'assets/images/path250.png',
                                width: 100.0,
                                height: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.02370,
                                  20.0,
                                ),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.91, -0.94),
                            child: Text(
                              'PRÓXIMAMENTE',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Satoshi',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.01185,
                                      10.0,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ],
                      ),
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
