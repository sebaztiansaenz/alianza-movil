import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/sucess_mensaje_error/sucess_mensaje_error_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'change_password4_widget.dart' show ChangePassword4Widget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChangePassword4Model extends FlutterFlowModel<ChangePassword4Widget> {
  ///  Local state fields for this component.

  int? codeOTP;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (sendGridEmail Reset OTP)] action in Button widget.
  ApiCallResponse? apiResult1pv;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
