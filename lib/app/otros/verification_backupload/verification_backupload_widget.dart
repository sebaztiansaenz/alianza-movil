import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'verification_backupload_model.dart';
export 'verification_backupload_model.dart';

class VerificationBackuploadWidget extends StatefulWidget {
  const VerificationBackuploadWidget({
    super.key,
    this.front,
    this.reverificacion2,
  });

  final String? front;
  final bool? reverificacion2;

  static String routeName = 'VerificationBackupload';
  static String routePath = '/verificationBackupload';

  @override
  State<VerificationBackuploadWidget> createState() =>
      _VerificationBackuploadWidgetState();
}

class _VerificationBackuploadWidgetState
    extends State<VerificationBackuploadWidget> {
  late VerificationBackuploadModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerificationBackuploadModel());

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
        backgroundColor: Color(0xFF0B35B8),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(1.0, 1.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Image.asset(
                    'assets/images/Group_(4).png',
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.network(
                      '',
                    ).image,
                  ),
                  gradient: LinearGradient(
                    colors: [Color(0xFF006AD8), Color(0x810B35B8)],
                    stops: [0.0, 0.8],
                    begin: AlignmentDirectional(0.0, -1.0),
                    end: AlignmentDirectional(0, 1.0),
                  ),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(35.0, 40.0, 35.0, 80.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 40.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
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
                                    child: Icon(
                                      Icons.arrow_back_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                'FOTO DE REVERSO',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Satoshi',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 300.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 15.0, 0.0, 15.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/12321.png',
                                        width: 40.0,
                                        height: 30.0,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'REVERSO',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 180.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF578BDD),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.network(
                                      _model.uploadedFileUrl_uploadData3dd,
                                    ).image,
                                  ),
                                ),
                                child: Visibility(
                                  visible: _model
                                              .uploadedFileUrl_uploadData3dd ==
                                          null ||
                                      _model.uploadedFileUrl_uploadData3dd ==
                                          '',
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/Frame_2609710r.png',
                                      width: 200.0,
                                      height: 200.0,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Text(
                              'Tome la parte reversa de su documento de identidad, preferiblemente sobre un fondo blanco.',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Satoshi',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w200,
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              36.0, 80.0, 32.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (_model.uploadedFileUrl_uploadData3dd ==
                                      null ||
                                  _model.uploadedFileUrl_uploadData3dd == '')
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    final selectedMedia = await selectMedia(
                                      multiImage: false,
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      safeSetState(() =>
                                          _model.isDataUploading_uploadData3dd =
                                              true);
                                      var selectedUploadedFiles =
                                          <FFUploadedFile>[];

                                      var downloadUrls = <String>[];
                                      try {
                                        showUploadMessage(
                                          context,
                                          'El archivo se está cargando a la aplicación.',
                                          showLoading: true,
                                        );
                                        selectedUploadedFiles = selectedMedia
                                            .map((m) => FFUploadedFile(
                                                  name: m.storagePath
                                                      .split('/')
                                                      .last,
                                                  bytes: m.bytes,
                                                  height: m.dimensions?.height,
                                                  width: m.dimensions?.width,
                                                  blurHash: m.blurHash,
                                                  originalFilename:
                                                      m.originalFilename,
                                                ))
                                            .toList();

                                        downloadUrls = (await Future.wait(
                                          selectedMedia.map(
                                            (m) async => await uploadData(
                                                m.storagePath, m.bytes),
                                          ),
                                        ))
                                            .where((u) => u != null)
                                            .map((u) => u!)
                                            .toList();
                                      } finally {
                                        ScaffoldMessenger.of(context)
                                            .hideCurrentSnackBar();
                                        _model.isDataUploading_uploadData3dd =
                                            false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                              selectedMedia.length &&
                                          downloadUrls.length ==
                                              selectedMedia.length) {
                                        safeSetState(() {
                                          _model.uploadedLocalFile_uploadData3dd =
                                              selectedUploadedFiles.first;
                                          _model.uploadedFileUrl_uploadData3dd =
                                              downloadUrls.first;
                                        });
                                        showUploadMessage(context,
                                            'Se ingresó el archivo correctamente.');
                                      } else {
                                        safeSetState(() {});
                                        showUploadMessage(context,
                                            'Tuvimos dificultades para cargar el archivo. Intente nuevamente.');
                                        return;
                                      }
                                    }
                                  },
                                  child: Container(
                                    width: 60.0,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      borderRadius: BorderRadius.circular(50.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Icon(
                                        Icons.camera_alt_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                ),
                              if (_model.uploadedFileUrl_uploadData3dd !=
                                      null &&
                                  _model.uploadedFileUrl_uploadData3dd != '')
                                FFButtonWidget(
                                  onPressed: () async {
                                    context.pushNamed(
                                      VerificationSelfiPageWidget.routeName,
                                      queryParameters: {
                                        'front': serializeParam(
                                          widget!.front,
                                          ParamType.String,
                                        ),
                                        'back': serializeParam(
                                          _model.uploadedFileUrl_uploadData3dd,
                                          ParamType.String,
                                        ),
                                        'reverificacion3': serializeParam(
                                          widget!.reverificacion2,
                                          ParamType.bool,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        '__transition_info__': TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 320),
                                        ),
                                      },
                                    );
                                  },
                                  text: 'Continuar',
                                  options: FFButtonOptions(
                                    width: 158.0,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color: Color(0xFFF77E06),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.only(),
                                  ),
                                ),
                            ].divide(SizedBox(height: 16.0)),
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
      ),
    );
  }
}
