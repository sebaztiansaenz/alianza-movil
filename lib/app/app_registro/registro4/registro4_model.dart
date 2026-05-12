import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/sucess_mensaje_error/sucess_mensaje_error_widget.dart';
import 'dart:ui';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'registro4_widget.dart' show Registro4Widget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Registro4Model extends FlutterFlowModel<Registro4Widget> {
  ///  Local state fields for this page.

  bool otpSent = false;

  String? whats;

  String? confirmwaths;

  String? correo;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for wsp1 widget.
  FocusNode? wsp1FocusNode;
  TextEditingController? wsp1TextController;
  String? Function(BuildContext, String?)? wsp1TextControllerValidator;
  String? _wsp1TextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El campo es obligatorio';
    }

    if (val.length < 10) {
      return 'Los números de whatsapp deben ser de 10 dígitos';
    }
    if (val.length > 10) {
      return 'Los números de whatsapp deben ser de 10 dígitos';
    }

    return null;
  }

  // State field(s) for wsp2 widget.
  FocusNode? wsp2FocusNode;
  TextEditingController? wsp2TextController;
  String? Function(BuildContext, String?)? wsp2TextControllerValidator;
  String? _wsp2TextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El campo es obligatorio';
    }

    if (val.length < 10) {
      return 'Los números de whatsapp deben ser de 10 dígitos';
    }
    if (val.length > 10) {
      return 'Los números de whatsapp deben ser de 10 dígitos';
    }

    return null;
  }

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // Stores action output result for [Backend Call - API (sendGridEmailOTP Copy)] action in Button widget.
  ApiCallResponse? code;

  @override
  void initState(BuildContext context) {
    wsp1TextControllerValidator = _wsp1TextControllerValidator;
    wsp2TextControllerValidator = _wsp2TextControllerValidator;
  }

  @override
  void dispose() {
    wsp1FocusNode?.dispose();
    wsp1TextController?.dispose();

    wsp2FocusNode?.dispose();
    wsp2TextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
