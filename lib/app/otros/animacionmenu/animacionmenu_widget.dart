import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'animacionmenu_model.dart';
export 'animacionmenu_model.dart';

class AnimacionmenuWidget extends StatefulWidget {
  const AnimacionmenuWidget({super.key});

  @override
  State<AnimacionmenuWidget> createState() => _AnimacionmenuWidgetState();
}

class _AnimacionmenuWidgetState extends State<AnimacionmenuWidget>
    with TickerProviderStateMixin {
  late AnimacionmenuModel _model;

  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;
  var hasContainerTriggered1 = false;
  var hasContainerTriggered2 = false;
  var hasContainerTriggered3 = false;
  var hasContainerTriggered4 = false;
  var hasContainerTriggered5 = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnimacionmenuModel());

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        safeSetState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    animationsMap.addAll({
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: null,
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: null,
      ),
      'containerOnActionTriggerAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(72.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 10.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, -1.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: Offset(1.012, 0),
            end: Offset(0, 0.349),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(-72.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 10.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, -1.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: (isWeb
              ? MediaQuery.viewInsetsOf(context).bottom > 0
              : _isKeyboardVisible) ==
          false,
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).height * 1.0,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5.0,
                  sigmaY: 5.0,
                ),
                child: Visibility(
                  visible: _model.abierto,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      _model.abierto = false;
                      safeSetState(() {});
                    },
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      decoration: BoxDecoration(),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: SafeArea(
                child: Container(
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (_model.abierto)
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  ConveniosWidget.routeName,
                                  extra: <String, dynamic>{
                                    '__transition_info__': TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.rightToLeft,
                                      duration: Duration(milliseconds: 300),
                                    ),
                                  },
                                );
                              },
                              child: Container(
                                width: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).width * 0.24872,
                                  97.0,
                                ),
                                height: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.11848,
                                  100.0,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(
                                    color: Color(0x1A002CE9),
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0,
                                      valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.02370,
                                        20.0,
                                      ),
                                      0.0,
                                      valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.02370,
                                        20.0,
                                      )),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.asset(
                                          'assets/images/Frame_(64).png',
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
                                      AutoSizeText(
                                        'Convenios',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              fontSize: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .height *
                                                    0.01659,
                                                14.0,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ).animateOnActionTrigger(
                              animationsMap[
                                  'containerOnActionTriggerAnimation1']!,
                              hasBeenTriggered: hasContainerTriggered1,
                              effects: [
                                MoveEffect(
                                  curve: Curves.easeInOut,
                                  delay: 0.0.ms,
                                  duration: 400.0.ms,
                                  begin: Offset(100.0, 600),
                                  end: Offset(0.0, 0.0),
                                ),
                                ScaleEffect(
                                  curve: Curves.easeInOut,
                                  delay: 0.0.ms,
                                  duration: 400.0.ms,
                                  begin: Offset(-2.0, 1.0),
                                  end: Offset(1.0, 1.0),
                                ),
                                FadeEffect(
                                  curve: Curves.easeInOut,
                                  delay: 0.0.ms,
                                  duration: 400.0.ms,
                                  begin: 0.0,
                                  end: 1.0,
                                ),
                              ],
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  AyudaWidget.routeName,
                                  extra: <String, dynamic>{
                                    '__transition_info__': TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.rightToLeft,
                                      duration: Duration(milliseconds: 300),
                                    ),
                                  },
                                );
                              },
                              child: Container(
                                width: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).width * 0.24872,
                                  97.0,
                                ),
                                height: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.11848,
                                  100.0,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(
                                    color: Color(0x1A002CE9),
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0,
                                      valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.02370,
                                        20.0,
                                      ),
                                      0.0,
                                      valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.02370,
                                        20.0,
                                      )),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.asset(
                                          'assets/images/Frame_(65).png',
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
                                      AutoSizeText(
                                        'Ayuda',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              fontSize: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .height *
                                                    0.01659,
                                                14.0,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ).animateOnActionTrigger(
                              animationsMap[
                                  'containerOnActionTriggerAnimation2']!,
                              hasBeenTriggered: hasContainerTriggered2,
                              effects: [
                                MoveEffect(
                                  curve: Curves.easeInOut,
                                  delay: 0.0.ms,
                                  duration: 400.0.ms,
                                  begin: Offset(-1000, 600),
                                  end: Offset(0.0, 0.0),
                                ),
                                ScaleEffect(
                                  curve: Curves.easeInOut,
                                  delay: 0.0.ms,
                                  duration: 400.0.ms,
                                  begin: Offset(-2.0, 1.0),
                                  end: Offset(1.0, 1.0),
                                ),
                                FadeEffect(
                                  curve: Curves.easeInOut,
                                  delay: 0.0.ms,
                                  duration: 400.0.ms,
                                  begin: 0.0,
                                  end: 1.0,
                                ),
                              ],
                            ),
                          ].divide(SizedBox(width: 12.0)),
                        ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0,
                            valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.01659,
                              14.0,
                            ),
                            0.0,
                            0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (_model.abierto)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    HomeNew2Widget.routeName,
                                    extra: <String, dynamic>{
                                      '__transition_info__': TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );
                                },
                                child: Container(
                                  width: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).width * 0.24872,
                                    97.0,
                                  ),
                                  height: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.11848,
                                    100.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(16.0),
                                    border: Border.all(
                                      color: Color(0x1A002CE9),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0,
                                        valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.02370,
                                          20.0,
                                        ),
                                        0.0,
                                        valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.02370,
                                          20.0,
                                        )),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: Image.asset(
                                            'assets/images/Frame_(66).png',
                                            width: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context).width *
                                                  0.09231,
                                              36.0,
                                            ),
                                            height: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.04266,
                                              36.0,
                                            ),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        AutoSizeText(
                                          'Inicio',
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
                                      ],
                                    ),
                                  ),
                                ),
                              ).animateOnActionTrigger(
                                  animationsMap[
                                      'containerOnActionTriggerAnimation3']!,
                                  hasBeenTriggered: hasContainerTriggered3),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 60.0, 0.0, 0.0),
                              child: Stack(
                                children: [
                                  if (_model.abierto)
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        _model.abierto = false;
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).width *
                                              0.17436,
                                          68.0,
                                        ),
                                        height: 68.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF002CE9),
                                          borderRadius:
                                              BorderRadius.circular(90.0),
                                        ),
                                        child: Icon(
                                          Icons.close_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          size: 32.0,
                                        ),
                                      ),
                                    ).animateOnActionTrigger(
                                        animationsMap[
                                            'containerOnActionTriggerAnimation4']!,
                                        hasBeenTriggered:
                                            hasContainerTriggered4),
                                  if (!_model.abierto)
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 28.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await Future.wait([
                                              Future(() async {
                                                if (animationsMap[
                                                        'containerOnActionTriggerAnimation1'] !=
                                                    null) {
                                                  safeSetState(() =>
                                                      hasContainerTriggered1 =
                                                          true);
                                                  SchedulerBinding.instance
                                                      .addPostFrameCallback(
                                                          (_) async =>
                                                              await animationsMap[
                                                                      'containerOnActionTriggerAnimation1']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0));
                                                }
                                              }),
                                              Future(() async {
                                                if (animationsMap[
                                                        'containerOnActionTriggerAnimation2'] !=
                                                    null) {
                                                  safeSetState(() =>
                                                      hasContainerTriggered2 =
                                                          true);
                                                  SchedulerBinding.instance
                                                      .addPostFrameCallback(
                                                          (_) async =>
                                                              await animationsMap[
                                                                      'containerOnActionTriggerAnimation2']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0));
                                                }
                                              }),
                                              Future(() async {
                                                if (animationsMap[
                                                        'containerOnActionTriggerAnimation3'] !=
                                                    null) {
                                                  safeSetState(() =>
                                                      hasContainerTriggered3 =
                                                          true);
                                                  SchedulerBinding.instance
                                                      .addPostFrameCallback(
                                                          (_) async =>
                                                              await animationsMap[
                                                                      'containerOnActionTriggerAnimation3']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0));
                                                }
                                              }),
                                              Future(() async {
                                                if (animationsMap[
                                                        'containerOnActionTriggerAnimation5'] !=
                                                    null) {
                                                  safeSetState(() =>
                                                      hasContainerTriggered5 =
                                                          true);
                                                  SchedulerBinding.instance
                                                      .addPostFrameCallback(
                                                          (_) async =>
                                                              await animationsMap[
                                                                      'containerOnActionTriggerAnimation5']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0));
                                                }
                                              }),
                                              Future(() async {
                                                _model.abierto = true;
                                                safeSetState(() {});
                                              }),
                                              Future(() async {
                                                if (animationsMap[
                                                        'containerOnActionTriggerAnimation4'] !=
                                                    null) {
                                                  safeSetState(() =>
                                                      hasContainerTriggered4 =
                                                          true);
                                                  SchedulerBinding.instance
                                                      .addPostFrameCallback(
                                                          (_) async =>
                                                              await animationsMap[
                                                                      'containerOnActionTriggerAnimation4']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0));
                                                }
                                              }),
                                            ]);
                                          },
                                          child: Container(
                                            width: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context).width *
                                                  0.17436,
                                              68.0,
                                            ),
                                            height: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.08058,
                                              68.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              border: Border.all(
                                                color: Color(0xFFEEF1FA),
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Image.asset(
                                                'assets/images/Logo_Alianza_(1).png',
                                                width: valueOrDefault<double>(
                                                  MediaQuery.sizeOf(context)
                                                          .width *
                                                      0.13333,
                                                  52.0,
                                                ),
                                                height: valueOrDefault<double>(
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.05688,
                                                  48.0,
                                                ),
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            if (_model.abierto)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    Perfil01Widget.routeName,
                                    extra: <String, dynamic>{
                                      '__transition_info__': TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.rightToLeft,
                                        duration: Duration(milliseconds: 300),
                                      ),
                                    },
                                  );
                                },
                                child: Container(
                                  width: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).width * 0.24872,
                                    97.0,
                                  ),
                                  height: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.11848,
                                    100.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(16.0),
                                    border: Border.all(
                                      color: Color(0x1A002CE9),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0,
                                        valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.02370,
                                          20.0,
                                        ),
                                        0.0,
                                        valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.02370,
                                          20.0,
                                        )),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: Image.asset(
                                            'assets/images/Vector_(62).png',
                                            width: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context).width *
                                                  0.09231,
                                              36.0,
                                            ),
                                            height: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.04266,
                                              36.0,
                                            ),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        AutoSizeText(
                                          'Mi perfil',
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
                                      ],
                                    ),
                                  ),
                                ),
                              ).animateOnActionTrigger(
                                  animationsMap[
                                      'containerOnActionTriggerAnimation5']!,
                                  hasBeenTriggered: hasContainerTriggered5),
                          ].divide(SizedBox(width: 20.0)),
                        ),
                      ),
                    ],
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
