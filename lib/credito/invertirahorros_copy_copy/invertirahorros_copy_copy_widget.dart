import '/app/cdathablarasesor_copy_copy/cdathablarasesor_copy_copy_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/session_inactivity.dart';
import '/credito/widgets/credito_mis_creditos_home_section.dart';
import '/credito/widgets/credito_oferta_proceso_page.dart';
import '/credito/widgets/credito_simulador_credito_page.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/credito/credito_navigation.dart';
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
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
    extends State<InvertirahorrosCopyCopyWidget> with SessionActivityOnInitMixin {
  late InvertirahorrosCopyCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _rebancarizacionActiva = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InvertirahorrosCopyCopyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  Future<void> _onPerfilCreditoTap() async {
    _model.habilitar = await queryUserRecordOnce(
      queryBuilder: (userRecord) => userRecord
          .where('uid', isEqualTo: currentUserReference?.id)
          .where('habilitar', isEqualTo: true),
      singleRecord: true,
    ).then((s) => s.firstOrNull);
    if (!mounted) return;
    if (_model.habilitar?.habilitar == true) {
      context.pushNamed(BienvenidacreditoWidget.routeName);
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
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: CdathablarasesorCopyCopyWidget(),
            ),
          );
        },
      );
    }
    safeSetState(() {});
  }

  Future<void> _onSolicitarCreditoTap() async {
    _model.habilitar = await queryUserRecordOnce(
      queryBuilder: (userRecord) => userRecord
          .where('uid', isEqualTo: currentUserReference?.id)
          .where('habilitar', isEqualTo: true),
      singleRecord: true,
    ).then((s) => s.firstOrNull);
    if (!mounted) return;
    if (_model.habilitar?.habilitar == true) {
      context.pushNamed(BienvenidacreditoWidget.routeName);
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
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: CdathablarasesorCopyCopyWidget(),
            ),
          );
        },
      );
    }
    safeSetState(() {});
  }

  Future<void> _onSimuladorTap() async {
    await Navigator.of(context).push<void>(
      creditoMaterialPageRoute(const CreditoSimuladorCreditoPage()),
    );
  }

  Future<void> _onHistorialTap() async {
    final doc = currentUserDocument;
    if (doc != null &&
        doc.perfilCredito &&
        doc.montoPreAprobado > 0) {
      await Navigator.of(context).push<dynamic>(
        creditoMaterialPageRoute(
          CreditoOfertaProcesoPage(
            montoPreAprobado: doc.montoPreAprobado,
            cuotaMensual: doc.cuotaMensual,
            plazoAprobadoMeses: doc.plazoAprobadoMeses,
          ),
        ),
      );
      if (mounted) safeSetState(() {});
      return;
    }

    _model.habilitar = await queryUserRecordOnce(
      queryBuilder: (userRecord) => userRecord
          .where('uid', isEqualTo: currentUserReference?.id)
          .where('habilitar', isEqualTo: true),
      singleRecord: true,
    ).then((s) => s.firstOrNull);
    if (!mounted) return;
    if (_model.habilitar?.habilitar == true) {
      context.pushNamed(Solicitarcrdito1Widget.routeName);
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
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: CdathablarasesorCopyCopyWidget(),
            ),
          );
        },
      );
    }
    if (mounted) safeSetState(() {});
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
        body: custom_widgets.FloatingNavBarScrollScope(
          child: Stack(
            children: [
              custom_widgets.FloatingNavBarScrollListener(
                child: Column(
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
                              Color(0xFF002CE9),
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
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: AlignmentDirectional.centerStart,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
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
                                        Expanded(
                                          child: InkWell(
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
                                        ),
                                        Expanded(
                                          child: Container(
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
                                                  e.reference.id != '')
                                              .toList()
                                              .firstOrNull,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'cdat': containerCdatsRecordList
                                            .where((e) =>
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
                        AuthUserStreamWidget(
                          builder: (context) {
                            final perfilCredito =
                                currentUserDocument?.perfilCredito == true;
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                20.0,
                                20.0,
                                20.0,
                                custom_widgets.floatingNavBarClearance(context) +
                                    52.0,
                              ),
                              child: CreditoMisCreditosHomeSection(
                                onPerfilCredito: _onPerfilCreditoTap,
                                onSolicitar: _onSolicitarCreditoTap,
                                onSimulador: _onSimuladorTap,
                                onHistorial: _onHistorialTap,
                                perfilCredito: perfilCredito,
                                montoPreAprobado:
                                    currentUserDocument?.montoPreAprobado ?? 0,
                                cuotaMensual:
                                    currentUserDocument?.cuotaMensual ?? 0,
                                plazoAprobadoMeses:
                                    currentUserDocument?.plazoAprobadoMeses ??
                                        0,
                                rebancarizacionProgramaActivo:
                                    _rebancarizacionActiva,
                                    onRebancarizacionActivada: () =>
                                        safeSetState(() =>
                                            _rebancarizacionActiva = true),
                                    onAbonarRebank: () {
                                      context.pushNamed(
                                        UnderDevelopmentWidget.routeName,
                                      );
                                    },
                                onDetallesRebank: () {
                                  context.pushNamed(
                                    UnderDevelopmentWidget.routeName,
                                  );
                                },
                              ),
                            );
                          },
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
              phone: true,
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
              phone: true,
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
  }
}
