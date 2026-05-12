import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'verification_success_model.dart';
export 'verification_success_model.dart';

class VerificationSuccessWidget extends StatefulWidget {
  const VerificationSuccessWidget({super.key});

  static String routeName = 'VerificationSuccess';
  static String routePath = '/verificationSuccess';

  @override
  State<VerificationSuccessWidget> createState() =>
      _VerificationSuccessWidgetState();
}

class _VerificationSuccessWidgetState extends State<VerificationSuccessWidget> {
  late VerificationSuccessModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerificationSuccessModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.ciudad = await actions.getJson(
        'https://opensheet.elk.sh/1VMxcLvCSOE0czms4r-mcd4HYsFneFx0lN6GZ2__hqoU/CIUDADES',
      );
      FFAppState().gsheets = getJsonField(
        _model.ciudad,
        r'''$''',
      );
      safeSetState(() {});
      _model.load = true;
      safeSetState(() {});
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
        backgroundColor: FlutterFlowTheme.of(context).secondary,
        body: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.network(
                '',
              ).image,
            ),
          ),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            child: Stack(
              children: [
                FlutterFlowVideoPlayer(
                  path:
                      'assets/videos/Brown_and_Red_Elegant_Minimalist_Fashion_Coming_Soon_Mobile_Video.mp4',
                  videoType: VideoType.asset,
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  autoPlay: true,
                  looping: true,
                  showControls: false,
                  allowFullScreen: false,
                  allowPlaybackSpeedMenu: false,
                  pauseOnNavigate: false,
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 80.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        _model.cuenta = await queryAhorrosRecordCount(
                          queryBuilder: (ahorrosRecord) => ahorrosRecord
                              .where(
                                'user',
                                isEqualTo: currentUserReference,
                              )
                              .where(
                                'AhorrosDocPdf1',
                                isNotEqualTo: '',
                              ),
                        );
                        if (_model.cuenta! >= 1) {
                          context.goNamed(
                            HomeNew2Widget.routeName,
                            extra: <String, dynamic>{
                              '__transition_info__': TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        } else {
                          context.goNamed(Aperturaahorro1Widget.routeName);
                        }

                        safeSetState(() {});
                      },
                      text: 'Comenzar',
                      options: FFButtonOptions(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 48.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).customColor4,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
