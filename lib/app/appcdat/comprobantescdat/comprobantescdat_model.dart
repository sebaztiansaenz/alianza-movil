import '/app/otros/animacionmenu/animacionmenu_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'comprobantescdat_widget.dart' show ComprobantescdatWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ComprobantescdatModel extends FlutterFlowModel<ComprobantescdatWidget> {
  ///  Local state fields for this page.

  String? pdfURL = '';

  ///  State fields for stateful widgets in this page.

  // Model for animacionmenu component.
  late AnimacionmenuModel animacionmenuModel;

  @override
  void initState(BuildContext context) {
    animacionmenuModel = createModel(context, () => AnimacionmenuModel());
  }

  @override
  void dispose() {
    animacionmenuModel.dispose();
  }
}
