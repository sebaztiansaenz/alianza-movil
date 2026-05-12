import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nuevodepositoahorro_model.dart';
export 'nuevodepositoahorro_model.dart';

class NuevodepositoahorroWidget extends StatefulWidget {
  const NuevodepositoahorroWidget({
    super.key,
    required this.amount,
    required this.ahorro,
  });

  final double? amount;
  final AhorrosRecord? ahorro;

  @override
  State<NuevodepositoahorroWidget> createState() =>
      _NuevodepositoahorroWidgetState();
}

class _NuevodepositoahorroWidgetState extends State<NuevodepositoahorroWidget> {
  late NuevodepositoahorroModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NuevodepositoahorroModel());

    _model.amountTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      functions.formatAmount(widget!.amount!),
      '--',
    ));
    _model.amountFocusNode ??= FocusNode();

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: 450.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 32.0,
                  height: 4.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).customColor5,
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
                    child: AutoSizeText(
                      'Pago protegido por',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Satoshi',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.01659,
                              14.0,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 12.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.asset(
                      'assets/images/Group_118.png',
                      height: valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.03555,
                        30.0,
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                  child: AutoSizeText(
                    'El costo de transacción es \$0.0',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Satoshi',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                    child: AutoSizeText(
                      'Confirmar valor depósito',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Satoshi',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.01659,
                              14.0,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                TextFormField(
                  controller: _model.amountTextController,
                  focusNode: _model.amountFocusNode,
                  onChanged: (_) => EasyDebounce.debounce(
                    '_model.amountTextController',
                    Duration(milliseconds: 2000),
                    () async {
                      safeSetState(() {});
                    },
                  ),
                  autofocus: false,
                  readOnly: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    isDense: false,
                    labelStyle: FlutterFlowTheme.of(context)
                        .labelMedium
                        .override(
                          fontFamily: 'Satoshi',
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          fontSize: valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.01659,
                            14.0,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w300,
                        ),
                    hintText: '0.0',
                    hintStyle: FlutterFlowTheme.of(context)
                        .labelMedium
                        .override(
                          fontFamily: 'Satoshi',
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          fontSize: valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.01659,
                            14.0,
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
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).customColor5,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Satoshi',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.01659,
                          14.0,
                        ),
                        letterSpacing: 0.0,
                      ),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  validator:
                      _model.amountTextControllerValidator.asValidator(context),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp('^\\d*\\.?\\d{0,2}\$'))
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 36.0, 0.0, 40.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      _model.ipAddress = await actions.getIpAddress();
                      try {
                        final result = await FirebaseFunctions.instanceFor(
                                region: 'europe-central2')
                            .httpsCallable('createPaymentSession')
                            .call({
                          "amount": widget!.amount!,
                          "currency": 'COP',
                          "paymentReference": FFAppState().paymentReference,
                          "description": 'Depósito asociado',
                          "returnURL":
                              'alianza://alianza.com/transactionsDetails',
                          "userAgent":
                              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.5845.179 Safari/537.36 Brave/116.1.59.132',
                          "ipAddress": _model.ipAddress!,
                          "userAccounts": FFAppState()
                              .userAccounts
                              .map((j) => j.toMap())
                              .toList(),
                          "buyer": <String, String?>{
                            'document':
                                valueOrDefault(currentUserDocument?.nit, ''),
                            'documentType': () {
                              if (valueOrDefault(
                                      currentUserDocument?.tipoDocumento, '') ==
                                  'Cedula ciudadania') {
                                return 'CC';
                              } else if (valueOrDefault(
                                      currentUserDocument?.tipoDocumento, '') ==
                                  'Cedula extranjeria') {
                                return 'CE';
                              } else {
                                return 'PPN';
                              }
                            }(),
                            'name':
                                valueOrDefault(currentUserDocument?.nombre, ''),
                            'email': currentUserEmail,
                          },
                          "userId": currentUserUid,
                          "ahorrosId": widget!.ahorro?.reference.id,
                          "bank": FFAppState().bankName,
                        });
                        _model.cloudFunctionf1f =
                            CreatePaymentSessionCloudFunctionCallResponse(
                          data: result.data,
                          succeeded: true,
                          resultAsString: result.data.toString(),
                          jsonBody: result.data,
                        );
                      } on FirebaseFunctionsException catch (error) {
                        _model.cloudFunctionf1f =
                            CreatePaymentSessionCloudFunctionCallResponse(
                          errorCode: error.code,
                          succeeded: false,
                        );
                      }

                      if (_model.cloudFunctionf1f!.succeeded!) {
                        FFAppState().lastPayment = functions.twelveMinsLater();
                        safeSetState(() {});
                        await launchURL(_model.cloudFunctionf1f!.data!);
                      } else {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              _model.cloudFunctionf1f!.data!,
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: Duration(milliseconds: 7000),
                            backgroundColor: FlutterFlowTheme.of(context).error,
                          ),
                        );
                      }

                      safeSetState(() {});
                    },
                    text: 'Iniciar depósito',
                    options: FFButtonOptions(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 48.0,
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
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
