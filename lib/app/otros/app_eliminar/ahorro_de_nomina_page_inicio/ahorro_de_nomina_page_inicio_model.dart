import '/app/ahorros_pages/ahorro_contract_type_home/ahorro_contract_type_home_widget.dart';
import '/app/otros/animacionmenu/animacionmenu_widget.dart';
import '/app/otros/app_eliminar/menu_arriba/menu_arriba_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'ahorro_de_nomina_page_inicio_widget.dart'
    show AhorroDeNominaPageInicioWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AhorroDeNominaPageInicioModel
    extends FlutterFlowModel<AhorroDeNominaPageInicioWidget> {
  ///  Local state fields for this page.

  bool noNIT = false;

  bool noContractType = false;

  bool noLugar = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getJson] action in Ahorro_de_nominaPageInicio widget.
  dynamic? ciudadbf;
  // Model for MenuArriba component.
  late MenuArribaModel menuArribaModel;
  // Model for animacionmenu component.
  late AnimacionmenuModel animacionmenuModel;

  @override
  void initState(BuildContext context) {
    menuArribaModel = createModel(context, () => MenuArribaModel());
    animacionmenuModel = createModel(context, () => AnimacionmenuModel());
  }

  @override
  void dispose() {
    menuArribaModel.dispose();
    animacionmenuModel.dispose();
  }
}
