import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ahorro_options_model.dart';
export 'ahorro_options_model.dart';

class AhorroOptionsWidget extends StatefulWidget {
  const AhorroOptionsWidget({super.key});

  @override
  State<AhorroOptionsWidget> createState() => _AhorroOptionsWidgetState();
}

class _AhorroOptionsWidgetState extends State<AhorroOptionsWidget> {
  late AhorroOptionsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AhorroOptionsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
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
                    color: FlutterFlowTheme.of(context).customColor5,
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 28.0, 0.0, 40.0),
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
                    List<AhorrosRecord> listViewAhorrosRecordList =
                        snapshot.data!;

                    return ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewAhorrosRecordList.length,
                      separatorBuilder: (_, __) => SizedBox(height: 4.0),
                      itemBuilder: (context, listViewIndex) {
                        final listViewAhorrosRecord =
                            listViewAhorrosRecordList[listViewIndex];
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            FFAppState().statementTypeRef =
                                listViewAhorrosRecord.reference;
                            _model.updatePage(() {});
                            await Future.delayed(
                              Duration(
                                milliseconds: 1000,
                              ),
                            );
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: double.infinity,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).customColor5,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  14.0, 0.0, 14.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: AutoSizeText(
                                      listViewAhorrosRecord.savingsType,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  if (listViewAhorrosRecord.reference ==
                                      FFAppState().statementTypeRef)
                                    Icon(
                                      Icons.radio_button_checked,
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      size: 24.0,
                                    ),
                                  if (listViewAhorrosRecord.reference !=
                                      FFAppState().statementTypeRef)
                                    Icon(
                                      Icons.radio_button_off,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                ].divide(SizedBox(width: 20.0)),
                              ),
                            ),
                          ),
                        );
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
