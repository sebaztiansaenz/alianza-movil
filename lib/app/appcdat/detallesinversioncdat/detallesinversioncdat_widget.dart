import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'detallesinversioncdat_model.dart';
export 'detallesinversioncdat_model.dart';

class DetallesinversioncdatWidget extends StatefulWidget {
  const DetallesinversioncdatWidget({
    super.key,
    required this.cdat,
  });

  final CdatsRecord? cdat;

  @override
  State<DetallesinversioncdatWidget> createState() =>
      _DetallesinversioncdatWidgetState();
}

class _DetallesinversioncdatWidgetState
    extends State<DetallesinversioncdatWidget> {
  late DetallesinversioncdatModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetallesinversioncdatModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).height * 0.35,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: Container(
                  width: 32.0,
                  height: 4.0,
                  decoration: BoxDecoration(
                    color: Color(0x1A262632),
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: AutoSizeText(
                  'Detalle de inversión',
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  minFontSize: 16.0,
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Satoshi',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.02370,
                          20.0,
                        ),
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  AutoSizeText(
                    'Tu CDAT se renovará automaticamente el ',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    minFontSize: 10.0,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Satoshi',
                          fontSize: valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.01659,
                            14.0,
                          ),
                          letterSpacing: 0.0,
                        ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                    child: AutoSizeText(
                      valueOrDefault<String>(
                        dateTimeFormat(
                          "d/M/y",
                          functions.sumarrestardias(
                              widget!.cdat!.fechaFinalizacion!, 1, true),
                          locale: FFLocalizations.of(context).languageCode,
                        ),
                        '-',
                      ),
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      minFontSize: 10.0,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Satoshi',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Image.asset(
                                    'assets/images/Frame_(53).png',
                                    width: 20.0,
                                    height: 20.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                AutoSizeText(
                                  valueOrDefault<String>(
                                    dateTimeFormat(
                                      "d/M/y",
                                      widget!.cdat?.fechaApertura,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    '-',
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  minFontSize: 10.0,
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
                              ].divide(SizedBox(width: 6.0)),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  14.0, 4.0, 0.0, 0.0),
                              child: AutoSizeText(
                                'Fecha de\n apertura',
                                textAlign: TextAlign.start,
                                maxLines: 2,
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
                          ],
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/Vector_(31).png',
                                        width: 20.0,
                                        height: 20.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    AutoSizeText(
                                      '${valueOrDefault<String>(
                                        widget!.cdat?.tiempo?.toString(),
                                        '0',
                                      )} meses',
                                      textAlign: TextAlign.start,
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
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 6.0)),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: AutoSizeText(
                                      'Tiempo\n',
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
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              4.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: Image.asset(
                                      'assets/images/Frame_(53).png',
                                      width: 20.0,
                                      height: 20.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  AutoSizeText(
                                    valueOrDefault<String>(
                                      dateTimeFormat(
                                        "d/M/y",
                                        widget!.cdat?.fechaFinalizacion,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      '-',
                                    ),
                                    textAlign: TextAlign.start,
                                    maxLines: 1,
                                    minFontSize: 10.0,
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
                                ].divide(SizedBox(width: 6.0)),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    14.0, 4.0, 0.0, 0.0),
                                child: AutoSizeText(
                                  'Fecha de \nfinalización',
                                  textAlign: TextAlign.start,
                                  maxLines: 2,
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
                            ],
                          ),
                        ),
                      ),
                    ].addToStart(SizedBox(width: 12.0)),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: Image.asset(
                                      'assets/images/Vector_(32).png',
                                      width: 20.0,
                                      height: 20.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  AutoSizeText(
                                    '-${functions.formatAmount(valueOrDefault<double>(
                                      widget!.cdat?.retefuenteMonto,
                                      0.0,
                                    ))}',
                                    textAlign: TextAlign.start,
                                    maxLines: 1,
                                    minFontSize: 10.0,
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
                                ].divide(SizedBox(width: 6.0)),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Retefuente ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      TextSpan(
                                        text: valueOrDefault<String>(
                                          valueOrDefault<double>(
                                                    widget!.cdat
                                                        ?.retefuenteporcentaje,
                                                    7.0,
                                                  ) ==
                                                  0.07
                                              ? '7'
                                              : '4',
                                          '7',
                                        ),
                                        style: TextStyle(),
                                      ),
                                      TextSpan(
                                        text: '',
                                        style: TextStyle(),
                                      ),
                                      TextSpan(
                                        text: '%',
                                        style: TextStyle(),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              4.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: Image.asset(
                                      'assets/images/Vector_(32).png',
                                      width: 20.0,
                                      height: 20.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  AutoSizeText(
                                    '${valueOrDefault<String>(
                                      widget!.cdat?.ea?.toString(),
                                      '0',
                                    )} %',
                                    textAlign: TextAlign.start,
                                    maxLines: 1,
                                    minFontSize: 10.0,
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
                                ].divide(SizedBox(width: 6.0)),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: AutoSizeText(
                                  'Efectiva Anual\n',
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
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: Image.asset(
                                      'assets/images/Vector_(32).png',
                                      width: 20.0,
                                      height: 20.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                AutoSizeText(
                                  valueOrDefault<String>(
                                    functions
                                        .formatAmount(valueOrDefault<double>(
                                      widget!.cdat?.rendimiento,
                                      0.0,
                                    )),
                                    '-',
                                  ),
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  minFontSize: 10.0,
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
                              ].divide(SizedBox(width: 6.0)),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: AutoSizeText(
                                'Rendimientos\n',
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
      ),
    );
  }
}
