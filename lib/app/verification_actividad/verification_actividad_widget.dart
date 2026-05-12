import '/app/perfil/perfil_laboral2/perfil_laboral2_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'verification_actividad_model.dart';
export 'verification_actividad_model.dart';

class VerificationActividadWidget extends StatefulWidget {
  const VerificationActividadWidget({
    super.key,
    this.front,
    this.back,
    this.selfie,
  });

  final String? front;
  final String? back;
  final String? selfie;

  static String routeName = 'VerificationActividad';
  static String routePath = '/verificationActividad';

  @override
  State<VerificationActividadWidget> createState() =>
      _VerificationActividadWidgetState();
}

class _VerificationActividadWidgetState
    extends State<VerificationActividadWidget> {
  late VerificationActividadModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerificationActividadModel());

    _model.ingresosTextController ??= TextEditingController();
    _model.ingresosFocusNode ??= FocusNode();
    _model.ingresosFocusNode!.addListener(() => safeSetState(() {}));
    _model.egresosTextController ??= TextEditingController();
    _model.egresosFocusNode ??= FocusNode();
    _model.egresosFocusNode!.addListener(() => safeSetState(() {}));
    _model.activosTextController ??= TextEditingController();
    _model.activosFocusNode ??= FocusNode();
    _model.activosFocusNode!.addListener(() => safeSetState(() {}));
    _model.patrimonioTextController ??= TextEditingController();
    _model.patrimonioFocusNode ??= FocusNode();
    _model.patrimonioFocusNode!.addListener(() => safeSetState(() {}));
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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF0B35B8),
        body: Column(
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
                            4.0,
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
                                        20.0, 0.0, 12.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/hand_icon.png',
                                        height: valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.03792,
                                          32.0,
                                        ),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: AutoSizeText(
                                    'ACTIVIDAD ECONÓMICA',
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
                                          fontWeight: FontWeight.bold,
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
                                        .secondaryBackground,
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    '1',
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
                                    color: Color(0x1FFFFFFF),
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: AutoSizeText(
                                    '2',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
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
                                    color: Color(0x1FFFFFFF),
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: AutoSizeText(
                                    '3',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
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
                                    color: Color(0x1FFFFFFF),
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: AutoSizeText(
                                    '4',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
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
                                    color: Color(0x1FFFFFFF),
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
                                              .alternate,
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0,
                                      valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.02844,
                                        24.0,
                                      ),
                                      0.0,
                                      valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.0095,
                                        8.0,
                                      )),
                                  child: AutoSizeText(
                                    'Actividad',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.01659,
                                            14.0,
                                          ),
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
                                      return GestureDetector(
                                        onTap: () {
                                          FocusScope.of(context).unfocus();
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: PerfilLaboral2Widget(),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 48.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .customColor5,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        14.0, 0.0, 14.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AuthUserStreamWidget(
                                          builder: (context) => Text(
                                            valueOrDefault<String>(
                                              FFAppState().occupation != null &&
                                                      FFAppState().occupation !=
                                                          ''
                                                  ? FFAppState().occupation
                                                  : valueOrDefault<String>(
                                                      valueOrDefault(
                                                          currentUserDocument
                                                              ?.ocupacion,
                                                          ''),
                                                      'Selecciona tu profesión',
                                                    ),
                                              'Selecciona tu actividad',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  color: valueOrDefault<Color>(
                                                    valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.ocupacion,
                                                                    '') !=
                                                                null &&
                                                            valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.ocupacion,
                                                                    '') !=
                                                                ''
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                  ),
                                                  fontSize:
                                                      valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.01896,
                                                    16.0,
                                                  ),
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_down_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0,
                                      valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.02370,
                                        20.0,
                                      ),
                                      0.0,
                                      valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.0095,
                                        8.0,
                                      )),
                                  child: AutoSizeText(
                                    'Total ingresos mensuales',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.01659,
                                            14.0,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 48.0,
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            14.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          '\$',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: TextFormField(
                                            controller:
                                                _model.ingresosTextController,
                                            focusNode: _model.ingresosFocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.ingresosTextController',
                                              Duration(milliseconds: 100),
                                              () async {
                                                _model.ingreso = _model
                                                    .ingresosTextController
                                                    .text;
                                                safeSetState(() {});
                                              },
                                            ),
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: false,
                                              hintStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Satoshi',
                                                    color:
                                                        valueOrDefault<Color>(
                                                      (_model.ingreso != null &&
                                                                  _model.ingreso !=
                                                                      '') &&
                                                              !(_model.ingresosFocusNode
                                                                      ?.hasFocus ??
                                                                  false)
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor5
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                    ),
                                                    fontSize:
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.01896,
                                                      16.0,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              filled: true,
                                              fillColor: valueOrDefault<Color>(
                                                (_model.ingreso != null &&
                                                            _model.ingreso !=
                                                                '') &&
                                                        !(_model.ingresosFocusNode?.hasFocus ??
                                                            false)
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .customColor5
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                              ),
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          32.0, 0.0, 0.0, 0.0),
                                              hoverColor: valueOrDefault<Color>(
                                                (_model.ingreso != null &&
                                                            _model.ingreso !=
                                                                '') &&
                                                        !(_model.ingresosFocusNode?.hasFocus ??
                                                            false)
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .customColor5
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  color: valueOrDefault<Color>(
                                                    (_model.ingreso != null &&
                                                                _model.ingreso !=
                                                                    '') &&
                                                            !(_model.ingresosFocusNode
                                                                    ?.hasFocus ??
                                                                false)
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .customColor5
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  fontSize:
                                                      valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.01896,
                                                    16.0,
                                                  ),
                                                  letterSpacing: 0.0,
                                                ),
                                            keyboardType: TextInputType.number,
                                            cursorColor: valueOrDefault<Color>(
                                              (_model.ingreso != null &&
                                                          _model.ingreso !=
                                                              '') &&
                                                      !(_model.ingresosFocusNode?.hasFocus ??
                                                          false)
                                                  ? FlutterFlowTheme.of(context)
                                                      .customColor5
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            validator: _model
                                                .ingresosTextControllerValidator
                                                .asValidator(context),
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp('[a-zA-Z0-9]'))
                                            ],
                                          ),
                                        ),
                                        if (_model.ingresosTextController
                                                    .text !=
                                                null &&
                                            _model.ingresosTextController
                                                    .text !=
                                                '')
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      valueOrDefault<double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .height *
                                                            0.01896,
                                                        16.0,
                                                      ),
                                                      0.0,
                                                      0.0,
                                                      0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  functions.formatAmount(
                                                      valueOrDefault<double>(
                                                    double.tryParse(_model
                                                        .ingresosTextController
                                                        .text),
                                                    0.0,
                                                  )),
                                                  'Escribe tus ingresos totales',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          fontSize:
                                                              valueOrDefault<
                                                                  double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.01896,
                                                            16.0,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        if (_model.ingresosTextController
                                                    .text ==
                                                null ||
                                            _model.ingresosTextController
                                                    .text ==
                                                '')
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      valueOrDefault<double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .height *
                                                            0.01896,
                                                        16.0,
                                                      ),
                                                      0.0,
                                                      0.0,
                                                      0.0),
                                              child: Text(
                                                'Escribe tus ingresos totales',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          fontSize:
                                                              valueOrDefault<
                                                                  double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.01896,
                                                            16.0,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0,
                                      valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.02370,
                                        20.0,
                                      ),
                                      0.0,
                                      valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.0095,
                                        8.0,
                                      )),
                                  child: AutoSizeText(
                                    'Total egresos mensuales',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.01659,
                                            14.0,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 48.0,
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            14.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          '\$',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: TextFormField(
                                            controller:
                                                _model.egresosTextController,
                                            focusNode: _model.egresosFocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.egresosTextController',
                                              Duration(milliseconds: 100),
                                              () async {
                                                _model.egreso = _model
                                                    .egresosTextController.text;
                                                safeSetState(() {});
                                              },
                                            ),
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: false,
                                              hintText:
                                                  'Escribe tus egresos totales',
                                              hintStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Satoshi',
                                                    color:
                                                        valueOrDefault<Color>(
                                                      (_model.egreso != null &&
                                                                  _model.egreso !=
                                                                      '') &&
                                                              !(_model.egresosFocusNode
                                                                      ?.hasFocus ??
                                                                  false)
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor5
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                    ),
                                                    fontSize:
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.01896,
                                                      16.0,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              filled: true,
                                              fillColor: valueOrDefault<Color>(
                                                (_model.egreso != null &&
                                                            _model.egreso !=
                                                                '') &&
                                                        !(_model.egresosFocusNode?.hasFocus ??
                                                            false)
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .customColor5
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                              ),
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          32.0, 0.0, 0.0, 0.0),
                                              hoverColor: valueOrDefault<Color>(
                                                (_model.egreso != null &&
                                                            _model.egreso !=
                                                                '') &&
                                                        !(_model.egresosFocusNode?.hasFocus ??
                                                            false)
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .customColor5
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  color: valueOrDefault<Color>(
                                                    (_model.egreso != null &&
                                                                _model.egreso !=
                                                                    '') &&
                                                            !(_model.egresosFocusNode
                                                                    ?.hasFocus ??
                                                                false)
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .customColor5
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  fontSize:
                                                      valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.01896,
                                                    16.0,
                                                  ),
                                                  letterSpacing: 0.0,
                                                ),
                                            keyboardType: TextInputType.number,
                                            cursorColor: valueOrDefault<Color>(
                                              (_model.egreso != null &&
                                                          _model.egreso !=
                                                              '') &&
                                                      !(_model.egresosFocusNode
                                                              ?.hasFocus ??
                                                          false)
                                                  ? FlutterFlowTheme.of(context)
                                                      .customColor5
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            validator: _model
                                                .egresosTextControllerValidator
                                                .asValidator(context),
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp('[0-9]'))
                                            ],
                                          ),
                                        ),
                                        if (_model.egresosTextController.text !=
                                                null &&
                                            _model.egresosTextController.text !=
                                                '')
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      valueOrDefault<double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .height *
                                                            0.01896,
                                                        16.0,
                                                      ),
                                                      0.0,
                                                      0.0,
                                                      0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  functions.formatAmount(
                                                      valueOrDefault<double>(
                                                    double.tryParse(_model
                                                        .egresosTextController
                                                        .text),
                                                    0.0,
                                                  )),
                                                  'Escribe tus egresos totales',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          fontSize:
                                                              valueOrDefault<
                                                                  double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.01896,
                                                            16.0,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        if (_model.egresosTextController.text ==
                                                null ||
                                            _model.egresosTextController.text ==
                                                '')
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      valueOrDefault<double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .height *
                                                            0.01896,
                                                        16.0,
                                                      ),
                                                      0.0,
                                                      0.0,
                                                      0.0),
                                              child: Text(
                                                'Escribe tus egresos totales',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          fontSize:
                                                              valueOrDefault<
                                                                  double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.01896,
                                                            16.0,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0,
                                      valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.02370,
                                        20.0,
                                      ),
                                      0.0,
                                      valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.0095,
                                        8.0,
                                      )),
                                  child: AutoSizeText(
                                    'Total activos',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.01659,
                                            14.0,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                              Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.activosTextController,
                                      focusNode: _model.activosFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.activosTextController',
                                        Duration(milliseconds: 100),
                                        () async {
                                          _model.activo =
                                              _model.activosTextController.text;
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
                                              color: valueOrDefault<Color>(
                                                (_model.activo != null &&
                                                            _model.activo !=
                                                                '') &&
                                                        !(_model.activosFocusNode?.hasFocus ??
                                                            false)
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .customColor5
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                              ),
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
                                        fillColor: valueOrDefault<Color>(
                                          (_model.activo != null &&
                                                      _model.activo != '') &&
                                                  !(_model.activosFocusNode
                                                          ?.hasFocus ??
                                                      false)
                                              ? FlutterFlowTheme.of(context)
                                                  .customColor5
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                32.0, 0.0, 0.0, 0.0),
                                        hoverColor: valueOrDefault<Color>(
                                          (_model.activo != null &&
                                                      _model.activo != '') &&
                                                  !(_model.activosFocusNode
                                                          ?.hasFocus ??
                                                      false)
                                              ? FlutterFlowTheme.of(context)
                                                  .customColor5
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
                                            color: valueOrDefault<Color>(
                                              (_model.activo != null &&
                                                          _model.activo !=
                                                              '') &&
                                                      !(_model.activosFocusNode
                                                              ?.hasFocus ??
                                                          false)
                                                  ? FlutterFlowTheme.of(context)
                                                      .customColor5
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            fontSize: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.01896,
                                              16.0,
                                            ),
                                            letterSpacing: 0.0,
                                          ),
                                      keyboardType: TextInputType.number,
                                      cursorColor: valueOrDefault<Color>(
                                        (_model.activo != null &&
                                                    _model.activo != '') &&
                                                !(_model.activosFocusNode
                                                        ?.hasFocus ??
                                                    false)
                                            ? FlutterFlowTheme.of(context)
                                                .customColor5
                                            : FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      validator: _model
                                          .activosTextControllerValidator
                                          .asValidator(context),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp('[0-9]'))
                                      ],
                                    ),
                                  ),
                                  if (_model.activosTextController.text !=
                                          null &&
                                      _model.activosTextController.text != '')
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.01896,
                                              16.0,
                                            ),
                                            valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.01659,
                                              14.0,
                                            ),
                                            0.0,
                                            0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            functions.formatAmount(
                                                valueOrDefault<double>(
                                              double.tryParse(_model
                                                  .activosTextController.text),
                                              0.0,
                                            )),
                                            'Escribe tus activos totales',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                fontSize:
                                                    valueOrDefault<double>(
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.01896,
                                                  16.0,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                  if (_model.activosTextController.text ==
                                          null ||
                                      _model.activosTextController.text == '')
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.01896,
                                              16.0,
                                            ),
                                            valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.01659,
                                              14.0,
                                            ),
                                            0.0,
                                            0.0),
                                        child: Text(
                                          'Escribe tus activos totales',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                fontSize:
                                                    valueOrDefault<double>(
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.01896,
                                                  16.0,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0,
                                      valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.02370,
                                        20.0,
                                      ),
                                      0.0,
                                      valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.0095,
                                        8.0,
                                      )),
                                  child: AutoSizeText(
                                    'Total patrimonio',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.01659,
                                            14.0,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 48.0,
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: TextFormField(
                                        controller:
                                            _model.patrimonioTextController,
                                        focusNode: _model.patrimonioFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.patrimonioTextController',
                                          Duration(milliseconds: 100),
                                          () async {
                                            _model.patrimonio = _model
                                                .patrimonioTextController.text;
                                            safeSetState(() {});
                                          },
                                        ),
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: false,
                                          hintText:
                                              'Escribe tu patrimonio total',
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                color: valueOrDefault<Color>(
                                                  (_model.patrimonio != null &&
                                                              _model.patrimonio !=
                                                                  '') &&
                                                          !(_model.patrimonioFocusNode?.hasFocus ??
                                                              false)
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .customColor5
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                fontSize:
                                                    valueOrDefault<double>(
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
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor: valueOrDefault<Color>(
                                            (_model.patrimonio != null &&
                                                        _model.patrimonio !=
                                                            '') &&
                                                    !(_model.patrimonioFocusNode
                                                            ?.hasFocus ??
                                                        false)
                                                ? FlutterFlowTheme.of(context)
                                                    .customColor5
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  32.0, 0.0, 0.0, 0.0),
                                          hoverColor: valueOrDefault<Color>(
                                            (_model.patrimonio != null &&
                                                        _model.patrimonio !=
                                                            '') &&
                                                    !(_model.patrimonioFocusNode
                                                            ?.hasFocus ??
                                                        false)
                                                ? FlutterFlowTheme.of(context)
                                                    .customColor5
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
                                              color: valueOrDefault<Color>(
                                                (_model.patrimonio != null &&
                                                            _model.patrimonio !=
                                                                '') &&
                                                        !(_model.patrimonioFocusNode?.hasFocus ??
                                                            false)
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .customColor5
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                              ),
                                              fontSize: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .height *
                                                    0.01896,
                                                16.0,
                                              ),
                                              letterSpacing: 0.0,
                                            ),
                                        keyboardType: TextInputType.number,
                                        cursorColor: valueOrDefault<Color>(
                                          (_model.patrimonio != null &&
                                                      _model.patrimonio !=
                                                          '') &&
                                                  !(_model.patrimonioFocusNode
                                                          ?.hasFocus ??
                                                      false)
                                              ? FlutterFlowTheme.of(context)
                                                  .customColor5
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        validator: _model
                                            .patrimonioTextControllerValidator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp('[0-9]'))
                                        ],
                                      ),
                                    ),
                                    if (_model.patrimonioTextController.text ==
                                            null ||
                                        _model.patrimonioTextController.text ==
                                            '')
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.01896,
                                                    16.0,
                                                  ),
                                                  0.0,
                                                  0.0,
                                                  0.0),
                                          child: Text(
                                            'Escribe tu patrimonio total',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  fontSize:
                                                      valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.01896,
                                                    16.0,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ),
                                    if (_model.patrimonioTextController.text !=
                                            null &&
                                        _model.patrimonioTextController.text !=
                                            '')
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.01896,
                                                    16.0,
                                                  ),
                                                  0.0,
                                                  0.0,
                                                  0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              functions.formatAmount(
                                                  valueOrDefault<double>(
                                                double.tryParse(_model
                                                    .patrimonioTextController
                                                    .text),
                                                0.0,
                                              )),
                                              'Escribe tu patrimonio total',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  fontSize:
                                                      valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.01896,
                                                    16.0,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0,
                                valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).width * 0.06636,
                                  56.0,
                                ),
                                0.0,
                                0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                if (_model.formKey.currentState == null ||
                                    !_model.formKey.currentState!.validate()) {
                                  return;
                                }

                                await currentUserReference!
                                    .update(createUserRecordData(
                                  ocupacion: FFAppState().occupation,
                                  ingresos: _model.ingresosTextController.text,
                                  egresos: _model.egresosTextController.text,
                                  activos: _model.activosTextController.text,
                                  patrimonio:
                                      _model.patrimonioTextController.text,
                                ));

                                context.pushNamed(
                                  VerificationDeclaracionWidget.routeName,
                                  queryParameters: {
                                    'front': serializeParam(
                                      widget!.front,
                                      ParamType.String,
                                    ),
                                    'back': serializeParam(
                                      widget!.back,
                                      ParamType.String,
                                    ),
                                    'selfie': serializeParam(
                                      widget!.selfie,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
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
                        ],
                      ),
                    ),
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
