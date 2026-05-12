import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'pas4cdat_widget.dart' show Pas4cdatWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Pas4cdatModel extends FlutterFlowModel<Pas4cdatWidget> {
  ///  Local state fields for this page.

  String? pdfURL = '';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in pas4cdat widget.
  List<RetirosCdatRecord>? retiross;
  // Stores action output result for [Custom Action - generateCDATSinglePage] action in pas4cdat widget.
  FFUploadedFile? pdfcdat;
  InstantTimer? cdat;
  // Stores action output result for [Custom Action - cdatStringPdf] action in Button widget.
  String? base64PDFd2;
  // Stores action output result for [Backend Call - API (CDATFirmaZapsign)] action in Button widget.
  ApiCallResponse? apiResultwkv;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    cdat?.cancel();
  }
}
