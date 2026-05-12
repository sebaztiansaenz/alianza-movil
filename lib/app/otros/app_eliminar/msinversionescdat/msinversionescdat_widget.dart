import '/app/cdathablarasesor_copy/cdathablarasesor_copy_widget.dart';
import '/app/otros/animacionmenu/animacionmenu_widget.dart';
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
import 'package:carousel_slider/carousel_slider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'msinversionescdat_model.dart';
export 'msinversionescdat_model.dart';

class MsinversionescdatWidget extends StatefulWidget {
  const MsinversionescdatWidget({super.key});

  static String routeName = 'msinversionescdat';
  static String routePath = '/msinversionescdat';

  @override
  State<MsinversionescdatWidget> createState() =>
      _MsinversionescdatWidgetState();
}

class _MsinversionescdatWidgetState extends State<MsinversionescdatWidget> {
  late MsinversionescdatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MsinversionescdatModel());

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
      stream: queryCdatsRecord(
        queryBuilder: (cdatsRecord) => cdatsRecord.where(
          'Idusuario',
          isEqualTo: currentUserReference,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
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
        List<CdatsRecord> msinversionescdatCdatsRecordList = snapshot.data!;

        return Scaffold(
          key: scaffoldKey,
          body: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: valueOrDefault<double>(
                      MediaQuery.sizeOf(context).height * 0.31398,
                      265.0,
                    ),
                    decoration: BoxDecoration(),
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.31398,
                              265.0,
                            ),
                            child: custom_widgets.Video(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.31398,
                                265.0,
                              ),
                              url:
                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/kea5macdj9xv/VIDEO_HOME_APP_ALIANZA.mp4',
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 20.0, 20.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0,
                                            valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.01422,
                                              12.0,
                                            ),
                                            0.0,
                                            0.0),
                                        child: AutoSizeText(
                                          'Mis inversiones',
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          minFontSize: 26.0,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize:
                                                    valueOrDefault<double>(
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.03792,
                                                  32.0,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w900,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0,
                                            valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.0095,
                                              8.0,
                                            ),
                                            0.0,
                                            0.0),
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Te damos ',
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                                                0.01896,
                                                            16.0,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              TextSpan(
                                                text: '+',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize:
                                                      valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.01896,
                                                    16.0,
                                                  ),
                                                ),
                                              ),
                                              TextSpan(
                                                text:
                                                    ' razones para ahorrar con Alianza',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize:
                                                      valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.01896,
                                                    16.0,
                                                  ),
                                                ),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w200,
                                                ),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 8.0),
                                        child: AutoSizeText(
                                          valueOrDefault<String>(
                                            functions.formatAmount(
                                                valueOrDefault<double>(
                                              functions.sumaTotal(
                                                  msinversionescdatCdatsRecordList
                                                      .where((e) =>
                                                          e.estado == 'Activo')
                                                      .toList()
                                                      .map((e) =>
                                                          valueOrDefault<
                                                              double>(
                                                            e.inversion,
                                                            0.0,
                                                          ))
                                                      .toList()),
                                              0.0,
                                            )),
                                            '0',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor4,
                                                fontSize:
                                                    valueOrDefault<double>(
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.04266,
                                                  36.0,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 8.0),
                                        child: AutoSizeText(
                                          'Total invertido',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize:
                                                    valueOrDefault<double>(
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.01422,
                                                  12.0,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0,
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.07110,
                                60.0,
                              ),
                              0.0,
                              0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(HomeNew2Widget.routeName);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0,
                                valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.01896,
                                  16.0,
                                ),
                                0.0,
                                0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 140.0,
                              child: CarouselSlider(
                                items: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/CDAT-3.png',
                                      width: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).width *
                                            0.52564,
                                        205.0,
                                      ),
                                      height: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.15166,
                                        128.0,
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/CDAT-1.png',
                                      width: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).width *
                                            0.52564,
                                        205.0,
                                      ),
                                      height: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.15166,
                                        128.0,
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/CDAT-2.png',
                                      width: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).width *
                                            0.52564,
                                        205.0,
                                      ),
                                      height: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.15166,
                                        128.0,
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ],
                                carouselController:
                                    _model.carouselController ??=
                                        CarouselSliderController(),
                                options: CarouselOptions(
                                  initialPage: 1,
                                  viewportFraction: 0.65,
                                  disableCenter: true,
                                  enlargeCenterPage: true,
                                  enlargeFactor: 0.2,
                                  enableInfiniteScroll: false,
                                  scrollDirection: Axis.horizontal,
                                  autoPlay: true,
                                  autoPlayAnimationDuration:
                                      Duration(milliseconds: 800),
                                  autoPlayInterval:
                                      Duration(milliseconds: (800 + 4000)),
                                  autoPlayCurve: Curves.linear,
                                  pauseAutoPlayInFiniteScroll: false,
                                  onPageChanged: (index, _) =>
                                      _model.carouselCurrentIndex = index,
                                ),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      useSafeArea: true,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: CdathablarasesorCopyWidget(),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            14.0, 0.0, 0.0, 0.0),
                                        child: Icon(
                                          Icons.add,
                                          color: FlutterFlowTheme.of(context)
                                              .customColor4,
                                          size: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
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
                                              fontSize: valueOrDefault<double>(
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
                            msinversionescdatCdatsRecordList.length == 0,
                            true,
                          ))
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
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/Frame_2085662602.png',
                                      width: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).width *
                                            0.48205,
                                        188.0,
                                      ),
                                      height: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.14220,
                                        120.0,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/Group_97.png',
                                      width: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).width *
                                            0.37949,
                                        148.0,
                                      ),
                                      height: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.17536,
                                        148.0,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (valueOrDefault<bool>(
                                msinversionescdatCdatsRecordList.length > 0,
                                false,
                              ))
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 16.0, 20.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final cdatss =
                                            msinversionescdatCdatsRecordList
                                                .sortedList(
                                                    keyOf: (e) =>
                                                        e.fechaApertura!,
                                                    desc: false)
                                                .toList();

                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                cdatss.length, (cdatssIndex) {
                                              final cdatssItem =
                                                  cdatss[cdatssIndex];
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if (cdatssItem.firmado ==
                                                      true) {
                                                    context.pushNamed(
                                                      AHORROScdat2Widget
                                                          .routeName,
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
                                                              milliseconds:
                                                                  500),
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
                                                              milliseconds:
                                                                  500),
                                                        ),
                                                      },
                                                    );
                                                  }
                                                },
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height:
                                                      valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.07110,
                                                    60.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFEEF1FA),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          height:
                                                              valueOrDefault<
                                                                  double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.07110,
                                                            60.0,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .customColor5,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      8.0),
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      8.0),
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Image.asset(
                                                                  'assets/images/Captura_de_pantalla_2025-06-19_095229.png',
                                                                  width:
                                                                      valueOrDefault<
                                                                          double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.06154,
                                                                    24.0,
                                                                  ),
                                                                  height:
                                                                      valueOrDefault<
                                                                          double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.02844,
                                                                    24.0,
                                                                  ),
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                                AutoSizeText(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    functions.formatAmount(
                                                                        valueOrDefault<
                                                                            double>(
                                                                      cdatssItem
                                                                          .inversion,
                                                                      0.0,
                                                                    )),
                                                                    '0',
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            valueOrDefault<double>(
                                                                          MediaQuery.sizeOf(context).height *
                                                                              0.01659,
                                                                          14.0,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 12.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Opacity(
                                                        opacity: valueOrDefault<
                                                            double>(
                                                          cdatssItem.firmado ==
                                                                  true
                                                              ? 0.0
                                                              : 1.0,
                                                          0.0,
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, -1.0),
                                                          child: Container(
                                                            width: 84.0,
                                                            height: 20.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Opacity(
                                                              opacity:
                                                                  valueOrDefault<
                                                                      double>(
                                                                cdatssItem.firmado ==
                                                                        true
                                                                    ? 0.0
                                                                    : 1.0,
                                                                0.0,
                                                              ),
                                                              child: Stack(
                                                                children: [
                                                                  Image.asset(
                                                                    'assets/images/path344.png',
                                                                    width: valueOrDefault<
                                                                        double>(
                                                                      MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.21538,
                                                                      84.0,
                                                                    ),
                                                                    height: valueOrDefault<
                                                                        double>(
                                                                      MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.02370,
                                                                      20.0,
                                                                    ),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          4.0,
                                                                          1.0),
                                                                      child:
                                                                          AutoSizeText(
                                                                        'En proceso',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        maxLines:
                                                                            1,
                                                                        minFontSize:
                                                                            7.0,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Satoshi',
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              fontSize: valueOrDefault<double>(
                                                                                MediaQuery.sizeOf(context).height * 0.01303,
                                                                                11.0,
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
                                                          ),
                                                        ),
                                                      ),
                                                      Image.asset(
                                                        'assets/images/separador.png',
                                                        height: valueOrDefault<
                                                            double>(
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .height *
                                                              0.07110,
                                                          60.0,
                                                        ),
                                                        fit: BoxFit.contain,
                                                      ),
                                                      Container(
                                                        height: valueOrDefault<
                                                            double>(
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .height *
                                                              0.07110,
                                                          60.0,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFF002CE9),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topRight:
                                                                Radius.circular(
                                                                    8.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    8.0),
                                                          ),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        41.0,
                                                                        18.0,
                                                                        41.0,
                                                                        18.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                FaIcon(
                                                                  FontAwesomeIcons
                                                                      .arrowRight,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  size: 20.0,
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 12.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 0.0)),
                                                  ),
                                                ),
                                              );
                                            }).divide(SizedBox(height: 12.0)),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                32.0,
                                valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.04266,
                                  36.0,
                                ),
                                32.0,
                                valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.02844,
                                  24.0,
                                )),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {},
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 12.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: Image.asset(
                                            'assets/images/Group_93_(2).png',
                                            width: 28.0,
                                            height: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.03318,
                                              28.0,
                                            ),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      AutoSizeText(
                                        'Calcula tu rentabilidad',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              fontSize: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .height *
                                                    0.01896,
                                                16.0,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    size: 24.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0,
                                valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.01422,
                                  12.0,
                                ),
                                20.0,
                                valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.04740,
                                  40.0,
                                )),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await launchURL(
                                    'https://api.whatsapp.com/send?phone=573157792999&text=Hola%2C%20quiero%20aperturar%20mi%20CDAT');
                              },
                              text: 'Apertura con un asesor',
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.05688,
                                  48.0,
                                ),
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color:
                                    FlutterFlowTheme.of(context).customColor4,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Satoshi',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.01896,
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
                    ),
                  ),
                ],
              ),
              if (responsiveVisibility(
                context: context,
                phone: false,
                desktop: false,
              ))
                wrapWithModel(
                  model: _model.animacionmenuModel,
                  updateCallback: () => safeSetState(() {}),
                  child: AnimacionmenuWidget(),
                ),
            ],
          ),
        );
      },
    );
  }
}
