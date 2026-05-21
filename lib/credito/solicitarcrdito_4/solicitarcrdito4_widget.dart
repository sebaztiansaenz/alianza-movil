import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/session_inactivity.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/sucess_mensaje_error/sucess_mensaje_error_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'solicitarcrdito4_model.dart';
export 'solicitarcrdito4_model.dart';

class Solicitarcrdito4Widget extends StatefulWidget {
  const Solicitarcrdito4Widget({
    super.key,
    required this.estadoCivil,
    required this.personasDependientes,
    required this.adultosAcargo,
    required this.residencia,
    required this.tiempoResidiendo,
    required this.tipoVivienda,
  });

  final String? estadoCivil;
  final String? personasDependientes;
  final String? adultosAcargo;
  final String? residencia;
  final String? tiempoResidiendo;
  final String? tipoVivienda;

  static String routeName = 'SOLICITARCRDITO-4';
  static String routePath = '/solicitarcrdito4';

  @override
  State<Solicitarcrdito4Widget> createState() => _Solicitarcrdito4WidgetState();
}

class _Solicitarcrdito4WidgetState extends State<Solicitarcrdito4Widget> with SessionActivityOnInitMixin {
  late Solicitarcrdito4Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Solicitarcrdito4Model());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FlutterFlowIconButton(
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
                  Text(
                    'Datos de empleo e ingresos',
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
                ].divide(SizedBox(width: 8.0)),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 4.0,
                  decoration: BoxDecoration(
                    color: Color(0x0C262632),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: valueOrDefault<double>(
                          MediaQuery.sizeOf(context).width * 0.08974,
                          35.0,
                        ),
                        height: 4.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF002CE9),
                        ),
                      ),
                      Container(
                        width: valueOrDefault<double>(
                          MediaQuery.sizeOf(context).width * 0.08974,
                          35.0,
                        ),
                        height: 4.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF002CE9),
                        ),
                      ),
                      Container(
                        width: valueOrDefault<double>(
                          MediaQuery.sizeOf(context).width * 0.08974,
                          35.0,
                        ),
                        height: 4.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF002CE9),
                        ),
                      ),
                      Container(
                        width: valueOrDefault<double>(
                          MediaQuery.sizeOf(context).width * 0.08974,
                          35.0,
                        ),
                        height: 4.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF002CE9),
                        ),
                      ),
                      Container(
                        width: valueOrDefault<double>(
                          MediaQuery.sizeOf(context).width * 0.08974,
                          35.0,
                        ),
                        height: 4.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF002CE9),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        20.0,
                        valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.03792,
                          32.0,
                        ),
                        20.0,
                        0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '¿Cuál es el nombre de su empleador o empresa?',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Satoshi',
                                fontSize: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.01659,
                                  14.0,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.05688,
                            48.0,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).customColor5,
                              width: 1.0,
                            ),
                          ),
                          child: Container(
                            width: 200.0,
                            child: TextFormField(
                              controller: _model.textController,
                              focusNode: _model.textFieldFocusNode,
                              autofocus: false,
                              enabled: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Satoshi',
                                      fontSize: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.01659,
                                        14.0,
                                      ),
                                      letterSpacing: 0.0,
                                    ),
                                hintText: 'Escriba el nombre',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Satoshi',
                                      fontSize: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.01659,
                                        14.0,
                                      ),
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
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
                                  ),
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              enableInteractiveSelection: true,
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0,
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.02370,
                                20.0,
                              ),
                              0.0,
                              0.0),
                          child: Text(
                            '¿Cuánto tiempo lleva en su empleo actual?',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Satoshi',
                                  fontSize: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.01659,
                                    14.0,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.tiempoEmpleo = 'Más de 24 meses';
                            safeSetState(() {});
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.05688,
                              48.0,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color:
                                    FlutterFlowTheme.of(context).customColor5,
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.01659,
                                    14.0,
                                  ),
                                  0.0,
                                  0.0,
                                  0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (_model.tiempoEmpleo !=
                                          'Más de 24 meses')
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.tiempoEmpleo =
                                                'Más de 24 meses';
                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            width: 16.0,
                                            height: 16.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                              border: Border.all(
                                                color: Color(0xB2262632),
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (_model.tiempoEmpleo ==
                                          'Más de 24 meses')
                                        Container(
                                          width: 16.0,
                                          height: 16.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                            border: Border.all(
                                              color: Color(0xB0FF6700),
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(2.0),
                                            child: Container(
                                              width: 100.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor4,
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                                shape: BoxShape.rectangle,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  Text(
                                    'Más de 24 meses',
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
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ].divide(SizedBox(
                                    width: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.01422,
                                  12.0,
                                ))),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.tiempoEmpleo = 'Entre 12 y 24 meses';
                            safeSetState(() {});
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.05688,
                              48.0,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color:
                                    FlutterFlowTheme.of(context).customColor5,
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.01659,
                                    14.0,
                                  ),
                                  0.0,
                                  0.0,
                                  0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (_model.tiempoEmpleo !=
                                          'Entre 12 y 24 meses')
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.tiempoEmpleo =
                                                'Entre 12 y 24 meses';
                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            width: 16.0,
                                            height: 16.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                              border: Border.all(
                                                color: Color(0xB2262632),
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (_model.tiempoEmpleo ==
                                          'Entre 12 y 24 meses')
                                        Container(
                                          width: 16.0,
                                          height: 16.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                            border: Border.all(
                                              color: Color(0xB0FF6700),
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(2.0),
                                            child: Container(
                                              width: 100.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor4,
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                                shape: BoxShape.rectangle,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  Text(
                                    'Entre 12 y 24 meses',
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
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ].divide(SizedBox(
                                    width: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.01422,
                                  12.0,
                                ))),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.tiempoEmpleo = 'Menos de 12 meses';
                            safeSetState(() {});
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.05688,
                              48.0,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color:
                                    FlutterFlowTheme.of(context).customColor5,
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.01659,
                                    14.0,
                                  ),
                                  0.0,
                                  0.0,
                                  0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (_model.tiempoEmpleo !=
                                          'Menos de 12 meses')
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.tiempoEmpleo =
                                                'Menos de 12 meses';
                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            width: 16.0,
                                            height: 16.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                              border: Border.all(
                                                color: Color(0xB2262632),
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (_model.tiempoEmpleo ==
                                          'Menos de 12 meses')
                                        Container(
                                          width: 16.0,
                                          height: 16.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                            border: Border.all(
                                              color: Color(0xB0FF6700),
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(2.0),
                                            child: Container(
                                              width: 100.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor4,
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                                shape: BoxShape.rectangle,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  Text(
                                    'Menos de 12 meses',
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
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ].divide(SizedBox(
                                    width: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.01422,
                                  12.0,
                                ))),
                              ),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(
                          height: valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.01422,
                        12.0,
                      ))),
                    ),
                  ),
                  if ((_model.tiempoEmpleo != null &&
                          _model.tiempoEmpleo != '') &&
                      (_model.textController.text != null &&
                          _model.textController.text != ''))
                    Builder(
                      builder: (context) => Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0,
                            valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.06162,
                              52.0,
                            ),
                            20.0,
                            0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if ((_model.tiempoEmpleo != null &&
                                    _model.tiempoEmpleo != '') &&
                                (_model.textController.text != null &&
                                    _model.textController.text != '')) {
                              context.pushNamed(
                                Solicitarcrdito5Widget.routeName,
                                queryParameters: {
                                  'estadoCivil': serializeParam(
                                    widget!.estadoCivil,
                                    ParamType.String,
                                  ),
                                  'personasDependientes': serializeParam(
                                    widget!.personasDependientes,
                                    ParamType.String,
                                  ),
                                  'adultosAcargo': serializeParam(
                                    widget!.adultosAcargo,
                                    ParamType.String,
                                  ),
                                  'residencia': serializeParam(
                                    widget!.residencia,
                                    ParamType.String,
                                  ),
                                  'tiempoResidiendo': serializeParam(
                                    widget!.tiempoResidiendo,
                                    ParamType.String,
                                  ),
                                  'tipoVivienda': serializeParam(
                                    widget!.tipoVivienda,
                                    ParamType.String,
                                  ),
                                  'empleadorNombre': serializeParam(
                                    _model.textController.text,
                                    ParamType.String,
                                  ),
                                  'tiempoEmpleo': serializeParam(
                                    _model.tiempoEmpleo,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  '__transition_info__': TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.rightToLeft,
                                  ),
                                },
                              );
                            } else {
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: GestureDetector(
                                      onTap: () {
                                        FocusScope.of(dialogContext).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: SucessMensajeErrorWidget(
                                        titulo: 'Error!',
                                        descripcion:
                                            'Debes completar la información faltante',
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          },
                          text: 'Continuar',
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
                            color: FlutterFlowTheme.of(context).customColor4,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Satoshi',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.01896,
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
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
