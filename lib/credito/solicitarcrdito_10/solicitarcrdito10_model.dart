import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/sucess_mensaje_error/sucess_mensaje_error_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'solicitarcrdito10_widget.dart' show Solicitarcrdito10Widget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Solicitarcrdito10Model extends FlutterFlowModel<Solicitarcrdito10Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for amount1 widget.
  FocusNode? amount1FocusNode1;
  TextEditingController? amount1TextController1;
  String? Function(BuildContext, String?)? amount1TextController1Validator;
  // State field(s) for amount1 widget.
  FocusNode? amount1FocusNode2;
  TextEditingController? amount1TextController2;
  String? Function(BuildContext, String?)? amount1TextController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    amount1FocusNode1?.dispose();
    amount1TextController1?.dispose();

    amount1FocusNode2?.dispose();
    amount1TextController2?.dispose();
  }
}
