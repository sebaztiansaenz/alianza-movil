import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/sucess_mensaje_error/sucess_mensaje_error_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'registro3_model.dart';
export 'registro3_model.dart';

class Registro3Widget extends StatefulWidget {
  const Registro3Widget({super.key});

  static String routeName = 'REGISTRO3';
  static String routePath = '/registro3';

  @override
  State<Registro3Widget> createState() => _Registro3WidgetState();
}

class _Registro3WidgetState extends State<Registro3Widget> {
  late Registro3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Registro3Model());

    _model.dirTextController ??= TextEditingController();
    _model.dirFocusNode ??= FocusNode();

    _model.barrioTextController ??= TextEditingController();
    _model.barrioFocusNode ??= FocusNode();

    _model.ciuexpTextController ??= TextEditingController();

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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                            8.0,
                            0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 16.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: Image.asset(
                                      'assets/images/datos.png',
                                      width: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).width *
                                            0.09231,
                                        36.0,
                                      ),
                                      height: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.04266,
                                        36.0,
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: AutoSizeText(
                                    'RESIDENCIA',
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
                                    height: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.02607,
                                      22.0,
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
                                        .secondaryBackground,
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
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.only(),
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
                  child: SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Form(
                          key: _model.formKey,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 40.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, -1.0),
                                      child: AutoSizeText(
                                        'Dirección de residencia',
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0,
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.0095,
                                            8.0,
                                          ),
                                          0.0,
                                          0.0),
                                      child: TextFormField(
                                        controller: _model.dirTextController,
                                        focusNode: _model.dirFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.dirTextController',
                                          Duration(milliseconds: 2000),
                                          () async {
                                            _model.dir =
                                                _model.dirTextController.text;
                                            safeSetState(() {});
                                          },
                                        ),
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: false,
                                          hintText:
                                              'Escribe tu dirección de residencia',
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
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
                                            (_model.dir != null &&
                                                        _model.dir != '') &&
                                                    !(_model.dirFocusNode
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
                                              fontWeight: FontWeight.normal,
                                            ),
                                        validator: _model
                                            .dirTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: AutoSizeText(
                                          'Barrio',
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
                                                fontWeight: FontWeight.bold,
                                              ),
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
                                          0.0),
                                      child: TextFormField(
                                        controller: _model.barrioTextController,
                                        focusNode: _model.barrioFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.barrioTextController',
                                          Duration(milliseconds: 2000),
                                          () async {
                                            _model.barrio = _model
                                                .barrioTextController.text;
                                            safeSetState(() {});
                                          },
                                        ),
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: false,
                                          hintText: 'Escribe tu barrio',
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
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
                                            (_model.barrio != null &&
                                                        _model.barrio != '') &&
                                                    !(_model.barrioFocusNode
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
                                              fontWeight: FontWeight.normal,
                                            ),
                                        validator: _model
                                            .barrioTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: AutoSizeText(
                                          'Ciudad de residencia',
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
                                                fontWeight: FontWeight.bold,
                                              ),
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
                                          0.0),
                                      child: Autocomplete<String>(
                                        initialValue: TextEditingValue(),
                                        optionsBuilder: (textEditingValue) {
                                          if (textEditingValue.text == '') {
                                            return const Iterable<
                                                String>.empty();
                                          }
                                          return (getJsonField(
                                            FFAppState().gsheets,
                                            r'''$..ciudad''',
                                            true,
                                          ) as List?)!
                                              .map<String>((e) => e.toString())
                                              .toList()
                                              .cast<String>()
                                              .where((option) {
                                            final lowercaseOption =
                                                option.toLowerCase();
                                            return lowercaseOption.contains(
                                                textEditingValue.text
                                                    .toLowerCase());
                                          });
                                        },
                                        optionsViewBuilder:
                                            (context, onSelected, options) {
                                          return AutocompleteOptionsList(
                                            textFieldKey: _model.ciuexpKey,
                                            textController:
                                                _model.ciuexpTextController!,
                                            options: options.toList(),
                                            onSelected: onSelected,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                            textHighlightStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Satoshi',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                    ),
                                            elevation: 4.0,
                                            optionBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .customColor5,
                                            optionHighlightColor:
                                                FlutterFlowTheme.of(context)
                                                    .customColor5,
                                            maxHeight: 200.0,
                                          );
                                        },
                                        onSelected: (String selection) {
                                          safeSetState(() =>
                                              _model.ciuexpSelectedOption =
                                                  selection);
                                          FocusScope.of(context).unfocus();
                                        },
                                        fieldViewBuilder: (
                                          context,
                                          textEditingController,
                                          focusNode,
                                          onEditingComplete,
                                        ) {
                                          _model.ciuexpFocusNode = focusNode;

                                          _model.ciuexpTextController =
                                              textEditingController;
                                          return TextFormField(
                                            key: _model.ciuexpKey,
                                            controller: textEditingController,
                                            focusNode: focusNode,
                                            onEditingComplete:
                                                onEditingComplete,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.ciuexpTextController',
                                              Duration(milliseconds: 2000),
                                              () async {
                                                _model.ciuexp = _model
                                                    .ciuexpTextController.text;
                                                safeSetState(() {});
                                              },
                                            ),
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: false,
                                              hintText: 'Seleccione la ciudad',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Satoshi',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
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
                                                (_model.ciuexp != null &&
                                                            _model.ciuexp !=
                                                                '') &&
                                                        !(_model.ciuexpFocusNode?.hasFocus ??
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
                                                  fontWeight: FontWeight.normal,
                                                ),
                                            validator: _model
                                                .ciuexpTextControllerValidator
                                                .asValidator(context),
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0,
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.04740,
                                            40.0,
                                          ),
                                          0.0,
                                          0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Theme(
                                            data: ThemeData(
                                              checkboxTheme: CheckboxThemeData(
                                                visualDensity:
                                                    VisualDensity.compact,
                                                materialTapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                              ),
                                              unselectedWidgetColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                            child: Checkbox(
                                              value: _model.checkboxValue ??=
                                                  false,
                                              onChanged: (newValue) async {
                                                safeSetState(() => _model
                                                    .checkboxValue = newValue!);
                                              },
                                              side:
                                                  (FlutterFlowTheme.of(context)
                                                              .secondaryText !=
                                                          null)
                                                      ? BorderSide(
                                                          width: 2,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText!,
                                                        )
                                                      : null,
                                              activeColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              checkColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                          ),
                                          Flexible(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  AutoSizeText(
                                                    'Acepto politicas y tratamiento de datos personales ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          await launchURL(
                                                              'https://alianzacapital.co/politica-de-privacidad.html');
                                                        },
                                                        child: AutoSizeText(
                                                          'Ver políticas',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Satoshi',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
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
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          await launchURL(
                                                              'https://alianzacapital.co/politica-de-privacidad.html');
                                                        },
                                                        child: SizedBox(
                                                          width: 80.0,
                                                          child: Divider(
                                                            height: 5.0,
                                                            thickness: 2.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
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
                        if (_model.checkboxValue == true)
                          Builder(
                            builder: (context) => Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0,
                                  60.0,
                                  20.0,
                                  valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.04740,
                                    40.0,
                                  )),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    return;
                                  }
                                  if (_model.checkboxValue == true) {
                                    FFAppState().updateUserInformationStruct(
                                      (e) => e
                                        ..direccinResidencia =
                                            _model.dirTextController.text
                                        ..barrio =
                                            _model.barrioTextController.text
                                        ..ciudadResidencia =
                                            _model.ciuexpTextController.text
                                        ..userType = FFAppConstants.Role1,
                                    );
                                    safeSetState(() {});

                                    context.pushNamed(
                                      Registro4Widget.routeName,
                                      extra: <String, dynamic>{
                                        '__transition_info__': TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 200),
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
                                                  'Debes aceptar las políticas y tratamiento de datos personales',
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  }
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
