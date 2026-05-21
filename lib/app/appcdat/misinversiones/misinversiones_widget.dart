import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'misinversiones_model.dart';
export 'misinversiones_model.dart';

class MisinversionesWidget extends StatefulWidget {
  const MisinversionesWidget({
    super.key,
    this.cdat,
    this.pendienteretiro,
  });

  final CdatsRecord? cdat;
  final ConfirmacionretirosRecord? pendienteretiro;

  static String routeName = 'MISINVERSIONES';
  static String routePath = '/misinversiones';

  @override
  State<MisinversionesWidget> createState() => _MisinversionesWidgetState();
}

class _MisinversionesWidgetState extends State<MisinversionesWidget> {
  late MisinversionesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MisinversionesModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().lastAction = getCurrentTimestamp;
      safeSetState(() {});
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 10000),
        callback: (timer) async {
          if (functions.past5Mins(FFAppState().lastAction!)) {
            GoRouter.of(context).prepareAuthEvent();
            await authManager.signOut();
            GoRouter.of(context).clearRedirectLocation();

            context.goNamedAuth(
                CierredeSesionWidget.routeName, context.mounted);

            _model.instantTimer?.cancel();
          }
        },
        startImmediately: false,
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<CdatsRecord>>(
      stream: currentUserReference != null
          ? queryCdatsRecord(
              queryBuilder: (cdatsRecord) => cdatsRecord.where(
                'Idusuario',
                isEqualTo: currentUserReference,
              ),
            )
          : Stream.value(const <CdatsRecord>[]),
      builder: (context, snapshot) {
        if (!snapshot.hasData && !snapshot.hasError) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final List<CdatsRecord> misinversionesCdatsRecordList =
            snapshot.hasData ? snapshot.data! : const <CdatsRecord>[];

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: custom_widgets.FloatingNavBarScrollScope(
              child: Stack(
              children: [
                custom_widgets.FloatingNavBarScrollListener(
                  child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    StreamBuilder<List<CdatsRecord>>(
                      stream: currentUserReference != null
                          ? queryCdatsRecord(
                              queryBuilder: (cdatsRecord) => cdatsRecord.where(
                                'Idusuario',
                                isEqualTo: currentUserReference,
                              ),
                            )
                          : Stream.value(const <CdatsRecord>[]),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData && !snapshot.hasError) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        final List<CdatsRecord> containerCdatsRecordList =
                            snapshot.hasData
                                ? snapshot.data!
                                : const <CdatsRecord>[];

                        return Container(
                          decoration: BoxDecoration(
                            color: Color(0xB1FFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0,
                                      valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.07584,
                                        64.0,
                                      ),
                                      0.0,
                                      21.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Hola,',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          AuthUserStreamWidget(
                                            builder: (context) => Text(
                                              valueOrDefault<String>(
                                                currentUserDisplayName,
                                                '- - -',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Satoshi',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 2.0)),
                                      ),
                                      Flexible(
                                        child:
                                            StreamBuilder<List<AhorrosRecord>>(
                                          stream: currentUserReference != null
                                              ? queryAhorrosRecord(
                                                  queryBuilder:
                                                      (ahorrosRecord) =>
                                                          ahorrosRecord.where(
                                                    'user',
                                                    isEqualTo:
                                                        currentUserReference,
                                                  ),
                                                )
                                              : Stream.value(
                                                  const <AhorrosRecord>[]),
                                          builder: (context, snapshot) {
                                            if (!snapshot.hasData &&
                                                !snapshot.hasError) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            final List<AhorrosRecord>
                                                containerAhorrosRecordList =
                                                (snapshot.hasData
                                                        ? snapshot.data!
                                                        : const <
                                                            AhorrosRecord>[])
                                                    .where((e) => e
                                                        .ahorrosDocPdf1
                                                        .isNotEmpty)
                                                    .toList();

                                            return Container(
                                              width: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .width *
                                                    0.27179,
                                                106.0,
                                              ),
                                              height: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .height *
                                                    0.04147,
                                                35.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Color(0xFF002CE9),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: 18.0,
                                                      height: 18.0,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          fit: BoxFit.contain,
                                                          image: Image.asset(
                                                            'assets/images/Frame_(36).png',
                                                          ).image,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: AutoSizeText(
                                                        valueOrDefault<String>(
                                                          functions.formatAmount(
                                                              valueOrDefault<
                                                                  double>(
                                                            functions.sumarbeneficioscdat(
                                                                    containerCdatsRecordList
                                                                        .toList(),
                                                                    getCurrentTimestamp) +
                                                                valueOrDefault<
                                                                    double>(
                                                                  functions.ahorroBenefitsTotal(
                                                                      containerAhorrosRecordList
                                                                          .toList()),
                                                                  0.0,
                                                                ),
                                                            0.0,
                                                          )),
                                                          '\$ 0',
                                                        ),
                                                        minFontSize: 10.0,
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
                                                                        0.01659,
                                                                    14.0,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 8.0)),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                      height: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.06162,
                                        52.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .customColor5,
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        border: Border.all(
                                          color: Color(0xFFE8EBF3),
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  AHORROSPage1CopyCopyWidget
                                                      .routeName,
                                                  extra: <String, dynamic>{
                                                    '__transition_info__':
                                                        TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                      duration: Duration(
                                                          milliseconds: 0),
                                                    ),
                                                  },
                                                );
                                              },
                                              child: Container(
                                                height: 44.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .customColor5,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .customColor5,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    'Ahorro',
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
                                                                0.01659,
                                                            14.0,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            ),
                                            Expanded(
                                              child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  InvertirahorrosCopyCopyWidget
                                                      .routeName,
                                                  extra: <String, dynamic>{
                                                    '__transition_info__':
                                                        TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                      duration: Duration(
                                                          milliseconds: 0),
                                                    ),
                                                  },
                                                );
                                              },
                                              child: Container(
                                                height: 44.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .customColor5,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .customColor5,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    'Crédito',
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
                                                                0.01659,
                                                            14.0,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
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
                                    SizedBox(width: 8.0),
                                    Expanded(
                                      child: Container(
                                      height: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.06162,
                                        52.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .customColor4,
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                        border: Border.all(
                                          color: Color(0x3FFF6700),
                                          width: 1.5,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              width: 20.0,
                                              height: 20.0,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.contain,
                                                  image: Image.asset(
                                                    'assets/images/Frame_2085664384_(1).png',
                                                  ).image,
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: Text(
                                                'Inversión',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Satoshi',
                                                      color: FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                      fontSize:
                                                          valueOrDefault<double>(
                                                        MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                            0.01659,
                                                        14.0,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                      ),
                                    ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    Flexible(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0,
                                  valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.02962,
                                    25.0,
                                  ),
                                  20.0,
                                  0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).secondary,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.asset(
                                      'assets/images/cf43bb702e21163187af577f4a7dd3e1dbd8a19a.png',
                                    ).image,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.all(valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.02370,
                                        20.0,
                                      )),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: Text(
                                              'Capital',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Satoshi',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    fontSize:
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.01659,
                                                      14.0,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          AutoSizeText(
                                            valueOrDefault<String>(
                                              functions.formatAmount(
                                                  valueOrDefault<double>(
                                                functions.sumaTotal(
                                                    misinversionesCdatsRecordList
                                                        .map((e) =>
                                                            valueOrDefault<
                                                                double>(
                                                              e.inversion,
                                                              0.0,
                                                            ))
                                                        .toList()),
                                                0.0,
                                              )),
                                              '\$ 0',
                                            ),
                                            minFontSize: 18.0,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  fontSize:
                                                      valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.04266,
                                                    36.0,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 6.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    width: 100.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: AutoSizeText(
                                                            'Historico de Beneficios',
                                                            textAlign:
                                                                TextAlign.start,
                                                            maxLines: 1,
                                                            minFontSize: 8.0,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Satoshi',
                                                                  color: Color(
                                                                      0xCCFFFFFF),
                                                                  fontSize:
                                                                      valueOrDefault<
                                                                          double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.01422,
                                                                    12.0,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 18.0,
                                                              height: 18.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .contain,
                                                                  image: Image
                                                                      .asset(
                                                                    'assets/images/Frame_(40).png',
                                                                  ).image,
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child:
                                                                  AutoSizeText(
                                                                valueOrDefault<
                                                                    String>(
                                                                  '${valueOrDefault<String>(
                                                                    functions.formatAmount(functions.sumarbeneficioscdat(
                                                                        misinversionesCdatsRecordList
                                                                            .toList(),
                                                                        getCurrentTimestamp)),
                                                                    '\$ 0',
                                                                  )}',
                                                                  '\$ 0',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                maxLines: 1,
                                                                minFontSize:
                                                                    10.0,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Satoshi',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .customColor4,
                                                                      fontSize:
                                                                          valueOrDefault<
                                                                              double>(
                                                                        MediaQuery.sizeOf(context).height *
                                                                            0.01896,
                                                                        16.0,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0,
                                  valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.02844,
                                    24.0,
                                  ),
                                  20.0,
                                  0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AutoSizeText(
                                    'Mis CDAT',
                                    textAlign: TextAlign.start,
                                    maxLines: 1,
                                    minFontSize: 10.0,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.01659,
                                            14.0,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w800,
                                        ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        InvertirahorrosCopyWidget.routeName,
                                        queryParameters: {
                                          'cdat': serializeParam(
                                            widget!.cdat,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'cdat': widget!.cdat,
                                        },
                                      );
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  14.0, 0.0, 0.0, 0.0),
                                          child: Icon(
                                            Icons.add,
                                            color: FlutterFlowTheme.of(context)
                                                .customColor4,
                                            size: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.02844,
                                              24.0,
                                            ),
                                          ),
                                        ),
                                        AutoSizeText(
                                          'Aperturar CDAT',
                                          textAlign: TextAlign.end,
                                          maxLines: 1,
                                          minFontSize: 10.0,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                fontSize:
                                                    valueOrDefault<double>(
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.01659,
                                                  14.0,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (valueOrDefault<bool>(
                              misinversionesCdatsRecordList.length > 0,
                              false,
                            ))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0,
                                    valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.01422,
                                      12.0,
                                    ),
                                    0.0,
                                    0.0),
                                child: Builder(
                                  builder: (context) {
                                    final cdatss = misinversionesCdatsRecordList
                                        .sortedList(
                                          keyOf: (e) =>
                                              e.fechaApertura ??
                                              DateTime.fromMillisecondsSinceEpoch(
                                                  0),
                                          desc: true,
                                        )
                                        .toList();

                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: List.generate(cdatss.length,
                                            (cdatssIndex) {
                                          final cdatssItem =
                                              cdatss[cdatssIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (cdatssItem.firmado ==
                                                    true) {
                                                  context.pushNamed(
                                                    VERMAScdatWidget.routeName,
                                                    queryParameters: {
                                                      'cdat': serializeParam(
                                                        cdatssItem,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'cdat': cdatssItem,
                                                      '__transition_info__':
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .rightToLeft,
                                                        duration: Duration(
                                                            milliseconds: 500),
                                                      ),
                                                    },
                                                  );
                                                } else {
                                                  context.pushNamed(
                                                    SolicitudcdatWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'cdats': serializeParam(
                                                        cdatssItem,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'cdats': cdatssItem,
                                                      '__transition_info__':
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .rightToLeft,
                                                        duration: Duration(
                                                            milliseconds: 500),
                                                      ),
                                                    },
                                                  );
                                                }
                                              },
                                              child: Container(
                                                width: valueOrDefault<double>(
                                                  MediaQuery.sizeOf(context)
                                                          .width *
                                                      0.75641,
                                                  295.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 25.0,
                                                      color: Color(0x14000000),
                                                      offset: Offset(
                                                        0.0,
                                                        12.0,
                                                      ),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          17.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .customColor5,
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Opacity(
                                                          opacity:
                                                              valueOrDefault<
                                                                  double>(
                                                            cdatssItem.firmado ==
                                                                    true
                                                                ? 1.0
                                                                : 0.5,
                                                            0.5,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    valueOrDefault<
                                                                        double>(
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.01659,
                                                              14.0,
                                                            )),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Image.asset(
                                                                      'assets/images/Group_75.png',
                                                                      width:
                                                                          16.0,
                                                                      height:
                                                                          16.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                    Text(
                                                                      'CDAT',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Satoshi',
                                                                            color:
                                                                                Color(0xFF002CE9),
                                                                            fontSize:
                                                                                valueOrDefault<double>(
                                                                              MediaQuery.sizeOf(context).height * 0.01659,
                                                                              14.0,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          6.0)),
                                                                ),
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    cdatssItem
                                                                        .idCdat
                                                                        .toString(),
                                                                    '- - - ',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Satoshi',
                                                                        color: Color(
                                                                            0xB3262632),
                                                                        fontSize:
                                                                            valueOrDefault<double>(
                                                                          MediaQuery.sizeOf(context).height *
                                                                              0.01422,
                                                                          12.0,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        functions
                                                                            .formatAmount(cdatssItem.inversion),
                                                                        ' \$ 0',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Satoshi',
                                                                            color:
                                                                                Color(0xFF002CE9),
                                                                            fontSize:
                                                                                valueOrDefault<double>(
                                                                              MediaQuery.sizeOf(context).height * 0.02844,
                                                                              24.0,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w900,
                                                                          ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Text(
                                                                          'Beneficios: ',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Satoshi',
                                                                                fontSize: valueOrDefault<double>(
                                                                                  MediaQuery.sizeOf(context).height * 0.01422,
                                                                                  12.0,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.formatAmount(valueOrDefault<double>(
                                                                              functions.sumarbeneficioscdatCopys(
                                                                              cdatssItem.fechaApertura ?? DateTime.fromMillisecondsSinceEpoch(0),
                                                                              cdatssItem.ganancias,
                                                                              cdatssItem.tiempo,
                                                                              getCurrentTimestamp,
                                                                            ),
                                                                              0.0,
                                                                            )),
                                                                            '\$ 0',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Satoshi',
                                                                                color: Color(0xFF002CE9),
                                                                                fontSize: valueOrDefault<double>(
                                                                                  MediaQuery.sizeOf(context).height * 0.01422,
                                                                                  12.0,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 6.0)),
                                                            ),
                                                          ),
                                                        ),
                                                        if (cdatssItem
                                                                .firmado ==
                                                            true)
                                                          Opacity(
                                                            opacity:
                                                                valueOrDefault<
                                                                    double>(
                                                              cdatssItem.firmado ==
                                                                      true
                                                                  ? 1.0
                                                                  : 0.5,
                                                              0.5,
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 1.0),
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  gradient:
                                                                      LinearGradient(
                                                                    colors: [
                                                                      Color(
                                                                          0x1AEEF1FA),
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .customColor5
                                                                    ],
                                                                    stops: [
                                                                      0.0,
                                                                      1.0
                                                                    ],
                                                                    begin:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                    end: AlignmentDirectional(
                                                                        0, 1.0),
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            16.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            16.0),
                                                                  ),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor5,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          14.0,
                                                                          6.0,
                                                                          14.0,
                                                                          6.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        'Activo',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Satoshi',
                                                                              fontSize: valueOrDefault<double>(
                                                                                MediaQuery.sizeOf(context).height * 0.01422,
                                                                                12.0,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Text(
                                                                            'Ver más',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Satoshi',
                                                                                  color: FlutterFlowTheme.of(context).customColor4,
                                                                                  fontSize: valueOrDefault<double>(
                                                                                    MediaQuery.sizeOf(context).height * 0.01422,
                                                                                    12.0,
                                                                                  ),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                          Icon(
                                                                            Icons.arrow_forward,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).customColor4,
                                                                            size:
                                                                                16.0,
                                                                          ),
                                                                        ].divide(SizedBox(width: 4.0)),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        if (cdatssItem
                                                                .firmado ==
                                                            false)
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 1.0),
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                gradient:
                                                                    LinearGradient(
                                                                  colors: [
                                                                    Color(
                                                                        0x1AEEF1FA),
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor5
                                                                  ],
                                                                  stops: [
                                                                    0.0,
                                                                    1.0
                                                                  ],
                                                                  begin:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          -1.0),
                                                                  end:
                                                                      AlignmentDirectional(
                                                                          0,
                                                                          1.0),
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          16.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          16.0),
                                                                ),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .customColor5,
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            14.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Expanded(
                                                                      flex: 6,
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            image:
                                                                                DecorationImage(
                                                                              fit: BoxFit.cover,
                                                                              image: Image.network(
                                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/9ballwktq383/Forma_2_1.png',
                                                                              ).image,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 6.0),
                                                                              child: Text(
                                                                                'Iniciar firma',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Satoshi',
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      fontSize: valueOrDefault<double>(
                                                                                        MediaQuery.sizeOf(context).height * 0.01422,
                                                                                        12.0,
                                                                                      ),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 3,
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children:
                                                                            [
                                                                          Text(
                                                                            'Ver más',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Satoshi',
                                                                                  color: FlutterFlowTheme.of(context).customColor4,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                          Icon(
                                                                            Icons.arrow_forward,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).customColor4,
                                                                            size:
                                                                                16.0,
                                                                          ),
                                                                        ].divide(SizedBox(width: 4.0)),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                    Opacity(
                                                      opacity: valueOrDefault<
                                                          double>(
                                                        cdatssItem.firmado ==
                                                                true
                                                            ? 1.0
                                                            : 0.5,
                                                        0.5,
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, -1.0),
                                                        child: Container(
                                                          width: 72.0,
                                                          height: 24.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            image:
                                                                DecorationImage(
                                                              fit: BoxFit
                                                                  .contain,
                                                              image:
                                                                  Image.network(
                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/7s5m7urx252h/Frame_2085662799_1.png',
                                                              ).image,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        5.0),
                                                            child: Text(
                                                              '${valueOrDefault<String>(
                                                                cdatssItem.ea
                                                                    .toString(),
                                                                '0',
                                                              )}% E.A.',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                                          0.01303,
                                                                      11.0,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }).divide(SizedBox(width: 16.0)),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            if (misinversionesCdatsRecordList.length == 0)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0,
                                    valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.01422,
                                      12.0,
                                    ),
                                    20.0,
                                    0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: (MediaQuery.sizeOf(context).height *
                                            0.26)
                                        .clamp(200.0, 320.0)
                                        .toDouble(),
                                    child: Image.network(
                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/tl3shshw2p5j/cdat.png',
                                      fit: BoxFit.cover,
                                      alignment: Alignment.center,
                                      width: double.infinity,
                                      height: double.infinity,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Container(
                                          color: Color(0xFF002CE9),
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(24.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(
                                                Icons.savings_outlined,
                                                size: 48.0,
                                                color: Colors.white
                                                    .withOpacity(0.9),
                                              ),
                                              SizedBox(height: 12.0),
                                              Text(
                                                'Aún no tienes CDAT',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleMedium
                                                    .override(
                                                      fontFamily: 'Satoshi',
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                              SizedBox(height: 6.0),
                                              Text(
                                                'Crea uno con + Aperturar CDAT',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodySmall
                                                    .override(
                                                      fontFamily: 'Satoshi',
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground
                                                          .withOpacity(0.85),
                                                    ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0,
                                  valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.04740,
                                    40.0,
                                  ),
                                  0.0,
                                  valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.04740,
                                    40.0,
                                  )),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        InvertirahorrosWidget.routeName,
                                        queryParameters: {
                                          'cdat': serializeParam(
                                            widget!.cdat,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'cdat': widget!.cdat,
                                          '__transition_info__': TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.rightToLeft,
                                          ),
                                        },
                                      );
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width *
                                                0.13333,
                                            52.0,
                                          ),
                                          height: 52.0,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.network(
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/9tu1nk4zlu25/Frame_2609937_(12).png',
                                              ).image,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Invertir',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                fontSize:
                                                    valueOrDefault<double>(
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.01659,
                                                  14.0,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ].divide(SizedBox(height: 8.0)),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        SimuladorCdatStandaloneWidget.routeName,
                                        extra: <String, dynamic>{
                                          '__transition_info__': TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.rightToLeft,
                                          ),
                                        },
                                      );
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width *
                                                0.13333,
                                            52.0,
                                          ),
                                          height: 52.0,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.network(
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/8qf37jgjzvo8/Frame_2609937_(3).png',
                                              ).image,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Simulador',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                fontSize:
                                                    valueOrDefault<double>(
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.01659,
                                                  14.0,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ].divide(SizedBox(height: 8.0)),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: 0.5,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width *
                                                0.13333,
                                            52.0,
                                          ),
                                          height: 52.0,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.network(
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/uto7zwrrqxvj/Frame_2609937_(4).png',
                                              ).image,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Historial',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                fontSize:
                                                    valueOrDefault<double>(
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.01659,
                                                  14.0,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ].divide(SizedBox(height: 8.0)),
                                    ),
                                  ),
                                ].divide(SizedBox(
                                    width: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).width * 0.11282,
                                  44.0,
                                ))),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 27.0),
                                      child: Text(
                                        'Renta variable',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                    Opacity(
                                      opacity: 0.5,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 14.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.08295,
                                            70.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 24.0,
                                                color: Color(0x0E000000),
                                                offset: Offset(
                                                  0.0,
                                                  12.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(14.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    14.0, 0.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: 55.0,
                                                      height: valueOrDefault<
                                                          double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .height *
                                                            0.05688,
                                                        48.0,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        image: DecorationImage(
                                                          fit: BoxFit.contain,
                                                          image: Image.asset(
                                                            'assets/images/Frame_2085662547_(22).png',
                                                          ).image,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Acciones americanas',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Satoshi',
                                                                  fontSize:
                                                                      valueOrDefault<
                                                                          double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.01659,
                                                                    14.0,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                          Text(
                                                            'Define tu monto de inversión.',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Satoshi',
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    child: Image.asset(
                                                      'assets/images/Frame_2085662540_(14).png',
                                                      width: 83.0,
                                                      height: valueOrDefault<
                                                          double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .height *
                                                            0.02607,
                                                        22.0,
                                                      ),
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Opacity(
                                      opacity: 0.5,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 14.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.08295,
                                            70.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 24.0,
                                                color: Color(0x0E000000),
                                                offset: Offset(
                                                  0.0,
                                                  12.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(14.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    14.0, 0.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: 55.0,
                                                      height: valueOrDefault<
                                                          double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .height *
                                                            0.05688,
                                                        48.0,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        image: DecorationImage(
                                                          fit: BoxFit.contain,
                                                          image: Image.asset(
                                                            'assets/images/Frame_2085662547_(23).png',
                                                          ).image,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Fondos de inversión colectiva',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Satoshi',
                                                                  fontSize:
                                                                      valueOrDefault<
                                                                          double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.01659,
                                                                    14.0,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                          Text(
                                                            'Define tu monto de inversión.',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Satoshi',
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    child: Image.asset(
                                                      'assets/images/Frame_2085662540_(14).png',
                                                      width: 83.0,
                                                      height: valueOrDefault<
                                                          double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .height *
                                                            0.02607,
                                                        22.0,
                                                      ),
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Opacity(
                                      opacity: 0.5,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 120.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.08295,
                                            70.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 24.0,
                                                color: Color(0x0E000000),
                                                offset: Offset(
                                                  0.0,
                                                  12.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(14.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    14.0, 0.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: 55.0,
                                                      height: valueOrDefault<
                                                          double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .height *
                                                            0.05688,
                                                        48.0,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        image: DecorationImage(
                                                          fit: BoxFit.contain,
                                                          image: Image.asset(
                                                            'assets/images/Frame_2085662547_(24).png',
                                                          ).image,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Criptomonedas',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Satoshi',
                                                                  fontSize:
                                                                      valueOrDefault<
                                                                          double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.01659,
                                                                    14.0,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                          Text(
                                                            'Define tu monto de inversión.',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Satoshi',
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    child: Image.asset(
                                                      'assets/images/Frame_2085662540_(14).png',
                                                      width: 83.0,
                                                      height: valueOrDefault<
                                                          double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .height *
                                                            0.02607,
                                                        22.0,
                                                      ),
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
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
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                ),
                if (responsiveVisibility(
                  context: context,
                  tablet: false,
                ))
                  Container(
                    width: valueOrDefault<double>(
                      MediaQuery.sizeOf(context).width * 1.00,
                      393.0,
                    ),
                    height: valueOrDefault<double>(
                      MediaQuery.sizeOf(context).height * 0.948,
                      800.0,
                    ),
                    child: custom_widgets.DraggableFloatingButton(
                      width: valueOrDefault<double>(
                        MediaQuery.sizeOf(context).width * 1.00,
                        393.0,
                      ),
                      height: valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.948,
                        800.0,
                      ),
                      onPressed: () async {
                        context.pushNamed(
                          AyudaWidget.routeName,
                          extra: <String, dynamic>{
                            '__transition_info__': TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                    ),
                  ),
                if (responsiveVisibility(
                  context: context,
                  tablet: false,
                ))
                  Container(
                    width: valueOrDefault<double>(
                      MediaQuery.sizeOf(context).width * 1.00,
                      393.0,
                    ),
                    height: valueOrDefault<double>(
                      MediaQuery.sizeOf(context).height * 1,
                      852.0,
                    ),
                    child: custom_widgets.FloatingNavBar(
                      width: valueOrDefault<double>(
                        MediaQuery.sizeOf(context).width * 1.00,
                        393.0,
                      ),
                      height: valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 1,
                        852.0,
                      ),
                      onLeftPressed: () async {
                        context.pushNamed(
                          ConveniosWidget.routeName,
                          extra: <String, dynamic>{
                            '__transition_info__': TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                      onCenterPressed: () async {
                        context.pushNamed(
                          AHORROSPage1CopyCopyWidget.routeName,
                          extra: <String, dynamic>{
                            '__transition_info__': TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                      onRightPressed: () async {
                        context.pushNamed(
                          Perfil01Widget.routeName,
                          extra: <String, dynamic>{
                            '__transition_info__': TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                    ),
                  ),
              ],
              ),
            ),
          ),
        );
      },
    );
  }
}
