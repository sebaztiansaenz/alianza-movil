import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/sucess_mensaje_error/sucess_mensaje_error_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'solicitarcrdito7_widget.dart' show Solicitarcrdito7Widget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Solicitarcrdito7Model extends FlutterFlowModel<Solicitarcrdito7Widget> {
  ///  Local state fields for this page.

  String? creditosActivos;

  String? pagoOtrasDeudas;

  String? gastos;

  ///  State fields for stateful widgets in this page.

  // State field(s) for amount1 widget.
  FocusNode? amount1FocusNode;
  TextEditingController? amount1TextController;
  String? Function(BuildContext, String?)? amount1TextControllerValidator;
  // State field(s) for amount2 widget.
  FocusNode? amount2FocusNode;
  TextEditingController? amount2TextController;
  String? Function(BuildContext, String?)? amount2TextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    amount1FocusNode?.dispose();
    amount1TextController?.dispose();

    amount2FocusNode?.dispose();
    amount2TextController?.dispose();
  }
}
