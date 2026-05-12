import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'detallesinversioncdat_copy2_model.dart';
export 'detallesinversioncdat_copy2_model.dart';

class DetallesinversioncdatCopy2Widget extends StatefulWidget {
  const DetallesinversioncdatCopy2Widget({
    super.key,
    this.cdat,
    required this.tiempo,
    double? inversion,
    double? ea,
    required this.cdatahorro,
  })  : this.inversion = inversion ?? 0.0,
        this.ea = ea ?? 0.0;

  final CdatsRecord? cdat;

  /// 0
  final String? tiempo;

  final double inversion;
  final double ea;
  final RetiroscdatStruct? cdatahorro;

  @override
  State<DetallesinversioncdatCopy2Widget> createState() =>
      _DetallesinversioncdatCopy2WidgetState();
}

class _DetallesinversioncdatCopy2WidgetState
    extends State<DetallesinversioncdatCopy2Widget> {
  late DetallesinversioncdatCopy2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetallesinversioncdatCopy2Model());

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
                                      getCurrentTimestamp,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    '- --',
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
                                      '${widget!.tiempo} meses',
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
                                      functions
                                          .sumarmeses(
                                              getCurrentTimestamp,
                                              widget!.tiempo == '6 meses'
                                                  ? 6
                                                  : 12)
                                          .toString(),
                                      '-',
                                    ),
                                    textAlign: TextAlign.start,
                                    maxLines: 1,
                                    minFontSize: 8.0,
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
                                    valueOrDefault<String>(
                                      '-${valueOrDefault<String>(
                                        functions.formatAmount(widget!.tiempo ==
                                                '6'
                                            ? valueOrDefault<double>(
                                                ((valueOrDefault<double>(
                                                              widget!.inversion,
                                                              0.0,
                                                            ) /
                                                            100) *
                                                        ((valueOrDefault<
                                                                    double>(
                                                                  widget!.ea,
                                                                  0.0,
                                                                ) /
                                                                12) *
                                                            6)) *
                                                    0.04,
                                                0.0,
                                              )
                                            : valueOrDefault<double>(
                                                ((valueOrDefault<double>(
                                                              widget!.inversion,
                                                              0.0,
                                                            ) /
                                                            100) *
                                                        ((valueOrDefault<
                                                                    double>(
                                                                  widget!.ea,
                                                                  0.0,
                                                                ) /
                                                                12) *
                                                            12)) *
                                                    0.04,
                                                0.0,
                                              )),
                                        '0',
                                      )}',
                                      '0',
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
                                  'Retefuente 4%\n',
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
                                    valueOrDefault<String>(
                                      '${valueOrDefault<String>(
                                        widget!.ea.toString(),
                                        '-',
                                      )} %',
                                      '- - -',
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
                                    functions.formatAmount(widget!.tiempo == '6'
                                        ? valueOrDefault<double>(
                                            ((valueOrDefault<double>(
                                                      widget!.inversion,
                                                      0.0,
                                                    ) /
                                                    100) *
                                                ((valueOrDefault<double>(
                                                          widget!.ea,
                                                          0.0,
                                                        ) /
                                                        12) *
                                                    6)),
                                            0.0,
                                          )
                                        : valueOrDefault<double>(
                                            ((valueOrDefault<double>(
                                                      widget!.inversion,
                                                      0.0,
                                                    ) /
                                                    100) *
                                                ((valueOrDefault<double>(
                                                          widget!.ea,
                                                          0.0,
                                                        ) /
                                                        12) *
                                                    12)),
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
