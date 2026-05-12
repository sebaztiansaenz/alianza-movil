import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'verification_backupload_widget.dart' show VerificationBackuploadWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VerificationBackuploadModel
    extends FlutterFlowModel<VerificationBackuploadWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadData3dd = false;
  FFUploadedFile uploadedLocalFile_uploadData3dd =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadData3dd = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
