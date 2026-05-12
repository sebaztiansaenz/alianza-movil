import '/app/perfil/perfil_laboral2/perfil_laboral2_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'verification_actividad_widget.dart' show VerificationActividadWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VerificationActividadModel
    extends FlutterFlowModel<VerificationActividadWidget> {
  ///  Local state fields for this page.

  bool? options1;

  bool? options2;

  String? ingreso;

  String? egreso;

  String? activo;

  String? patrimonio;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for ingresos widget.
  FocusNode? ingresosFocusNode;
  TextEditingController? ingresosTextController;
  String? Function(BuildContext, String?)? ingresosTextControllerValidator;
  String? _ingresosTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido';
    }

    return null;
  }

  // State field(s) for egresos widget.
  FocusNode? egresosFocusNode;
  TextEditingController? egresosTextController;
  String? Function(BuildContext, String?)? egresosTextControllerValidator;
  String? _egresosTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido';
    }

    return null;
  }

  // State field(s) for activos widget.
  FocusNode? activosFocusNode;
  TextEditingController? activosTextController;
  String? Function(BuildContext, String?)? activosTextControllerValidator;
  String? _activosTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido';
    }

    return null;
  }

  // State field(s) for patrimonio widget.
  FocusNode? patrimonioFocusNode;
  TextEditingController? patrimonioTextController;
  String? Function(BuildContext, String?)? patrimonioTextControllerValidator;
  String? _patrimonioTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    ingresosTextControllerValidator = _ingresosTextControllerValidator;
    egresosTextControllerValidator = _egresosTextControllerValidator;
    activosTextControllerValidator = _activosTextControllerValidator;
    patrimonioTextControllerValidator = _patrimonioTextControllerValidator;
  }

  @override
  void dispose() {
    ingresosFocusNode?.dispose();
    ingresosTextController?.dispose();

    egresosFocusNode?.dispose();
    egresosTextController?.dispose();

    activosFocusNode?.dispose();
    activosTextController?.dispose();

    patrimonioFocusNode?.dispose();
    patrimonioTextController?.dispose();
  }
}
