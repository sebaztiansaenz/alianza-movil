import '/app/newaperturacdat/newaperturacdat_widget.dart';
import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/sucess_mensaje_error/sucess_mensaje_error_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'login_pagenew_model.dart';
export 'login_pagenew_model.dart';

class LoginPagenewWidget extends StatefulWidget {
  const LoginPagenewWidget({super.key});

  static String routeName = 'LoginPagenew';
  static String routePath = '/loginPagenew';

  @override
  State<LoginPagenewWidget> createState() => _LoginPagenewWidgetState();
}

class _LoginPagenewWidgetState extends State<LoginPagenewWidget> {
  late LoginPagenewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginPagenewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.versionactual = await actions.getVersion1();
    });

    _model.correoTextController ??= TextEditingController();
    _model.correoFocusNode ??= FocusNode();
    _model.correoFocusNode!.addListener(() => safeSetState(() {}));
    _model.pinCodeFocusNode ??= FocusNode();

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
      child: PopScope(
        canPop: false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        child: Stack(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    child: Stack(
                                      children: [
                                        FlutterFlowVideoPlayer(
                                          path:
                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/jmo10bghe31c/-_Modern_Typography_Titles_After_Effects_Template_38_1_1.mp4',
                                          videoType: VideoType.network,
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          autoPlay: true,
                                          looping: true,
                                          showControls: false,
                                          allowFullScreen: false,
                                          allowPlaybackSpeedMenu: false,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.10072,
                                    85.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.04, 0.99),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/Frame_2609768_(1).png',
                                    width: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).width *
                                          0.38462,
                                      150.0,
                                    ),
                                    height: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.11494,
                                      97.0,
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          20.0,
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.02370,
                            20.0,
                          ),
                          20.0,
                          0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Form(
                              key: _model.formKey,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, -1.0),
                                    child: AutoSizeText(
                                      'Correo electrónico',
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      minFontSize: 10.0,
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
                                  Container(
                                    child: TextFormField(
                                      controller: _model.correoTextController,
                                      focusNode: _model.correoFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.correoTextController',
                                        Duration(milliseconds: 100),
                                        () async {
                                          _model.email =
                                              _model.correoTextController.text;
                                          safeSetState(() {});
                                        },
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              fontSize: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .height *
                                                    0.01659,
                                                14.0,
                                              ),
                                              letterSpacing: 0.0,
                                            ),
                                        hintText:
                                            'Escribe tu correo electrónico',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              color: Color(0xB857636C),
                                              fontSize: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .height *
                                                    0.01896,
                                                16.0,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFEEF1FA),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF002CE9),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: valueOrDefault<Color>(
                                          (_model.email != null &&
                                                      _model.email != '') &&
                                                  !(_model.correoFocusNode
                                                          ?.hasFocus ??
                                                      false)
                                              ? Color(0xFFEEF1FA)
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.01896,
                                              16.0,
                                            ),
                                            letterSpacing: 0.0,
                                          ),
                                      keyboardType: TextInputType.emailAddress,
                                      validator: _model
                                          .correoTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0,
                                        valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.03555,
                                          30.0,
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
                                            'Contraseña',
                                            textAlign: TextAlign.start,
                                            maxLines: 1,
                                            minFontSize: 10.0,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize:
                                                      valueOrDefault<double>(
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
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 18.0,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 6.0, 0.0, 0.0),
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
                                            fontSize: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.01896,
                                              16.0,
                                            ),
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
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      obscureText: _model.obsure,
                                      obscuringCharacter: '*',
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      pinTheme: PinTheme(
                                        fieldHeight: valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).width *
                                              0.12308,
                                          48.0,
                                        ),
                                        fieldWidth: valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.05688,
                                          48.0,
                                        ),
                                        borderWidth: 1.0,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(8.0),
                                          bottomRight: Radius.circular(8.0),
                                          topLeft: Radius.circular(8.0),
                                          topRight: Radius.circular(8.0),
                                        ),
                                        shape: PinCodeFieldShape.box,
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .customColor5,
                                        inactiveColor:
                                            FlutterFlowTheme.of(context)
                                                .customColor5,
                                        selectedColor: Color(0xFF002CE9),
                                        activeFillColor:
                                            FlutterFlowTheme.of(context)
                                                .customColor5,
                                        inactiveFillColor:
                                            FlutterFlowTheme.of(context).info,
                                        selectedFillColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                      ),
                                      controller: _model.pinCodeController,
                                      onChanged: (_) {},
                                      autovalidateMode:
                                          AutovalidateMode.disabled,
                                      validator: _model
                                          .pinCodeControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0,
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.05688,
                                            48.0,
                                          ),
                                          20.0,
                                          0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                              ChangePassword1Widget.routeName);
                                        },
                                        child: AutoSizeText(
                                          '¿Olvidaste tu contraseña?',
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          minFontSize: 10.0,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize:
                                                    valueOrDefault<double>(
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.01659,
                                                  14.0,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 40.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Builder(
                                    builder: (context) => Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0,
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.05925,
                                            50.0,
                                          ),
                                          0.0,
                                          0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          var _shouldSetState = false;
                                          if (_model.formKey.currentState ==
                                                  null ||
                                              !_model.formKey.currentState!
                                                  .validate()) {
                                            return;
                                          }
                                          GoRouter.of(context)
                                              .prepareAuthEvent();

                                          final user =
                                              await authManager.signInWithEmail(
                                            context,
                                            _model.correoTextController.text,
                                            _model.pinCodeController!.text,
                                          );
                                          if (user == null) {
                                            return;
                                          }

                                          if (loggedIn) {
                                            FFAppState().UserName =
                                                currentUserDisplayName;
                                            FFAppState().UID = currentUserUid;
                                            FFAppState().CC = valueOrDefault(
                                                currentUserDocument?.nit, '');
                                            FFAppState().UserEmail =
                                                currentUserEmail;
                                            FFAppState().basarNumber =
                                                valueOrDefault(
                                                    currentUserDocument
                                                        ?.direccion,
                                                    '');
                                            FFAppState().desherNam =
                                                valueOrDefault(
                                                    currentUserDocument?.pais,
                                                    '');
                                            FFAppState().jonmoDin =
                                                currentUserDocument!
                                                    .fechaNacimiento!
                                                    .toString();
                                            FFAppState().kiRokomDoc =
                                                valueOrDefault(
                                                    currentUserDocument
                                                        ?.tipoDocumento,
                                                    '');
                                            FFAppState().koithakedocDece =
                                                currentUserDocument!
                                                    .fechaExpedicion!
                                                    .toString();
                                            FFAppState().amrNumber =
                                                valueOrDefault(
                                                    currentUserDocument
                                                        ?.telefono1,
                                                    '');
                                            FFAppState().UserCludad =
                                                valueOrDefault(
                                                    currentUserDocument?.ciudad,
                                                    '');
                                            FFAppState().isSavingAccountHave =
                                                valueOrDefault<bool>(
                                                    currentUserDocument
                                                        ?.isHaveSavingAccount,
                                                    false);
                                            safeSetState(() {});
                                            safeSetState(() {
                                              _model.correoTextController
                                                  ?.clear();
                                            });
                                            await Future.delayed(
                                              Duration(
                                                milliseconds: 1,
                                              ),
                                            );
                                            _model.cuenta =
                                                await queryAhorrosRecordCount(
                                              queryBuilder: (ahorrosRecord) =>
                                                  ahorrosRecord
                                                      .where(
                                                        'user',
                                                        isEqualTo:
                                                            currentUserReference,
                                                      )
                                                      .where(
                                                        'AhorrosDocPdf1',
                                                        isNotEqualTo: '',
                                                      ),
                                            );
                                            _shouldSetState = true;
                                            if (valueOrDefault(
                                                        currentUserDocument
                                                            ?.verificationPDF,
                                                        '') ==
                                                    null ||
                                                valueOrDefault(
                                                        currentUserDocument
                                                            ?.verificationPDF,
                                                        '') ==
                                                    '') {
                                              context.pushNamedAuth(
                                                RegistroVinculacionWidget
                                                    .routeName,
                                                context.mounted,
                                                extra: <String, dynamic>{
                                                  '__transition_info__':
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType
                                                            .rightToLeft,
                                                    duration: Duration(
                                                        milliseconds: 300),
                                                  ),
                                                },
                                              );

                                              if (_shouldSetState)
                                                safeSetState(() {});
                                              return;
                                            } else {
                                              if (_model.cuenta! >= 1) {
                                                _model.numerocdats =
                                                    await queryCdatsRecordCount(
                                                  queryBuilder: (cdatsRecord) =>
                                                      cdatsRecord.where(
                                                    'Idusuario',
                                                    isEqualTo:
                                                        currentUserReference,
                                                  ),
                                                );
                                                _shouldSetState = true;
                                                final openedCdatFlow =
                                                    await showDialog<bool>(
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(
                                                                  dialogContext)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child:
                                                            NewaperturacdatWidget(),
                                                      ),
                                                    );
                                                  },
                                                );

                                                if (openedCdatFlow != true &&
                                                    context.mounted) {
                                                  context.goNamedAuth(
                                                    AHORROSPage1CopyCopyWidget
                                                        .routeName,
                                                    context.mounted,
                                                    extra: <String, dynamic>{
                                                      '__transition_info__':
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .bottomToTop,
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                      ),
                                                    },
                                                  );
                                                }

                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                                return;
                                              } else {
                                                context.goNamedAuth(
                                                    Aperturaahorro1Widget
                                                        .routeName,
                                                    context.mounted);

                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                                return;
                                              }
                                            }
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(
                                                              dialogContext)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child:
                                                        SucessMensajeErrorWidget(
                                                      titulo:
                                                          '¡Correo o contraseña incorrecta!',
                                                      descripcion:
                                                          'Por favor, vuelva a intentarlo.',
                                                    ),
                                                  ),
                                                );
                                              },
                                            );

                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          }

                                          if (_shouldSetState)
                                            safeSetState(() {});
                                        },
                                        text: 'Iniciar Sesión',
                                        options: FFButtonOptions(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.05688,
                                            48.0,
                                          ),
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFF002CE9),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Satoshi',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
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
                                        16.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                            SelectCountryWidget.routeName);
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          AutoSizeText(
                                            '¿Aún no tienes una cuenta?',
                                            textAlign: TextAlign.justify,
                                            maxLines: 1,
                                            minFontSize: 10.0,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize:
                                                      valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.01659,
                                                    14.0,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(),
                                            child: AutoSizeText(
                                              'Registrarme',
                                              textAlign: TextAlign.justify,
                                              maxLines: 1,
                                              minFontSize: 10.0,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Satoshi',
                                                    color: Color(0xFFFF6700),
                                                    fontSize:
                                                        valueOrDefault<double>(
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
                                        ].divide(SizedBox(width: 7.0)),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      _model.versionactual,
                                      '0.0',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
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
          ),
        ),
      ),
    );
  }
}
