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
import 'mensajedeconfirmacin_model.dart';
export 'mensajedeconfirmacin_model.dart';

class MensajedeconfirmacinWidget extends StatefulWidget {
  const MensajedeconfirmacinWidget({super.key});

  static String routeName = 'MENSAJEDECONFIRMACIN';
  static String routePath = '/mensajedeconfirmacin';

  @override
  State<MensajedeconfirmacinWidget> createState() =>
      _MensajedeconfirmacinWidgetState();
}

class _MensajedeconfirmacinWidgetState
    extends State<MensajedeconfirmacinWidget> {
  late MensajedeconfirmacinModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MensajedeconfirmacinModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          await Future.delayed(
            Duration(
              milliseconds: 10000,
            ),
          );

          context.pushNamedAuth(
            InvertirahorrosCopyCopyWidget.routeName,
            context.mounted,
            extra: <String, dynamic>{
              '__transition_info__': TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.rightToLeft,
              ),
            },
          );
        }),
        Future(() async {
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
        }),
      ]);
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
              width: MediaQuery.sizeOf(context).width * 1.0,
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
                        'assets/images/3fcbab0db31231fa11019c5a15ded09e7fe188ff.gif',
                        width: 100.0,
                        height: 100.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                      child: Text(
                        '¡Tú solicitud está En estudio!',
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
