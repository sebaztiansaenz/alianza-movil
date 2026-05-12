import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/sucess_mensaje_error/sucess_mensaje_error_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'r_e_g_i_s_t_r_o5_main_widget.dart' show REGISTRO5MainWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class REGISTRO5MainModel extends FlutterFlowModel<REGISTRO5MainWidget> {
  ///  Local state fields for this page.

  bool obsure = true;

  bool obsure1 = true;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  String? _pinCodeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese su contraseña de 6 números';
    }
    if (val.length < 6) {
      return 'Requires 6 characters.';
    }
    return null;
  }

  // State field(s) for PinCode2 widget.
  TextEditingController? pinCode2;
  FocusNode? pinCode2FocusNode;
  String? Function(BuildContext, String?)? pinCode2Validator;
  String? _pinCode2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Confirme su contraseña de 6 números';
    }
    if (val.length < 6) {
      return 'Requires 6 characters.';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
    pinCodeControllerValidator = _pinCodeControllerValidator;
    pinCode2 = TextEditingController();
    pinCode2Validator = _pinCode2Validator;
  }

  @override
  void dispose() {
    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();

    pinCode2FocusNode?.dispose();
    pinCode2?.dispose();
  }
}
