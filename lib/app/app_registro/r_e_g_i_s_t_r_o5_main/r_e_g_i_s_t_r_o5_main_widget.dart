import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/sucess_mensaje_error/sucess_mensaje_error_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'r_e_g_i_s_t_r_o5_main_model.dart';
export 'r_e_g_i_s_t_r_o5_main_model.dart';

class REGISTRO5MainWidget extends StatefulWidget {
  const REGISTRO5MainWidget({super.key});

  static String routeName = 'REGISTRO5Main';
  static String routePath = '/rEGISTRO5Main';

  @override
  State<REGISTRO5MainWidget> createState() => _REGISTRO5MainWidgetState();
}

class _REGISTRO5MainWidgetState extends State<REGISTRO5MainWidget> {
  late REGISTRO5MainModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => REGISTRO5MainModel());

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
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Material(
              color: Colors.transparent,
              elevation: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.network(
                      '',
                    ).image,
                  ),
                  gradient: LinearGradient(
                    colors: [Color(0xFF006AD8), Color(0xFF002CE9)],
                    stops: [0.0, 1.0],
                    begin: AlignmentDirectional(-1.0, 0.0),
                    end: AlignmentDirectional(1.0, 0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0.0,
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.07110,
                        60.0,
                      ),
                      0.0,
                      4.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0,
                            valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.01422,
                              12.0,
                            ),
                            8.0,
                            0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 16.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/Group_(12).png',
                                        width: valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).width *
                                              0.09231,
                                          36.0,
                                        ),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: AutoSizeText(
                                    'CREAR CONTRASEÑA',
                                    textAlign: TextAlign.start,
                                    maxLines: 1,
                                    minFontSize: 14.0,
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.02133,
                                            18.0,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    30.0, 0.0, 16.0, 0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Image.asset(
                                    'assets/images/Group_(10).png',
                                    width: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).width *
                                          0.07179,
                                      28.0,
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0,
                            valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.02370,
                              20.0,
                            ),
                            0.0,
                            valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.01185,
                              10.0,
                            )),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 6.0,
                          decoration: BoxDecoration(
                            color: Color(0xFF678EC9),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 18.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  width: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).width * 0.12821,
                                    50.0,
                                  ),
                                  height: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.05925,
                                    50.0,
                                  ),
                                  decoration: BoxDecoration(),
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.04266,
                                    36.0,
                                  ),
                                  height: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.04266,
                                    36.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .customColor4,
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Icon(
                                    Icons.check_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.02844,
                                      24.0,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.04266,
                                    36.0,
                                  ),
                                  height: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.04266,
                                    36.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .customColor4,
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Icon(
                                    Icons.check_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.02844,
                                      24.0,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.04266,
                                    36.0,
                                  ),
                                  height: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.04266,
                                    36.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .customColor4,
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Icon(
                                    Icons.check_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.02844,
                                      24.0,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.04266,
                                    36.0,
                                  ),
                                  height: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.04266,
                                    36.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .customColor4,
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Icon(
                                    Icons.check_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.02844,
                                      24.0,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.04266,
                                    36.0,
                                  ),
                                  height: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.04266,
                                    36.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: AutoSizeText(
                                    '5',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          fontSize: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.01659,
                                            14.0,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 4.0)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 0.8,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.only(),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, -1.0),
                                    child: AutoSizeText(
                                      'Introduce tu nueva contraseña',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            color: FlutterFlowTheme.of(context)
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
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
                                  autoFocus: false,
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
                                          0.05214,
                                      44.0,
                                    ),
                                    fieldWidth: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).width *
                                          0.11282,
                                      44.0,
                                    ),
                                    borderWidth: 1.0,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8.0),
                                      bottomRight: Radius.circular(8.0),
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                    ),
                                    shape: PinCodeFieldShape.box,
                                    activeColor: Color(0x00FFFFFF),
                                    inactiveColor: Color(0xFFEEF1FA),
                                    selectedColor:
                                        FlutterFlowTheme.of(context).secondary,
                                    activeFillColor: Color(0xFFEEF1FA),
                                    inactiveFillColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    selectedFillColor:
                                        FlutterFlowTheme.of(context)
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, -1.0),
                                      child: AutoSizeText(
                                        'Confirme su nueva contraseña',
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
                                    0.0, 12.0, 0.0, 0.0),
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
                                  autoFocus: false,
                                  focusNode: _model.pinCode2FocusNode,
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
                                          0.05214,
                                      44.0,
                                    ),
                                    fieldWidth: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).width *
                                          0.11282,
                                      44.0,
                                    ),
                                    borderWidth: 1.0,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8.0),
                                      bottomRight: Radius.circular(8.0),
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                    ),
                                    shape: PinCodeFieldShape.box,
                                    activeColor: Color(0x00FFFFFF),
                                    inactiveColor: Color(0xFFEEF1FA),
                                    selectedColor:
                                        FlutterFlowTheme.of(context).secondary,
                                    activeFillColor: Color(0xFFEEF1FA),
                                    inactiveFillColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    selectedFillColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
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
                              0.0,
                              40.0,
                              0.0,
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.04740,
                                40.0,
                              )),
                          child: FFButtonWidget(
                            onPressed: () async {
                              if (_model.formKey.currentState == null ||
                                  !_model.formKey.currentState!.validate()) {
                                return;
                              }
                              if (_model.pinCodeController!.text ==
                                  _model.pinCode2!.text) {
                                GoRouter.of(context).prepareAuthEvent();
                                if ('${_model.pinCodeController!.text}' !=
                                    '${_model.pinCode2!.text}') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Las contraseñas ingresadas no coinciden, por favor revisar.',
                                      ),
                                    ),
                                  );
                                  return;
                                }

                                final user =
                                    await authManager.createAccountWithEmail(
                                  context,
                                  FFAppState().userInformation.email,
                                  '${_model.pinCodeController!.text}',
                                );
                                if (user == null) {
                                  return;
                                }

                                await UserRecord.collection
                                    .doc(user.uid)
                                    .update(createUserRecordData(
                                      email: FFAppState().userInformation.email,
                                      displayName:
                                          FFAppState().userInformation.fullName,
                                      createdTime: getCurrentTimestamp,
                                      id: FFAppState()
                                          .userInformation
                                          .documentNumber,
                                      nit: FFAppState()
                                          .userInformation
                                          .documentNumber,
                                      pais: 'Colombia',
                                      phoneNumber: FFAppState()
                                          .userInformation
                                          .whatsappNumber,
                                      ciudad: FFAppState()
                                          .userInformation
                                          .ciudadResidencia,
                                      tipoDocumento: FFAppState()
                                          .userInformation
                                          .tipoDocument,
                                      ciudadExpedicion: FFAppState()
                                          .userInformation
                                          .ciudadExpedicion,
                                      fechaExpedicion: FFAppState()
                                          .userInformation
                                          .fechaExpedicion,
                                      genero: FFAppState().userInformation.sexo,
                                      userType:
                                          FFAppState().userInformation.userType,
                                      telefono1: FFAppState()
                                          .userInformation
                                          .whatsappNumber,
                                      departamento: FFAppState()
                                          .userInformation
                                          .ciudadResidencia,
                                      fechaNacimiento: FFAppState()
                                          .userInformation
                                          .fechaNacimiento,
                                      ciudadNacimiento: FFAppState()
                                          .userInformation
                                          .ciudadNacimiento,
                                      barrio:
                                          FFAppState().userInformation.barrio,
                                      empresaref: FFAppState()
                                          .userInformation
                                          .empresaRef,
                                      direccion: FFAppState()
                                          .userInformation
                                          .direccinResidencia,
                                    ));

                                FFAppState().UserName = currentUserDisplayName;
                                FFAppState().UID = currentUserUid;
                                FFAppState().CC = valueOrDefault(
                                    currentUserDocument?.nit, '');
                                FFAppState().UserEmail = currentUserEmail;
                                FFAppState().basarNumber = valueOrDefault(
                                    currentUserDocument?.direccion, '');
                                FFAppState().desherNam = valueOrDefault(
                                    currentUserDocument?.pais, '');
                                FFAppState().jonmoDin = currentUserDocument!
                                    .fechaNacimiento!
                                    .toString();
                                FFAppState().kiRokomDoc = valueOrDefault(
                                    currentUserDocument?.tipoDocumento, '');
                                FFAppState().koithakedocDece =
                                    currentUserDocument!.fechaExpedicion!
                                        .toString();
                                FFAppState().amrNumber = valueOrDefault(
                                    currentUserDocument?.telefono1, '');
                                FFAppState().UserCludad = valueOrDefault(
                                    currentUserDocument?.ciudad, '');
                                FFAppState().isSavingAccountHave = false;
                                safeSetState(() {});

                                context.goNamedAuth(
                                  SplashWidget.routeName,
                                  context.mounted,
                                  extra: <String, dynamic>{
                                    '__transition_info__': TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.rightToLeft,
                                      duration: Duration(milliseconds: 300),
                                    ),
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
                            },
                            text: 'Finalizar',
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.05688,
                                48.0,
                              ),
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
                                    fontSize: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.01896,
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
