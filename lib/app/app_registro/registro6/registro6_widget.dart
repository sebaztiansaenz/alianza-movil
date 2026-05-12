import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'registro6_model.dart';
export 'registro6_model.dart';

class Registro6Widget extends StatefulWidget {
  const Registro6Widget({super.key});

  static String routeName = 'REGISTRO6';
  static String routePath = '/registro6';

  @override
  State<Registro6Widget> createState() => _Registro6WidgetState();
}

class _Registro6WidgetState extends State<Registro6Widget> {
  late Registro6Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Registro6Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {});

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
      child: PopScope(
        canPop: false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondary,
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF006AD8), Color(0xFF002CE9)],
                stops: [0.0, 0.8],
                begin: AlignmentDirectional(0.0, -1.0),
                end: AlignmentDirectional(0, 1.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0.0,
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.02370,
                        20.0,
                      ),
                      0.0,
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.02370,
                        20.0,
                      )),
                  child: SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/people.png',
                            width: double.infinity,
                            fit: BoxFit.cover,
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.asset(
                              'assets/images/alianxa_logo.png',
                              width: valueOrDefault<double>(
                                MediaQuery.sizeOf(context).width * 0.44103,
                                172.0,
                              ),
                              height: valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.05095,
                                43.0,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: AutoSizeText(
                            '“Con Alianza, el futuro es ahorra”',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Satoshi',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  fontSize: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.01422,
                                    12.0,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w300,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0,
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.05095,
                                43.0,
                              ),
                              0.0,
                              0.0),
                          child: AutoSizeText(
                            '¡Te damos la bienvenida!',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Satoshi',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  fontSize: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.02844,
                                    24.0,
                                  ),
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              30.0, 36.0, 30.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              GoRouter.of(context).prepareAuthEvent();
                              await authManager.signOut();
                              GoRouter.of(context).clearRedirectLocation();

                              context.pushNamedAuth(
                                LoginPagenewWidget.routeName,
                                context.mounted,
                                extra: <String, dynamic>{
                                  '__transition_info__': TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.bottomToTop,
                                    duration: Duration(milliseconds: 300),
                                  ),
                                },
                              );
                            },
                            text: 'Comenzar',
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
                                      MediaQuery.sizeOf(context).height *
                                          0.01896,
                                      16.0,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(12.0),
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
    );
  }
}
