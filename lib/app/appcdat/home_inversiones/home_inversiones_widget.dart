import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_inversiones_model.dart';
export 'home_inversiones_model.dart';

class HomeInversionesWidget extends StatefulWidget {
  const HomeInversionesWidget({super.key});

  static String routeName = 'HomeInversiones';
  static String routePath = '/homeInversiones';

  @override
  State<HomeInversionesWidget> createState() => _HomeInversionesWidgetState();
}

class _HomeInversionesWidgetState extends State<HomeInversionesWidget> {
  late HomeInversionesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeInversionesModel());

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
        List<CdatsRecord> homeInversionesCdatsRecordList = snapshot.data!;

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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 20.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FlutterFlowIconButton(
                              borderRadius: 8.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.arrow_back,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.02844,
                                  24.0,
                                ),
                              ),
                              onPressed: () async {
                                context.pushNamed(
                                  HomeNew2Widget.routeName,
                                  extra: <String, dynamic>{
                                    '__transition_info__': TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.leftToRight,
                                      duration: Duration(milliseconds: 1),
                                    ),
                                  },
                                );
                              },
                            ),
                            Text(
                              'Mis Inversiones',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Satoshi',
                                    fontSize: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.02133,
                                      18.0,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: valueOrDefault<double>(
                                MediaQuery.sizeOf(context).width * 0.11282,
                                44.0,
                              ),
                              height: valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.04977,
                                42.0,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.network(
                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/j4spiyiroi56/Frame_(2).png',
                                  ).image,
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                GoRouter.of(context).prepareAuthEvent();
                                await authManager.signOut();
                                GoRouter.of(context).clearRedirectLocation();

                                context.goNamedAuth(
                                  OnboardingAppMovilWidget.routeName,
                                  context.mounted,
                                  extra: <String, dynamic>{
                                    '__transition_info__': TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              child: Container(
                                width: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).width * 0.11282,
                                  44.0,
                                ),
                                height: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.04977,
                                  42.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0x80EEF1FA),
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: Color(0x80EEF1FA),
                                  ),
                                ),
                                child: Icon(
                                  Icons.logout_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.02133,
                                    18.0,
                                  ),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 6.0)),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
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
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 25.0,
                                    color: Color(0x0E000000),
                                    offset: Offset(
                                      0.0,
                                      12.0,
                                    ),
                                    spreadRadius: 0.0,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(
                                  color:
                                      FlutterFlowTheme.of(context).customColor5,
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.01896,
                                  16.0,
                                )),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Rentabilidad',
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
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Te damos ',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Satoshi',
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
                                            TextSpan(
                                              text: '+ ',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Satoshi',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .customColor4,
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
                                            TextSpan(
                                              text:
                                                  'razones para invertir en Alianza.',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Satoshi',
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
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
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
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0,
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.02370,
                                            20.0,
                                          ),
                                          0.0,
                                          0.0),
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Capital invertido',
                                              style: FlutterFlowTheme.of(
                                                      context)
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
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  functions.formatAmount(
                                                      valueOrDefault<double>(
                                                    functions.sumaTotal(
                                                        homeInversionesCdatsRecordList
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
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Satoshi',
                                                      color: Color(0xFF002CE9),
                                                      fontSize: valueOrDefault<
                                                          double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .height *
                                                            0.03792,
                                                        32.0,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0,
                                                      valueOrDefault<double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .height *
                                                            0.01896,
                                                        16.0,
                                                      ),
                                                      0.0,
                                                      0.0),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .customColor5,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 100.0,
                                                      color: Colors.transparent,
                                                      offset: Offset(
                                                        0.0,
                                                        2.0,
                                                      ),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: Color(0x1AFFFFFF),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          valueOrDefault<
                                                              double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.01422,
                                                            12.0,
                                                          ),
                                                          valueOrDefault<
                                                              double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.01185,
                                                            8.0,
                                                          ),
                                                          valueOrDefault<
                                                              double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.01422,
                                                            12.0,
                                                          ),
                                                          valueOrDefault<
                                                              double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.01185,
                                                            8.0,
                                                          )),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Beneficios generados',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Satoshi',
                                                                  color: Color(
                                                                      0xCC262632),
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
                                                                ),
                                                      ),
                                                      Text(
                                                        valueOrDefault<String>(
                                                          functions.formatAmount(
                                                              valueOrDefault<
                                                                  double>(
                                                            functions.sumaTotal(
                                                                homeInversionesCdatsRecordList
                                                                    .map((e) =>
                                                                        e.saldoDisponible)
                                                                    .toList()),
                                                            0.0,
                                                          )),
                                                          '\$ 0',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Satoshi',
                                                                  fontSize:
                                                                      valueOrDefault<
                                                                          double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .height *
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
                                                    ].divide(
                                                        SizedBox(height: 8.0)),
                                                  ),
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
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0,
                                valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.02844,
                                  24.0,
                                ),
                                0.0,
                                0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Renta fija',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          fontSize: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.01659,
                                            14.0,
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
                                        MediaQuery.sizeOf(context).height *
                                            0.01896,
                                        16.0,
                                      ),
                                      0.0,
                                      0.0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.02370,
                                                    20.0,
                                                  ),
                                                  0.0,
                                                  0.0,
                                                  valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.02844,
                                                    24.0,
                                                  )),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                MisinversionesWidget.routeName,
                                                queryParameters: {
                                                  'cdat': serializeParam(
                                                    homeInversionesCdatsRecordList
                                                        .where((e) =>
                                                            e.reference.id !=
                                                                null &&
                                                            e.reference.id !=
                                                                '')
                                                        .toList()
                                                        .firstOrNull,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'cdat':
                                                      homeInversionesCdatsRecordList
                                                          .where((e) =>
                                                              e.reference.id !=
                                                                  null &&
                                                              e.reference.id !=
                                                                  '')
                                                          .toList()
                                                          .firstOrNull,
                                                  '__transition_info__':
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType
                                                            .rightToLeft,
                                                  ),
                                                },
                                              );
                                            },
                                            child: Container(
                                              width: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .width *
                                                    0.52051,
                                                203.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 25.0,
                                                    color: Color(0x0E000000),
                                                    offset: Offset(
                                                      0.0,
                                                      12.0,
                                                    ),
                                                    spreadRadius: 0.0,
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .customColor5,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Stack(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.all(
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.01659,
                                                      14.0,
                                                    )),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          width: valueOrDefault<
                                                              double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.11282,
                                                            44.0,
                                                          ),
                                                          height:
                                                              valueOrDefault<
                                                                  double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.05214,
                                                            44.0,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            image:
                                                                DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image:
                                                                  Image.network(
                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/mbd8ebcwajow/Frame_2085662547_(8).png',
                                                              ).image,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  valueOrDefault<
                                                                      double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.01896,
                                                                    16.0,
                                                                  ),
                                                                  0.0,
                                                                  0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'CDAT',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Satoshi',
                                                                      fontSize:
                                                                          valueOrDefault<
                                                                              double>(
                                                                        MediaQuery.sizeOf(context).height *
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
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Satoshi',
                                                                      color: Color(
                                                                          0xB2262632),
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 4.0)),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: Image.network(
                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/1vj9w9irhrdo/Frame_2085662540_(10).png',
                                                      width: valueOrDefault<
                                                          double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .width *
                                                            0.26410,
                                                        103.0,
                                                      ),
                                                      height: valueOrDefault<
                                                          double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .height *
                                                            0.02607,
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
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.02370,
                                                    20.0,
                                                  ),
                                                  0.0,
                                                  0.0,
                                                  valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.02844,
                                                    24.0,
                                                  )),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                InvertirahorrosWidget.routeName,
                                                extra: <String, dynamic>{
                                                  '__transition_info__':
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType
                                                            .rightToLeft,
                                                  ),
                                                },
                                              );
                                            },
                                            child: Container(
                                              width: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .width *
                                                    0.52051,
                                                203.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 25.0,
                                                    color: Color(0x0E000000),
                                                    offset: Offset(
                                                      0.0,
                                                      12.0,
                                                    ),
                                                    spreadRadius: 0.0,
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .customColor5,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Stack(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.all(
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.01659,
                                                      14.0,
                                                    )),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          width: valueOrDefault<
                                                              double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.11282,
                                                            44.0,
                                                          ),
                                                          height:
                                                              valueOrDefault<
                                                                  double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.05214,
                                                            44.0,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            image:
                                                                DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image:
                                                                  Image.network(
                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/0b2axpdxpsdc/Frame_2085662547_(9).png',
                                                              ).image,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  valueOrDefault<
                                                                      double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.01896,
                                                                    16.0,
                                                                  ),
                                                                  0.0,
                                                                  0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Invertir Ahorros',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Satoshi',
                                                                      fontSize:
                                                                          valueOrDefault<
                                                                              double>(
                                                                        MediaQuery.sizeOf(context).height *
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
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Satoshi',
                                                                      color: Color(
                                                                          0xB2262632),
                                                                      fontSize:
                                                                          valueOrDefault<
                                                                              double>(
                                                                        MediaQuery.sizeOf(context).height *
                                                                            0.01422,
                                                                        12.0,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 4.0)),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: Image.network(
                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/1vj9w9irhrdo/Frame_2085662540_(10).png',
                                                      width: valueOrDefault<
                                                          double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .width *
                                                            0.26410,
                                                        103.0,
                                                      ),
                                                      height: valueOrDefault<
                                                          double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .height *
                                                            0.02607,
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
                                        Opacity(
                                          opacity: 0.5,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.02370,
                                                      20.0,
                                                    ),
                                                    0.0,
                                                    20.0,
                                                    valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.02844,
                                                      24.0,
                                                    )),
                                            child: Container(
                                              width: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .width *
                                                    0.52051,
                                                203.0,
                                              ),
                                              height: 126.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 25.0,
                                                    color: Color(0x0E000000),
                                                    offset: Offset(
                                                      0.0,
                                                      12.0,
                                                    ),
                                                    spreadRadius: 0.0,
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .customColor5,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Stack(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.all(
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.01659,
                                                      14.0,
                                                    )),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          width: valueOrDefault<
                                                              double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.11282,
                                                            44.0,
                                                          ),
                                                          height:
                                                              valueOrDefault<
                                                                  double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.05214,
                                                            44.0,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .customColor5,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Image.asset(
                                                              'assets/images/ac32bdde10a33268d426cbfa9f360dbd3359fbd6.png',
                                                              width: 16.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  valueOrDefault<
                                                                      double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.01896,
                                                                    16.0,
                                                                  ),
                                                                  0.0,
                                                                  0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Invertir en dólares',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Satoshi',
                                                                      fontSize:
                                                                          valueOrDefault<
                                                                              double>(
                                                                        MediaQuery.sizeOf(context).height *
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
                                                            ].divide(SizedBox(
                                                                height: 4.0)),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: Image.network(
                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/0iwu4at0nui5/Frame_2085662540_(11).png',
                                                      width: valueOrDefault<
                                                          double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .width *
                                                            0.26410,
                                                        103.0,
                                                      ),
                                                      height: valueOrDefault<
                                                          double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .height *
                                                            0.02607,
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
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Renta variable',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Satoshi',
                                        fontSize: valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.01659,
                                          14.0,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              Opacity(
                                opacity: 0.5,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0,
                                      valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.01896,
                                        16.0,
                                      ),
                                      0.0,
                                      0.0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.02370,
                                                    20.0,
                                                  ),
                                                  0.0,
                                                  0.0,
                                                  valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.02844,
                                                    24.0,
                                                  )),
                                          child: Container(
                                            width: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context).width *
                                                  0.52051,
                                              203.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 25.0,
                                                  color: Color(0x0E000000),
                                                  offset: Offset(
                                                    0.0,
                                                    12.0,
                                                  ),
                                                  spreadRadius: 0.0,
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor5,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Stack(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(
                                                      valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.01659,
                                                    14.0,
                                                  )),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        width: valueOrDefault<
                                                            double>(
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .width *
                                                              0.11282,
                                                          44.0,
                                                        ),
                                                        height: valueOrDefault<
                                                            double>(
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .height *
                                                              0.05214,
                                                          44.0,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          image:
                                                              DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image:
                                                                Image.network(
                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/md93dekxxvvt/Frame_2085662547_(10).png',
                                                            ).image,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    valueOrDefault<
                                                                        double>(
                                                                      MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.01896,
                                                                      16.0,
                                                                    ),
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            AutoSizeText(
                                                              'Acciones americanas',
                                                              minFontSize: 10.0,
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
                                                          ].divide(SizedBox(
                                                              height: 4.0)),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
                                                  child: Image.network(
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/0iwu4at0nui5/Frame_2085662540_(11).png',
                                                    width:
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.26410,
                                                      103.0,
                                                    ),
                                                    height:
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.02607,
                                                      22.0,
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.02370,
                                                    20.0,
                                                  ),
                                                  0.0,
                                                  0.0,
                                                  valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.02844,
                                                    24.0,
                                                  )),
                                          child: Container(
                                            width: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context).width *
                                                  0.52051,
                                              203.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 25.0,
                                                  color: Color(0x0E000000),
                                                  offset: Offset(
                                                    0.0,
                                                    12.0,
                                                  ),
                                                  spreadRadius: 0.0,
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor5,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Stack(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(
                                                      valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.01659,
                                                    14.0,
                                                  )),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        width: valueOrDefault<
                                                            double>(
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .width *
                                                              0.11282,
                                                          44.0,
                                                        ),
                                                        height: valueOrDefault<
                                                            double>(
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .height *
                                                              0.05214,
                                                          44.0,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          image:
                                                              DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image:
                                                                Image.network(
                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/t4sb9dy1z5nf/Frame_2085662547_(11).png',
                                                            ).image,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    valueOrDefault<
                                                                        double>(
                                                                      MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.01896,
                                                                      16.0,
                                                                    ),
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            AutoSizeText(
                                                              'Fondos de inversión colectiva',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              minFontSize: 10.0,
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
                                                                          0.01540,
                                                                      13.0,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 4.0)),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
                                                  child: Image.network(
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/0iwu4at0nui5/Frame_2085662540_(11).png',
                                                    width:
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.26410,
                                                      103.0,
                                                    ),
                                                    height:
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.02607,
                                                      22.0,
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.02370,
                                                    20.0,
                                                  ),
                                                  0.0,
                                                  20.0,
                                                  valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.02844,
                                                    24.0,
                                                  )),
                                          child: Container(
                                            width: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context).width *
                                                  0.52051,
                                              203.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 25.0,
                                                  color: Color(0x0E000000),
                                                  offset: Offset(
                                                    0.0,
                                                    12.0,
                                                  ),
                                                  spreadRadius: 0.0,
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor5,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Stack(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(
                                                      valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.01659,
                                                    14.0,
                                                  )),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        width: valueOrDefault<
                                                            double>(
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .width *
                                                              0.11282,
                                                          44.0,
                                                        ),
                                                        height: valueOrDefault<
                                                            double>(
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .height *
                                                              0.05214,
                                                          44.0,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customColor5,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Image.asset(
                                                            'assets/images/31625ee9723a5a4cdda140c14bf32616058f1c66.png',
                                                            width: 16.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    valueOrDefault<
                                                                        double>(
                                                                      MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.01896,
                                                                      16.0,
                                                                    ),
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            AutoSizeText(
                                                              'Holding en Crypto',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              maxLines: 1,
                                                              minFontSize: 10.0,
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
                                                          ].divide(SizedBox(
                                                              height: 4.0)),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
                                                  child: Image.network(
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/0iwu4at0nui5/Frame_2085662540_(11).png',
                                                    width:
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.26410,
                                                      103.0,
                                                    ),
                                                    height:
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.02607,
                                                      22.0,
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
