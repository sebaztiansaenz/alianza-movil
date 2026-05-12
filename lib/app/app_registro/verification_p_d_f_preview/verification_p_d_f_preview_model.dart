import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'verification_p_d_f_preview_widget.dart'
    show VerificationPDFPreviewWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VerificationPDFPreviewModel
    extends FlutterFlowModel<VerificationPDFPreviewWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - createUpdatedPDFUploadedFile] action in verificationPDFPreview widget.
  FFUploadedFile? pdfOutput;
  // Stores action output result for [Custom Action - createUpdatedPDF] action in Button widget.
  String? pdfBase64Copy;
  // Stores action output result for [Backend Call - API (Initiate signature)] action in Button widget.
  ApiCallResponse? apiResultfxjCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
