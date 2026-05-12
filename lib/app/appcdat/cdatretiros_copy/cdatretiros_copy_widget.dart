import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cdatretiros_copy_model.dart';
export 'cdatretiros_copy_model.dart';

class CdatretirosCopyWidget extends StatefulWidget {
  const CdatretirosCopyWidget({
    super.key,
    this.cdatsss,
  });

  final CdatsRecord? cdatsss;

  @override
  State<CdatretirosCopyWidget> createState() => _CdatretirosCopyWidgetState();
}

class _CdatretirosCopyWidgetState extends State<CdatretirosCopyWidget> {
  late CdatretirosCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CdatretirosCopyModel());

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
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: Container(
                  width: 32.0,
                  height: 4.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).customColor5,
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 28.0, 0.0, 0.0),
                child: Image.asset(
                  'assets/images/Frame_98_(1).png',
                  width: 36.0,
                  height: 33.0,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: AutoSizeText(
                  'Método para Transferir',
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  minFontSize: 16.0,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Satoshi',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 60.0),
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(context);

                        context.pushNamed(
                          RETIRO2CopyWidget.routeName,
                          queryParameters: {
                            'cdat': serializeParam(
                              widget!.cdatsss,
                              ParamType.Document,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            'cdat': widget!.cdatsss,
                            '__transition_info__': TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.rightToLeft,
                              duration: Duration(milliseconds: 300),
                            ),
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).customColor5,
                            width: 1.0,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      14.0, 14.0, 0.0, 14.0),
                                  child: Container(
                                    width: 48.0,
                                    height: 48.0,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: Image.network(
                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/euoqy4ooujvv/Frame_2085662547_(4).png',
                                        ).image,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8.0),
                                        bottomLeft: Radius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AutoSizeText(
                                        'Transferencia bancaria',
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        minFontSize: 12.0,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      AutoSizeText(
                                        'Banco y billeteras 1-3 diás hábiles.',
                                        textAlign: TextAlign.start,
                                        maxLines: 2,
                                        minFontSize: 8.0,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(1.0, -1.0),
                                    child: Image.network(
                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/zb1msd64dvpg/Frame_2085662540_(13).png',
                                      width: 50.0,
                                      height: 22.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 14.0, 0.0),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Color(0xC1262632),
                                      size: 22.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: 0.5,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).customColor5,
                            width: 1.0,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      14.0, 14.0, 0.0, 14.0),
                                  child: Container(
                                    width: 48.0,
                                    height: 48.0,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: Image.network(
                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/fltoxtdqackq/Frame_2085662547_(6).png',
                                        ).image,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8.0),
                                        bottomLeft: Radius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AutoSizeText(
                                        'Entre mis cuentas',
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        minFontSize: 12.0,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      AutoSizeText(
                                        'A cualquier banco y billeteras.',
                                        textAlign: TextAlign.start,
                                        maxLines: 2,
                                        minFontSize: 8.0,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(1.0, -1.0),
                                        child: Image.asset(
                                          'assets/images/path250.png',
                                          width: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width *
                                                0.28205,
                                            110.0,
                                          ),
                                          height: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.02370,
                                            20.0,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 14.0, 0.0),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Color(0xC1262632),
                                          size: 22.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.62, -0.83),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 4.0, 0.0, 0.0),
                                    child: Text(
                                      'PRÓXIMAMENTE',
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.01185,
                                              10.0,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 16.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
