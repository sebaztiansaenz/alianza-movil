import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/session_inactivity.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/sucess_mensaje_error/sucess_mensaje_error_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'solicitarcrdito10_model.dart';
export 'solicitarcrdito10_model.dart';

class Solicitarcrdito10Widget extends StatefulWidget {
  const Solicitarcrdito10Widget({
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
    required this.fuentesingreso,
    this.promIngresos,
    required this.pagoOtrasDeudas,
    required this.gastosFijos,
    required this.retrasoPagos,
    required this.tarjetasActivas,
    required this.centralRiesgo,
    required this.inversionActiva,
    required this.creditoGota,
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
  final String? fuentesingreso;
  final int? promIngresos;
  final int? pagoOtrasDeudas;
  final int? gastosFijos;
  final String? retrasoPagos;
  final String? tarjetasActivas;
  final String? centralRiesgo;
  final String? inversionActiva;
  final String? creditoGota;

  static String routeName = 'SOLICITARCRDITO-10';
  static String routePath = '/solicitarcrdito10';

  @override
  State<Solicitarcrdito10Widget> createState() =>
      _Solicitarcrdito10WidgetState();
}

class _Solicitarcrdito10WidgetState extends State<Solicitarcrdito10Widget> with SessionActivityOnInitMixin {
  late Solicitarcrdito10Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Solicitarcrdito10Model());

    _model.amount1TextController1 ??= TextEditingController();
    _model.amount1FocusNode1 ??= FocusNode();

    _model.amount1TextController2 ??= TextEditingController();
    _model.amount1FocusNode2 ??= FocusNode();

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
        body: Container(
          decoration: BoxDecoration(),
          child: Padding(
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
                      'Monto a solicitar',
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
                      color: Color(0xFF002CE9),
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
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: Column(
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
                              '¿Qué monto está solicitando?',
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
                                    controller: _model.amount1TextController1,
                                    focusNode: _model.amount1FocusNode1,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.amount1TextController1',
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
                                              MediaQuery.sizeOf(context)
                                                      .height *
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
                                              MediaQuery.sizeOf(context)
                                                      .height *
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
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
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
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .customColor5,
                                    validator: _model
                                        .amount1TextController1Validator
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
                                            double.tryParse(_model
                                                .amount1TextController1.text),
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
                                '¿En cuántos meses deseas pagar?',
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
                                    controller: _model.amount1TextController2,
                                    focusNode: _model.amount1FocusNode2,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.amount1TextController2',
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
                                              MediaQuery.sizeOf(context)
                                                      .height *
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
                                              MediaQuery.sizeOf(context)
                                                      .height *
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
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
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
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .customColor5,
                                    validator: _model
                                        .amount1TextController2Validator
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
                                          _model.amount1TextController2.text,
                                          '0',
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
                          ].divide(SizedBox(
                              height: valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.01422,
                            12.0,
                          ))),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(),
                        child: Builder(
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
                                if ((_model.amount1TextController1.text !=
                                            null &&
                                        _model.amount1TextController1.text !=
                                            '') &&
                                    (_model.amount1TextController2.text !=
                                            null &&
                                        _model.amount1TextController2.text !=
                                            '')) {
                                  await actions.actualizarHabilitarCredito(
                                    currentUserReference!.id,
                                    false,
                                    'En estudio',
                                    widget!.estadoCivil!,
                                    widget!.personasDependientes!,
                                    widget!.adultosAcargo!,
                                    widget!.residencia!,
                                    widget!.tiempoResidiendo!,
                                    widget!.tipoVivienda!,
                                    widget!.empresaNombre!,
                                    widget!.tiempoEmpleo!,
                                    widget!.tipodeContrato!,
                                    widget!.interrupcionesLab!,
                                    widget!.creditosActivos!,
                                    widget!.cuantoscreditos!,
                                    widget!.fuentesingreso!,
                                    widget!.retrasoPagos!,
                                    widget!.tarjetasActivas!,
                                    widget!.centralRiesgo!,
                                    widget!.inversionActiva!,
                                    widget!.creditoGota!,
                                    widget!.ingresoPromed!,
                                    widget!.gastos!,
                                    widget!.promIngresos!,
                                    widget!.pagoOtrasDeudas!,
                                    widget!.gastosFijos!,
                                    int.parse(
                                        _model.amount1TextController1.text),
                                    int.parse(
                                        _model.amount1TextController2.text),
                                  );

                                  await currentUserReference!
                                      .update(createUserRecordData(
                                    habilitar: false,
                                  ));

                                  context.pushNamed(
                                    MensajedeconfirmacinWidget.routeName,
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
                                        alignment:
                                            AlignmentDirectional(0.0, 1.0)
                                                .resolve(
                                                    Directionality.of(context)),
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
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
