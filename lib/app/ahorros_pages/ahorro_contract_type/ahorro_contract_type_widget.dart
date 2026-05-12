import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ahorro_contract_type_model.dart';
export 'ahorro_contract_type_model.dart';

class AhorroContractTypeWidget extends StatefulWidget {
  const AhorroContractTypeWidget({super.key});

  @override
  State<AhorroContractTypeWidget> createState() =>
      _AhorroContractTypeWidgetState();
}

class _AhorroContractTypeWidgetState extends State<AhorroContractTypeWidget> {
  late AhorroContractTypeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AhorroContractTypeModel());

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
                    color: FlutterFlowTheme.of(context).customColor5,
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 28.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/Frame_(36).png',
                        width: 24.0,
                        height: 24.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                    AutoSizeText(
                      'Contrato',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 28.0, 0.0, 40.0),
                child: Builder(
                  builder: (context) {
                    final types = _model.typeList.toList();

                    return ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: types.length,
                      separatorBuilder: (_, __) => SizedBox(height: 4.0),
                      itemBuilder: (context, typesIndex) {
                        final typesItem = types[typesIndex];
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            FFAppState().TipoContrato = typesItem;
                            _model.updatePage(() {});
                            await Future.delayed(
                              Duration(
                                milliseconds: 1000,
                              ),
                            );
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 0.06,
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
                                      typesItem,
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
                                  if (FFAppState().typeofcontact == typesItem)
                                    Icon(
                                      Icons.radio_button_checked,
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      size: 24.0,
                                    ),
                                  if (FFAppState().typeofcontact != typesItem)
                                    Icon(
                                      Icons.radio_button_off,
                                      color: Color(0x79FFFFFF),
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
