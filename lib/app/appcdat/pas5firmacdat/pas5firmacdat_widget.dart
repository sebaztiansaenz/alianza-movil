import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pas5firmacdat_model.dart';
export 'pas5firmacdat_model.dart';

class Pas5firmacdatWidget extends StatefulWidget {
  const Pas5firmacdatWidget({super.key});

  static String routeName = 'pas5firmacdat';
  static String routePath = '/pas5firmacdat';

  @override
  State<Pas5firmacdatWidget> createState() => _Pas5firmacdatWidgetState();
}

class _Pas5firmacdatWidgetState extends State<Pas5firmacdatWidget>
    with TickerProviderStateMixin {
  late Pas5firmacdatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Pas5firmacdatModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResulthr4 = await GetDocumentDetailsCall.call(
        token: FFAppState().appstateCDAT,
      );

      if ((_model.apiResulthr4?.succeeded ?? true)) {
        if (GetDocumentDetailsCall.signedFile(
              (_model.apiResulthr4?.jsonBody ?? ''),
            ) !=
            null) {
          await Future.delayed(
            Duration(
              milliseconds: 3000,
            ),
          );

          context.pushNamed(
            ModalCopyCopy4Widget.routeName,
            extra: <String, dynamic>{
              '__transition_info__': TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.topToBottom,
                duration: Duration(milliseconds: 500),
              ),
            },
          );
        } else {
          await Future.delayed(
            Duration(
              milliseconds: 3000,
            ),
          );

          context.pushNamed(
            ModalCopyCopy4Widget.routeName,
            extra: <String, dynamic>{
              '__transition_info__': TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.topToBottom,
                duration: Duration(milliseconds: 500),
              ),
            },
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              GetDocumentDetailsCall.errorMessage(
                (_model.apiResulthr4?.jsonBody ?? ''),
              )!,
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      }
    });

    animationsMap.addAll({
      'iconOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 4.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 8.0, 0.0),
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
                                        30.0, 0.0, 12.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/phone.png',
                                        height: 30.0,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: AutoSizeText(
                                    'FIRMA ELECTRÓNICA',
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 10.0),
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
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(),
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
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      size: 24.0,
                                    ),
                                  ),
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 72.0, 0.0, 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Image.asset(
                  'assets/images/image_2075_(1).png',
                  width: 191.0,
                  height: 191.0,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 56.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    'Reconectando',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Satoshi',
                          letterSpacing: 0.0,
                        ),
                  ),
                  FaIcon(
                    FontAwesomeIcons.circleNotch,
                    color: FlutterFlowTheme.of(context).customColor4,
                    size: 24.0,
                  ).animateOnPageLoad(
                      animationsMap['iconOnPageLoadAnimation']!),
                ].divide(SizedBox(width: 12.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
