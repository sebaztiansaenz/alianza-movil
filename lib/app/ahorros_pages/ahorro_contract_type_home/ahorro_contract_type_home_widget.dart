import '/app/ahorros_pages/ahorro_options_copy/ahorro_options_copy_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ahorro_contract_type_home_model.dart';
export 'ahorro_contract_type_home_model.dart';

class AhorroContractTypeHomeWidget extends StatefulWidget {
  const AhorroContractTypeHomeWidget({super.key});

  @override
  State<AhorroContractTypeHomeWidget> createState() =>
      _AhorroContractTypeHomeWidgetState();
}

class _AhorroContractTypeHomeWidgetState
    extends State<AhorroContractTypeHomeWidget> {
  late AhorroContractTypeHomeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AhorroContractTypeHomeModel());

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
        width: MediaQuery.sizeOf(context).width * 1.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
        child: Form(
          key: _model.formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/g2004.png',
                    width: 46.0,
                    height: 51.0,
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: AutoSizeText(
                    'Apertura tu',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Satoshi',
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
                AutoSizeText(
                  'Línea de Ahorro',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Satoshi',
                        fontSize: 24.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                  child: AutoSizeText(
                    'Estás a un solo paso de empezar a ahorrar de verdad',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Satoshi',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 8.0),
                          child: AutoSizeText(
                            'Tipo de ahorro',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Satoshi',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
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
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            useSafeArea: true,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: AhorroOptionsCopyWidget(),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                        child: Container(
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).customColor5,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 14.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  valueOrDefault<String>(
                                    FFAppState().typeOfProduct != null &&
                                            FFAppState().typeOfProduct != ''
                                        ? FFAppState().typeOfProduct
                                        : 'Selecciona el tipo de ahorro',
                                    'Selecciona el tipo de ahorro',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Satoshi',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Opacity(
                  opacity: valueOrDefault<double>(
                    FFAppState().typeOfProduct != null &&
                            FFAppState().typeOfProduct != ''
                        ? 1.0
                        : 0.0,
                    1.0,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 64.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Theme(
                          data: ThemeData(
                            checkboxTheme: CheckboxThemeData(
                              visualDensity: VisualDensity.compact,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                            unselectedWidgetColor:
                                FlutterFlowTheme.of(context).alternate,
                          ),
                          child: Checkbox(
                            value: _model.checkboxValue ??= false,
                            onChanged: (newValue) async {
                              safeSetState(
                                  () => _model.checkboxValue = newValue!);
                            },
                            side: (FlutterFlowTheme.of(context).alternate !=
                                    null)
                                ? BorderSide(
                                    width: 2,
                                    color:
                                        FlutterFlowTheme.of(context).alternate!,
                                  )
                                : null,
                            activeColor:
                                FlutterFlowTheme.of(context).customColor4,
                            checkColor: FlutterFlowTheme.of(context).info,
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 0.0, 0.0),
                            child: RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        'Confirmo que he leído y acepto el reglamento de las ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  TextSpan(
                                    text: 'Líneas de Ahorro',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                        ),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Satoshi',
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (_model.checkboxValue ?? true)
                  Opacity(
                    opacity: valueOrDefault<double>(
                      _model.checkboxValue! ? 1.0 : 0.0,
                      1.0,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 56.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: (_model.checkboxValue != true)
                            ? null
                            : () async {
                                if ((FFAppState().typeOfProduct ==
                                        'Linea de Ahorro de nómina') ||
                                    (FFAppState().typeOfProduct ==
                                        'Ahorro de nómina')) {
                                  context.pushNamed(
                                    AhorroDeNominaPageWidget.routeName,
                                    queryParameters: {
                                      'cambioEmpresa': serializeParam(
                                        false,
                                        ParamType.bool,
                                      ),
                                    }.withoutNulls,
                                  );
                                } else {
                                  context.pushNamed(
                                      AhorroDOCUMENTOapageWidget.routeName);
                                }
                              },
                        text: 'Continuar',
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 48.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).customColor4,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Satoshi',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 16.0,
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
          ),
        ),
      ),
    );
  }
}
