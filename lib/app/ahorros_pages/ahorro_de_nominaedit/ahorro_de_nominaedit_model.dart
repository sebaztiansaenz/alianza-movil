import '/app/app_registro/o_t_p_code_nomina/o_t_p_code_nomina_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'ahorro_de_nominaedit_widget.dart' show AhorroDeNominaeditWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AhorroDeNominaeditModel
    extends FlutterFlowModel<AhorroDeNominaeditWidget> {
  ///  Local state fields for this page.

  int? otp;

  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  // State field(s) for amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountTextController;
  String? Function(BuildContext, String?)? amountTextControllerValidator;
  // Stores action output result for [Backend Call - API (sendGridEmailOTP EditNomina)] action in Button widget.
  ApiCallResponse? apiResultxl4;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
    amountFocusNode?.dispose();
    amountTextController?.dispose();
  }
}
