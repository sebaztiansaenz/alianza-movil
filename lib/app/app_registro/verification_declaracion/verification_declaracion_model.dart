import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'verification_declaracion_widget.dart'
    show VerificationDeclaracionWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VerificationDeclaracionModel
    extends FlutterFlowModel<VerificationDeclaracionWidget> {
  ///  Local state fields for this page.

  bool? options1;

  bool? options2;

  String? name;

  String? doc;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Checkbox1 widget.
  bool? checkbox1Value;
  // State field(s) for Checkbox2 widget.
  bool? checkbox2Value;
  // State field(s) for Checkbox3 widget.
  bool? checkbox3Value;
  // State field(s) for Checkbox4 widget.
  bool? checkbox4Value;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese nombre completo y documento de identidad de familiar PEP';
    }

    return null;
  }

  // State field(s) for id widget.
  FocusNode? idFocusNode;
  TextEditingController? idTextController;
  String? Function(BuildContext, String?)? idTextControllerValidator;
  String? _idTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese nombre completo y documento de identidad de familiar PEP';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    idTextControllerValidator = _idTextControllerValidator;
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    idFocusNode?.dispose();
    idTextController?.dispose();
  }
}
