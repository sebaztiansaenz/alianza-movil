import '/app/otros/animacionmenu/animacionmenu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/sucess_mensaje_error/sucess_mensaje_error_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'ahorro_de_nomina_page2_widget.dart' show AhorroDeNominaPage2Widget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AhorroDeNominaPage2Model
    extends FlutterFlowModel<AhorroDeNominaPage2Widget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Escribe tu profesión ';
    }

    return null;
  }

  // State field(s) for amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountTextController;
  String? Function(BuildContext, String?)? amountTextControllerValidator;
  String? _amountTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingresa el monto';
    }

    return null;
  }

  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validar;
  // Model for animacionmenu component.
  late AnimacionmenuModel animacionmenuModel;

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    amountTextControllerValidator = _amountTextControllerValidator;
    animacionmenuModel = createModel(context, () => AnimacionmenuModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    amountFocusNode?.dispose();
    amountTextController?.dispose();

    animacionmenuModel.dispose();
  }
}
