import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/sucess_mensaje_error/sucess_mensaje_error_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'solicitarcrdito6_widget.dart' show Solicitarcrdito6Widget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Solicitarcrdito6Model extends FlutterFlowModel<Solicitarcrdito6Widget> {
  ///  Local state fields for this page.

  String? otrasfuentres;

  String? promedioingreso;

  String? gastos;

  String? creditosActivos;

  ///  State fields for stateful widgets in this page.

  // State field(s) for amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountTextController;
  String? Function(BuildContext, String?)? amountTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    amountFocusNode?.dispose();
    amountTextController?.dispose();
  }
}
