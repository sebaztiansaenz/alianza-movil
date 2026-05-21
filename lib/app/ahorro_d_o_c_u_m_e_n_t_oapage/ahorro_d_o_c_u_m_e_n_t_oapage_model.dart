import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'ahorro_d_o_c_u_m_e_n_t_oapage_widget.dart'
    show AhorroDOCUMENTOapageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AhorroDOCUMENTOapageModel
    extends FlutterFlowModel<AhorroDOCUMENTOapageWidget> {
  ///  Local state fields for this page.

  bool isLoadingPdf = true;

  bool isSigning = false;

  String? pdfError;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - firstPDFCopy] action in Ahorro_DOCUMENTOapage widget.
  FFUploadedFile? pdf2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ServicesRecord? service;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  AhorrosRecord? ahorro1;
  // Stores action output result for [Custom Action - pdf2String] action in Button widget.
  String? base64PDF;
  // Stores action output result for [Backend Call - API (Initiate signature Copy)] action in Button widget.
  ApiCallResponse? apiResultwkv;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
