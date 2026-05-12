import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'version_copy2_model.dart';
export 'version_copy2_model.dart';

class VersionCopy2Widget extends StatefulWidget {
  const VersionCopy2Widget({
    super.key,
    required this.inversion,
    required this.tiempo,
    required this.ea,
    required this.cdatahorro,
    required this.ahorro,
    required this.lista,
  });

  final double? inversion;
  final String? tiempo;
  final double? ea;
  final List<RetiroscdatStruct>? cdatahorro;
  final DocumentReference? ahorro;
  final int? lista;

  static String routeName = 'versionCopy2';
  static String routePath = '/versionCopy2';

  @override
  State<VersionCopy2Widget> createState() => _VersionCopy2WidgetState();
}

class _VersionCopy2WidgetState extends State<VersionCopy2Widget> {
  late VersionCopy2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VersionCopy2Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().lastAction = getCurrentTimestamp;
      safeSetState(() {});
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 10000),
        callback: (timer) async {
          if (functions.past5Mins(FFAppState().lastAction!)) {
            GoRouter.of(context).prepareAuthEvent();
            await authManager.signOut();
            GoRouter.of(context).clearRedirectLocation();

            context.goNamedAuth(
                CierredeSesionWidget.routeName, context.mounted);

            _model.instantTimer?.cancel();
          }
        },
        startImmediately: false,
      );
    });

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
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 137.0, 20.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: Image.network(
                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/b7hsxts59jtp/46ee52ef56314585beb7b7ff1e88e8e0959ef90c_(1).gif',
                          width: 250.0,
                          height: 250.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Text(
                        'A partir de ahora aperturaras tu \nCDAT con el saldo de mis ahorros',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Satoshi',
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Text(
                        'Recuerda que una vez aperturado, tu saldo ya no aparecerá en ahorros, si no en Inversiones.',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Satoshi',
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Theme(
                            data: ThemeData(
                              checkboxTheme: CheckboxThemeData(
                                visualDensity: VisualDensity.compact,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              unselectedWidgetColor:
                                  FlutterFlowTheme.of(context).alternate,
                            ),
                            child: Checkbox(
                              value: _model.checkboxValue ??= false,
                              onChanged: (newValue) async {
                                safeSetState(
                                    () => _model.checkboxValue = newValue!);
                              },
                              side: (FlutterFlowTheme.of(context).alternate !=
                                      null)
                                  ? BorderSide(
                                      width: 2,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate!,
                                    )
                                  : null,
                              activeColor:
                                  FlutterFlowTheme.of(context).customColor4,
                              checkColor:
                                  FlutterFlowTheme.of(context).customColor5,
                            ),
                          ),
                          Text(
                            'Si, entendido',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Satoshi',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ].divide(SizedBox(width: 12.0)),
                      ),
                    ),
                    if (_model.checkboxValue == true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 32.0, 0.0, 55.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  context.safePop();
                                },
                                text: 'Cancelar',
                                options: FFButtonOptions(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 48.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Satoshi',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .customColor5,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  context.pushNamed(
                                    AHORROScdat2CopyCopyCopyCopyWidget
                                        .routeName,
                                    queryParameters: {
                                      'inversion': serializeParam(
                                        widget!.inversion,
                                        ParamType.double,
                                      ),
                                      'tiempo': serializeParam(
                                        widget!.tiempo,
                                        ParamType.String,
                                      ),
                                      'ea': serializeParam(
                                        widget!.ea,
                                        ParamType.double,
                                      ),
                                      'cdatahorro': serializeParam(
                                        widget!.cdatahorro,
                                        ParamType.DataStruct,
                                        isList: true,
                                      ),
                                      'ahorro': serializeParam(
                                        widget!.ahorro,
                                        ParamType.DocumentReference,
                                      ),
                                      'lista': serializeParam(
                                        widget!.lista,
                                        ParamType.int,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                text: 'Aperturar CDAT',
                                options: FFButtonOptions(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 48.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFFFF6700),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Satoshi',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 12.0)),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
