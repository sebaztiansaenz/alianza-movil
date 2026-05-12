import '/app/ahorros_pages/ahorro_contract_type_home/ahorro_contract_type_home_widget.dart';
import '/app/otros/animacionmenu/animacionmenu_widget.dart';
import '/app/otros/app_eliminar/menu_arriba/menu_arriba_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'a_h_o_r_r_o_s_page1_model.dart';
export 'a_h_o_r_r_o_s_page1_model.dart';

class AHORROSPage1Widget extends StatefulWidget {
  const AHORROSPage1Widget({super.key});

  static String routeName = 'AHORRO_SPage1';
  static String routePath = '/aHORROSPage1';

  @override
  State<AHORROSPage1Widget> createState() => _AHORROSPage1WidgetState();
}

class _AHORROSPage1WidgetState extends State<AHORROSPage1Widget> {
  late AHORROSPage1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AHORROSPage1Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          FFAppState().isSavingAccountHave = valueOrDefault<bool>(
              currentUserDocument?.isHaveSavingAccount, false);
          FFAppState().lastAction = getCurrentTimestamp;
          safeSetState(() {});
          _model.ahorros = await queryAhorrosRecordOnce(
            queryBuilder: (ahorrosRecord) => ahorrosRecord
                .where(
                  'AhorrosDocPdf1',
                  isNotEqualTo: '',
                )
                .where(
                  'user',
                  isEqualTo: currentUserReference,
                ),
          );
          await Future.wait([
            Future(() async {
              _model.transactionsTotal = await actions.transactionsTotal(
                _model.ahorros!.map((e) => e.reference.id).toList().toList(),
              );
              _model.total = _model.transactionsTotal;
              safeSetState(() {});
            }),
            Future(() async {
              _model.withdrawalTotal = await actions.withdrawalTotal(
                _model.ahorros!.map((e) => e.reference.id).toList().toList(),
              );
              _model.withdrawals = _model.withdrawalTotal;
              safeSetState(() {});
            }),
          ]);
        }),
        Future(() async {
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
        }),
      ]);
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

    return StreamBuilder<List<AhorrosRecord>>(
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
        List<AhorrosRecord> aHORROSPage1AhorrosRecordList = snapshot.data!;

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
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            alignment: AlignmentDirectional(0.0, -1.0),
                            image: Image.asset(
                              'assets/images/Frame_2609784_(1).png',
                            ).image,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            wrapWithModel(
                              model: _model.menuArribaModel,
                              updateCallback: () => safeSetState(() {}),
                              child: MenuArribaWidget(
                                black: false,
                                text: 'Mis ahorros',
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 2.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  AutoSizeText(
                                    'Tus ahorros',
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    minFontSize: 28.0,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          fontSize: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.03792,
                                            32.0,
                                          ),
                                          letterSpacing: 1.5,
                                          fontWeight: FontWeight.w900,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: RichText(
                                      textScaler:
                                          MediaQuery.of(context).textScaler,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Te damos ',
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
                                                        0.01896,
                                                    16.0,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          TextSpan(
                                            text: '+',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              fontWeight: FontWeight.w500,
                                              fontSize: valueOrDefault<double>(
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontWeight: FontWeight.w500,
                                              fontSize: valueOrDefault<double>(
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              fontSize: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .height *
                                                    0.01659,
                                                14.0,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w200,
                                            ),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        6.0, 20.0, 6.0, 0.0),
                                    child: AutoSizeText(
                                      valueOrDefault<String>(
                                        functions.formatAmount(
                                            valueOrDefault<double>(
                                          valueOrDefault<double>(
                                                valueOrDefault<double>(
                                                      _model.total,
                                                      0.0,
                                                    ) -
                                                    valueOrDefault<double>(
                                                      _model.withdrawals,
                                                      0.0,
                                                    ),
                                                0.0,
                                              ) +
                                              valueOrDefault<double>(
                                                functions.ahorroBenefitsTotal(
                                                    aHORROSPage1AhorrosRecordList
                                                        .toList()),
                                                0.0,
                                              ),
                                          0.0,
                                        )),
                                        '\$- - -',
                                      ),
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      minFontSize: 30.0,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            color: Color(0xFFFF7700),
                                            fontSize: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.03792,
                                              32.0,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 2.0, 0.0, 0.0),
                                    child: AutoSizeText(
                                      'Mi saldo total',
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      minFontSize: 8.0,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            fontSize: valueOrDefault<double>(
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 20.0, 20.0, 20.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF2F52EA),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                AutoSizeText(
                                                  ' ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Satoshi',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                AutoSizeText(
                                                  'Histórico',
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                  minFontSize: 8.0,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Satoshi',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    _model.historico =
                                                        !_model.historico;
                                                    safeSetState(() {});
                                                  },
                                                  child: Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (_model.historico)
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 1.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x19D9D9D9),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          6.0,
                                                                          0.0,
                                                                          6.0,
                                                                          0.0),
                                                              child:
                                                                  AutoSizeText(
                                                                valueOrDefault<
                                                                    String>(
                                                                  _model.total !=
                                                                          null
                                                                      ? valueOrDefault<
                                                                          String>(
                                                                          functions
                                                                              .formatAmount(_model.total!),
                                                                          '0',
                                                                        )
                                                                      : '\$ - - -',
                                                                  '\$- - -',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
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
                                                                          .secondaryBackground,
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
                                                                              .bold,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                              child:
                                                                  AutoSizeText(
                                                                'Total ahorrado',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                maxLines: 1,
                                                                minFontSize:
                                                                    8.0,
                                                                style: FlutterFlowTheme.of(
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
                                                                        MediaQuery.sizeOf(context).height *
                                                                            0.01422,
                                                                        12.0,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          6.0,
                                                                          0.0,
                                                                          6.0,
                                                                          0.0),
                                                              child:
                                                                  AutoSizeText(
                                                                valueOrDefault<
                                                                    String>(
                                                                  functions.formatAmount(
                                                                      functions.ahorroBenefitsTotal(
                                                                          aHORROSPage1AhorrosRecordList
                                                                              .toList())),
                                                                  '\$- - -',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
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
                                                                          .secondaryBackground,
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
                                                                              .bold,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                              child:
                                                                  AutoSizeText(
                                                                'Beneficios',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                maxLines: 1,
                                                                minFontSize:
                                                                    8.0,
                                                                style: FlutterFlowTheme.of(
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
                                                                        MediaQuery.sizeOf(context).height *
                                                                            0.01422,
                                                                        12.0,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 8.0)),
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
                          ],
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0,
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.01896,
                                16.0,
                              ),
                              0.0,
                              0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.8,
                                height: 130.0,
                                child: CarouselSlider(
                                  items: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/Home-app4.jpg',
                                          width: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width *
                                                0.46154,
                                            180.0,
                                          ),
                                          height: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.16233,
                                            137.0,
                                          ),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/image_(2).png',
                                          width: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width *
                                                0.46154,
                                            180.0,
                                          ),
                                          height: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.16233,
                                            137.0,
                                          ),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/Home-app3.jpg',
                                          width: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width *
                                                0.46154,
                                            180.0,
                                          ),
                                          height: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.16233,
                                            137.0,
                                          ),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/Home-app2.jpg',
                                          width: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width *
                                                0.46154,
                                            180.0,
                                          ),
                                          height: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.16233,
                                            137.0,
                                          ),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ],
                                  carouselController:
                                      _model.carouselController ??=
                                          CarouselSliderController(),
                                  options: CarouselOptions(
                                    initialPage: 1,
                                    viewportFraction: 0.5,
                                    disableCenter: false,
                                    enlargeCenterPage: true,
                                    enlargeFactor: 0.1,
                                    enableInfiniteScroll: true,
                                    scrollDirection: Axis.horizontal,
                                    autoPlay: false,
                                    onPageChanged: (index, _) =>
                                        _model.carouselCurrentIndex = index,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 40.0),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0,
                                                        valueOrDefault<double>(
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .height *
                                                              0.02370,
                                                          20.0,
                                                        ),
                                                        0.0,
                                                        0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    AutoSizeText(
                                                      'Mis líneas',
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
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                    FutureBuilder<int>(
                                                      future:
                                                          queryServicesRecordCount(
                                                        queryBuilder:
                                                            (servicesRecord) =>
                                                                servicesRecord
                                                                    .where(
                                                          'ServiceMainType',
                                                          isEqualTo: 'Ahorros',
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
                                                        int containerCount =
                                                            snapshot.data!;

                                                        return Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Visibility(
                                                            visible:
                                                                aHORROSPage1AhorrosRecordList
                                                                        .length <
                                                                    containerCount,
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                FFAppState()
                                                                    .typeOfProduct = '';
                                                                FFAppState()
                                                                    .TipoContrato = '';
                                                                FFAppState()
                                                                    .Salario = '';
                                                                FFAppState()
                                                                    .Antiguedad = '';
                                                                safeSetState(
                                                                    () {});
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  useSafeArea:
                                                                      true,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        FocusScope.of(context)
                                                                            .unfocus();
                                                                        FocusManager
                                                                            .instance
                                                                            .primaryFocus
                                                                            ?.unfocus();
                                                                      },
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            MediaQuery.viewInsetsOf(context),
                                                                        child:
                                                                            AhorroContractTypeHomeWidget(),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    safeSetState(
                                                                        () {}));
                                                              },
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Icon(
                                                                    Icons.add,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor4,
                                                                    size: 24.0,
                                                                  ),
                                                                  AutoSizeText(
                                                                    'Aperturar línea',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    maxLines: 1,
                                                                    minFontSize:
                                                                        10.0,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Satoshi',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).customColor4,
                                                                          fontSize:
                                                                              valueOrDefault<double>(
                                                                            MediaQuery.sizeOf(context).height *
                                                                                0.01659,
                                                                            14.0,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        4.0)),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ],
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
                                                        40.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final containerVar =
                                                        aHORROSPage1AhorrosRecordList
                                                            .where((e) =>
                                                                e.ahorrosDocPdf1 !=
                                                                    null &&
                                                                e.ahorrosDocPdf1 !=
                                                                    '')
                                                            .toList();

                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                          containerVar.length,
                                                          (containerVarIndex) {
                                                        final containerVarItem =
                                                            containerVar[
                                                                containerVarIndex];
                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              AhorroMainPageWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'ahoro':
                                                                    serializeParam(
                                                                  containerVarItem,
                                                                  ParamType
                                                                      .Document,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                'ahoro':
                                                                    containerVarItem,
                                                                '__transition_info__':
                                                                    TransitionInfo(
                                                                  hasTransition:
                                                                      true,
                                                                  transitionType:
                                                                      PageTransitionType
                                                                          .rightToLeft,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          300),
                                                                ),
                                                              },
                                                            );
                                                          },
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            height: 60.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    width: valueOrDefault<
                                                                        double>(
                                                                      MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.65128,
                                                                      254.0,
                                                                    ),
                                                                    height: valueOrDefault<
                                                                        double>(
                                                                      MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.07110,
                                                                      60.0,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .customColor5,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(8.0),
                                                                        bottomLeft:
                                                                            Radius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Image.asset(
                                                                              'assets/images/Group_73_(1).png',
                                                                              width: 20.0,
                                                                              height: 28.0,
                                                                              fit: BoxFit.contain,
                                                                            ),
                                                                            Flexible(
                                                                              child: AutoSizeText(
                                                                                containerVarItem.savingsType,
                                                                                textAlign: TextAlign.start,
                                                                                maxLines: 2,
                                                                                minFontSize: 10.0,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Satoshi',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontSize: valueOrDefault<double>(
                                                                                        MediaQuery.sizeOf(context).height * 0.01659,
                                                                                        14.0,
                                                                                      ),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 12.0)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Image.asset(
                                                                  'assets/images/separador.png',
                                                                  height:
                                                                      valueOrDefault<
                                                                          double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.07110,
                                                                    60.0,
                                                                  ),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                                Container(
                                                                  height:
                                                                      valueOrDefault<
                                                                          double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.07110,
                                                                    60.0,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFF002CE9),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
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
                                                                          -1.0,
                                                                          0.0),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          41.0,
                                                                          18.0,
                                                                          41.0,
                                                                          18.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          FaIcon(
                                                                            FontAwesomeIcons.arrowRight,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            size:
                                                                                20.0,
                                                                          ),
                                                                        ].divide(SizedBox(width: 12.0)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 0.0)),
                                                            ),
                                                          ),
                                                        );
                                                      }).divide(SizedBox(
                                                          height: 8.0)),
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
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
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
          ),
        );
      },
    );
  }
}
