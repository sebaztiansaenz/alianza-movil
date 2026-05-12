import '/app/app_contrasea/success_messaje3/success_messaje3_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/sucess_mensaje_error/sucess_mensaje_error_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'change_password6_widget.dart' show ChangePassword6Widget;
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChangePassword6Model extends FlutterFlowModel<ChangePassword6Widget> {
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
      return 'Ingresa tu nueva contraseña';
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
      return 'Confirma tu nueva contraseña';
    }
    if (val.length < 6) {
      return 'Requires 6 characters.';
    }
    return null;
  }

  // Stores action output result for [Custom Action - adminResetPasswordAction] action in Button widget.
  bool? cambiocontrasena;

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
