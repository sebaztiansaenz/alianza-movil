import '/app/appcdat/detallesinversioncdat/detallesinversioncdat_widget.dart';
import '/app/otros/animacionmenu/animacionmenu_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'nuevaaperturacdat_widget.dart' show NuevaaperturacdatWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NuevaaperturacdatModel extends FlutterFlowModel<NuevaaperturacdatWidget> {
  ///  Local state fields for this page.

  bool noNIT = false;

  bool noContractType = false;

  bool noLugar = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getJson] action in nuevaaperturacdat widget.
  dynamic? ciudadbf;
  InstantTimer? instantTimer;
  // Model for animacionmenu component.
  late AnimacionmenuModel animacionmenuModel;

  @override
  void initState(BuildContext context) {
    animacionmenuModel = createModel(context, () => AnimacionmenuModel());
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    animacionmenuModel.dispose();
  }
}
