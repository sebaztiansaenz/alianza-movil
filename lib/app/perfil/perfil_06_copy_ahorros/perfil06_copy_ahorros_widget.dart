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
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'perfil06_copy_ahorros_model.dart';
export 'perfil06_copy_ahorros_model.dart';

class Perfil06CopyAhorrosWidget extends StatefulWidget {
  const Perfil06CopyAhorrosWidget({
    super.key,
    required this.accountType,
  });

  final String? accountType;

  static String routeName = 'Perfil_06CopyAhorros';
  static String routePath = '/perfil06CopyAhorros';

  @override
  State<Perfil06CopyAhorrosWidget> createState() =>
      _Perfil06CopyAhorrosWidgetState();
}

class _Perfil06CopyAhorrosWidgetState extends State<Perfil06CopyAhorrosWidget> {
  late Perfil06CopyAhorrosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Perfil06CopyAhorrosModel());

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
            StreamBuilder<List<AhorrosRecord>>(
              stream: queryAhorrosRecord(
                queryBuilder: (ahorrosRecord) => ahorrosRecord
                    .where(
                      'user',
                      isEqualTo: currentUserReference,
                    )
                    .where(
                      'AhorrosDocPdf1',
                      isNotEqualTo: '',
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
                List<AhorrosRecord> containerAhorrosRecordList = snapshot.data!;

                return Container(
                  decoration: BoxDecoration(),
                  child: StreamBuilder<List<ServicesRecord>>(
                    stream: queryServicesRecord(
                      queryBuilder: (servicesRecord) => servicesRecord
                          .where(
                            'ServiceMainType',
                            isEqualTo: 'Ahorros',
                          )
                          .whereIn(
                              'TypesOfProductName',
                              containerAhorrosRecordList
                                  .map((e) => e.savingsType)
                                  .toList()),
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
                      List<ServicesRecord> containerServicesRecordList =
                          snapshot.data!;

                      return Container(
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 40.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      FlutterFlowTheme.of(context).fondo,
                                      Color(0xFF002CE9)
                                    ],
                                    stops: [0.0, 1.0],
                                    begin: AlignmentDirectional(-1.0, 0.0),
                                    end: AlignmentDirectional(1.0, 0),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 64.0, 0.0, 20.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.safePop();
                                              },
                                              child: Container(
                                                width: 50.0,
                                                height: 50.0,
                                                decoration: BoxDecoration(),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.safePop();
                                                  },
                                                  child: Icon(
                                                    Icons.arrow_back,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: Image.asset(
                                                'assets/images/Group_(16).png',
                                                height: 30.0,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 30.0, 0.0),
                                              child: AutoSizeText(
                                                valueOrDefault<String>(
                                                  widget!.accountType,
                                                  'LÍNEAS DE AHORRO',
                                                ),
                                                textAlign: TextAlign.start,
                                                maxLines: 11,
                                                minFontSize: 14.0,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 20.0, 0.0),
                                        child: Image.asset(
                                          'assets/images/Group_(10).png',
                                          width: 24.0,
                                          height: 24.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if ((widget!.accountType ==
                                                'Ahorros') &&
                                            (containerAhorrosRecordList.length >
                                                0))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 24.0, 24.0, 24.0),
                                            child: Builder(
                                              builder: (context) {
                                                final servicios =
                                                    containerServicesRecordList
                                                        .toList();

                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: List.generate(
                                                      servicios.length,
                                                      (serviciosIndex) {
                                                    final serviciosItem =
                                                        servicios[
                                                            serviciosIndex];
                                                    return StreamBuilder<
                                                        List<AhorrosRecord>>(
                                                      stream:
                                                          queryAhorrosRecord(
                                                        queryBuilder:
                                                            (ahorrosRecord) =>
                                                                ahorrosRecord
                                                                    .where(
                                                                      'service_',
                                                                      isEqualTo:
                                                                          serviciosItem
                                                                              .reference,
                                                                    )
                                                                    .where(
                                                                      'user',
                                                                      isEqualTo:
                                                                          currentUserReference,
                                                                    )
                                                                    .where(
                                                                      'AhorrosDocPdf1',
                                                                      isNotEqualTo:
                                                                          '',
                                                                    ),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
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
                                                        List<AhorrosRecord>
                                                            containerAhorrosRecordList =
                                                            snapshot.data!;

                                                        return Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child:
                                                                    AutoSizeText(
                                                                  serviciosItem
                                                                      .typesOfProductName,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  maxLines: 1,
                                                                  minFontSize:
                                                                      12.0,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Satoshi',
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                ),
                                                              ),
                                                              Builder(
                                                                builder:
                                                                    (context) {
                                                                  final ahorros =
                                                                      containerAhorrosRecordList
                                                                          .toList();

                                                                  return Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: List.generate(
                                                                        ahorros
                                                                            .length,
                                                                        (ahorrosIndex) {
                                                                      final ahorrosItem =
                                                                          ahorros[
                                                                              ahorrosIndex];
                                                                      return InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          context
                                                                              .pushNamed(
                                                                            Perfil06CopyViewWidget.routeName,
                                                                            queryParameters:
                                                                                {
                                                                              'urlpdf': serializeParam(
                                                                                ahorrosItem.ahorrosDocPdf1,
                                                                                ParamType.String,
                                                                              ),
                                                                              'nombre': serializeParam(
                                                                                ahorrosItem.savingsType,
                                                                                ParamType.String,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 1.0,
                                                                          height:
                                                                              MediaQuery.sizeOf(context).height * 0.08,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: 255.0,
                                                                                  height: 60.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).customColor5,
                                                                                    borderRadius: BorderRadius.only(
                                                                                      topLeft: Radius.circular(8.0),
                                                                                      bottomLeft: Radius.circular(8.0),
                                                                                    ),
                                                                                  ),
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Image.asset(
                                                                                            'assets/images/Frame_(31).png',
                                                                                            width: 20.0,
                                                                                            height: 28.0,
                                                                                            fit: BoxFit.contain,
                                                                                          ),
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              AutoSizeText(
                                                                                                valueOrDefault<String>(
                                                                                                  ahorrosItem.savingsType,
                                                                                                  'Tipo de cuenta ',
                                                                                                ),
                                                                                                textAlign: TextAlign.start,
                                                                                                maxLines: 2,
                                                                                                minFontSize: 10.0,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Satoshi',
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                    ),
                                                                                              ),
                                                                                              AutoSizeText(
                                                                                                'No. ${(ahorrosIndex + 1).toString()}-00${(ahorrosIndex + 1).toString()}'.maybeHandleOverflow(
                                                                                                  maxChars: 10,
                                                                                                ),
                                                                                                textAlign: TextAlign.start,
                                                                                                maxLines: 1,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Satoshi',
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 12.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Image.asset(
                                                                                'assets/images/separador.png',
                                                                                height: 60.0,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                              Container(
                                                                                height: 60.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xFF002CE9),
                                                                                  borderRadius: BorderRadius.only(
                                                                                    topRight: Radius.circular(8.0),
                                                                                    bottomRight: Radius.circular(8.0),
                                                                                  ),
                                                                                ),
                                                                                alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, -1.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(41.0, 18.0, 41.0, 18.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        FaIcon(
                                                                                          FontAwesomeIcons.arrowRight,
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          size: 20.0,
                                                                                        ),
                                                                                      ].divide(SizedBox(width: 12.0)),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 0.0)),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }).divide(SizedBox(
                                                                        height:
                                                                            8.0)),
                                                                  );
                                                                },
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 16.0)),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  }).divide(
                                                      SizedBox(height: 24.0)),
                                                );
                                              },
                                            ),
                                          ),
                                        if (widget!.accountType == 'Otros')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 24.0, 24.0, 24.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  Perfil06CopyViewWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'urlpdf': serializeParam(
                                                      valueOrDefault(
                                                          currentUserDocument
                                                              ?.verificationPDF,
                                                          ''),
                                                      ParamType.String,
                                                    ),
                                                    'nombre': serializeParam(
                                                      'Vinculación',
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 60.0,
                                                decoration: BoxDecoration(),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        width: 255.0,
                                                        height: 60.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customColor5,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    8.0),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    8.0),
                                                          ),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
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
                                                                  'assets/images/Frame_(31).png',
                                                                  width: 20.0,
                                                                  height: 28.0,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Vinculación',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Satoshi',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      'No. 1-001',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Satoshi',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 12.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Image.asset(
                                                      'assets/images/separador.png',
                                                      height: 60.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                    Container(
                                                      height: 60.0,
                                                      decoration: BoxDecoration(
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
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
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
                      );
                    },
                  ),
                );
              },
            ),
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
