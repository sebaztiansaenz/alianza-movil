import '/app/ahorros_pages/transferir/transferir_widget.dart';
import '/app/depositar_retiro_bottom_sheet_ahorro/depositar_retiro_bottom_sheet_ahorro_widget.dart';
import '/app/nominamodaleditar/nominamodaleditar_widget.dart';
import '/app/otros/animacionmenu/animacionmenu_widget.dart';
import '/app/otros/retiros/retiros_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'ahorro_main_page_widget.dart' show AhorroMainPageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AhorroMainPageModel extends FlutterFlowModel<AhorroMainPageWidget> {
  ///  Local state fields for this page.

  bool showAnimation = true;

  bool abrirhistorico = false;

  ///  State fields for stateful widgets in this page.

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
