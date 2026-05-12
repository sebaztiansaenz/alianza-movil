import '/app/otros/animacionmenu/animacionmenu_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'comprobantescdat_model.dart';
export 'comprobantescdat_model.dart';

class ComprobantescdatWidget extends StatefulWidget {
  const ComprobantescdatWidget({
    super.key,
    required this.cdats,
  });

  final DocumentReference? cdats;

  static String routeName = 'comprobantescdat';
  static String routePath = '/comprobantescdat';

  @override
  State<ComprobantescdatWidget> createState() => _ComprobantescdatWidgetState();
}

class _ComprobantescdatWidgetState extends State<ComprobantescdatWidget> {
  late ComprobantescdatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComprobantescdatModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CdatsRecord>(
      stream: CdatsRecord.getDocument(widget!.cdats!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }

        final comprobantescdatCdatsRecord = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Stack(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 60.0, 0.0, 4.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 18.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
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
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.safePop();
                                              },
                                              child: Icon(
                                                Icons.arrow_back,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      AutoSizeText(
                                        'Comprobantes de despósito',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
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
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Builder(
                                builder: (context) {
                                  final archivos = comprobantescdatCdatsRecord
                                      .archivos
                                      .toList();

                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(archivos.length,
                                        (archivosIndex) {
                                      final archivosItem =
                                          archivos[archivosIndex];
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (comprobantescdatCdatsRecord
                                              .archivos.isNotEmpty)
                                            FlutterFlowPdfViewer(
                                              networkPath: archivosItem,
                                              width: 350.0,
                                              height: 260.0,
                                              horizontalScroll: false,
                                            ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 18.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                await downloadFile(
                                                  filename: 'archivo',
                                                  url: archivosItem,
                                                );
                                              },
                                              text: 'Descargar ',
                                              icon: FaIcon(
                                                FontAwesomeIcons.fileDownload,
                                                size: 16.0,
                                              ),
                                              options: FFButtonOptions(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 48.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconAlignment:
                                                    IconAlignment.end,
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor4,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 4.0)),
                                      );
                                    }).divide(SizedBox(height: 8.0)),
                                  );
                                },
                              ),
                              Builder(
                                builder: (context) {
                                  final comprobante =
                                      comprobantescdatCdatsRecord.comprobantes
                                          .toList();

                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(comprobante.length,
                                        (comprobanteIndex) {
                                      final comprobanteItem =
                                          comprobante[comprobanteIndex];
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (comprobantescdatCdatsRecord
                                              .comprobantes.isNotEmpty)
                                            FlutterFlowPdfViewer(
                                              networkPath: comprobanteItem,
                                              width: 350.0,
                                              height: 260.0,
                                              horizontalScroll: false,
                                            ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 18.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                await downloadFile(
                                                  filename: 'comprobante',
                                                  url: comprobanteItem,
                                                );
                                              },
                                              text: 'Descargar ',
                                              icon: FaIcon(
                                                FontAwesomeIcons.fileDownload,
                                                size: 16.0,
                                              ),
                                              options: FFButtonOptions(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 48.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconAlignment:
                                                    IconAlignment.end,
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor4,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 4.0)),
                                      );
                                    }),
                                  );
                                },
                              ),
                            ]
                                .divide(SizedBox(height: 8.0))
                                .addToEnd(SizedBox(height: 40.0)),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                ),
                if (responsiveVisibility(
                  context: context,
                  desktop: false,
                ))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                    child: wrapWithModel(
                      model: _model.animacionmenuModel,
                      updateCallback: () => safeSetState(() {}),
                      child: AnimacionmenuWidget(),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
