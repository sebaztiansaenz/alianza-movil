import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'verification_cardfrontupload_widget.dart'
    show VerificationCardfrontuploadWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VerificationCardfrontuploadModel
    extends FlutterFlowModel<VerificationCardfrontuploadWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadDataE29 = false;
  FFUploadedFile uploadedLocalFile_uploadDataE29 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataE29 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
