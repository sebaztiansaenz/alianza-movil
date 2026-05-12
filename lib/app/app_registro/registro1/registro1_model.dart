import '/app/app_registro/usuarioregistrado/usuarioregistrado_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/sucess_mensaje_error/sucess_mensaje_error_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'registro1_widget.dart' show Registro1Widget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Registro1Model extends FlutterFlowModel<Registro1Widget> {
  ///  Local state fields for this page.

  bool load = false;

  String? doc;

  String? confirmdoc;

  String? ciuexp;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - getJson] action in REGISTRO1 widget.
  dynamic? ciudad;
  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // State field(s) for CCvalue widget.
  String? cCvalueValue;
  FormFieldController<String>? cCvalueValueController;
  // State field(s) for doc widget.
  FocusNode? docFocusNode;
  TextEditingController? docTextController;
  String? Function(BuildContext, String?)? docTextControllerValidator;
  String? _docTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingresa tu número de documento';
    }

    if (val.length < 6) {
      return 'Requires at least 6 characters.';
    }

    return null;
  }

  // State field(s) for confirmedoc widget.
  FocusNode? confirmedocFocusNode;
  TextEditingController? confirmedocTextController;
  String? Function(BuildContext, String?)? confirmedocTextControllerValidator;
  String? _confirmedocTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Confirma tu número de documento';
    }

    if (val.length < 6) {
      return 'Requires at least 6 characters.';
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for ciuexp widget.
  final ciuexpKey = GlobalKey();
  FocusNode? ciuexpFocusNode;
  TextEditingController? ciuexpTextController;
  String? ciuexpSelectedOption;
  String? Function(BuildContext, String?)? ciuexpTextControllerValidator;
  String? _ciuexpTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Seleccione Ciudad de Expedición de Documento';
    }
    if (val != ciuexpSelectedOption) {
      return 'Seleccione Ciudad de Expedición de Documento';
    }

    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<UserRecord>? userExistsCopy;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<UserRecord>? userExistsCopy2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<UserRecord>? userExistsCopy3;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
    docTextControllerValidator = _docTextControllerValidator;
    confirmedocTextControllerValidator = _confirmedocTextControllerValidator;
    ciuexpTextControllerValidator = _ciuexpTextControllerValidator;
  }

  @override
  void dispose() {
    columnController1?.dispose();
    columnController2?.dispose();
    docFocusNode?.dispose();
    docTextController?.dispose();

    confirmedocFocusNode?.dispose();
    confirmedocTextController?.dispose();

    ciuexpFocusNode?.dispose();
  }
}
