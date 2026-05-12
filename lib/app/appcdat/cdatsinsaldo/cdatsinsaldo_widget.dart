import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cdatsinsaldo_model.dart';
export 'cdatsinsaldo_model.dart';

class CdatsinsaldoWidget extends StatefulWidget {
  const CdatsinsaldoWidget({
    super.key,
    required this.fecharetiro,
  });

  final CdatsRecord? fecharetiro;

  @override
  State<CdatsinsaldoWidget> createState() => _CdatsinsaldoWidgetState();
}

class _CdatsinsaldoWidgetState extends State<CdatsinsaldoWidget> {
  late CdatsinsaldoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CdatsinsaldoModel());

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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: Container(
                  width: 32.0,
                  height: 4.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 28.0, 0.0, 0.0),
                child: Container(
                  width: 52.0,
                  height: 52.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: Image.network(
                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/krz0wmr8idhh/Frame_2609937_(5).png',
                      ).image,
                    ),
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: AutoSizeText(
                  'No tienes saldo disponible',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  minFontSize: 16.0,
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Satoshi',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: AutoSizeText(
                  'En tu próximo anticipo tendrás saldo para transferir. ',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  minFontSize: 10.0,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Satoshi',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: StreamBuilder<List<RetirosCdatRecord>>(
                  stream: queryRetirosCdatRecord(
                    parent: widget!.fecharetiro?.reference,
                    queryBuilder: (retirosCdatRecord) => retirosCdatRecord
                        .where(
                          'Fecharetiro',
                          isGreaterThanOrEqualTo: getCurrentTimestamp,
                        )
                        .orderBy('Fecharetiro'),
                    limit: 1,
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
                    List<RetirosCdatRecord> columnRetirosCdatRecordList =
                        snapshot.data!;

                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(
                          columnRetirosCdatRecordList.length, (columnIndex) {
                        final columnRetirosCdatRecord =
                            columnRetirosCdatRecordList[columnIndex];
                        return AutoSizeText(
                          valueOrDefault<String>(
                            dateTimeFormat(
                              "d/M/y",
                              columnRetirosCdatRecord.fecharetiro,
                              locale: FFLocalizations.of(context).languageCode,
                            ),
                            '- - -',
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          minFontSize: 10.0,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Satoshi',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        );
                      }),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 48.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  text: 'Aceptar',
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 48.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).customColor4,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Satoshi',
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          fontSize: 16.0,
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
    );
  }
}
