import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'perfil06_copy_view_model.dart';
export 'perfil06_copy_view_model.dart';

class Perfil06CopyViewWidget extends StatefulWidget {
  const Perfil06CopyViewWidget({
    super.key,
    required this.urlpdf,
    required this.nombre,
  });

  final String? urlpdf;
  final String? nombre;

  static String routeName = 'Perfil_06CopyView';
  static String routePath = '/perfil06VerificationDocv22';

  @override
  State<Perfil06CopyViewWidget> createState() => _Perfil06CopyViewWidgetState();
}

class _Perfil06CopyViewWidgetState extends State<Perfil06CopyViewWidget> {
  late Perfil06CopyViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Perfil06CopyViewModel());

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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    FlutterFlowTheme.of(context).fondo,
                    Color(0xFF002CE9)
                  ],
                  stops: [0.0, 1.0],
                  begin: AlignmentDirectional(0.0, -1.0),
                  end: AlignmentDirectional(0, 1.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 56.0, 24.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.safePop();
                      },
                      child: Container(
                        width: 32.0,
                        height: 32.0,
                        decoration: BoxDecoration(),
                        child: Icon(
                          Icons.arrow_back_sharp,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          size: 24.0,
                        ),
                      ),
                    ),
                    Container(
                      width: 239.0,
                      height: 60.0,
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          AutoSizeText(
                            valueOrDefault<String>(
                              widget!.nombre,
                              'PDF',
                            ),
                            textAlign: TextAlign.start,
                            maxLines: 2,
                            minFontSize: 14.0,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Satoshi',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ].divide(SizedBox(width: 12.0)),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: 100.0,
                decoration: BoxDecoration(),
                child: Container(
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FlutterFlowPdfViewer(
                            networkPath: widget!.urlpdf!,
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 600.0,
                            horizontalScroll: false,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 40.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await downloadFile(
                                  filename: valueOrDefault<String>(
                                    widget!.nombre,
                                    'archivo',
                                  ),
                                  url: widget!.urlpdf!,
                                );
                              },
                              text: 'Descargar',
                              icon: Icon(
                                Icons.sim_card_download_outlined,
                                size: 20.0,
                              ),
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 48.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconAlignment: IconAlignment.end,
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color:
                                    FlutterFlowTheme.of(context).customColor4,
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
                        ],
                      ),
                    ),
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
