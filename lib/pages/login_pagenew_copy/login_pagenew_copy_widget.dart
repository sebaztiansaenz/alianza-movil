import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'login_pagenew_copy_model.dart';
export 'login_pagenew_copy_model.dart';

class LoginPagenewCopyWidget extends StatefulWidget {
  const LoginPagenewCopyWidget({super.key});

  static String routeName = 'LoginPagenewCopy';
  static String routePath = '/loginPagenewCopy';

  @override
  State<LoginPagenewCopyWidget> createState() => _LoginPagenewCopyWidgetState();
}

class _LoginPagenewCopyWidgetState extends State<LoginPagenewCopyWidget> {
  late LoginPagenewCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginPagenewCopyModel());

    _model.emailTextController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
      child: Scaffold(
        key: scaffoldKey,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Image.asset(
                    'assets/images/Captura_de_pantalla_2024-10-01_a_la(s)_10.54.51_a._m._2.png',
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                FlutterFlowVideoPlayer(
                  path:
                      'https://s3-figma-videos-production-sig.figma.com/video/1424044353203191127/TEAM/2ded/5e46/-b4bb-4837-81da-eeb538211a9a?Expires=1736121600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Q~Fm30mAqbF~22BWySSv~NLe2VBbVsfE98~5E7f~YYK3ATeqj75aSWhut0yCcUHjF~fditmwEfH42qQlFK54e493GNBlHz-lKoeHpBxcsiI~nRWRNL3dtGGi3IzzERLVqkQ8TZx-Hhwr0sv1AalKCot8fSzqmtVsqrmbUgr94n7n5Rbi0uaGt6GHxsyqp83lbeOdRsCgeAVgUJrKwAnUJ86Z2L1Wo6astLLGiCYTvGHncAPFiZDvSf7XJkujlvxXUdt2achkEUPjkyXYJP3~vhMb90Uf1N4LNg~sT5ajAc-Nz~dnBB7rcM2URoD7HvPthff2mu5HV2Mhuw9HAl3JWA__',
                  videoType: VideoType.network,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  autoPlay: true,
                  looping: true,
                  showControls: false,
                  allowFullScreen: true,
                  allowPlaybackSpeedMenu: false,
                  pauseOnNavigate: false,
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 46.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 72.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {},
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/ubukbuibuik-removebg-preview.png',
                                  width: 180.0,
                                  height: 140.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Form(
                            key: _model.formKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 100.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, -1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          32.0, 0.0, 0.0, 8.0),
                                      child: Text(
                                        'Correo electrónico',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        32.0, 0.0, 32.0, 35.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            controller:
                                                _model.emailTextController,
                                            focusNode:
                                                _model.textFieldFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Satoshi',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText: 'Escribe tu correo',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Satoshi',
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                              ),
                                              filled: true,
                                              fillColor: Color(0x22FFFFFF),
                                              prefixIcon: Icon(
                                                Icons.email_outlined,
                                                color: Color(0xE7FFFFFF),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  color: Colors.white,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                ),
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            validator: _model
                                                .emailTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 32.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, -1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    32.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Digita tu contraseña',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Satoshi',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
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
                                        32.0, 8.0, 32.0, 0.0),
                                    child: PinCodeTextField(
                                      autoDisposeControllers: false,
                                      appContext: context,
                                      length: 6,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Satoshi',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
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
                                          FlutterFlowTheme.of(context).tertiary,
                                      obscureText: _model.obsure,
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
                                          bottomLeft: Radius.circular(0.0),
                                          bottomRight: Radius.circular(0.0),
                                          topLeft: Radius.circular(0.0),
                                          topRight: Radius.circular(0.0),
                                        ),
                                        shape: PinCodeFieldShape.box,
                                        activeColor: Color(0x00FFFFFF),
                                        inactiveColor: Color(0x50FFFFFF),
                                        selectedColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        activeFillColor: Color(0x1DFFFFFF),
                                        inactiveFillColor: Color(0x00FFFFFF),
                                        selectedFillColor: Color(0x1FFFFFFF),
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
                                    alignment: AlignmentDirectional(1.0, -1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          32.0, 8.0, 32.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                              ChangePassword1Widget.routeName);
                                        },
                                        child: Text(
                                          '¿Olvidaste tu contraseña?',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w200,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                32.0, 52.0, 32.0, 0.0),
                            child: Stack(
                              alignment: AlignmentDirectional(1.0, -1.0),
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    if (_model.formKey.currentState == null ||
                                        !_model.formKey.currentState!
                                            .validate()) {
                                      return;
                                    }
                                    GoRouter.of(context).prepareAuthEvent();

                                    final user =
                                        await authManager.signInWithEmail(
                                      context,
                                      _model.emailTextController.text,
                                      _model.pinCodeController!.text,
                                    );
                                    if (user == null) {
                                      return;
                                    }

                                    FFAppState().UserName =
                                        currentUserDisplayName;
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
                                    FFAppState().isSavingAccountHave =
                                        valueOrDefault<bool>(
                                            currentUserDocument
                                                ?.isHaveSavingAccount,
                                            false);
                                    safeSetState(() {});

                                    context.goNamedAuth(
                                      HomeNewWidget.routeName,
                                      context.mounted,
                                      extra: <String, dynamic>{
                                        '__transition_info__': TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );

                                    safeSetState(() {
                                      _model.emailTextController?.clear();
                                    });
                                  },
                                  text: 'Iniciar Sesión',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 48.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color: Color(0xFFF77E06),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.only(),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 5.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/Vector_1.png',
                                        width: 15.0,
                                        height: 15.0,
                                        fit: BoxFit.cover,
                                        alignment: Alignment(1.0, -1.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 21.0, 0.0, 24.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context
                                    .pushNamed(SelectCountryWidget.routeName);
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '¿Aún no tienes una cuenta?',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Registrarme',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w300,
                                              ),
                                        ),
                                        SizedBox(
                                          width: 100.0,
                                          child: Divider(
                                            height: 5.0,
                                            thickness: 2.0,
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 40.0, 0.0, 0.0),
                            child: Text(
                              'From',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Satoshi',
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/Gou_bank.png',
                              fit: BoxFit.cover,
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
        ),
      ),
    );
  }
}
