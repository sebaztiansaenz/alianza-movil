import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'menu_new_model.dart';
export 'menu_new_model.dart';

class MenuNewWidget extends StatefulWidget {
  const MenuNewWidget({super.key});

  @override
  State<MenuNewWidget> createState() => _MenuNewWidgetState();
}

class _MenuNewWidgetState extends State<MenuNewWidget> {
  late MenuNewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuNewModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: 80.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        CardWidget.routeName,
                        extra: <String, dynamic>{
                          '__transition_info__': TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.rightToLeft,
                            duration: Duration(milliseconds: 300),
                          ),
                        },
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: Image.asset(
                            'assets/images/Group_(20).png',
                            width: 40.0,
                            height: 32.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Text(
                          'Tarjetas',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Satoshi',
                                    color: Color(0xFF0B35B8),
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ].divide(SizedBox(height: 4.0)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 44.0,
                child: VerticalDivider(
                  width: 8.0,
                  thickness: 1.8,
                  color: FlutterFlowTheme.of(context).customColor5,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                  child: InkWell(
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
                            transitionType: PageTransitionType.rightToLeft,
                            duration: Duration(milliseconds: 300),
                          ),
                        },
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: Image.asset(
                            'assets/images/4675Xx.tif.png',
                            width: 40.0,
                            height: 32.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Text(
                          'Convenios',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Satoshi',
                                    color: Color(0xFF0B35B8),
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ].divide(SizedBox(height: 4.0)),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.goNamed(
                      HomeNewWidget.routeName,
                      extra: <String, dynamic>{
                        '__transition_info__': TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 500),
                        ),
                      },
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.asset(
                      'assets/images/Group_67.png',
                      width: 68.0,
                      height: 62.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                  child: InkWell(
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
                            transitionType: PageTransitionType.rightToLeft,
                            duration: Duration(milliseconds: 300),
                          ),
                        },
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/Group_(19).png',
                            width: 32.0,
                            height: 32.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Text(
                          'Ayuda',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Satoshi',
                                    color: Color(0xFF0B35B8),
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ].divide(SizedBox(height: 4.0)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 44.0,
                child: VerticalDivider(
                  width: 8.0,
                  thickness: 1.8,
                  color: FlutterFlowTheme.of(context).customColor5,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                  child: InkWell(
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
                            transitionType: PageTransitionType.rightToLeft,
                            duration: Duration(milliseconds: 300),
                          ),
                        },
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: Image.asset(
                            'assets/images/Group_(18).png',
                            width: 32.0,
                            height: 32.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Text(
                          'Mi Perfil',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Satoshi',
                                    color: Color(0xFF0B35B8),
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ].divide(SizedBox(height: 4.0)),
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
