import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'verification_declaracion_model.dart';
export 'verification_declaracion_model.dart';

class VerificationDeclaracionWidget extends StatefulWidget {
  const VerificationDeclaracionWidget({
    super.key,
    this.front,
    this.back,
    this.selfie,
  });

  final String? front;
  final String? back;
  final String? selfie;

  static String routeName = 'VerificationDeclaracion';
  static String routePath = '/verificationDeclaracion';

  @override
  State<VerificationDeclaracionWidget> createState() =>
      _VerificationDeclaracionWidgetState();
}

class _VerificationDeclaracionWidgetState
    extends State<VerificationDeclaracionWidget> {
  late VerificationDeclaracionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerificationDeclaracionModel());

    _model.nameTextController ??= TextEditingController();
    _model.nameFocusNode ??= FocusNode();

    _model.idTextController ??= TextEditingController();
    _model.idFocusNode ??= FocusNode();

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
                                        'assets/images/book_icon.png',
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
                                    'DECLARACION',
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
                                        .customColor4,
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Icon(
                                    Icons.check_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: 24.0,
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
                                    '2',
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
              child: Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        20.0,
                        valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.02844,
                          24.0,
                        ),
                        20.0,
                        0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Form(
                            key: _model.formKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: AutoSizeText(
                                        '1. Es usted una persona politicamente expuesta (Decreto 830 de 2021)',
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
                                                    0.01896,
                                                16.0,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0,
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.0095,
                                            8.0,
                                          ),
                                          0.0,
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.0095,
                                            8.0,
                                          )),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          AutoSizeText(
                                            'Si',
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
                                                ),
                                          ),
                                          Theme(
                                            data: ThemeData(
                                              checkboxTheme: CheckboxThemeData(
                                                visualDensity:
                                                    VisualDensity.compact,
                                                materialTapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap,
                                                shape: CircleBorder(),
                                              ),
                                              unselectedWidgetColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                            child: Checkbox(
                                              value: _model.checkbox1Value ??=
                                                  false,
                                              onChanged: (newValue) async {
                                                safeSetState(() =>
                                                    _model.checkbox1Value =
                                                        newValue!);
                                                if (newValue!) {
                                                  safeSetState(() {
                                                    _model.checkbox2Value =
                                                        false;
                                                  });
                                                  _model.options1 = true;
                                                  safeSetState(() {});
                                                } else {
                                                  safeSetState(() {
                                                    _model.checkbox2Value =
                                                        true;
                                                  });
                                                  _model.options1 = false;
                                                  safeSetState(() {});
                                                }
                                              },
                                              side:
                                                  (FlutterFlowTheme.of(context)
                                                              .primaryText !=
                                                          null)
                                                      ? BorderSide(
                                                          width: 2,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText!,
                                                        )
                                                      : null,
                                              activeColor:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              checkColor:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    28.0, 0.0, 0.0, 0.0),
                                            child: AutoSizeText(
                                              'No',
                                              style: FlutterFlowTheme.of(
                                                      context)
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
                                                  ),
                                            ),
                                          ),
                                          Theme(
                                            data: ThemeData(
                                              checkboxTheme: CheckboxThemeData(
                                                visualDensity:
                                                    VisualDensity.compact,
                                                materialTapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap,
                                                shape: CircleBorder(),
                                              ),
                                              unselectedWidgetColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                            child: Checkbox(
                                              value: _model.checkbox2Value ??=
                                                  false,
                                              onChanged: (newValue) async {
                                                safeSetState(() =>
                                                    _model.checkbox2Value =
                                                        newValue!);
                                                if (newValue!) {
                                                  safeSetState(() {
                                                    _model.checkbox1Value =
                                                        false;
                                                  });
                                                  _model.options1 = false;
                                                  safeSetState(() {});
                                                } else {
                                                  safeSetState(() {
                                                    _model.checkbox1Value =
                                                        true;
                                                  });
                                                  _model.options1 = true;
                                                  safeSetState(() {});
                                                }
                                              },
                                              side:
                                                  (FlutterFlowTheme.of(context)
                                                              .primaryText !=
                                                          null)
                                                      ? BorderSide(
                                                          width: 2,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText!,
                                                        )
                                                      : null,
                                              activeColor:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              checkColor:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context).alternate,
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
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: AutoSizeText(
                                          '2. ¿Tiene familiares hasta segundo grado de consanguinidad, segundo de afinidad y primero civil que sean PEP’s?',
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
                                                      0.01896,
                                                  16.0,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0,
                                            valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.0095,
                                              8.0,
                                            ),
                                            0.0,
                                            0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            AutoSizeText(
                                              'Si',
                                              style: FlutterFlowTheme.of(
                                                      context)
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
                                                  ),
                                            ),
                                            Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  visualDensity:
                                                      VisualDensity.compact,
                                                  materialTapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                  shape: CircleBorder(),
                                                ),
                                                unselectedWidgetColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                              child: Checkbox(
                                                value: _model.checkbox3Value ??=
                                                    false,
                                                onChanged: (newValue) async {
                                                  safeSetState(() =>
                                                      _model.checkbox3Value =
                                                          newValue!);
                                                  if (newValue!) {
                                                    safeSetState(() {
                                                      _model.checkbox4Value =
                                                          false;
                                                    });
                                                    _model.options2 = true;
                                                    safeSetState(() {});
                                                  } else {
                                                    safeSetState(() {
                                                      _model.checkbox4Value =
                                                          true;
                                                    });
                                                    _model.options2 = false;
                                                    safeSetState(() {});
                                                  }
                                                },
                                                side: (FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText !=
                                                        null)
                                                    ? BorderSide(
                                                        width: 2,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText!,
                                                      )
                                                    : null,
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                checkColor:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      28.0, 0.0, 0.0, 0.0),
                                              child: AutoSizeText(
                                                'No',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize:
                                                              valueOrDefault<
                                                                  double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.01659,
                                                            14.0,
                                                          ),
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  visualDensity:
                                                      VisualDensity.compact,
                                                  materialTapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                  shape: CircleBorder(),
                                                ),
                                                unselectedWidgetColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                              child: Checkbox(
                                                value: _model.checkbox4Value ??=
                                                    false,
                                                onChanged: (newValue) async {
                                                  safeSetState(() =>
                                                      _model.checkbox4Value =
                                                          newValue!);
                                                  if (newValue!) {
                                                    safeSetState(() {
                                                      _model.checkbox3Value =
                                                          false;
                                                    });
                                                    _model.options2 = false;
                                                    safeSetState(() {});
                                                  } else {
                                                    safeSetState(() {
                                                      _model.checkbox3Value =
                                                          true;
                                                    });
                                                    _model.options2 = true;
                                                    safeSetState(() {});
                                                  }
                                                },
                                                side: (FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText !=
                                                        null)
                                                    ? BorderSide(
                                                        width: 2,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText!,
                                                      )
                                                    : null,
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                checkColor:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (_model.checkbox3Value ?? true)
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
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, -1.0),
                                          child: AutoSizeText(
                                            'Nombre y apellidos',
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
                                        Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0,
                                                      valueOrDefault<double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .height *
                                                            0.0095,
                                                        8.0,
                                                      ),
                                                      0.0,
                                                      0.0),
                                              child: TextFormField(
                                                controller:
                                                    _model.nameTextController,
                                                focusNode: _model.nameFocusNode,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.nameTextController',
                                                  Duration(milliseconds: 2000),
                                                  () async {
                                                    _model.name = _model
                                                        .nameTextController
                                                        .text;
                                                    safeSetState(() {});
                                                  },
                                                ),
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: false,
                                                  hintText:
                                                      'Digite nombres, apellidos',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Satoshi',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
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
                                                            FontWeight.normal,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor5,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      valueOrDefault<Color>(
                                                    (_model.name != null &&
                                                                _model.name !=
                                                                    '') &&
                                                            !(_model.nameFocusNode
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
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(46.0, 0.0,
                                                              0.0, 0.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
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
                                                        ),
                                                validator: _model
                                                    .nameTextControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      14.0, 24.0, 0.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: Image.asset(
                                                  'assets/images/Vector_(2).png',
                                                  width: 20.0,
                                                  height: 20.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, -1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0,
                                                    valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.02370,
                                                      20.0,
                                                    ),
                                                    0.0,
                                                    0.0),
                                            child: AutoSizeText(
                                              'Número de documento',
                                              style: FlutterFlowTheme.of(
                                                      context)
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
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0,
                                                  valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.0095,
                                                    8.0,
                                                  ),
                                                  0.0,
                                                  0.0),
                                          child: TextFormField(
                                            controller: _model.idTextController,
                                            focusNode: _model.idFocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.idTextController',
                                              Duration(milliseconds: 2000),
                                              () async {
                                                _model.doc = _model
                                                    .idTextController.text;
                                                safeSetState(() {});
                                              },
                                            ),
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: false,
                                              hintText:
                                                  'Escribe el número de documento',
                                              hintStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Satoshi',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
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
                                                (_model.doc != null &&
                                                            _model.doc != '') &&
                                                        !(_model.idFocusNode
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
                                            ),
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
                                                        0.01896,
                                                    16.0,
                                                  ),
                                                  letterSpacing: 0.0,
                                                ),
                                            validator: _model
                                                .idTextControllerValidator
                                                .asValidator(context),
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp('[a-zA-Z0-9]'))
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0,
                                valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.06636,
                                  56.0,
                                ),
                                0.0,
                                valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.04266,
                                  36.0,
                                )),
                            child: FFButtonWidget(
                              onPressed: () async {
                                if (_model.options1 != null) {
                                  if (_model.options2 != null) {
                                    if (_model.checkbox3Value!) {
                                      if (_model.formKey.currentState == null ||
                                          !_model.formKey.currentState!
                                              .validate()) {
                                        return;
                                      }

                                      context.pushNamed(
                                        VerificationOriginWidget.routeName,
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
                                          'flgPPE': serializeParam(
                                            _model.options1,
                                            ParamType.bool,
                                          ),
                                          'flgRelativesPPE': serializeParam(
                                            _model.options2,
                                            ParamType.bool,
                                          ),
                                          'fullName': serializeParam(
                                            _model.nameTextController.text,
                                            ParamType.String,
                                          ),
                                          'relativeId': serializeParam(
                                            _model.idTextController.text,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          '__transition_info__': TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                          ),
                                        },
                                      );
                                    } else {
                                      context.pushNamed(
                                        VerificationOriginWidget.routeName,
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
                                          'flgPPE': serializeParam(
                                            _model.options1,
                                            ParamType.bool,
                                          ),
                                          'flgRelativesPPE': serializeParam(
                                            _model.options2,
                                            ParamType.bool,
                                          ),
                                        }.withoutNulls,
                                      );
                                    }
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Error'),
                                          content: Text(
                                              'Responda a la pregunta: Tiene usted familiar2s hasta segundo grado de consanguinidad, segundo de afinidad y primero civil que sean PEP’s'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Error'),
                                        content: Text(
                                            'Responda a la pregunta: Es usted una persona políticamente expuesta'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
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
