import '/app/perfil/perfil_component1/perfil_component1_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/pages/sucess_mensaje_error/sucess_mensaje_error_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'perfil04_widget.dart' show Perfil04Widget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Perfil04Model extends FlutterFlowModel<Perfil04Widget> {
  ///  Local state fields for this page.

  bool obsure = true;

  bool obsure1 = true;

  bool obsure2 = true;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  InstantTimer? instantTimer;
  // State field(s) for PinCodeMain widget.
  TextEditingController? pinCodeMain;
  FocusNode? pinCodeMainFocusNode;
  String? Function(BuildContext, String?)? pinCodeMainValidator;
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // State field(s) for PinCode2 widget.
  TextEditingController? pinCode2;
  FocusNode? pinCode2FocusNode;
  String? Function(BuildContext, String?)? pinCode2Validator;
  // Stores action output result for [Custom Action - changeUserPassword] action in Button widget.
  String? changePassword;

  @override
  void initState(BuildContext context) {
    pinCodeMain = TextEditingController();
    pinCodeController = TextEditingController();
    pinCode2 = TextEditingController();
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    pinCodeMainFocusNode?.dispose();
    pinCodeMain?.dispose();

    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();

    pinCode2FocusNode?.dispose();
    pinCode2?.dispose();
  }
}
