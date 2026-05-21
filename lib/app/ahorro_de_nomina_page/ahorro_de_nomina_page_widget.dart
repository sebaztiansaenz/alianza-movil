import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
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
import 'ahorro_de_nomina_page_model.dart';
export 'ahorro_de_nomina_page_model.dart';

class AhorroDeNominaPageWidget extends StatefulWidget {
  const AhorroDeNominaPageWidget({
    super.key,
    bool? cambioEmpresa,
    this.ahorroActual,
  }) : this.cambioEmpresa = cambioEmpresa ?? false;

  final bool cambioEmpresa;
  final DocumentReference? ahorroActual;

  static String routeName = 'Ahorro_de_nominaPage';
  static String routePath = '/ahorroDeNominaPage';

  @override
  State<AhorroDeNominaPageWidget> createState() =>
      _AhorroDeNominaPageWidgetState();
}

class _AhorroDeNominaPageWidgetState extends State<AhorroDeNominaPageWidget> {
  late AhorroDeNominaPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AhorroDeNominaPageModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
        body: custom_widgets.FloatingNavBarScrollScope(
          child: Stack(
          children: [
            custom_widgets.FloatingNavBarScrollListener(
              child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        FlutterFlowTheme.of(context).fondo,
                        Color(0xFF002CE9)
                      ],
                      stops: [0.0, 1.0],
                      begin: AlignmentDirectional(0.0, -1.0),
                      end: AlignmentDirectional(0, 1.0),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 56.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            FlutterFlowIconButton(
                              borderRadius: 8.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.arrow_back_sharp,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                context.safePop();
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                        child: Container(
                          width: double.infinity,
                          height: 120.0,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                FFIcons.kapartment,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                size: 50.0,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 4.0),
                                child: AutoSizeText(
                                  'Datos de la empresa',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Satoshi',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 24.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              AutoSizeText(
                                'Completa los siguientes datos para continuar',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Satoshi',
                                      color: Color(0xFFAFB9C9),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: AutoSizeText(
                                'NIT de la empresa',
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
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 200.0,
                                  child: TextFormField(
                                    controller: _model.textController,
                                    focusNode: _model.textFieldFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.textController',
                                      Duration(milliseconds: 100),
                                      () => safeSetState(() {}),
                                    ),
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            letterSpacing: 0.0,
                                          ),
                                      hintText: 'Escribe el NIT de la empresa',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .customColor5,
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
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                        ),
                                    maxLength: 10,
                                    maxLengthEnforcement:
                                        MaxLengthEnforcement.enforced,
                                    buildCounter: (context,
                                            {required currentLength,
                                            required isFocused,
                                            maxLength}) =>
                                        null,
                                    keyboardType: TextInputType.number,
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    validator: _model.textControllerValidator
                                        .asValidator(context),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[0-9]'))
                                    ],
                                  ),
                                ),
                              ),
                              if (functions.contarCaracteres(
                                          _model.textController.text) >=
                                      8
                                  ? true
                                  : false)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.nitexist = false;
                                      safeSetState(() {});
                                      _model.empresa =
                                          await queryEmpresaRecordOnce(
                                        queryBuilder: (empresaRecord) =>
                                            empresaRecord.where(
                                          'nit',
                                          isEqualTo: _model.textController.text,
                                        ),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      if (_model.empresa?.reference != null) {
                                        context.pushNamed(
                                          AhorroDeNominaPageBuscarWidget
                                              .routeName,
                                          queryParameters: {
                                            'empresa': serializeParam(
                                              _model.empresa,
                                              ParamType.Document,
                                            ),
                                            'cambioEmpresa2': serializeParam(
                                              widget!.cambioEmpresa,
                                              ParamType.bool,
                                            ),
                                            'ahorroActual2': serializeParam(
                                              widget!.ahorroActual,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'empresa': _model.empresa,
                                          },
                                        );
                                      } else {
                                        _model.nitexist = true;
                                        safeSetState(() {});
                                      }

                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      width: 48.0,
                                      height: 48.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .customColor4,
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: FaIcon(
                                          FontAwesomeIcons.arrowRight,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          size: 20.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          if (_model.nitexist)
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 46.0, 0.0, 16.0),
                                  child: AutoSizeText(
                                    'Mi empresa no está registrada',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                        RegistroempresasWidget.routeName);
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      AutoSizeText(
                                        'Registrarla ahora',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic,
                                            ),
                                      ),
                                      Container(
                                        width: 111.0,
                                        height: 1.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFF6700),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ),
            Container(
              width: valueOrDefault<double>(
                MediaQuery.sizeOf(context).width * 1.00,
                393.0,
              ),
              height: valueOrDefault<double>(
                MediaQuery.sizeOf(context).height * 0.948,
                800.0,
              ),
              child: custom_widgets.DraggableFloatingButton(
                width: valueOrDefault<double>(
                  MediaQuery.sizeOf(context).width * 1.00,
                  393.0,
                ),
                height: valueOrDefault<double>(
                  MediaQuery.sizeOf(context).height * 0.948,
                  800.0,
                ),
                onPressed: () async {
                  context.pushNamed(
                    AyudaWidget.routeName,
                    extra: <String, dynamic>{
                      '__transition_info__': TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );
                },
              ),
            ),
            Container(
              width: valueOrDefault<double>(
                MediaQuery.sizeOf(context).width * 1.00,
                393.0,
              ),
              height: valueOrDefault<double>(
                MediaQuery.sizeOf(context).height * 1,
                852.0,
              ),
              child: custom_widgets.FloatingNavBar(
                width: valueOrDefault<double>(
                  MediaQuery.sizeOf(context).width * 1.00,
                  393.0,
                ),
                height: valueOrDefault<double>(
                  MediaQuery.sizeOf(context).height * 1,
                  852.0,
                ),
                onLeftPressed: () async {
                  context.pushNamed(
                    ConveniosWidget.routeName,
                    extra: <String, dynamic>{
                      '__transition_info__': TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );
                },
                onCenterPressed: () async {
                  context.pushNamed(
                    AHORROSPage1CopyCopyWidget.routeName,
                    extra: <String, dynamic>{
                      '__transition_info__': TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );
                },
                onRightPressed: () async {
                  context.pushNamed(
                    Perfil01Widget.routeName,
                    extra: <String, dynamic>{
                      '__transition_info__': TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
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
