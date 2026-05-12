import '/app/perfil/perfil_component2/perfil_component2_widget.dart';
import '/app/perfil/perfil_laboral2/perfil_laboral2_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'perfil05_widget.dart' show Perfil05Widget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Perfil05Model extends FlutterFlowModel<Perfil05Widget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  InstantTimer? instantTimer;
  // State field(s) for direction widget.
  FocusNode? directionFocusNode;
  TextEditingController? directionTextController;
  String? Function(BuildContext, String?)? directionTextControllerValidator;
  String? _directionTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido';
    }

    return null;
  }

  // State field(s) for ciuexp widget.
  final ciuexpKey = GlobalKey();
  FocusNode? ciuexpFocusNode;
  TextEditingController? ciuexpTextController;
  String? ciuexpSelectedOption;
  String? Function(BuildContext, String?)? ciuexpTextControllerValidator;
  // State field(s) for phone1 widget.
  FocusNode? phone1FocusNode;
  TextEditingController? phone1TextController;
  String? Function(BuildContext, String?)? phone1TextControllerValidator;
  String? _phone1TextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido';
    }

    return null;
  }

  // State field(s) for phone2 widget.
  FocusNode? phone2FocusNode;
  TextEditingController? phone2TextController;
  String? Function(BuildContext, String?)? phone2TextControllerValidator;

  @override
  void initState(BuildContext context) {
    directionTextControllerValidator = _directionTextControllerValidator;
    phone1TextControllerValidator = _phone1TextControllerValidator;
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    directionFocusNode?.dispose();
    directionTextController?.dispose();

    ciuexpFocusNode?.dispose();

    phone1FocusNode?.dispose();
    phone1TextController?.dispose();

    phone2FocusNode?.dispose();
    phone2TextController?.dispose();
  }
}
