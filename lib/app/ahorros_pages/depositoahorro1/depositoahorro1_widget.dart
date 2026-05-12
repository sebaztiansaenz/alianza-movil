import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'depositoahorro1_model.dart';
export 'depositoahorro1_model.dart';

class Depositoahorro1Widget extends StatefulWidget {
  const Depositoahorro1Widget({
    super.key,
    this.doc,
  });

  final AhorrosRecord? doc;

  @override
  State<Depositoahorro1Widget> createState() => _Depositoahorro1WidgetState();
}

class _Depositoahorro1WidgetState extends State<Depositoahorro1Widget> {
  late Depositoahorro1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Depositoahorro1Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
                    'assets/images/Group_96.png',
                    width: 28.0,
                    height: 41.0,
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
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.option = 'PSE';
                          safeSetState(() {});
                          _model.ahorroCopy = await queryAhorrosRecordOnce(
                            queryBuilder: (ahorrosRecord) =>
                                ahorrosRecord.where(
                              'UserID',
                              isEqualTo: currentUserReference?.id,
                            ),
                          );
                          if ((_model.ahorroCopy!
                                      .where((e) =>
                                          (e.savingsType ==
                                              'Linea de Ahorro de nómina') &&
                                          (e.ahorrosDocPdf1 != null &&
                                              e.ahorrosDocPdf1 != ''))
                                      .toList()
                                      .length >
                                  0) &&
                              (_model.ahorroCopy
                                      ?.where((e) =>
                                          (e.savingsType !=
                                              'Linea de Ahorro de nómina') &&
                                          (e.ahorrosDocPdf1 != null &&
                                              e.ahorrosDocPdf1 != ''))
                                      .toList()
                                      ?.length ==
                                  0)) {
                            context.pushNamed(
                              Retiro2newCopyCopyWidget.routeName,
                              extra: <String, dynamic>{
                                '__transition_info__': TransitionInfo(
                                  hasTransition: true,
                                  transitionType:
                                      PageTransitionType.rightToLeft,
                                ),
                              },
                            );
                          } else if (_model.ahorroCopy!
                                  .where((e) =>
                                      (e.savingsType !=
                                          'Linea de Ahorro de nómina') &&
                                      (e.ahorrosDocPdf1 != null &&
                                          e.ahorrosDocPdf1 != ''))
                                  .toList()
                                  .length >
                              0) {
                            context.pushNamed(
                              Retiro2newCopyWidget.routeName,
                              queryParameters: {
                                'ahorro': serializeParam(
                                  widget!.doc,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'ahorro': widget!.doc,
                                '__transition_info__': TransitionInfo(
                                  hasTransition: true,
                                  transitionType:
                                      PageTransitionType.rightToLeft,
                                ),
                              },
                            );
                          }

                          Navigator.pop(context);

                          safeSetState(() {});
                        },
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.09006,
                            76.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            border: Border.all(
                              color: Color(0xFFEEF1FA),
                              width: 1.0,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    14.0, 0.0, 0.0, 14.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 14.0, 0.0, 0.0),
                                          child: Container(
                                            width: 48.0,
                                            height: 48.0,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.asset(
                                                  'assets/images/Frame_2085662547.png',
                                                ).image,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(8.0),
                                                bottomLeft:
                                                    Radius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 14.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: AutoSizeText(
                                                  'Deposita por PSE',
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  minFontSize: 12.0,
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
                                                              0.01896,
                                                          16.0,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                              AutoSizeText(
                                                'Deposita desde otros bancos o billeteras.',
                                                textAlign: TextAlign.start,
                                                maxLines: 2,
                                                minFontSize: 8.0,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Satoshi',
                                                      color: Color(0xB2262632),
                                                      fontSize: valueOrDefault<
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
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 14.0, 0.0),
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 16.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(1.0, -1.0),
                                child: Image.asset(
                                  'assets/images/Frame_2085662540_(3).png',
                                  width: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).width * 0.12821,
                                    50.0,
                                  ),
                                  height: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.02607,
                                    22.0,
                                  ),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          0.0,
                          0.0,
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.01896,
                            16.0,
                          )),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          FFAppState().Savingtype = widget!.doc!.savingsType;
                          safeSetState(() {});
                          _model.option = 'PSE';
                          safeSetState(() {});
                          if ((_model.ahorroCopy!
                                      .where((e) =>
                                          (e.savingsType ==
                                              'Linea de Ahorro de nómina') &&
                                          (e.ahorrosDocPdf1 != null &&
                                              e.ahorrosDocPdf1 != ''))
                                      .toList()
                                      .length >
                                  0) &&
                              (_model.ahorroCopy
                                      ?.where((e) =>
                                          (e.savingsType !=
                                              'Linea de Ahorro de nómina') &&
                                          (e.ahorrosDocPdf1 != null &&
                                              e.ahorrosDocPdf1 != ''))
                                      .toList()
                                      ?.length ==
                                  0)) {
                            context.pushNamed(
                              Retiro2newCopyCopyWidget.routeName,
                              extra: <String, dynamic>{
                                '__transition_info__': TransitionInfo(
                                  hasTransition: true,
                                  transitionType:
                                      PageTransitionType.rightToLeft,
                                ),
                              },
                            );
                          } else if (_model.ahorroCopy!
                                  .where((e) =>
                                      (e.savingsType !=
                                          'Linea de Ahorro de nómina') &&
                                      (e.ahorrosDocPdf1 != null &&
                                          e.ahorrosDocPdf1 != ''))
                                  .toList()
                                  .length >
                              0) {
                            context.pushNamed(
                              Retiro2newCopyWidget.routeName,
                              queryParameters: {
                                'ahorro': serializeParam(
                                  widget!.doc,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'ahorro': widget!.doc,
                                '__transition_info__': TransitionInfo(
                                  hasTransition: true,
                                  transitionType:
                                      PageTransitionType.rightToLeft,
                                ),
                              },
                            );
                          }
                        },
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.09006,
                            76.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            border: Border.all(
                              color: Color(0xFFEEF1FA),
                              width: 1.0,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    14.0, 0.0, 0.0, 14.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 14.0, 0.0, 0.0),
                                      child: Container(
                                        width: 48.0,
                                        height: 48.0,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: Image.asset(
                                              'assets/images/Frame_2085662547_(1).png',
                                            ).image,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8.0),
                                            bottomLeft: Radius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 14.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: AutoSizeText(
                                              'Billeteras',
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              minFontSize: 12.0,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Satoshi',
                                                    fontSize:
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.01896,
                                                      16.0,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                          AutoSizeText(
                                            'Nequi, Daviplata.',
                                            textAlign: TextAlign.start,
                                            maxLines: 2,
                                            minFontSize: 8.0,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  color: Color(0xB2262632),
                                                  fontSize:
                                                      valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.01422,
                                                    12.0,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 14.0, 0.0),
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 16.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(1.0, -1.0),
                                child: Image.asset(
                                  'assets/images/Frame_2085662540_(3).png',
                                  width: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).width * 0.12821,
                                    50.0,
                                  ),
                                  height: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.02607,
                                    22.0,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.09006,
                        76.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        border: Border.all(
                          color: Color(0xFFEEF1FA),
                          width: 1.0,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                14.0, 0.0, 0.0, 14.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Opacity(
                                  opacity: 0.5,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 14.0, 0.0, 0.0),
                                    child: Container(
                                      width: 48.0,
                                      height: 48.0,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: Image.asset(
                                            'assets/images/Frame_2085662547_(2).png',
                                          ).image,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8.0),
                                          bottomLeft: Radius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Opacity(
                                  opacity: 0.5,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 14.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: AutoSizeText(
                                            'Deposita por llaves',
                                            textAlign: TextAlign.start,
                                            maxLines: 1,
                                            minFontSize: 12.0,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  fontSize:
                                                      valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.01896,
                                                    16.0,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                        AutoSizeText(
                                          'Desde otros bancos o billeteras.',
                                          textAlign: TextAlign.start,
                                          maxLines: 2,
                                          minFontSize: 8.0,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                color: Color(0xB2262632),
                                                fontSize:
                                                    valueOrDefault<double>(
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.01422,
                                                  12.0,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(1.0, -1.0),
                            child: Image.asset(
                              'assets/images/Frame_2085662540_(4).png',
                              width: valueOrDefault<double>(
                                MediaQuery.sizeOf(context).width * 0.23846,
                                93.0,
                              ),
                              height: valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.02607,
                                22.0,
                              ),
                              fit: BoxFit.cover,
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
