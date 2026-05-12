import '/app/perfil/perfil_component1/perfil_component1_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/pages/sucess_mensaje_error/sucess_mensaje_error_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'perfil04_model.dart';
export 'perfil04_model.dart';

class Perfil04Widget extends StatefulWidget {
  const Perfil04Widget({super.key});

  static String routeName = 'Perfil_04';
  static String routePath = '/perfil04';

  @override
  State<Perfil04Widget> createState() => _Perfil04WidgetState();
}

class _Perfil04WidgetState extends State<Perfil04Widget> {
  late Perfil04Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Perfil04Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().lastAction = getCurrentTimestamp;
      safeSetState(() {});
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 10000),
        callback: (timer) async {
          if (functions.past5Mins(FFAppState().lastAction!)) {
            GoRouter.of(context).prepareAuthEvent();
            await authManager.signOut();
            GoRouter.of(context).clearRedirectLocation();

            context.goNamedAuth(
                CierredeSesionWidget.routeName, context.mounted);

            _model.instantTimer?.cancel();
          }
        },
        startImmediately: false,
      );
    });

    _model.pinCodeMainFocusNode ??= FocusNode();

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
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [FlutterFlowTheme.of(context).fondo, Color(0xFF002CE9)],
                stops: [0.0, 1.0],
                begin: AlignmentDirectional(-1.0, 0.0),
                end: AlignmentDirectional(1.0, 0),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 56.0, 0.0, 20.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.safePop();
                          },
                          child: Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(),
                            child: InkWell(
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
                                    .secondaryBackground,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: Image.asset(
                            'assets/images/Group_(1).png',
                            height: 33.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 30.0, 0.0),
                          child: AutoSizeText(
                            'CAMBIAR CONTRASEÑA',
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            minFontSize: 14.0,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Satoshi',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                    child: Image.asset(
                      'assets/images/Group_(10).png',
                      width: 24.0,
                      height: 24.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 40.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                  child: AutoSizeText(
                                    'Introduzca su contraseña actual',
                                    textAlign: TextAlign.start,
                                    maxLines: 1,
                                    minFontSize: 10.0,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                if (_model.obsure2)
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.obsure2 = !_model.obsure2;
                                      safeSetState(() {});
                                    },
                                    child: FaIcon(
                                      FontAwesomeIcons.eye,
                                      color: Color(0xB2FFFFFF),
                                      size: 18.0,
                                    ),
                                  ),
                                if (!_model.obsure2)
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.obsure2 = !_model.obsure2;
                                      safeSetState(() {});
                                    },
                                    child: FaIcon(
                                      FontAwesomeIcons.eyeSlash,
                                      color: Color(0xB2FFFFFF),
                                      size: 18.0,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              enableActiveFill: true,
                              autoFocus: false,
                              focusNode: _model.pinCodeMainFocusNode,
                              enablePinAutofill: false,
                              errorTextSpace: 16.0,
                              showCursor: true,
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              obscureText: _model.obsure2,
                              obscuringCharacter: '●',
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              pinTheme: PinTheme(
                                fieldHeight: 48.0,
                                fieldWidth: 48.0,
                                borderWidth: 1.0,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8.0),
                                  bottomRight: Radius.circular(8.0),
                                  topLeft: Radius.circular(8.0),
                                  topRight: Radius.circular(8.0),
                                ),
                                shape: PinCodeFieldShape.box,
                                activeColor:
                                    FlutterFlowTheme.of(context).customColor5,
                                inactiveColor: Color(0xFFEEF1FA),
                                selectedColor: Color(0xFF002CE9),
                                activeFillColor:
                                    FlutterFlowTheme.of(context).customColor5,
                                inactiveFillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                selectedFillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              controller: _model.pinCodeMain,
                              onChanged: (_) {},
                              autovalidateMode: AutovalidateMode.disabled,
                              validator: _model.pinCodeMainValidator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                  child: AutoSizeText(
                                    'Introduce tu nueva contraseña',
                                    textAlign: TextAlign.start,
                                    maxLines: 1,
                                    minFontSize: 10.0,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
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
                                      color: Color(0xB2FFFFFF),
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
                                      color: Color(0xB2FFFFFF),
                                      size: 18.0,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              enableActiveFill: true,
                              autoFocus: false,
                              focusNode: _model.pinCodeFocusNode,
                              enablePinAutofill: false,
                              errorTextSpace: 16.0,
                              showCursor: true,
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              obscureText: _model.obsure2,
                              obscuringCharacter: '●',
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              pinTheme: PinTheme(
                                fieldHeight: 48.0,
                                fieldWidth: 48.0,
                                borderWidth: 1.0,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8.0),
                                  bottomRight: Radius.circular(8.0),
                                  topLeft: Radius.circular(8.0),
                                  topRight: Radius.circular(8.0),
                                ),
                                shape: PinCodeFieldShape.box,
                                activeColor:
                                    FlutterFlowTheme.of(context).customColor5,
                                inactiveColor: Color(0xFFEEF1FA),
                                selectedColor: Color(0xFF002CE9),
                                activeFillColor:
                                    FlutterFlowTheme.of(context).customColor5,
                                inactiveFillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                selectedFillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
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
                                0.0, 20.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                  child: AutoSizeText(
                                    'Confirme su nueva contrasena',
                                    textAlign: TextAlign.start,
                                    maxLines: 1,
                                    minFontSize: 10.0,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
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
                                      color: Color(0xB2FFFFFF),
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
                                      color: Color(0xB2FFFFFF),
                                      size: 18.0,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              enableActiveFill: true,
                              autoFocus: false,
                              focusNode: _model.pinCode2FocusNode,
                              enablePinAutofill: false,
                              errorTextSpace: 16.0,
                              showCursor: true,
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              obscureText: _model.obsure1,
                              obscuringCharacter: '●',
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              pinTheme: PinTheme(
                                fieldHeight: 48.0,
                                fieldWidth: 48.0,
                                borderWidth: 1.0,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8.0),
                                  bottomRight: Radius.circular(8.0),
                                  topLeft: Radius.circular(8.0),
                                  topRight: Radius.circular(8.0),
                                ),
                                shape: PinCodeFieldShape.box,
                                activeColor:
                                    FlutterFlowTheme.of(context).customColor5,
                                inactiveColor: Color(0xFFEEF1FA),
                                selectedColor: Color(0xFF002CE9),
                                activeFillColor:
                                    FlutterFlowTheme.of(context).customColor5,
                                inactiveFillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                selectedFillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              controller: _model.pinCode2,
                              onChanged: (_) {},
                              autovalidateMode: AutovalidateMode.disabled,
                              validator:
                                  _model.pinCode2Validator.asValidator(context),
                            ),
                          ),
                        ],
                      ),
                      Builder(
                        builder: (context) => Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 70.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              if (_model.formKey.currentState == null ||
                                  !_model.formKey.currentState!.validate()) {
                                return;
                              }
                              if (_model.pinCodeController!.text ==
                                  _model.pinCode2!.text) {
                                GoRouter.of(context).prepareAuthEvent();

                                final user = await authManager.signInWithEmail(
                                  context,
                                  currentUserEmail,
                                  _model.pinCodeMain!.text,
                                );
                                if (user == null) {
                                  return;
                                }

                                _model.changePassword =
                                    await actions.changeUserPassword(
                                  _model.pinCodeController!.text,
                                );
                                if (_model.changePassword != null &&
                                    _model.changePassword != '') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        _model.changePassword!,
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).error,
                                    ),
                                  );
                                } else {
                                  await showDialog(
                                    barrierDismissible: false,
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
                                        child: PerfilComponent1Widget(),
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
                                      child: SucessMensajeErrorWidget(
                                        titulo: 'Error!',
                                        descripcion:
                                            'Las contraseñas no coinciden',
                                      ),
                                    );
                                  },
                                );
                              }

                              safeSetState(() {});
                            },
                            text: 'Actualizar',
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
          ),
        ],
      ),
    );
  }
}
