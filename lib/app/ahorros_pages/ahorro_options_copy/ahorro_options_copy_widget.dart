import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ahorro_options_copy_model.dart';
export 'ahorro_options_copy_model.dart';

class AhorroOptionsCopyWidget extends StatefulWidget {
  const AhorroOptionsCopyWidget({super.key});

  @override
  State<AhorroOptionsCopyWidget> createState() =>
      _AhorroOptionsCopyWidgetState();
}

class _AhorroOptionsCopyWidgetState extends State<AhorroOptionsCopyWidget> {
  late AhorroOptionsCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AhorroOptionsCopyModel());

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
          List<AhorrosRecord> containerAhorrosRecordList = snapshot.data!;

          return Container(
            width: double.infinity,
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 28.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/Frame_(45).png',
                            width: 24.0,
                            height: 24.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                        AutoSizeText(
                          'Línea de ahorro',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Satoshi',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ].divide(SizedBox(width: 8.0)),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                    child: Container(
                      width: 32.0,
                      height: 4.0,
                      decoration: BoxDecoration(
                        color: Color(0x80FFFFFF),
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                    ),
                  ),
                  StreamBuilder<List<ServicesRecord>>(
                    stream: queryServicesRecord(
                      queryBuilder: (servicesRecord) => servicesRecord.where(
                        'ServiceMainType',
                        isEqualTo: FFAppState().CRMproductType,
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
                      List<ServicesRecord> containerServicesRecordList =
                          snapshot.data!;

                      return Container(
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 40.0),
                          child: Builder(
                            builder: (context) {
                              final containerVar2 = containerServicesRecordList
                                  .where((e) => !functions.listContainsItem(
                                      containerAhorrosRecordList
                                          .map((e) => e.service?.id)
                                          .withoutNulls
                                          .toList(),
                                      e.reference.id))
                                  .toList();

                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: containerVar2.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 4.0),
                                itemBuilder: (context, containerVar2Index) {
                                  final containerVar2Item =
                                      containerVar2[containerVar2Index];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      FFAppState().typeOfProduct =
                                          containerVar2Item.typesOfProductName;
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
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.055,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .customColor5,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
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
                                                containerVar2Item
                                                    .typesOfProductName,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                            if (containerVar2Item
                                                    .typesOfProductName ==
                                                FFAppState().typeOfProduct)
                                              Icon(
                                                Icons.radio_button_checked,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                size: 24.0,
                                              ),
                                            if (containerVar2Item
                                                    .typesOfProductName !=
                                                FFAppState().typeOfProduct)
                                              Icon(
                                                Icons.radio_button_off,
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                      );
                    },
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
