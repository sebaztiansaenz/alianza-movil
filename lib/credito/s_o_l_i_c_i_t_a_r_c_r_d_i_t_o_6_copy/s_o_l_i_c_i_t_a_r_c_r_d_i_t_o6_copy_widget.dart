import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/sucess_mensaje_error/sucess_mensaje_error_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 's_o_l_i_c_i_t_a_r_c_r_d_i_t_o6_copy_model.dart';
export 's_o_l_i_c_i_t_a_r_c_r_d_i_t_o6_copy_model.dart';

class SOLICITARCRDITO6CopyWidget extends StatefulWidget {
  const SOLICITARCRDITO6CopyWidget({
    super.key,
    required this.estadoCivil,
    required this.personasDependientes,
    required this.adultosAcargo,
    required this.residencia,
    required this.tiempoResidiendo,
    required this.tipoVivienda,
    required this.empresaNombre,
    required this.tiempoEmpleo,
    required this.ingresoPromed,
    required this.tipodeContrato,
    required this.interrupcionesLab,
    required this.creditosActivos,
    this.cuantoscreditos,
    this.gastos,
  });

  final String? estadoCivil;
  final String? personasDependientes;
  final String? adultosAcargo;
  final String? residencia;
  final String? tiempoResidiendo;
  final String? tipoVivienda;
  final String? empresaNombre;
  final String? tiempoEmpleo;
  final int? ingresoPromed;
  final String? tipodeContrato;
  final String? interrupcionesLab;
  final String? creditosActivos;
  final String? cuantoscreditos;
  final int? gastos;

  static String routeName = 'SOLICITARCRDITO-6Copy';
  static String routePath = '/sOLICITARCRDITO6Copy';

  @override
  State<SOLICITARCRDITO6CopyWidget> createState() =>
      _SOLICITARCRDITO6CopyWidgetState();
}

class _SOLICITARCRDITO6CopyWidgetState
    extends State<SOLICITARCRDITO6CopyWidget> {
  late SOLICITARCRDITO6CopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SOLICITARCRDITO6CopyModel());

    _model.amountTextController ??= TextEditingController();
    _model.amountFocusNode ??= FocusNode();

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
                    'Situación laboral y económica',
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
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '¿Tiene otras fuentes de ingreso?',
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
                                      _model.otrasfuentres = 'Si';
                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.05688,
                                        48.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: valueOrDefault<Color>(
                                            _model.otrasfuentres == 'Si'
                                                ? FlutterFlowTheme.of(context)
                                                    .customColor4
                                                : FlutterFlowTheme.of(context)
                                                    .customColor5,
                                            FlutterFlowTheme.of(context)
                                                .customColor5,
                                          ),
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.01659,
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
                                                if (_model.otrasfuentres !=
                                                    'Si')
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
                                                      _model.otrasfuentres =
                                                          'Si';
                                                      safeSetState(() {});
                                                    },
                                                    child: Container(
                                                      width: 16.0,
                                                      height: 16.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xB2262632),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (_model.otrasfuentres ==
                                                    'Si')
                                                  Container(
                                                    width: 16.0,
                                                    height: 16.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xB0FF6700),
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(2.0),
                                                      child: Container(
                                                        width: 100.0,
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customColor4,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      24.0),
                                                          shape: BoxShape
                                                              .rectangle,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Text(
                                              'Si',
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
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ].divide(SizedBox(
                                              width: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.01422,
                                            12.0,
                                          ))),
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
                                      _model.otrasfuentres = 'No';
                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.05688,
                                        48.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: valueOrDefault<Color>(
                                            _model.otrasfuentres == 'No'
                                                ? FlutterFlowTheme.of(context)
                                                    .customColor4
                                                : FlutterFlowTheme.of(context)
                                                    .customColor5,
                                            FlutterFlowTheme.of(context)
                                                .customColor5,
                                          ),
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.01659,
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
                                                if (_model.otrasfuentres !=
                                                    'No')
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
                                                      _model.otrasfuentres =
                                                          'No';
                                                      safeSetState(() {});
                                                    },
                                                    child: Container(
                                                      width: 16.0,
                                                      height: 16.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xB2262632),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (_model.otrasfuentres ==
                                                    'No')
                                                  Container(
                                                    width: 16.0,
                                                    height: 16.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xB0FF6700),
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(2.0),
                                                      child: Container(
                                                        width: 100.0,
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customColor4,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      24.0),
                                                          shape: BoxShape
                                                              .rectangle,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Text(
                                              'No',
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
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ].divide(SizedBox(
                                              width: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.01422,
                                            12.0,
                                          ))),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(
                                  width: valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.01422,
                                12.0,
                              ))),
                            ),
                          ],
                        ),
                      ].divide(SizedBox(
                          height: valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.01422,
                        12.0,
                      ))),
                    ),
                  ),
                  if (_model.otrasfuentres == 'Si')
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                              '¿Cuál es el promedio mensual de sus fuentes de ingreso adicionales?',
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
                                color:
                                    FlutterFlowTheme.of(context).customColor5,
                                width: 1.0,
                              ),
                            ),
                            child: Stack(
                              children: [
                                TextFormField(
                                  controller: _model.amountTextController,
                                  focusNode: _model.amountFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.amountTextController',
                                    Duration(milliseconds: 100),
                                    () => safeSetState(() {}),
                                  ),
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: FlutterFlowTheme.of(context)
                                              .customColor5,
                                          fontSize: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.01896,
                                            16.0,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                    hintText: '0.0',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: FlutterFlowTheme.of(context)
                                              .customColor5,
                                          fontSize: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.01896,
                                            16.0,
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
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .customColor5,
                                    hoverColor: FlutterFlowTheme.of(context)
                                        .customColor5,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Satoshi',
                                        color: FlutterFlowTheme.of(context)
                                            .customColor5,
                                        fontSize: valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.01896,
                                          16.0,
                                        ),
                                        letterSpacing: 0.0,
                                      ),
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          decimal: true),
                                  cursorColor:
                                      FlutterFlowTheme.of(context).customColor5,
                                  validator: _model
                                      .amountTextControllerValidator
                                      .asValidator(context),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp('^\\d*\\.?\\d{0,2}\$'))
                                  ],
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 6.0, 0.0, 0.0),
                                    child: AutoSizeText(
                                      valueOrDefault<String>(
                                        functions.formatAmount(
                                            valueOrDefault<double>(
                                          double.tryParse(
                                              _model.amountTextController.text),
                                          0.0,
                                        )),
                                        '\$0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ].divide(SizedBox(height: 12.0)),
                      ),
                    ),
                  if (_model.otrasfuentres != null &&
                      _model.otrasfuentres != '')
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
                            if (_model.otrasfuentres == 'Si') {
                              if (_model.amountTextController.text != null &&
                                  _model.amountTextController.text != '') {
                                context.pushNamed(
                                  Solicitarcrdito7Widget.routeName,
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
                                    'empresaNombre': serializeParam(
                                      widget!.empresaNombre,
                                      ParamType.String,
                                    ),
                                    'tiempoEmpleo': serializeParam(
                                      widget!.tiempoEmpleo,
                                      ParamType.String,
                                    ),
                                    'ingresoPromed': serializeParam(
                                      widget!.ingresoPromed,
                                      ParamType.int,
                                    ),
                                    'tipodeContrato': serializeParam(
                                      widget!.tipodeContrato,
                                      ParamType.String,
                                    ),
                                    'interrupcionesLab': serializeParam(
                                      widget!.interrupcionesLab,
                                      ParamType.String,
                                    ),
                                    'creditosActivos': serializeParam(
                                      widget!.creditosActivos,
                                      ParamType.String,
                                    ),
                                    'cuantoscreditos': serializeParam(
                                      widget!.cuantoscreditos,
                                      ParamType.String,
                                    ),
                                    'gastos': serializeParam(
                                      widget!.gastos,
                                      ParamType.int,
                                    ),
                                    'fuentesingreso': serializeParam(
                                      _model.otrasfuentres,
                                      ParamType.String,
                                    ),
                                    'promIngresos': serializeParam(
                                      int.tryParse(
                                          _model.amountTextController.text),
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 1.0)
                                          .resolve(Directionality.of(context)),
                                      child: GestureDetector(
                                        onTap: () {
                                          FocusScope.of(dialogContext)
                                              .unfocus();
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
                            } else {
                              context.pushNamed(
                                Solicitarcrdito7Widget.routeName,
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
                                  'empresaNombre': serializeParam(
                                    widget!.empresaNombre,
                                    ParamType.String,
                                  ),
                                  'tiempoEmpleo': serializeParam(
                                    widget!.tiempoEmpleo,
                                    ParamType.String,
                                  ),
                                  'ingresoPromed': serializeParam(
                                    widget!.ingresoPromed,
                                    ParamType.int,
                                  ),
                                  'tipodeContrato': serializeParam(
                                    widget!.tipodeContrato,
                                    ParamType.String,
                                  ),
                                  'interrupcionesLab': serializeParam(
                                    widget!.interrupcionesLab,
                                    ParamType.String,
                                  ),
                                  'creditosActivos': serializeParam(
                                    widget!.creditosActivos,
                                    ParamType.String,
                                  ),
                                  'cuantoscreditos': serializeParam(
                                    widget!.cuantoscreditos,
                                    ParamType.String,
                                  ),
                                  'gastos': serializeParam(
                                    widget!.gastos,
                                    ParamType.int,
                                  ),
                                  'fuentesingreso': serializeParam(
                                    _model.otrasfuentres,
                                    ParamType.String,
                                  ),
                                  'promIngresos': serializeParam(
                                    int.tryParse(
                                        _model.amountTextController.text),
                                    ParamType.int,
                                  ),
                                }.withoutNulls,
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
