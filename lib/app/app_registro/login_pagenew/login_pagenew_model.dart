import '/app/newaperturacdat/newaperturacdat_widget.dart';
import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/sucess_mensaje_error/sucess_mensaje_error_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'login_pagenew_widget.dart' show LoginPagenewWidget;
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPagenewModel extends FlutterFlowModel<LoginPagenewWidget> {
  ///  Local state fields for this page.

  bool obsure = true;

  String? email;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - getVersion1] action in LoginPagenew widget.
  String? versionactual;
  // State field(s) for correo widget.
  FocusNode? correoFocusNode;
  TextEditingController? correoTextController;
  String? Function(BuildContext, String?)? correoTextControllerValidator;
  String? _correoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? cuenta;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? numerocdats;

  @override
  void initState(BuildContext context) {
    correoTextControllerValidator = _correoTextControllerValidator;
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    correoFocusNode?.dispose();
    correoTextController?.dispose();

    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();
  }
}
