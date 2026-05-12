import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'modal_copy_model.dart';
export 'modal_copy_model.dart';

class ModalCopyWidget extends StatefulWidget {
  const ModalCopyWidget({super.key});

  static String routeName = 'modalCopy';
  static String routePath = '/modalCopy';

  @override
  State<ModalCopyWidget> createState() => _ModalCopyWidgetState();
}

class _ModalCopyWidgetState extends State<ModalCopyWidget> {
  late ModalCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModalCopyModel());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 200.0, 0.0, 0.0),
                      child: Image.asset(
                        'assets/images/borrar-cuenta.gif',
                        width: 100.0,
                        height: 100.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 0.0),
                      child: Text(
                        '¡Tú cuenta ha sido eliminada!',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'Satoshi',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Text(
                      'Puedes agregar o eliminar las que quieras.',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Satoshi',
                            color: Color(0xB2262632),
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 56.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          text: 'Aceptar\n',
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 48.0,
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
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 16.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
