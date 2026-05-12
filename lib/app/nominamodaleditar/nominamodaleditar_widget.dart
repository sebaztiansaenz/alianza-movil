import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nominamodaleditar_model.dart';
export 'nominamodaleditar_model.dart';

class NominamodaleditarWidget extends StatefulWidget {
  const NominamodaleditarWidget({
    super.key,
    double? monto,
    required this.ahorroref,
  }) : this.monto = monto ?? 0.0;

  final double monto;
  final DocumentReference? ahorroref;

  @override
  State<NominamodaleditarWidget> createState() =>
      _NominamodaleditarWidgetState();
}

class _NominamodaleditarWidgetState extends State<NominamodaleditarWidget> {
  late NominamodaleditarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NominamodaleditarModel());

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
      child: StreamBuilder<AhorrosRecord>(
        stream: AhorrosRecord.getDocument(widget!.ahorroref!),
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

          final containerAhorrosRecord = snapshot.data!;

          return Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                    child: Container(
                      width: 32.0,
                      height: 4.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).customColor5,
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        0.0,
                        valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.03792,
                          36.0,
                        ),
                        0.0,
                        0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/Frame_(43).png',
                        width: valueOrDefault<double>(
                          MediaQuery.sizeOf(context).width * 0.09231,
                          36.0,
                        ),
                        height: valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.03792,
                          36.0,
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: AutoSizeText(
                      'Tu ahorro actual es de',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'Satoshi',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.02370,
                              20.0,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                    child: AutoSizeText(
                      valueOrDefault<String>(
                        functions.formatAmount(valueOrDefault<double>(
                          containerAhorrosRecord.totalSavingsPreApproval,
                          0.0,
                        )),
                        '\$ 0',
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Satoshi',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.03318,
                              28.0,
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
                          MediaQuery.sizeOf(context).height * 0.04266,
                          36.0,
                        ),
                        0.0,
                        valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.05688,
                          48.0,
                        )),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed(
                          AhorroDeNominaeditWidget.routeName,
                          queryParameters: {
                            'ahorroref': serializeParam(
                              widget!.ahorroref,
                              ParamType.DocumentReference,
                            ),
                            'monto': serializeParam(
                              containerAhorrosRecord.totalSavingsPreApproval,
                              ParamType.double,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            '__transition_info__': TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.rightToLeft,
                            ),
                          },
                        );
                      },
                      text: 'Modificar',
                      options: FFButtonOptions(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.05688,
                          48.0,
                        ),
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).customColor4,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
