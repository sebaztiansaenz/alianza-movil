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
import 'ahorro_d_o_c_u_m_e_n_t_o2_widget.dart' show AhorroDOCUMENTO2Widget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AhorroDOCUMENTO2Model extends FlutterFlowModel<AhorroDOCUMENTO2Widget> {
  ///  Local state fields for this page.

  String? pdfURL = '';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in Ahorro_DOCUMENTO2 widget.
  EmpresaRecord? empresaread;
  // Stores action output result for [Custom Action - firstPDFCopyCopy2] action in Ahorro_DOCUMENTO2 widget.
  FFUploadedFile? pdfffX;
  InstantTimer? doca;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ServicesRecord? service;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  AhorrosRecord? ahorro2;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  EmpresaRecord? empresareadfirma;
  // Stores action output result for [Custom Action - firstPDFCopyCopy] action in Button widget.
  String? base64PDFd;
  // Stores action output result for [Backend Call - API (Initiate signature Copy Copy Copy)] action in Button widget.
  ApiCallResponse? apiResultwkv;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    doca?.cancel();
  }
}
