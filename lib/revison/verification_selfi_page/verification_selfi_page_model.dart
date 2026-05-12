import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'verification_selfi_page_widget.dart' show VerificationSelfiPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VerificationSelfiPageModel
    extends FlutterFlowModel<VerificationSelfiPageWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadDataVpp = false;
  FFUploadedFile uploadedLocalFile_uploadDataVpp =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataVpp = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
