import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'aperturaahorro2_model.dart';
export 'aperturaahorro2_model.dart';

class Aperturaahorro2Widget extends StatefulWidget {
  const Aperturaahorro2Widget({super.key});

  static String routeName = 'aperturaahorro2';
  static String routePath = '/aperturaahorro2';

  @override
  State<Aperturaahorro2Widget> createState() => _Aperturaahorro2WidgetState();
}

class _Aperturaahorro2WidgetState extends State<Aperturaahorro2Widget> {
  late Aperturaahorro2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Aperturaahorro2Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 64.0, 0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
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
                          context.safePop();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: StreamBuilder<List<AhorrosRecord>>(
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
                    List<AhorrosRecord> containerAhorrosRecordList =
                        snapshot.data!;

                    return Container(
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 16.0, 20.0, 0.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Recibirás\n rendimientos\n diarios por tu\n Capital',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
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
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          child: Image.asset(
                                            'assets/images/cochiloopp.gif',
                                            width: 114.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 24.0)),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 32.0, 0.0, 16.0),
                                      child: Text(
                                        'Líneas de ahorro',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                    StreamBuilder<List<ServicesRecord>>(
                                      stream: queryServicesRecord(
                                        queryBuilder: (servicesRecord) =>
                                            servicesRecord.where(
                                          'ServiceMainType',
                                          isEqualTo:
                                              FFAppState().CRMproductType,
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
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<ServicesRecord>
                                            containerServicesRecordList =
                                            snapshot.data!;

                                        return Container(
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Builder(
                                                builder: (context) {
                                                  final containerVar2 =
                                                      containerServicesRecordList
                                                          .where((e) => functions
                                                              .listContainsItemCopy(
                                                                  containerAhorrosRecordList
                                                                      .toList(),
                                                                  ServicesTipoStruct(
                                                                    typesOfProductName:
                                                                        e.typesOfProductName,
                                                                    idServicio:
                                                                        e.reference,
                                                                  )))
                                                          .toList();

                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                        containerVar2.length,
                                                        (containerVar2Index) {
                                                      final containerVar2Item =
                                                          containerVar2[
                                                              containerVar2Index];
                                                      return Visibility(
                                                        visible: (containerVar2Item
                                                                    .typesOfProductName !=
                                                                'Linea de Ahorro Los Mejores') &&
                                                            (containerVar2Item
                                                                    .typesOfProductName !=
                                                                'Linea de Ahorro Permanente'),
                                                        child: Opacity(
                                                          opacity:
                                                              valueOrDefault<
                                                                  double>(
                                                            _model.ahorro !=
                                                                    containerVar2Item
                                                                        .typesOfProductName
                                                                ? 0.5
                                                                : 1.0,
                                                            1.0,
                                                          ),
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
                                                              _model.ahorro =
                                                                  containerVar2Item
                                                                      .typesOfProductName;
                                                              safeSetState(
                                                                  () {});
                                                              FFAppState()
                                                                      .typeOfProduct =
                                                                  containerVar2Item
                                                                      .typesOfProductName;
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              height: 48.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                                border:
                                                                    Border.all(
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    _model.ahorro ==
                                                                            containerVar2Item
                                                                                .typesOfProductName
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .customColor4
                                                                        : FlutterFlowTheme.of(context)
                                                                            .customColor5,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor5,
                                                                  ),
                                                                ),
                                                              ),
                                                              child: Stack(
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.08),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              14.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              if (_model.ahorro != containerVar2Item.typesOfProductName)
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    _model.ahorro = containerVar2Item.typesOfProductName;
                                                                                    safeSetState(() {});
                                                                                    FFAppState().typeOfProduct = containerVar2Item.typesOfProductName;
                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  child: Container(
                                                                                    width: 20.0,
                                                                                    height: 20.0,
                                                                                    decoration: BoxDecoration(
                                                                                      borderRadius: BorderRadius.circular(24.0),
                                                                                      border: Border.all(
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        width: 1.0,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (_model.ahorro == containerVar2Item.typesOfProductName)
                                                                                Container(
                                                                                  width: 20.0,
                                                                                  height: 20.0,
                                                                                  decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(24.0),
                                                                                    border: Border.all(
                                                                                      color: _model.ahorro == containerVar2Item.typesOfProductName ? FlutterFlowTheme.of(context).customColor4 : FlutterFlowTheme.of(context).customColor5,
                                                                                      width: 1.0,
                                                                                    ),
                                                                                  ),
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Container(
                                                                                      width: 10.0,
                                                                                      height: 10.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).customColor4,
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  valueOrDefault<String>(
                                                                                    containerVar2Item.typesOfProductName,
                                                                                    'Línea de ahorro Nomina',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Satoshi',
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1.01,
                                                                            -1.04),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/Frame_2085662540_(9).png',
                                                                      width: valueOrDefault<
                                                                          double>(
                                                                        MediaQuery.sizeOf(context).width *
                                                                            0.14872,
                                                                        58.0,
                                                                      ),
                                                                      height: valueOrDefault<
                                                                          double>(
                                                                        MediaQuery.sizeOf(context).height *
                                                                            0.02844,
                                                                        24.0,
                                                                      ),
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }).divide(
                                                      SizedBox(height: 12.0),
                                                      filterFn:
                                                          (containerVar2Index) {
                                                        final containerVar2Item =
                                                            containerVar2[
                                                                containerVar2Index];
                                                        return (containerVar2Item
                                                                    .typesOfProductName !=
                                                                'Linea de Ahorro Los Mejores') &&
                                                            (containerVar2Item
                                                                    .typesOfProductName !=
                                                                'Linea de Ahorro Permanente');
                                                      },
                                                    ),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                    if (_model.ahorro != null &&
                                        _model.ahorro != '')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 44.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  visualDensity:
                                                      VisualDensity.compact,
                                                  materialTapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                              child: Checkbox(
                                                value: _model.checkboxValue ??=
                                                    false,
                                                onChanged: (newValue) async {
                                                  safeSetState(() =>
                                                      _model.checkboxValue =
                                                          newValue!);
                                                },
                                                side: (FlutterFlowTheme.of(
                                                                context)
                                                            .alternate !=
                                                        null)
                                                    ? BorderSide(
                                                        width: 2,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate!,
                                                      )
                                                    : null,
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                checkColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                              ),
                                            ),
                                            Flexible(
                                              child: RichText(
                                                textScaler:
                                                    MediaQuery.of(context)
                                                        .textScaler,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text:
                                                          'Confirmo que he leído y acepto el reglamento de las',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Satoshi',
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                    TextSpan(
                                                      text: ' Líneas de Ahorro',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Satoshi',
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                          ),
                                                      mouseCursor:
                                                          SystemMouseCursors
                                                              .click,
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () async {
                                                              await launchURL(
                                                                  'https://alianzacapital.co/normatividad.html');
                                                            },
                                                    )
                                                  ],
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Satoshi',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                      ),
                                    if (_model.checkboxValue == true)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 56.0, 0.0, 40.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            FFAppState().typeOfProduct =
                                                _model.ahorro!;
                                            _model.updatePage(() {});
                                            if ((FFAppState().typeOfProduct ==
                                                    'Linea de Ahorro de nómina') ||
                                                (FFAppState().typeOfProduct ==
                                                    'Ahorro de nómina')) {
                                              context.pushNamed(
                                                AhorroDeNominaPageWidget
                                                    .routeName,
                                                queryParameters: {
                                                  'cambioEmpresa':
                                                      serializeParam(
                                                    false,
                                                    ParamType.bool,
                                                  ),
                                                }.withoutNulls,
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
                                            } else {
                                              context.pushNamed(
                                                AhorroDOCUMENTOapageWidget
                                                    .routeName,
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
                                            }
                                          },
                                          text: 'Crear Línea de ahorro',
                                          options: FFButtonOptions(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 48.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0xFFFF6700),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Satoshi',
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
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
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
