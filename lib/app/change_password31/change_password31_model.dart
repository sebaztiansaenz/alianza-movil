import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'change_password31_widget.dart' show ChangePassword31Widget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChangePassword31Model extends FlutterFlowModel<ChangePassword31Widget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for dir widget.
  FocusNode? dirFocusNode;
  TextEditingController? dirTextController;
  String? Function(BuildContext, String?)? dirTextControllerValidator;
  String? _dirTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingresa Dirección de residencia';
    }

    return null;
  }

  // State field(s) for barrio widget.
  FocusNode? barrioFocusNode;
  TextEditingController? barrioTextController;
  String? Function(BuildContext, String?)? barrioTextControllerValidator;
  String? _barrioTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese Barrio de Residencia';
    }

    return null;
  }

  // State field(s) for ciuexp widget.
  final ciuexpKey = GlobalKey();
  FocusNode? ciuexpFocusNode;
  TextEditingController? ciuexpTextController;
  String? ciuexpSelectedOption;
  String? Function(BuildContext, String?)? ciuexpTextControllerValidator;
  String? _ciuexpTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Seleccione Ciudad de Residencia';
    }
    if (val != ciuexpSelectedOption) {
      return 'Please choose an option from the dropdown';
    }

    return null;
  }

  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {
    dirTextControllerValidator = _dirTextControllerValidator;
    barrioTextControllerValidator = _barrioTextControllerValidator;
    ciuexpTextControllerValidator = _ciuexpTextControllerValidator;
  }

  @override
  void dispose() {
    dirFocusNode?.dispose();
    dirTextController?.dispose();

    barrioFocusNode?.dispose();
    barrioTextController?.dispose();

    ciuexpFocusNode?.dispose();
  }
}
