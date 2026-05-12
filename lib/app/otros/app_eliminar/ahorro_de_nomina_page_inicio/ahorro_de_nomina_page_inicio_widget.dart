import '/app/ahorros_pages/ahorro_contract_type_home/ahorro_contract_type_home_widget.dart';
import '/app/otros/animacionmenu/animacionmenu_widget.dart';
import '/app/otros/app_eliminar/menu_arriba/menu_arriba_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ahorro_de_nomina_page_inicio_model.dart';
export 'ahorro_de_nomina_page_inicio_model.dart';

class AhorroDeNominaPageInicioWidget extends StatefulWidget {
  const AhorroDeNominaPageInicioWidget({super.key});

  static String routeName = 'Ahorro_de_nominaPageInicio';
  static String routePath = '/ahorroDeNominaPageInicio';

  @override
  State<AhorroDeNominaPageInicioWidget> createState() =>
      _AhorroDeNominaPageInicioWidgetState();
}

class _AhorroDeNominaPageInicioWidgetState
    extends State<AhorroDeNominaPageInicioWidget> {
  late AhorroDeNominaPageInicioModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AhorroDeNominaPageInicioModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.ciudadbf = await actions.getJson(
        'https://opensheet.elk.sh/1VMxcLvCSOE0czms4r-mcd4HYsFneFx0lN6GZ2__hqoU/CIUDADES',
      );
      FFAppState().gsheets = _model.ciudadbf!;
      FFAppState().lastAction = getCurrentTimestamp;
      safeSetState(() {});
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    wrapWithModel(
                      model: _model.menuArribaModel,
                      updateCallback: () => safeSetState(() {}),
                      child: MenuArribaWidget(
                        black: true,
                        text: 'Mis ahorros',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.06399,
                            54.0,
                          ),
                          0.0,
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.02370,
                            20.0,
                          )),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            AutoSizeText(
                              'Apertura tu primera',
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              minFontSize: 10.0,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Satoshi',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.01659,
                                      14.0,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0,
                                  valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.0095,
                                    8.0,
                                  ),
                                  0.0,
                                  0.0),
                              child: AutoSizeText(
                                'Línea de Ahorro',
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                minFontSize: 20.0,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Satoshi',
                                      fontSize: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.02844,
                                        24.0,
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
                                    MediaQuery.sizeOf(context).height * 0.05214,
                                    44.0,
                                  ),
                                  0.0,
                                  0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/Group_73_(1).png',
                                  width: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).width * 0.17949,
                                    70.0,
                                  ),
                                  height: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.11139,
                                    94.0,
                                  ),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0,
                                  valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.05214,
                                    44.0,
                                  ),
                                  0.0,
                                  0.0),
                              child: AutoSizeText(
                                'Estás a un solo paso de empezar\nahorrar de verdad',
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                minFontSize: 12.0,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Satoshi',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.01896,
                                        16.0,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0,
                                  valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.06636,
                                    56.0,
                                  ),
                                  20.0,
                                  0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  FFAppState().typeOfProduct = '';
                                  FFAppState().TipoContrato = '';
                                  FFAppState().Salario = '';
                                  FFAppState().Antiguedad = '';
                                  safeSetState(() {});
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
                                          child: AhorroContractTypeHomeWidget(),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                text: 'Comenzar',
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
  }
}
