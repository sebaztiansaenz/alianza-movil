import '/app/app_registro/r_e_g_i_s_t_r_o2_sexo/r_e_g_i_s_t_r_o2_sexo_widget.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/sucess_mensaje_error/sucess_mensaje_error_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'registro2_widget.dart' show Registro2Widget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Registro2Model extends FlutterFlowModel<Registro2Widget> {
  ///  Local state fields for this page.

  String? sexo;

  String? nombre;

  String? ciudad;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for fullName widget.
  FocusNode? fullNameFocusNode;
  TextEditingController? fullNameTextController;
  String? Function(BuildContext, String?)? fullNameTextControllerValidator;
  String? _fullNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese nombre y apellido';
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for ciunacimiento widget.
  final ciunacimientoKey = GlobalKey();
  FocusNode? ciunacimientoFocusNode;
  TextEditingController? ciunacimientoTextController;
  String? ciunacimientoSelectedOption;
  String? Function(BuildContext, String?)? ciunacimientoTextControllerValidator;
  String? _ciunacimientoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Seleccione ciudad de Nacimiento';
    }
    if (val != ciunacimientoSelectedOption) {
      return 'Seleccione ciudad de Nacimiento';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    fullNameTextControllerValidator = _fullNameTextControllerValidator;
    ciunacimientoTextControllerValidator =
        _ciunacimientoTextControllerValidator;
  }

  @override
  void dispose() {
    columnController?.dispose();
    fullNameFocusNode?.dispose();
    fullNameTextController?.dispose();

    ciunacimientoFocusNode?.dispose();
  }
}
