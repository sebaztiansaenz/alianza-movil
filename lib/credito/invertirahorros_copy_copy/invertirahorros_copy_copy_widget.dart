import '/app/cdathablarasesor_copy_copy/cdathablarasesor_copy_copy_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'invertirahorros_copy_copy_model.dart';
export 'invertirahorros_copy_copy_model.dart';

class InvertirahorrosCopyCopyWidget extends StatefulWidget {
  const InvertirahorrosCopyCopyWidget({super.key});

  static String routeName = 'invertirahorrosCopyCopy';
  static String routePath = '/invertirahorrosCopyCopy';

  @override
  State<InvertirahorrosCopyCopyWidget> createState() =>
      _InvertirahorrosCopyCopyWidgetState();
}

class _InvertirahorrosCopyCopyWidgetState
    extends State<InvertirahorrosCopyCopyWidget> with TickerProviderStateMixin {
  late InvertirahorrosCopyCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InvertirahorrosCopyCopyModel());

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

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 1200.0.ms,
            duration: 1400.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.1, 1.1),
          ),
        ],
      ),
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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                StreamBuilder<List<CdatsRecord>>(
                  stream: queryCdatsRecord(
                    queryBuilder: (cdatsRecord) => cdatsRecord.where(
                      'Idusuario',
                      isEqualTo: currentUserReference,
                    ),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
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
                    List<CdatsRecord> containerCdatsRecordList = snapshot.data!;

                    return Container(
                      decoration: BoxDecoration(),
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
                                    MediaQuery.sizeOf(context).height * 0.07584,
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
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 2.0)),
                                  ),
                                  Flexible(
                                    child: Container(
                                      width: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).width *
                                            0.27179,
                                        106.0,
                                      ),
                                      height: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.04147,
                                        35.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .customColor5,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 18.0,
                                              height: 18.0,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.contain,
                                                  image: Image.asset(
                                                    'assets/images/Frame_(38).png',
                                                  ).image,
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: Text(
                                                '\$ 0',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
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
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 209.0,
                                  height: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.06162,
                                    52.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .customColor5,
                                    borderRadius: BorderRadius.circular(100.0),
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
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              AHORROSPage1CopyCopyWidget
                                                  .routeName,
                                              extra: <String, dynamic>{
                                                '__transition_info__':
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                  duration:
                                                      Duration(milliseconds: 0),
                                                ),
                                              },
                                            );
                                          },
                                          child: Container(
                                            width: 100.0,
                                            height: 44.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .customColor5,
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor5,
                                              ),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                'Ahorro',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 100.0,
                                          height: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.05214,
                                            44.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .customColor5,
                                            ),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              'Crédito',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Satoshi',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      MisinversionesWidget.routeName,
                                      queryParameters: {
                                        'cdat': serializeParam(
                                          containerCdatsRecordList
                                              .where((e) =>
                                                  e.reference.id != null &&
                                                  e.reference.id != '')
                                              .toList()
                                              .firstOrNull,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'cdat': containerCdatsRecordList
                                            .where((e) =>
                                                e.reference.id != null &&
                                                e.reference.id != '')
                                            .toList()
                                            .firstOrNull,
                                        '__transition_info__': TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: 133.0,
                                    height: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.06162,
                                      52.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x3BFF6700),
                                          offset: Offset(
                                            0.0,
                                            2.0,
                                          ),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(24.0),
                                      border: Border.all(
                                        color: Color(0x3FFF6700),
                                        width: 1.5,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 20.0,
                                            height: 20.0,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.contain,
                                                image: Image.asset(
                                                  'assets/images/Frame_2085664384.png',
                                                ).image,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Inversión',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 8.0)),
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
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
                                'Mis créditos',
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
                                      fontWeight: FontWeight.bold,
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
                                      return GestureDetector(
                                        onTap: () {
                                          FocusScope.of(context).unfocus();
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child:
                                              CdathablarasesorCopyCopyWidget(),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                      'Solicitar crédito',
                                      textAlign: TextAlign.end,
                                      maxLines: 1,
                                      minFontSize: 10.0,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            color: FlutterFlowTheme.of(context)
                                                .customColor4,
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 0.0),
                          child: InkWell(
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
                                  return GestureDetector(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: CdathablarasesorCopyCopyWidget(),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.5,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(16.0),
                                border: Border.all(
                                  color:
                                      FlutterFlowTheme.of(context).customColor5,
                                  width: 1.0,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 130.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(16.0),
                                        topRight: Radius.circular(16.0),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Image.asset(
                                            'assets/images/eb5d157d8d37003d5beb346ad66b197de00df2b5.gif',
                                            width: 55.0,
                                            height: 55.0,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        Text(
                                          'Contáctanos',
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
                                      ].divide(SizedBox(height: 6.0)),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 30.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF002CE9),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(16.0),
                                          bottomRight: Radius.circular(16.0),
                                        ),
                                        border: Border.all(
                                          color: Color(0xFF002CE9),
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'Tu próximo crédito',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation']!),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 32.0, 20.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 20.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.habilitar =
                                        await queryUserRecordOnce(
                                      queryBuilder: (userRecord) => userRecord
                                          .where(
                                            'uid',
                                            isEqualTo: currentUserReference?.id,
                                          )
                                          .where(
                                            'habilitar',
                                            isEqualTo: true,
                                          ),
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);
                                    if (_model.habilitar?.habilitar == true) {
                                      context.pushNamed(
                                          BienvenidacreditoWidget.routeName);
                                    } else {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        useSafeArea: true,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child:
                                                  CdathablarasesorCopyCopyWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    }

                                    safeSetState(() {});
                                  },
                                  child: Container(
                                    height: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.06162,
                                      52.0,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .customColor5,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(14.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 48.0,
                                            height: 48.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              image: DecorationImage(
                                                fit: BoxFit.contain,
                                                image: Image.asset(
                                                  'assets/images/Frame_(37).png',
                                                ).image,
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Mi Perfil de Crédito',
                                                  textAlign: TextAlign.start,
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
                                                Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Color(0xD0262632),
                                                  size: 20.0,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 16.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Opacity(
                                opacity: 0.5,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 20.0),
                                  child: Container(
                                    height: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.06162,
                                      52.0,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .customColor5,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(14.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 48.0,
                                            height: 48.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              image: DecorationImage(
                                                fit: BoxFit.contain,
                                                image: Image.asset(
                                                  'assets/images/Frame_(39).png',
                                                ).image,
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Historial de créditos',
                                                  textAlign: TextAlign.start,
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
                                                Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Color(0xD0262632),
                                                  size: 20.0,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 16.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: StreamBuilder<List<UserRecord>>(
                            stream: queryUserRecord(
                              queryBuilder: (userRecord) => userRecord
                                  .where(
                                    'uid',
                                    isEqualTo: currentUserReference?.id,
                                  )
                                  .where(
                                    'perfilCredito',
                                    isEqualTo: true,
                                  ),
                              singleRecord: true,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
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
                              List<UserRecord> containerUserRecordList =
                                  snapshot.data!;
                              final containerUserRecord =
                                  containerUserRecordList.isNotEmpty
                                      ? containerUserRecordList.first
                                      : null;

                              return Container(
                                decoration: BoxDecoration(),
                                child: Visibility(
                                  visible: containerUserRecord?.perfilCredito ==
                                      true,
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0,
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.02844,
                                            24.0,
                                          ),
                                          0.0,
                                          40.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Novedades',
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
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0,
                                                    valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
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
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                valueOrDefault<
                                                                    double>(
                                                                  MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.02370,
                                                                  20.0,
                                                                ),
                                                                0.0,
                                                                0.0,
                                                                valueOrDefault<
                                                                    double>(
                                                                  MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.02844,
                                                                  24.0,
                                                                )),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 25.0,
                                                            color: Color(
                                                                0x0E000000),
                                                            offset: Offset(
                                                              0.0,
                                                              12.0,
                                                            ),
                                                            spreadRadius: 0.0,
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customColor5,
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
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
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      valueOrDefault<
                                                                          double>(
                                                                        MediaQuery.sizeOf(context).height *
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
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        'Monto Pre-Aprobado;',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Satoshi',
                                                                              fontSize: valueOrDefault<double>(
                                                                                MediaQuery.sizeOf(context).height * 0.01659,
                                                                                14.0,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            AuthUserStreamWidget(
                                                                          builder: (context) =>
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              functions.formatAmount(valueOrDefault<double>(
                                                                                valueOrDefault(currentUserDocument?.montoPreAprobado, 0).toDouble(),
                                                                                0.0,
                                                                              )),
                                                                              '\$ 0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Satoshi',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        4.0)),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Container(
                                                                width: 150.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    if (_model.respuesta ==
                                                                            null ||
                                                                        _model.respuesta ==
                                                                            '')
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Theme(
                                                                            data:
                                                                                ThemeData(
                                                                              checkboxTheme: CheckboxThemeData(
                                                                                visualDensity: VisualDensity.compact,
                                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(4.0),
                                                                                ),
                                                                              ),
                                                                              unselectedWidgetColor: FlutterFlowTheme.of(context).alternate,
                                                                            ),
                                                                            child:
                                                                                Checkbox(
                                                                              value: _model.checkboxValue1 ??= false,
                                                                              onChanged: (newValue) async {
                                                                                safeSetState(() => _model.checkboxValue1 = newValue!);
                                                                                if (newValue!) {
                                                                                  _model.respuesta = 'Si';
                                                                                  safeSetState(() {});

                                                                                  await containerUserRecord!.reference.update(createUserRecordData(
                                                                                    respuestaCredito: true,
                                                                                    perfilCredito: false,
                                                                                  ));
                                                                                }
                                                                              },
                                                                              side: (FlutterFlowTheme.of(context).alternate != null)
                                                                                  ? BorderSide(
                                                                                      width: 2,
                                                                                      color: FlutterFlowTheme.of(context).alternate!,
                                                                                    )
                                                                                  : null,
                                                                              activeColor: FlutterFlowTheme.of(context).primary,
                                                                              checkColor: FlutterFlowTheme.of(context).info,
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            'Si',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Satoshi',
                                                                                  fontSize: 16.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    if (_model.respuesta ==
                                                                            null ||
                                                                        _model.respuesta ==
                                                                            '')
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children: [
                                                                          Theme(
                                                                            data:
                                                                                ThemeData(
                                                                              checkboxTheme: CheckboxThemeData(
                                                                                visualDensity: VisualDensity.compact,
                                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(4.0),
                                                                                ),
                                                                              ),
                                                                              unselectedWidgetColor: FlutterFlowTheme.of(context).alternate,
                                                                            ),
                                                                            child:
                                                                                Checkbox(
                                                                              value: _model.checkboxValue2 ??= false,
                                                                              onChanged: (newValue) async {
                                                                                safeSetState(() => _model.checkboxValue2 = newValue!);
                                                                                if (newValue!) {
                                                                                  _model.respuesta = 'No';
                                                                                  safeSetState(() {});

                                                                                  await containerUserRecord!.reference.update(createUserRecordData(
                                                                                    respuestaCredito: false,
                                                                                    perfilCredito: false,
                                                                                  ));
                                                                                }
                                                                              },
                                                                              side: (FlutterFlowTheme.of(context).alternate != null)
                                                                                  ? BorderSide(
                                                                                      width: 2,
                                                                                      color: FlutterFlowTheme.of(context).alternate!,
                                                                                    )
                                                                                  : null,
                                                                              activeColor: FlutterFlowTheme.of(context).primary,
                                                                              checkColor: FlutterFlowTheme.of(context).info,
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            'No',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Satoshi',
                                                                                  fontSize: 16.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
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
                              );
                            },
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
                              120.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Novedades',
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
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
                                          onTap: () async {},
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
                                                            Text(
                                                              'Apertura tu CDAT digital',
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
                                                              'Tasas hasta del 13.5% E.A',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                  child: Image.asset(
                                                    'assets/images/Frame_2085662540_(10).png',
                                                    width: 68.0,
                                                    height: 18.0,
                                                    fit: BoxFit.contain,
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
                                                            fit: BoxFit.contain,
                                                            image: Image.asset(
                                                              'assets/images/Frame_2085662547_(20).png',
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
                                                            Text(
                                                              'Asegura tu carro',
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
                                                              'Protege tu patrimonio.',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                  child: Image.asset(
                                                    'assets/images/Frame_2085662540_(14).png',
                                                    width: 68.0,
                                                    height: 18.0,
                                                    fit: BoxFit.contain,
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
                                                            fit: BoxFit.contain,
                                                            image: Image.asset(
                                                              'assets/images/Frame_2085662547_(19).png',
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
                                                            Text(
                                                              'Compra tu SOAT',
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
                                                              'Asegurárandote en el camino',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                  child: Image.asset(
                                                    'assets/images/Frame_2085662540_(14).png',
                                                    width: 68.0,
                                                    height: 18.0,
                                                    fit: BoxFit.contain,
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
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 24.0,
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
                                                                  Image.asset(
                                                                'assets/images/Frame_(41).png',
                                                              ).image,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
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
                                                            Text(
                                                              'Cotiza tu viaje',
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
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                              child: Text(
                                                                'La próxima aventura inicia aquí.',
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
                                                  child: Image.asset(
                                                    'assets/images/Frame_2085662540_(14).png',
                                                    width: 68.0,
                                                    height: 18.0,
                                                    fit: BoxFit.contain,
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if (responsiveVisibility(
              context: context,
              phone: false,
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
              phone: false,
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
    );
  }
}
