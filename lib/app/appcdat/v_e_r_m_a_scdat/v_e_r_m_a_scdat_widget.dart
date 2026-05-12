import '/app/appcdat/cdatretiros_copy/cdatretiros_copy_widget.dart';
import '/app/appcdat/cdatsinsaldo/cdatsinsaldo_widget.dart';
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
import 'v_e_r_m_a_scdat_model.dart';
export 'v_e_r_m_a_scdat_model.dart';

class VERMAScdatWidget extends StatefulWidget {
  const VERMAScdatWidget({
    super.key,
    required this.cdat,
    this.retirocdats,
  });

  final CdatsRecord? cdat;
  final ConfirmacionretirosRecord? retirocdats;

  static String routeName = 'VERMAScdat';
  static String routePath = '/vERMAScdat';

  @override
  State<VERMAScdatWidget> createState() => _VERMAScdatWidgetState();
}

class _VERMAScdatWidgetState extends State<VERMAScdatWidget> {
  late VERMAScdatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VERMAScdatModel());

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
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    20.0,
                    valueOrDefault<double>(
                      MediaQuery.sizeOf(context).height * 0.07110,
                      60.0,
                    ),
                    20.0,
                    0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 8.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.safePop();
                                },
                                child: Icon(
                                  Icons.arrow_back_sharp,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ),
                          AutoSizeText(
                            'CDAT',
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            minFontSize: 14.0,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Satoshi',
                                  fontSize: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.02133,
                                    18.0,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  lineHeight: 1.0,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ].divide(SizedBox(width: 4.0)),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 190.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      40.0, 0.0, 40.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 86.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .customColor5,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12.0),
                                        topRight: Radius.circular(12.0),
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Stack(
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        functions.formatAmount(
                                                            valueOrDefault<
                                                                double>(
                                                          widget!
                                                              .cdat?.inversion,
                                                          0.0,
                                                        )),
                                                        '\$ 0',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Satoshi',
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                    Text(
                                                      'Inversión',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Satoshi',
                                                            color: Color(
                                                                0xB2262632),
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, -1.0),
                                          child: Container(
                                            width: 68.0,
                                            height: 24.0,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.network(
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/7s5m7urx252h/Frame_2085662799_1.png',
                                                ).image,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 5.0, 0.0, 0.0),
                                              child: Text(
                                                '${valueOrDefault<String>(
                                                  widget!.cdat?.ea?.toString(),
                                                  '-',
                                                )}% E.A.',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 11.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        AHORROScdat2CopyCopyWidget.routeName,
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
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Detalles de inversión',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        FlutterFlowIconButton(
                                          borderRadius: 8.0,
                                          buttonSize: 30.0,
                                          icon: Icon(
                                            Icons.arrow_forward,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 16.0,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, -0.14),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 36.0, 0.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 115.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.asset(
                                        'assets/images/Vector_1_(1).png',
                                      ).image,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 12.0, 0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                functions.formatAmount(
                                                    valueOrDefault<double>(
                                                  widget!.cdat?.saldoDisponible,
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
                                                    fontSize: 36.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                            ),
                                          ),
                                          Text(
                                            'Mi saldo',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
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
                            ),
                          ],
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
                            20.0,
                            valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.02370,
                              20.0,
                            ),
                            20.0,
                            0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (valueOrDefault<double>(
                                        widget!.cdat?.saldoDisponible,
                                        0.0,
                                      ) >
                                      0.0) {
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
                                            child: CdatretirosCopyWidget(
                                              cdatsss: widget!.cdat,
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  } else {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
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
                                            child: CdatsinsaldoWidget(
                                              fecharetiro: widget!.cdat!,
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Container(
                                          width: 52.0,
                                          height: 52.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFEEF1FA),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.network(
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/krz0wmr8idhh/Frame_2609937_(5).png',
                                              ).image,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Transferir',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ].divide(SizedBox(height: 8.0)),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    MovimientoscdatWidget.routeName,
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
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Container(
                                        width: 52.0,
                                        height: 52.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFEEF1FA),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: Image.network(
                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/7xool9cvgt76/Frame_2609937_(6).png',
                                            ).image,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Movimientos',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ].divide(SizedBox(height: 8.0)),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Opacity(
                                opacity: 0.5,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Container(
                                        width: 52.0,
                                        height: 52.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFEEF1FA),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: Image.network(
                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/dwg5drhgmmlh/Frame_2609937_(7).png',
                                            ).image,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Certificado',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ].divide(SizedBox(height: 8.0)),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(
                              width: valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.01422,
                            12.0,
                          ))),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).customColor5,
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Disponibilidad de retiros aticipados',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        functions.formatAmount(
                                            valueOrDefault<double>(
                                          widget!.cdat?.ganancias,
                                          0.0,
                                        )),
                                        '\$ 0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            color: FlutterFlowTheme.of(context)
                                                .customColor4,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: StreamBuilder<List<RetirosCdatRecord>>(
                                    stream: queryRetirosCdatRecord(
                                      parent: widget!.cdat?.reference,
                                      queryBuilder: (retirosCdatRecord) =>
                                          retirosCdatRecord
                                              .orderBy('Fecharetiro'),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<RetirosCdatRecord>
                                          columnRetirosCdatRecordList =
                                          snapshot.data!;

                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(
                                            columnRetirosCdatRecordList.length,
                                            (columnIndex) {
                                          final columnRetirosCdatRecord =
                                              columnRetirosCdatRecordList[
                                                  columnIndex];
                                          return Opacity(
                                            opacity: valueOrDefault<double>(
                                              columnRetirosCdatRecord
                                                          .fecharetiro! <=
                                                      getCurrentTimestamp
                                                  ? 1.0
                                                  : 0.5,
                                              1.0,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Opacity(
                                                          opacity:
                                                              valueOrDefault<
                                                                  double>(
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
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        4.0,
                                                                        0.0),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderRadius:
                                                                  100.0,
                                                              buttonSize: 28.0,
                                                              fillColor: Color(
                                                                  0xFFFF6700),
                                                              icon: Icon(
                                                                Icons
                                                                    .check_outlined,
                                                                color: FlutterFlowTheme.of(
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
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        AutoSizeText(
                                                          valueOrDefault<
                                                              String>(
                                                            dateTimeFormat(
                                                              "d/M/y",
                                                              columnRetirosCdatRecord
                                                                  .fecharetiro,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            '- - - ',
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
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
                                                                  MediaQuery.sizeOf(
                                                                              context)
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
                                                        AutoSizeText(
                                                          valueOrDefault<
                                                              String>(
                                                            'Anticipo ${(columnIndex + 1).toString()}',
                                                            '-',
                                                          ),
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
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 4.0)),
                                                    ),
                                                  ],
                                                ),
                                                AutoSizeText(
                                                  valueOrDefault<String>(
                                                    functions.formatAmount(
                                                        columnRetirosCdatRecord
                                                            .monto),
                                                    '\$ 0',
                                                  ),
                                                  textAlign: TextAlign.end,
                                                  maxLines: 1,
                                                  minFontSize: 10.0,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Satoshi',
                                                        color:
                                                            Color(0xFF002CE9),
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
                                              ],
                                            ),
                                          );
                                        }).divide(SizedBox(height: 24.0)),
                                      );
                                    },
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
    );
  }
}
