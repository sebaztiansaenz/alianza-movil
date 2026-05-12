import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'verification_selfi_page_model.dart';
export 'verification_selfi_page_model.dart';

class VerificationSelfiPageWidget extends StatefulWidget {
  const VerificationSelfiPageWidget({
    super.key,
    this.front,
    this.back,
    bool? reverificacion3,
  }) : this.reverificacion3 = reverificacion3 ?? false;

  final String? front;
  final String? back;
  final bool reverificacion3;

  static String routeName = 'verificationSelfiPage';
  static String routePath = '/verificationSelfiPage';

  @override
  State<VerificationSelfiPageWidget> createState() =>
      _VerificationSelfiPageWidgetState();
}

class _VerificationSelfiPageWidgetState
    extends State<VerificationSelfiPageWidget> {
  late VerificationSelfiPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerificationSelfiPageModel());

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
        body: Stack(
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
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(35.0, 40.0, 35.0, 80.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
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
                              'SELFIE',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Satoshi',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ].divide(SizedBox(width: 12.0)),
                        ),
                      ),
                      Container(
                        width: 250.0,
                        height: 250.0,
                        decoration: BoxDecoration(
                          color: Color(0x00FFFFFF),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.network(
                              _model.uploadedFileUrl_uploadDataVpp,
                            ).image,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Visibility(
                          visible:
                              _model.uploadedFileUrl_uploadDataVpp == null ||
                                  _model.uploadedFileUrl_uploadDataVpp == '',
                          child: Container(
                            width: 200.0,
                            height: 200.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/images/selfieee.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Text(
                            'Tome una foto completamente de frente sin gafas y sin ningun accesorio que le cubra el rostro',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Satoshi',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w200,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            36.0, 180.0, 32.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (_model.uploadedFileUrl_uploadDataVpp == null ||
                                _model.uploadedFileUrl_uploadDataVpp == '')
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
                                    safeSetState(() => _model
                                        .isDataUploading_uploadDataVpp = true);
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
                                      _model.isDataUploading_uploadDataVpp =
                                          false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                            selectedMedia.length &&
                                        downloadUrls.length ==
                                            selectedMedia.length) {
                                      safeSetState(() {
                                        _model.uploadedLocalFile_uploadDataVpp =
                                            selectedUploadedFiles.first;
                                        _model.uploadedFileUrl_uploadDataVpp =
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
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
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
                            if (_model.uploadedFileUrl_uploadDataVpp != null &&
                                _model.uploadedFileUrl_uploadDataVpp != '')
                              FFButtonWidget(
                                onPressed: () async {
                                  if (widget!.reverificacion3 == true) {
                                    await currentUserReference!
                                        .update(createUserRecordData(
                                      fotofrontal: widget!.front,
                                      fototrasera: widget!.back,
                                      fotoperfil:
                                          _model.uploadedFileUrl_uploadDataVpp,
                                      verificacionusuario:
                                          FFAppConstants.enviado,
                                    ));

                                    context.pushNamed(
                                        VerificationSuccessWidget.routeName);
                                  } else {
                                    context.pushNamed(
                                      VerificationActividadWidget.routeName,
                                      queryParameters: {
                                        'front': serializeParam(
                                          widget!.front,
                                          ParamType.String,
                                        ),
                                        'back': serializeParam(
                                          widget!.back,
                                          ParamType.String,
                                        ),
                                        'selfie': serializeParam(
                                          _model.uploadedFileUrl_uploadDataVpp,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  }
                                },
                                text: 'Continuar',
                                options: FFButtonOptions(
                                  width: 158.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).tertiary,
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
    );
  }
}
