import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/session_inactivity.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/sucess_mensaje_error/sucess_mensaje_error_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'solicitarcrdito2_model.dart';
export 'solicitarcrdito2_model.dart';

class Solicitarcrdito2Widget extends StatefulWidget {
  const Solicitarcrdito2Widget({
    super.key,
    this.estadoCivil,
  });

  final String? estadoCivil;

  static String routeName = 'SOLICITARCRDITO-2';
  static String routePath = '/solicitarcrdito2';

  @override
  State<Solicitarcrdito2Widget> createState() => _Solicitarcrdito2WidgetState();
}

class _Solicitarcrdito2WidgetState extends State<Solicitarcrdito2Widget> with SessionActivityOnInitMixin {
  late Solicitarcrdito2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Solicitarcrdito2Model());

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
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(
              0.0,
              valueOrDefault<double>(
                MediaQuery.sizeOf(context).height * 0.07584,
                64.0,
              ),
              0.0,
              0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FlutterFlowIconButton(
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.arrow_back,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.safePop();
                    },
                  ),
                  Text(
                    'Situación familiar y económica',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Satoshi',
                          fontSize: valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.02133,
                            18.0,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ].divide(SizedBox(width: 8.0)),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 4.0,
                  decoration: BoxDecoration(
                    color: Color(0x0C262632),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: valueOrDefault<double>(
                          MediaQuery.sizeOf(context).width * 0.08974,
                          35.0,
                        ),
                        height: 4.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF002CE9),
                        ),
                      ),
                      Container(
                        width: valueOrDefault<double>(
                          MediaQuery.sizeOf(context).width * 0.08974,
                          35.0,
                        ),
                        height: 4.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF002CE9),
                        ),
                      ),
                      Container(
                        width: valueOrDefault<double>(
                          MediaQuery.sizeOf(context).width * 0.08974,
                          35.0,
                        ),
                        height: 4.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF002CE9),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        20.0,
                        valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.03792,
                          32.0,
                        ),
                        20.0,
                        0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '¿Cuántas personas dependen económicamente de usted?',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Satoshi',
                                fontSize: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.01659,
                                  14.0,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.personasDependientes = '0 - 1 ';
                            safeSetState(() {});
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.05688,
                              48.0,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: valueOrDefault<Color>(
                                  _model.personasDependientes == '0 - 1 '
                                      ? FlutterFlowTheme.of(context)
                                          .customColor4
                                      : FlutterFlowTheme.of(context)
                                          .customColor5,
                                  FlutterFlowTheme.of(context).customColor5,
                                ),
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.01659,
                                    14.0,
                                  ),
                                  0.0,
                                  0.0,
                                  0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (_model.personasDependientes !=
                                          '0 - 1 ')
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.personasDependientes =
                                                '0 - 1 ';
                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            width: 16.0,
                                            height: 16.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                              border: Border.all(
                                                color: Color(0xB2262632),
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (_model.personasDependientes ==
                                          '0 - 1 ')
                                        Container(
                                          width: 16.0,
                                          height: 16.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                            border: Border.all(
                                              color: Color(0xB0FF6700),
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(2.0),
                                            child: Container(
                                              width: 100.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor4,
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                                shape: BoxShape.rectangle,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  Text(
                                    '0 - 1 ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          fontSize: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.01659,
                                            14.0,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ].divide(SizedBox(
                                    width: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.01422,
                                  12.0,
                                ))),
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
                            _model.personasDependientes = '2 - 3 ';
                            safeSetState(() {});
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.05688,
                              48.0,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: valueOrDefault<Color>(
                                  _model.personasDependientes == '2 - 3 '
                                      ? FlutterFlowTheme.of(context)
                                          .customColor4
                                      : FlutterFlowTheme.of(context)
                                          .customColor5,
                                  FlutterFlowTheme.of(context).customColor5,
                                ),
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.01659,
                                    14.0,
                                  ),
                                  0.0,
                                  0.0,
                                  0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (_model.personasDependientes !=
                                          '2 - 3 ')
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.personasDependientes =
                                                '2 - 3 ';
                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            width: 16.0,
                                            height: 16.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                              border: Border.all(
                                                color: Color(0xB2262632),
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (_model.personasDependientes ==
                                          '2 - 3 ')
                                        Container(
                                          width: 16.0,
                                          height: 16.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                            border: Border.all(
                                              color: Color(0xB0FF6700),
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(2.0),
                                            child: Container(
                                              width: 100.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor4,
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                                shape: BoxShape.rectangle,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  Text(
                                    '2 - 3 ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          fontSize: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.01659,
                                            14.0,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ].divide(SizedBox(
                                    width: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.01422,
                                  12.0,
                                ))),
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
                            _model.personasDependientes = '4 o más';
                            safeSetState(() {});
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.05688,
                              48.0,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: valueOrDefault<Color>(
                                  _model.personasDependientes == '4 o más'
                                      ? FlutterFlowTheme.of(context)
                                          .customColor4
                                      : FlutterFlowTheme.of(context)
                                          .customColor5,
                                  FlutterFlowTheme.of(context).customColor5,
                                ),
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.01659,
                                    14.0,
                                  ),
                                  0.0,
                                  0.0,
                                  0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (_model.personasDependientes !=
                                          '4 o más')
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.personasDependientes =
                                                '4 o más';
                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            width: 16.0,
                                            height: 16.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                              border: Border.all(
                                                color: Color(0xB2262632),
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (_model.personasDependientes ==
                                          '4 o más')
                                        Container(
                                          width: 16.0,
                                          height: 16.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                            border: Border.all(
                                              color: Color(0xB0FF6700),
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(2.0),
                                            child: Container(
                                              width: 100.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor4,
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                                shape: BoxShape.rectangle,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  Text(
                                    '4 o más',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          fontSize: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.01659,
                                            14.0,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ].divide(SizedBox(
                                    width: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.01422,
                                  12.0,
                                ))),
                              ),
                            ),
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
                              0.0),
                          child: Text(
                            ' ¿Tiene personas a cargo menores de edad o adultos mayores?',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Satoshi',
                                  fontSize: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.01659,
                                    14.0,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.adultosAcargo = 'Si';
                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.05688,
                                    48.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: valueOrDefault<Color>(
                                        _model.adultosAcargo == 'Si'
                                            ? FlutterFlowTheme.of(context)
                                                .customColor4
                                            : FlutterFlowTheme.of(context)
                                                .customColor5,
                                        FlutterFlowTheme.of(context)
                                            .customColor5,
                                      ),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.01659,
                                          14.0,
                                        ),
                                        0.0,
                                        0.0,
                                        0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (_model.adultosAcargo != 'Si')
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model.adultosAcargo = 'Si';
                                                  safeSetState(() {});
                                                },
                                                child: Container(
                                                  width: 16.0,
                                                  height: 16.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                    border: Border.all(
                                                      color: Color(0xB2262632),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (_model.adultosAcargo == 'Si')
                                              Container(
                                                width: 16.0,
                                                height: 16.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                  border: Border.all(
                                                    color: Color(0xB0FF6700),
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(2.0),
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor4,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0),
                                                      shape: BoxShape.rectangle,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                        Text(
                                          'Si',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
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
                                      ].divide(SizedBox(
                                          width: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.01422,
                                        12.0,
                                      ))),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.adultosAcargo = 'No';
                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.05688,
                                    48.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: valueOrDefault<Color>(
                                        _model.adultosAcargo == 'No'
                                            ? FlutterFlowTheme.of(context)
                                                .customColor4
                                            : FlutterFlowTheme.of(context)
                                                .customColor5,
                                        FlutterFlowTheme.of(context)
                                            .customColor5,
                                      ),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.01659,
                                          14.0,
                                        ),
                                        0.0,
                                        0.0,
                                        0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (_model.adultosAcargo != 'No')
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model.adultosAcargo = 'No';
                                                  safeSetState(() {});
                                                },
                                                child: Container(
                                                  width: 16.0,
                                                  height: 16.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                    border: Border.all(
                                                      color: Color(0xB2262632),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (_model.adultosAcargo == 'No')
                                              Container(
                                                width: 16.0,
                                                height: 16.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                  border: Border.all(
                                                    color: Color(0xB0FF6700),
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(2.0),
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor4,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0),
                                                      shape: BoxShape.rectangle,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                        Text(
                                          'No',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
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
                                      ].divide(SizedBox(
                                          width: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.01422,
                                        12.0,
                                      ))),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(
                              width: valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.01422,
                            12.0,
                          ))),
                        ),
                      ].divide(SizedBox(
                          height: valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.01422,
                        12.0,
                      ))),
                    ),
                  ),
                  if ((_model.personasDependientes != null &&
                          _model.personasDependientes != '') &&
                      (_model.adultosAcargo != null &&
                          _model.adultosAcargo != ''))
                    Builder(
                      builder: (context) => Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0,
                            valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.06162,
                              52.0,
                            ),
                            20.0,
                            0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if ((_model.personasDependientes != null &&
                                    _model.personasDependientes != '') &&
                                (_model.adultosAcargo != null &&
                                    _model.adultosAcargo != '')) {
                              context.pushNamed(
                                Solicitarcrdito3Widget.routeName,
                                queryParameters: {
                                  'personasDependientes': serializeParam(
                                    _model.personasDependientes,
                                    ParamType.String,
                                  ),
                                  'adultosAcargo': serializeParam(
                                    _model.adultosAcargo,
                                    ParamType.String,
                                  ),
                                  'estadoCivil': serializeParam(
                                    widget!.estadoCivil,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
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
                                    alignment: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: GestureDetector(
                                      onTap: () {
                                        FocusScope.of(dialogContext).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: SucessMensajeErrorWidget(
                                        titulo: 'Error!',
                                        descripcion:
                                            'Debes completar la información faltante',
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
                            color: FlutterFlowTheme.of(context).customColor4,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Satoshi',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.01896,
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
            ],
          ),
        ),
      ),
    );
  }
}
