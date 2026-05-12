import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home1new_model.dart';
export 'home1new_model.dart';

class Home1newWidget extends StatefulWidget {
  const Home1newWidget({super.key});

  static String routeName = 'home1new';
  static String routePath = '/home1new';

  @override
  State<Home1newWidget> createState() => _Home1newWidgetState();
}

class _Home1newWidgetState extends State<Home1newWidget> {
  late Home1newModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Home1newModel());

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
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 56.5, 20.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 24.0,
                        height: valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.02844,
                          24.0,
                        ),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
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
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ),
                      ),
                      Text(
                        'Activación llave',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Satoshi',
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ].divide(SizedBox(width: 8.0)),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 42.0,
                        height: valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.04977,
                          42.0,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0x1A57636C),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/Frame_(2).png',
                            ).image,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ].divide(SizedBox(width: 6.0)),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.5, 0.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Image.asset(
                    'assets/images/Group_132.png',
                    width: 60.0,
                    height: 18.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 16.0),
                child: Text(
                  'Para poder empezar, necesitas\nactivar tu llave.',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Satoshi',
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cuenta asociada',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Satoshi',
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 25.0,
                            color: Color(0x0D00000D),
                            offset: Offset(
                              0.0,
                              12.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(16.0),
                        border: Border.all(
                          color: Color(0xFFEEF1FA),
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  14.0, 14.41, 0.0, 14.41),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 8.0, 0.0),
                                        child: Icon(
                                          FFIcons.kpiggyBank,
                                          color: Color(0xFF002CE9),
                                          size: 24.0,
                                        ),
                                      ),
                                      Text(
                                        'Línea de ahorro Nomina',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              color: Color(0xFF002CE9),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '#1118123413-01',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ].divide(SizedBox(height: 6.0)),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(1.0, -1.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(1.0, -1.0),
                                    child: Container(
                                      width: 58.0,
                                      height: 24.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFF6700),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(16.0),
                                          bottomLeft: Radius.circular(16.0),
                                        ),
                                      ),
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              '9% E.A',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Satoshi',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    fontSize: 11.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
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
                          ],
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 15.0)),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
                child: Icon(
                  Icons.keyboard_double_arrow_down_outlined,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tú número de celular ',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Satoshi',
                          letterSpacing: 0.0,
                        ),
                  ),
                  Text(
                    '+',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Satoshi',
                          color: Color(0xFFFF6700),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Text(
                    ' 01.',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Satoshi',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 52.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 25.0,
                        color: Color(0x0D00000D),
                        offset: Offset(
                          0.0,
                          12.0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(
                      color: Color(0xFFEEF1FA),
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(14.0, 14.0, 14.0, 14.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 48.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: Color(0x1A57636C),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 12.0, 12.0, 12.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/Frame.png',
                                width: 24.0,
                                height: 24.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 0.0),
                              child: Text(
                                '313672899101',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Satoshi',
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
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
                            if (_model.cuentaahorro == 0) {
                              _model.cuentaahorro = 1;
                              safeSetState(() {});
                            } else {
                              _model.cuentaahorro = 0;
                              safeSetState(() {});
                            }
                          },
                          child: Container(
                            width: 24.0,
                            height: 24.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(43.0),
                              border: Border.all(
                                color: _model.cuentaahorro == 1
                                    ? Color(0xFFFF6700)
                                    : Colors.black,
                              ),
                            ),
                            child: Visibility(
                              visible: _model.cuentaahorro == 1,
                              child: Icon(
                                Icons.circle_rounded,
                                color: Color(0xFFFF6700),
                                size: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              FFButtonWidget(
                onPressed: (_model.cuentaahorro == 0)
                    ? null
                    : () async {
                        context.pushNamed(Home2newWidget.routeName);
                      },
                text: 'Activar mi llave',
                options: FFButtonOptions(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 48.0,
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0xFFFF6700),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Satoshi',
                        color: Colors.white,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(8.0),
                  disabledColor: Color(0x7FFF6700),
                ),
              ),
              Flexible(
                child: Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 46.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/Logo_Alianza_(1).png',
                        width: 68.0,
                        height: 68.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
