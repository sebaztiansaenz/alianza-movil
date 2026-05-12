import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/sucess_mensaje_error/sucess_mensaje_error_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'change_password1_widget.dart' show ChangePassword1Widget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChangePassword1Model extends FlutterFlowModel<ChangePassword1Widget> {
  ///  Local state fields for this page.

  bool load = false;

  String? nrodoc;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for CCvalue widget.
  String? cCvalueValue;
  FormFieldController<String>? cCvalueValueController;
  // State field(s) for DocumentoNro widget.
  FocusNode? documentoNroFocusNode;
  TextEditingController? documentoNroTextController;
  String? Function(BuildContext, String?)? documentoNroTextControllerValidator;
  String? _documentoNroTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese número de documento';
    }

    if (val.length < 6) {
      return 'Requires at least 6 characters.';
    }

    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UserRecord? userr;

  @override
  void initState(BuildContext context) {
    documentoNroTextControllerValidator = _documentoNroTextControllerValidator;
  }

  @override
  void dispose() {
    documentoNroFocusNode?.dispose();
    documentoNroTextController?.dispose();
  }
}
