import '/app/ahorros_pages/ahorro_contract_type/ahorro_contract_type_widget.dart';
import '/app/ahorros_pages/ahorro_contract_type_antiguedad/ahorro_contract_type_antiguedad_widget.dart';
import '/app/ahorros_pages/ahorro_contract_type_salario/ahorro_contract_type_salario_widget.dart';
import '/app/otros/animacionmenu/animacionmenu_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/sucess_mensaje_error/sucess_mensaje_error_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'ahorro_de_nomina_page_buscar_empresa_widget.dart'
    show AhorroDeNominaPageBuscarEmpresaWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AhorroDeNominaPageBuscarEmpresaModel
    extends FlutterFlowModel<AhorroDeNominaPageBuscarEmpresaWidget> {
  ///  Local state fields for this page.

  bool noNIT = false;

  bool noContractType = false;

  bool noLugar = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getJson] action in Ahorro_de_nominaPageBuscarEmpresa widget.
  dynamic? ciudadbf;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for animacionmenu component.
  late AnimacionmenuModel animacionmenuModel;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    animacionmenuModel = createModel(context, () => AnimacionmenuModel());
  }

  @override
  void dispose() {
    columnController?.dispose();
    textFieldFocusNode?.dispose();

    animacionmenuModel.dispose();
  }
}
