import '/app/appcdat/detallesinversioncdat/detallesinversioncdat_widget.dart';
import '/app/otros/animacionmenu/animacionmenu_widget.dart';
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
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cdatdetalleretiro_model.dart';
export 'cdatdetalleretiro_model.dart';

class CdatdetalleretiroWidget extends StatefulWidget {
  const CdatdetalleretiroWidget({
    super.key,
    required this.cdats,
  });

  final CdatsRecord? cdats;

  static String routeName = 'cdatdetalleretiro';
  static String routePath = '/cdatdetalleretiro';

  @override
  State<CdatdetalleretiroWidget> createState() =>
      _CdatdetalleretiroWidgetState();
}

class _CdatdetalleretiroWidgetState extends State<CdatdetalleretiroWidget> {
  late CdatdetalleretiroModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CdatdetalleretiroModel());

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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    0.0,
                    valueOrDefault<double>(
                      MediaQuery.sizeOf(context).height * 0.07110,
                      60.0,
                    ),
                    0.0,
                    0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 8.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.safePop();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                      ),
                    ),
                    AutoSizeText(
                      'Aperturar CDAT',
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      minFontSize: 14.0,
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
                  ],
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
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: valueOrDefault<double>(
                    MediaQuery.sizeOf(context).height * 0.11376,
                    96.0,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Container(
                          height: valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.10191,
                            86.0,
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                FlutterFlowTheme.of(context).fondo,
                                Color(0xFF002CE9)
                              ],
                              stops: [0.0, 1.0],
                              begin: AlignmentDirectional(0.03, -1.0),
                              end: AlignmentDirectional(-0.03, 1.0),
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.10191,
                              86.0,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.asset(
                                  'assets/images/Frame_2609784_(1).png',
                                ).image,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AutoSizeText(
                                    valueOrDefault<String>(
                                      functions
                                          .formatAmount(valueOrDefault<double>(
                                                widget!.cdats?.inversion,
                                                0.0,
                                              ) +
                                              valueOrDefault<double>(
                                                widget!.cdats?.ganancias,
                                                0.0,
                                              )),
                                      '0',
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    minFontSize: 18.0,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.02844,
                                            24.0,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  AutoSizeText(
                                    'Total a recibir',
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    minFontSize: 10.0,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
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
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(1.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 12.0, 0.0),
                          child: Container(
                            width: valueOrDefault<double>(
                              MediaQuery.sizeOf(context).width * 0.08974,
                              35.0,
                            ),
                            height: valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.06636,
                              56.0,
                            ),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.asset(
                                  'assets/images/path1320_(1).png',
                                ).image,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 3.0, 0.0, 0.0),
                                    child: AutoSizeText(
                                      valueOrDefault<String>(
                                        '${valueOrDefault<String>(
                                          widget!.cdats?.ea?.toString(),
                                          '0',
                                        )} %',
                                        '-',
                                      ),
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      minFontSize: 8.0,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
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
                                  ),
                                  AutoSizeText(
                                    'E.A',
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    minFontSize: 6.0,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.0095,
                                            8.0,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
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
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0.0,
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.03555,
                        30.0,
                      ),
                      0.0,
                      40.0),
                  child: SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  height: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.07821,
                                    66.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEF1FA),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AutoSizeText(
                                        valueOrDefault<String>(
                                          functions.formatAmount(
                                              valueOrDefault<double>(
                                            widget!.cdats?.inversion,
                                            0.0,
                                          )),
                                          '0',
                                        ),
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        minFontSize: 12.0,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              color: Color(0xFF002CE9),
                                              fontSize: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .height *
                                                    0.01896,
                                                16.0,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      AutoSizeText(
                                        'Inversión',
                                        textAlign: TextAlign.center,
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
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Image.asset(
                                  'assets/images/g1294.png',
                                  width: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).width * 0.04615,
                                    18.0,
                                  ),
                                  height: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.02133,
                                    18.0,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 66.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEF1FA),
                                    borderRadius: BorderRadius.circular(8.0),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AutoSizeText(
                                        valueOrDefault<String>(
                                          functions.formatAmount(
                                              valueOrDefault<double>(
                                            widget!.cdats?.ganancias,
                                            0.0,
                                          )),
                                          '0',
                                        ),
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        minFontSize: 12.0,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              color: Color(0xFF002CE9),
                                              fontSize: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .height *
                                                    0.01896,
                                                16.0,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      AutoSizeText(
                                        'Ganancias',
                                        textAlign: TextAlign.center,
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
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 16.0)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AutoSizeText(
                                'Disponibilidad de retiros aticipados',
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                minFontSize: 8.0,
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    4.0, 0.0, 0.0, 0.0),
                                child: AutoSizeText(
                                  valueOrDefault<String>(
                                    functions
                                        .formatAmount(valueOrDefault<double>(
                                      widget!.cdats?.ganancias,
                                      0.0,
                                    )),
                                    '0',
                                  ).maybeHandleOverflow(
                                    maxChars: 10,
                                  ),
                                  textAlign: TextAlign.end,
                                  maxLines: 1,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Satoshi',
                                        color: Color(0xFFFF6700),
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
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 16.0, 20.0, 0.0),
                          child: StreamBuilder<List<RetirosCdatRecord>>(
                            stream: queryRetirosCdatRecord(
                              parent: widget!.cdats?.reference,
                              queryBuilder: (retirosCdatRecord) =>
                                  retirosCdatRecord.orderBy('Fecharetiro'),
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
                              List<RetirosCdatRecord>
                                  columnRetirosCdatRecordList = snapshot.data!;

                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(
                                    columnRetirosCdatRecordList.length,
                                    (columnIndex) {
                                  final columnRetirosCdatRecord =
                                      columnRetirosCdatRecordList[columnIndex];
                                  return Opacity(
                                    opacity: valueOrDefault<double>(
                                      columnRetirosCdatRecord.fecharetiro! <=
                                              getCurrentTimestamp
                                          ? 1.0
                                          : 0.5,
                                      1.0,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Opacity(
                                                  opacity:
                                                      valueOrDefault<double>(
                                                    columnRetirosCdatRecord
                                                                .fecharetiro! <=
                                                            getCurrentTimestamp
                                                        ? 1.0
                                                        : 0.0,
                                                    1.0,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                4.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderRadius: 100.0,
                                                      buttonSize: 28.0,
                                                      fillColor:
                                                          Color(0xFFFF6700),
                                                      icon: Icon(
                                                        Icons.check_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        size: 12.0,
                                                      ),
                                                      onPressed: () {
                                                        print(
                                                            'IconButton pressed ...');
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                AutoSizeText(
                                                  valueOrDefault<String>(
                                                    dateTimeFormat(
                                                      "d/M/y",
                                                      columnRetirosCdatRecord
                                                          .fecharetiro,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                    '-',
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  minFontSize: 10.0,
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
                                                AutoSizeText(
                                                  valueOrDefault<String>(
                                                    'Anticipo ${(columnIndex + 1).toString()}',
                                                    '-',
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  minFontSize: 8.0,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Satoshi',
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ].divide(SizedBox(height: 4.0)),
                                            ),
                                          ],
                                        ),
                                        AutoSizeText(
                                          valueOrDefault<String>(
                                            functions.formatAmount(
                                                columnRetirosCdatRecord.monto),
                                            '0',
                                          ),
                                          textAlign: TextAlign.end,
                                          maxLines: 1,
                                          minFontSize: 10.0,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                color: Color(0xFF002CE9),
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
                                  );
                                }).divide(SizedBox(height: 24.0)),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 32.0, 20.0, 0.0),
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
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: DetallesinversioncdatWidget(
                                      cdat: widget!.cdats!,
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.05688,
                                48.0,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xFFEEF1FA),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 12.0, 0.0),
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
                                                  0.0, 0.0, 8.0, 0.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: Image.asset(
                                              'assets/images/Group_123.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        AutoSizeText(
                                          'Mas detalles de inversión',
                                          textAlign: TextAlign.start,
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
                                    Icon(
                                      Icons.chevron_right_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                  ].divide(SizedBox(width: 8.0)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0,
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.02607,
                                22.0,
                              ),
                              20.0,
                              60.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 0.18,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEF1FA),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: AutoSizeText(
                                      'Ten en cuenta que:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      AutoSizeText(
                                        'Tu CDAT se renovará automáticamente el: ',
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        minFontSize: 8.0,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      AutoSizeText(
                                        valueOrDefault<String>(
                                          dateTimeFormat(
                                            "d/M/y",
                                            functions.sumarrestardias(
                                                widget!
                                                    .cdats!.fechaFinalizacion!,
                                                1,
                                                true),
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ),
                                          '-',
                                        ),
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
                                            ),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 4.0, 0.0),
                                      child: AutoSizeText(
                                        'Si deseas aplicar retiro total o parcial, podrás hacerlo entre el: ',
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        minFontSize: 8.0,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AutoSizeText(
                                        valueOrDefault<String>(
                                          dateTimeFormat(
                                            "d/M/y",
                                            functions.sumarrestardias(
                                                widget!
                                                    .cdats!.fechaFinalizacion!,
                                                10,
                                                false),
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ),
                                          '-',
                                        ),
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
                                            ),
                                      ),
                                      AutoSizeText(
                                        ' y ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      AutoSizeText(
                                        valueOrDefault<String>(
                                          dateTimeFormat(
                                            "d/M/y",
                                            widget!.cdats?.fechaFinalizacion,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ),
                                          '-',
                                        ),
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
                                            ),
                                      ),
                                    ].divide(SizedBox(width: 2.0)),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 4.0, 0.0),
                                      child: AutoSizeText(
                                        'Se renovará el capital disponible de tu saldo a la tasa efectiva de la fecha de finalización de este CDAT.',
                                        textAlign: TextAlign.start,
                                        minFontSize: 8.0,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 8.0)),
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
          if (responsiveVisibility(
            context: context,
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
  }
}
