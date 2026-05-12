import '/app/app_contrasea/success_messaje3/success_messaje3_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/sucess_mensaje_error/sucess_mensaje_error_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'change_password6_model.dart';
export 'change_password6_model.dart';

class ChangePassword6Widget extends StatefulWidget {
  const ChangePassword6Widget({
    super.key,
    required this.email,
  });

  final String? email;

  static String routeName = 'ChangePassword6';
  static String routePath = '/changePassword6';

  @override
  State<ChangePassword6Widget> createState() => _ChangePassword6WidgetState();
}

class _ChangePassword6WidgetState extends State<ChangePassword6Widget> {
  late ChangePassword6Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChangePassword6Model());

    _model.pinCodeFocusNode ??= FocusNode();

    _model.pinCode2FocusNode ??= FocusNode();

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
        backgroundColor: FlutterFlowTheme.of(context).secondary,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Material(
              color: Colors.transparent,
              elevation: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.network(
                      '',
                    ).image,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      20.0,
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.07110,
                        60.0,
                      ),
                      20.0,
                      4.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.safePop();
                                    },
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 10.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 4.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF002CE9),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 10.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 4.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF002CE9),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 10.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 4.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF002CE9),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0.0,
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.02844,
                        24.0,
                      ),
                      0.0,
                      0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: AutoSizeText(
                            'CREE SU CONTRASEÑA',
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Satoshi',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.02133,
                                    18.0,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: AutoSizeText(
                            'Tu nueva contraseña debe ser una combinación de 6 números.',
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: 'Satoshi',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.01659,
                                    14.0,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ),
                      Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              30.0,
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.03792,
                                32.0,
                              ),
                              30.0,
                              0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 32.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, -1.0),
                                      child: AutoSizeText(
                                        'Introduce tu nueva contraseña',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .height *
                                                    0.01659,
                                                14.0,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                    if (_model.obsure)
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.obsure = !_model.obsure;
                                          safeSetState(() {});
                                        },
                                        child: FaIcon(
                                          FontAwesomeIcons.eye,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 18.0,
                                        ),
                                      ),
                                    if (!_model.obsure)
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.obsure = !_model.obsure;
                                          safeSetState(() {});
                                        },
                                        child: FaIcon(
                                          FontAwesomeIcons.eyeSlash,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 18.0,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0,
                                    valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.01185,
                                      10.0,
                                    ),
                                    0.0,
                                    0.0),
                                child: PinCodeTextField(
                                  autoDisposeControllers: false,
                                  appContext: context,
                                  length: 6,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Satoshi',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                      ),
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  enableActiveFill: true,
                                  autoFocus: true,
                                  focusNode: _model.pinCodeFocusNode,
                                  enablePinAutofill: false,
                                  errorTextSpace: 16.0,
                                  showCursor: true,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  obscureText: _model.obsure,
                                  obscuringCharacter: '*',
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  pinTheme: PinTheme(
                                    fieldHeight: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.05688,
                                      48.0,
                                    ),
                                    fieldWidth: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).width *
                                          0.12308,
                                      48.0,
                                    ),
                                    borderWidth: 2.0,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8.0),
                                      bottomRight: Radius.circular(8.0),
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                    ),
                                    shape: PinCodeFieldShape.box,
                                    activeColor: FlutterFlowTheme.of(context)
                                        .customColor5,
                                    inactiveColor: FlutterFlowTheme.of(context)
                                        .customColor5,
                                    selectedColor: Color(0xFF002CE9),
                                    activeFillColor:
                                        FlutterFlowTheme.of(context)
                                            .customColor5,
                                    inactiveFillColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    selectedFillColor: Color(0x1FFFFFFF),
                                  ),
                                  controller: _model.pinCodeController,
                                  onChanged: (_) {},
                                  autovalidateMode: AutovalidateMode.disabled,
                                  validator: _model.pinCodeControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0,
                                    valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.02370,
                                      20.0,
                                    ),
                                    0.0,
                                    0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, -1.0),
                                      child: AutoSizeText(
                                        'Confirme su nueva contrasena',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .height *
                                                    0.01659,
                                                14.0,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                    if (_model.obsure1)
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.obsure1 = !_model.obsure1;
                                          safeSetState(() {});
                                        },
                                        child: FaIcon(
                                          FontAwesomeIcons.eye,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 18.0,
                                        ),
                                      ),
                                    if (!_model.obsure1)
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.obsure1 = !_model.obsure1;
                                          safeSetState(() {});
                                        },
                                        child: FaIcon(
                                          FontAwesomeIcons.eyeSlash,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 18.0,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0,
                                    valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.01185,
                                      10.0,
                                    ),
                                    0.0,
                                    0.0),
                                child: PinCodeTextField(
                                  autoDisposeControllers: false,
                                  appContext: context,
                                  length: 6,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Satoshi',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                      ),
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  enableActiveFill: true,
                                  autoFocus: true,
                                  focusNode: _model.pinCode2FocusNode,
                                  enablePinAutofill: false,
                                  errorTextSpace: 16.0,
                                  showCursor: true,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  obscureText: _model.obsure1,
                                  obscuringCharacter: '*',
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  pinTheme: PinTheme(
                                    fieldHeight: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.05688,
                                      48.0,
                                    ),
                                    fieldWidth: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).width *
                                          0.12308,
                                      48.0,
                                    ),
                                    borderWidth: 2.0,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8.0),
                                      bottomRight: Radius.circular(8.0),
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                    ),
                                    shape: PinCodeFieldShape.box,
                                    activeColor: FlutterFlowTheme.of(context)
                                        .customColor5,
                                    inactiveColor: FlutterFlowTheme.of(context)
                                        .customColor5,
                                    selectedColor: Color(0xFF002CE9),
                                    activeFillColor:
                                        FlutterFlowTheme.of(context)
                                            .customColor5,
                                    inactiveFillColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    selectedFillColor: Color(0x1FFFFFFF),
                                  ),
                                  controller: _model.pinCode2,
                                  onChanged: (_) {},
                                  autovalidateMode: AutovalidateMode.disabled,
                                  validator: _model.pinCode2Validator
                                      .asValidator(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Builder(
                        builder: (context) => Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              30.0,
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.06636,
                                56.0,
                              ),
                              30.0,
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.06162,
                                52.0,
                              )),
                          child: FFButtonWidget(
                            onPressed: () async {
                              if (_model.formKey.currentState == null ||
                                  !_model.formKey.currentState!.validate()) {
                                return;
                              }
                              if (_model.pinCodeController!.text ==
                                  _model.pinCode2!.text) {
                                _model.cambiocontrasena =
                                    await actions.adminResetPasswordAction(
                                  widget!.email!,
                                  _model.pinCode2!.text,
                                );
                                if (_model.cambiocontrasena!) {
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: GestureDetector(
                                          onTap: () {
                                            FocusScope.of(dialogContext)
                                                .unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: SuccessMessaje3Widget(),
                                        ),
                                      );
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
                                            AlignmentDirectional(0.0, 0.0)
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
                                                'No se pudo cambiar la contraseña',
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: GestureDetector(
                                        onTap: () {
                                          FocusScope.of(dialogContext)
                                              .unfocus();
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: SucessMensajeErrorWidget(
                                          titulo:
                                              'Las contraseñas no coinciden!',
                                          descripcion:
                                              'Asegurate de escribirlas correctamente',
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }

                              safeSetState(() {});
                            },
                            text: 'Guardar',
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 48.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).customColor4,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
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
          ],
        ),
      ),
    );
  }
}
