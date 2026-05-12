import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'menu_arriba_model.dart';
export 'menu_arriba_model.dart';

class MenuArribaWidget extends StatefulWidget {
  const MenuArribaWidget({
    super.key,
    bool? black,
    required this.text,
  }) : this.black = black ?? false;

  final bool black;
  final String? text;

  @override
  State<MenuArribaWidget> createState() => _MenuArribaWidgetState();
}

class _MenuArribaWidgetState extends State<MenuArribaWidget> {
  late MenuArribaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuArribaModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10.0, 54.0, 20.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: valueOrDefault<double>(
                  MediaQuery.sizeOf(context).width * 0.12821,
                  50.0,
                ),
                height: valueOrDefault<double>(
                  MediaQuery.sizeOf(context).height * 0.05925,
                  50.0,
                ),
                decoration: BoxDecoration(),
                child: FlutterFlowIconButton(
                  borderRadius: 8.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.arrow_back_sharp,
                    color: widget!.black
                        ? FlutterFlowTheme.of(context).primaryText
                        : FlutterFlowTheme.of(context).secondaryBackground,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    context.pushNamed(HomeNew2Widget.routeName);
                  },
                ),
              ),
              AutoSizeText(
                valueOrDefault<String>(
                  widget!.text,
                  'text',
                ),
                textAlign: TextAlign.start,
                maxLines: 1,
                minFontSize: 14.0,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Satoshi',
                      color: widget!.black
                          ? FlutterFlowTheme.of(context).primaryText
                          : FlutterFlowTheme.of(context).secondaryBackground,
                      fontSize: valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.02133,
                        18.0,
                      ),
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.network(
                valueOrDefault<String>(
                  widget!.black
                      ? 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/ja0dqauprga3/Frame_(33).png'
                      : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/p2nffehf1b86/Frame_(19).png',
                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/p2nffehf1b86/Frame_(19).png',
                ),
                width: valueOrDefault<double>(
                  MediaQuery.sizeOf(context).width * 0.06154,
                  24.0,
                ),
                height: valueOrDefault<double>(
                  MediaQuery.sizeOf(context).height * 0.02844,
                  24.0,
                ),
                fit: BoxFit.cover,
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(AyudaWidget.routeName);
                },
                child: Image.network(
                  valueOrDefault<String>(
                    widget!.black
                        ? 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/2koptfl6p0my/Frame_(34).png'
                        : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/ud12f60t7869/Frame_(20).png',
                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/ud12f60t7869/Frame_(20).png',
                  ),
                  width: valueOrDefault<double>(
                    MediaQuery.sizeOf(context).width * 0.06154,
                    24.0,
                  ),
                  height: valueOrDefault<double>(
                    MediaQuery.sizeOf(context).height * 0.02844,
                    24.0,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  GoRouter.of(context).prepareAuthEvent();
                  await authManager.signOut();
                  GoRouter.of(context).clearRedirectLocation();

                  context.goNamedAuth(
                      OnboardingAppMovilWidget.routeName, context.mounted);
                },
                child: Image.network(
                  valueOrDefault<String>(
                    widget!.black
                        ? 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/1m9fv2spqdd5/Frame_(35).png'
                        : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/ku3oqwik4ziu/Frame_(21).png',
                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/ku3oqwik4ziu/Frame_(21).png',
                  ),
                  width: valueOrDefault<double>(
                    MediaQuery.sizeOf(context).width * 0.06154,
                    24.0,
                  ),
                  height: valueOrDefault<double>(
                    MediaQuery.sizeOf(context).height * 0.02844,
                    24.0,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ].divide(SizedBox(width: 16.0)),
          ),
        ],
      ),
    );
  }
}
