import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/sucess_mensaje_error/sucess_mensaje_error_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'change_password1_model.dart';
export 'change_password1_model.dart';

class ChangePassword1Widget extends StatefulWidget {
  const ChangePassword1Widget({super.key});

  static String routeName = 'ChangePassword1';
  static String routePath = '/changePassword1';

  @override
  State<ChangePassword1Widget> createState() => _ChangePassword1WidgetState();
}

class _ChangePassword1WidgetState extends State<ChangePassword1Widget> {
  late ChangePassword1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChangePassword1Model());

    _model.documentoNroTextController ??= TextEditingController();
    _model.documentoNroFocusNode ??= FocusNode();
    _model.documentoNroFocusNode!.addListener(() => safeSetState(() {}));
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
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
                          child: Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Icon(
                              Icons.arrow_back,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/Group_(15).png',
                        width: valueOrDefault<double>(
                          MediaQuery.sizeOf(context).width * 0.19487,
                          76.0,
                        ),
                        height: valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.09598,
                          81.0,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.02844,
                            24.0,
                          ),
                          0.0,
                          0.0),
                      child: AutoSizeText(
                        '¿OLVIDASTE TU CONTRASEÑA?',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Satoshi',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.02370,
                                20.0,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        0.0,
                        valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.0107,
                          9.0,
                        ),
                        0.0,
                        0.0),
                    child: Container(
                      width: valueOrDefault<double>(
                        MediaQuery.sizeOf(context).width * 0.22308,
                        87.0,
                      ),
                      height: 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).customColor4,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.02962,
                            25.0,
                          ),
                          0.0,
                          0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: AutoSizeText(
                              'Digita tu número de documento, responde las preguntas de seguridad y enviaremos un código de verificación para la recuperación de su contraseña a tu correo registrado.',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Satoshi',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.01896,
                                      16.0,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                          Form(
                            key: _model.formKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 3.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, -1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0,
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.03792,
                                            32.0,
                                          ),
                                          0.0,
                                          0.0),
                                      child: AutoSizeText(
                                        'Tipo de documento',
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
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: FlutterFlowDropDown<String>(
                                      controller:
                                          _model.cCvalueValueController ??=
                                              FormFieldController<String>(null),
                                      options: [
                                        'Cedula ciudadania',
                                        'Pasaporte',
                                        'Cedula extranjeria',
                                        'Tarjeta identidad',
                                        'Permiso por Protección Temporal '
                                      ],
                                      onChanged: (val) => safeSetState(
                                          () => _model.cCvalueValue = val),
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.05925,
                                        50.0,
                                      ),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      hintText: 'Identificación',
                                      icon: FaIcon(
                                        FontAwesomeIcons.chevronDown,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 20.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .customColor5,
                                      elevation: 0.0,
                                      borderColor: Colors.transparent,
                                      borderWidth: 0.0,
                                      borderRadius: 8.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 4.0, 12.0, 4.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, -1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: AutoSizeText(
                                        'Número de documento',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: TextFormField(
                                      controller:
                                          _model.documentoNroTextController,
                                      focusNode: _model.documentoNroFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.documentoNroTextController',
                                        Duration(milliseconds: 100),
                                        () async {
                                          _model.nrodoc = _model
                                              .documentoNroTextController.text;
                                          safeSetState(() {});
                                        },
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: false,
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              fontSize: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .height *
                                                    0.01659,
                                                14.0,
                                              ),
                                              letterSpacing: 0.0,
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
                                          (_model.nrodoc != null &&
                                                      _model.nrodoc != '') &&
                                                  !(_model.documentoNroFocusNode
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
                                      maxLength: _model.cCvalueValue ==
                                              'Cedula ciudadania'
                                          ? 10
                                          : 30,
                                      maxLengthEnforcement:
                                          MaxLengthEnforcement.enforced,
                                      buildCounter: (context,
                                              {required currentLength,
                                              required isFocused,
                                              maxLength}) =>
                                          null,
                                      validator: _model
                                          .documentoNroTextControllerValidator
                                          .asValidator(context),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(_model.cCvalueValue ==
                                                    'Cedula ciudadania'
                                                ? '^\\d+\$'
                                                : '^[a-zA-Z0-9]*\$'))
                                      ],
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
                                  valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.04266,
                                    36.0,
                                  ),
                                  0.0,
                                  valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.02370,
                                    20.0,
                                  )),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    return;
                                  }
                                  if (_model.cCvalueValue == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Ingrese tipo de documento',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                      ),
                                    );
                                    return;
                                  }
                                  _model.userr = await queryUserRecordOnce(
                                    queryBuilder: (userRecord) => userRecord
                                        .where(
                                          'nit',
                                          isEqualTo: _model
                                              .documentoNroTextController.text,
                                        )
                                        .where(
                                          'tipoDocumento',
                                          isEqualTo: _model.cCvalueValue,
                                        ),
                                    singleRecord: true,
                                  ).then((s) => s.firstOrNull);
                                  if (_model.userr?.reference != null) {
                                    context.pushNamed(
                                      ChangePassword3Widget.routeName,
                                      queryParameters: {
                                        'docuser': serializeParam(
                                          _model.userr,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'docuser': _model.userr,
                                        '__transition_info__': TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.rightToLeft,
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
                                          alignment: AlignmentDirectional(
                                                  0.0, 0.0)
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
                                                  'Documento de identidad no se encuentra registrado',
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  }

                                  safeSetState(() {});
                                },
                                text: 'Continuar',
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
                                  color:
                                      FlutterFlowTheme.of(context).customColor4,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
