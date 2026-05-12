import '/app/app_contrasea/cerrar_sesion_movil/cerrar_sesion_movil_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'aperturaahorro1_model.dart';
export 'aperturaahorro1_model.dart';

class Aperturaahorro1Widget extends StatefulWidget {
  const Aperturaahorro1Widget({super.key});

  static String routeName = 'aperturaahorro1';
  static String routePath = '/aperturaahorro1';

  @override
  State<Aperturaahorro1Widget> createState() => _Aperturaahorro1WidgetState();
}

class _Aperturaahorro1WidgetState extends State<Aperturaahorro1Widget> {
  late Aperturaahorro1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Aperturaahorro1Model());

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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 64.0, 20.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.arrow_back,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        _model.cuenta = await queryAhorrosRecordCount(
                          queryBuilder: (ahorrosRecord) => ahorrosRecord
                              .where(
                                'user',
                                isEqualTo: currentUserReference,
                              )
                              .where(
                                'AhorrosDocPdf1',
                                isNotEqualTo: '',
                              ),
                        );
                        if (_model.cuenta! >= 1) {
                          context.safePop();
                        } else {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return GestureDetector(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: CerrarSesionMovilWidget(),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        }

                        safeSetState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 16.0, 0.0, 32.0),
                        child: Text(
                          'Apertura tu \nLínea de ahorro',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Satoshi',
                                    fontSize: 32.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w900,
                                  ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 76.0,
                        child: CarouselSlider(
                          items: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/MINI_BANNER_-_01.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/6cbe4414492477d463a689c130c497e45a194e97.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/f5edc8c53e6fcb227f51654609c13d85f9ed199e.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/4f8398a0ee7d0260d2b495a7213fd1eb08544371.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                          carouselController: _model.carouselController ??=
                              CarouselSliderController(),
                          options: CarouselOptions(
                            initialPage: 1,
                            viewportFraction: 0.77,
                            disableCenter: true,
                            enlargeCenterPage: false,
                            enlargeFactor: 0.0,
                            enableInfiniteScroll: true,
                            scrollDirection: Axis.horizontal,
                            autoPlay: true,
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            autoPlayInterval:
                                Duration(milliseconds: (800 + 4000)),
                            autoPlayCurve: Curves.linear,
                            pauseAutoPlayInFiniteScroll: true,
                            onPageChanged: (index, _) =>
                                _model.carouselCurrentIndex = index,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 36.0, 0.0, 16.0),
                        child: Text(
                          '¿Cuáles es tu objetivo para ahorrar?',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Satoshi',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (_model.objetivo.contains(
                                            random_data.randomInteger(1, 1)) ==
                                        true) {
                                      _model.removeFromObjetivo(1);
                                      safeSetState(() {});
                                    } else {
                                      _model.addToObjetivo(1);
                                      safeSetState(() {});
                                    }
                                  },
                                  child: Container(
                                    width: 100.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: valueOrDefault<Color>(
                                          _model.objetivo.contains(random_data
                                                      .randomInteger(1, 1)) ==
                                                  true
                                              ? FlutterFlowTheme.of(context)
                                                  .customColor4
                                              : FlutterFlowTheme.of(context)
                                                  .customColor5,
                                          FlutterFlowTheme.of(context)
                                              .customColor5,
                                        ),
                                      ),
                                    ),
                                    child: Opacity(
                                      opacity: valueOrDefault<double>(
                                        _model.objetivo.contains(random_data
                                                    .randomInteger(1, 1)) ==
                                                true
                                            ? 1.0
                                            : 0.5,
                                        0.5,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/images/Frame_(12).png',
                                            width: 20.0,
                                            height: 20.0,
                                            fit: BoxFit.cover,
                                          ),
                                          Text(
                                            'Viajes',
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
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
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
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (_model.objetivo.contains(
                                            random_data.randomInteger(2, 2)) ==
                                        true) {
                                      _model.removeFromObjetivo(2);
                                      safeSetState(() {});
                                    } else {
                                      _model.addToObjetivo(2);
                                      safeSetState(() {});
                                    }
                                  },
                                  child: Container(
                                    width: 100.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: valueOrDefault<Color>(
                                          _model.objetivo.contains(random_data
                                                      .randomInteger(2, 2)) ==
                                                  true
                                              ? FlutterFlowTheme.of(context)
                                                  .customColor4
                                              : FlutterFlowTheme.of(context)
                                                  .customColor5,
                                          FlutterFlowTheme.of(context)
                                              .customColor5,
                                        ),
                                      ),
                                    ),
                                    child: Opacity(
                                      opacity: valueOrDefault<double>(
                                        _model.objetivo.contains(random_data
                                                    .randomInteger(2, 2)) ==
                                                true
                                            ? 1.0
                                            : 0.5,
                                        0.5,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/images/Frame_(25).png',
                                            width: 20.0,
                                            height: 20.0,
                                            fit: BoxFit.cover,
                                          ),
                                          Text(
                                            'Compras',
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
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
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
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (_model.objetivo.contains(
                                            random_data.randomInteger(3, 3)) ==
                                        true) {
                                      _model.removeFromObjetivo(3);
                                      safeSetState(() {});
                                    } else {
                                      _model.addToObjetivo(3);
                                      safeSetState(() {});
                                    }
                                  },
                                  child: Container(
                                    width: 100.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: valueOrDefault<Color>(
                                          _model.objetivo.contains(random_data
                                                      .randomInteger(3, 3)) ==
                                                  true
                                              ? FlutterFlowTheme.of(context)
                                                  .customColor4
                                              : FlutterFlowTheme.of(context)
                                                  .customColor5,
                                          FlutterFlowTheme.of(context)
                                              .customColor5,
                                        ),
                                      ),
                                    ),
                                    child: Opacity(
                                      opacity: valueOrDefault<double>(
                                        _model.objetivo.contains(random_data
                                                    .randomInteger(3, 3)) ==
                                                true
                                            ? 1.0
                                            : 0.5,
                                        0.5,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/images/Frame_(26).png',
                                            width: 20.0,
                                            height: 20.0,
                                            fit: BoxFit.cover,
                                          ),
                                          Text(
                                            'Inversión',
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
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (_model.objetivo.contains(
                                            random_data.randomInteger(4, 4)) ==
                                        true) {
                                      _model.removeFromObjetivo(4);
                                      safeSetState(() {});
                                    } else {
                                      _model.addToObjetivo(4);
                                      safeSetState(() {});
                                    }
                                  },
                                  child: Container(
                                    width: 100.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: valueOrDefault<Color>(
                                          _model.objetivo.contains(random_data
                                                      .randomInteger(4, 4)) ==
                                                  true
                                              ? FlutterFlowTheme.of(context)
                                                  .customColor4
                                              : FlutterFlowTheme.of(context)
                                                  .customColor5,
                                          FlutterFlowTheme.of(context)
                                              .customColor5,
                                        ),
                                      ),
                                    ),
                                    child: Opacity(
                                      opacity: valueOrDefault<double>(
                                        _model.objetivo.contains(random_data
                                                    .randomInteger(4, 4)) ==
                                                true
                                            ? 1.0
                                            : 0.5,
                                        0.5,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/images/Frame_(27).png',
                                            width: 20.0,
                                            height: 20.0,
                                            fit: BoxFit.cover,
                                          ),
                                          Text(
                                            'Futuro',
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
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
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
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (_model.objetivo.contains(
                                            random_data.randomInteger(5, 5)) ==
                                        true) {
                                      _model.removeFromObjetivo(5);
                                      safeSetState(() {});
                                    } else {
                                      _model.addToObjetivo(5);
                                      safeSetState(() {});
                                    }
                                  },
                                  child: Container(
                                    width: 100.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: valueOrDefault<Color>(
                                          _model.objetivo.contains(random_data
                                                      .randomInteger(5, 5)) ==
                                                  true
                                              ? FlutterFlowTheme.of(context)
                                                  .customColor4
                                              : FlutterFlowTheme.of(context)
                                                  .customColor5,
                                          FlutterFlowTheme.of(context)
                                              .customColor5,
                                        ),
                                      ),
                                    ),
                                    child: Opacity(
                                      opacity: valueOrDefault<double>(
                                        _model.objetivo.contains(random_data
                                                    .randomInteger(5, 5)) ==
                                                true
                                            ? 1.0
                                            : 0.5,
                                        0.5,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/images/Frame_(28).png',
                                            width: 20.0,
                                            height: 20.0,
                                            fit: BoxFit.cover,
                                          ),
                                          Text(
                                            'Familia',
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
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
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
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (_model.objetivo.contains(
                                            random_data.randomInteger(6, 6)) ==
                                        true) {
                                      _model.removeFromObjetivo(6);
                                      safeSetState(() {});
                                    } else {
                                      _model.addToObjetivo(6);
                                      safeSetState(() {});
                                    }
                                  },
                                  child: Container(
                                    width: 100.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: valueOrDefault<Color>(
                                          _model.objetivo.contains(random_data
                                                      .randomInteger(6, 6)) ==
                                                  true
                                              ? FlutterFlowTheme.of(context)
                                                  .customColor4
                                              : FlutterFlowTheme.of(context)
                                                  .customColor5,
                                          FlutterFlowTheme.of(context)
                                              .customColor5,
                                        ),
                                      ),
                                    ),
                                    child: Opacity(
                                      opacity: valueOrDefault<double>(
                                        _model.objetivo.contains(random_data
                                                    .randomInteger(6, 6)) ==
                                                true
                                            ? 1.0
                                            : 0.5,
                                        0.5,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/images/Frame_(17).png',
                                            width: 20.0,
                                            height: 20.0,
                                            fit: BoxFit.cover,
                                          ),
                                          Text(
                                            'Arte',
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
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (_model.objetivo.contains(
                                            random_data.randomInteger(7, 7)) ==
                                        true) {
                                      _model.removeFromObjetivo(7);
                                      safeSetState(() {});
                                    } else {
                                      _model.addToObjetivo(7);
                                      safeSetState(() {});
                                    }
                                  },
                                  child: Container(
                                    width: 100.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: valueOrDefault<Color>(
                                          _model.objetivo.contains(random_data
                                                      .randomInteger(7, 7)) ==
                                                  true
                                              ? FlutterFlowTheme.of(context)
                                                  .customColor4
                                              : FlutterFlowTheme.of(context)
                                                  .customColor5,
                                          FlutterFlowTheme.of(context)
                                              .customColor5,
                                        ),
                                      ),
                                    ),
                                    child: Opacity(
                                      opacity: valueOrDefault<double>(
                                        _model.objetivo.contains(random_data
                                                    .randomInteger(7, 7)) ==
                                                true
                                            ? 1.0
                                            : 0.5,
                                        0.5,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/images/Frame_(29).png',
                                            width: 20.0,
                                            height: 20.0,
                                            fit: BoxFit.cover,
                                          ),
                                          Text(
                                            'Educación',
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
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
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
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (_model.objetivo.contains(
                                            random_data.randomInteger(8, 8)) ==
                                        true) {
                                      _model.removeFromObjetivo(8);
                                      safeSetState(() {});
                                    } else {
                                      _model.addToObjetivo(8);
                                      safeSetState(() {});
                                    }
                                  },
                                  child: Container(
                                    width: 100.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: valueOrDefault<Color>(
                                          _model.objetivo.contains(random_data
                                                      .randomInteger(8, 8)) ==
                                                  true
                                              ? FlutterFlowTheme.of(context)
                                                  .customColor4
                                              : FlutterFlowTheme.of(context)
                                                  .customColor5,
                                          FlutterFlowTheme.of(context)
                                              .customColor5,
                                        ),
                                      ),
                                    ),
                                    child: Opacity(
                                      opacity: valueOrDefault<double>(
                                        _model.objetivo.contains(random_data
                                                    .randomInteger(8, 8)) ==
                                                true
                                            ? 1.0
                                            : 0.5,
                                        0.5,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/images/Frame_(30).png',
                                            width: 20.0,
                                            height: 20.0,
                                            fit: BoxFit.cover,
                                          ),
                                          Text(
                                            'Negocio propio',
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
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (_model.objetivo.contains(
                                            random_data.randomInteger(9, 9)) ==
                                        true) {
                                      _model.removeFromObjetivo(9);
                                      safeSetState(() {});
                                    } else {
                                      _model.addToObjetivo(9);
                                      safeSetState(() {});
                                    }
                                  },
                                  child: Container(
                                    width: 100.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: valueOrDefault<Color>(
                                          _model.objetivo.contains(random_data
                                                      .randomInteger(9, 9)) ==
                                                  true
                                              ? FlutterFlowTheme.of(context)
                                                  .customColor4
                                              : FlutterFlowTheme.of(context)
                                                  .customColor5,
                                          FlutterFlowTheme.of(context)
                                              .customColor5,
                                        ),
                                      ),
                                    ),
                                    child: Opacity(
                                      opacity: valueOrDefault<double>(
                                        _model.objetivo.contains(random_data
                                                    .randomInteger(9, 9)) ==
                                                true
                                            ? 1.0
                                            : 0.5,
                                        0.5,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/images/Frame_(20).png',
                                            width: 20.0,
                                            height: 20.0,
                                            fit: BoxFit.cover,
                                          ),
                                          Text(
                                            'Auto',
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
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
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
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (_model.objetivo.contains(random_data
                                            .randomInteger(10, 10)) ==
                                        true) {
                                      _model.removeFromObjetivo(10);
                                      safeSetState(() {});
                                    } else {
                                      _model.addToObjetivo(10);
                                      safeSetState(() {});
                                    }
                                  },
                                  child: Container(
                                    width: 100.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: valueOrDefault<Color>(
                                          _model.objetivo.contains(random_data
                                                      .randomInteger(10, 10)) ==
                                                  true
                                              ? FlutterFlowTheme.of(context)
                                                  .customColor4
                                              : FlutterFlowTheme.of(context)
                                                  .customColor5,
                                          FlutterFlowTheme.of(context)
                                              .customColor5,
                                        ),
                                      ),
                                    ),
                                    child: Opacity(
                                      opacity: _model.objetivo.contains(
                                                  random_data.randomInteger(
                                                      10, 10)) ==
                                              true
                                          ? 1.0
                                          : 0.5,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/images/Frame_(31).png',
                                            width: 20.0,
                                            height: 20.0,
                                            fit: BoxFit.cover,
                                          ),
                                          Text(
                                            'Casa',
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
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
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
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (_model.objetivo.contains(random_data
                                            .randomInteger(11, 11)) ==
                                        true) {
                                      _model.removeFromObjetivo(11);
                                      safeSetState(() {});
                                    } else {
                                      _model.addToObjetivo(11);
                                      safeSetState(() {});
                                    }
                                  },
                                  child: Container(
                                    width: 100.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: valueOrDefault<Color>(
                                          _model.objetivo.contains(random_data
                                                      .randomInteger(11, 11)) ==
                                                  true
                                              ? FlutterFlowTheme.of(context)
                                                  .customColor4
                                              : FlutterFlowTheme.of(context)
                                                  .customColor5,
                                          FlutterFlowTheme.of(context)
                                              .customColor5,
                                        ),
                                      ),
                                    ),
                                    child: Opacity(
                                      opacity: valueOrDefault<double>(
                                        _model.objetivo.contains(random_data
                                                    .randomInteger(11, 11)) ==
                                                true
                                            ? 1.0
                                            : 0.5,
                                        0.5,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/images/Frame_(32).png',
                                            width: 20.0,
                                            height: 20.0,
                                            fit: BoxFit.cover,
                                          ),
                                          Text(
                                            'Boda',
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
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                        ].divide(SizedBox(height: 12.0)),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 72.0, 0.0, 40.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed(
                                Aperturaahorro2Widget.routeName,
                                extra: <String, dynamic>{
                                  '__transition_info__': TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.rightToLeft,
                                  ),
                                },
                              );
                            },
                            text: 'Siguiente',
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 48.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFFFF6700),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Satoshi',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
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
  }
}
