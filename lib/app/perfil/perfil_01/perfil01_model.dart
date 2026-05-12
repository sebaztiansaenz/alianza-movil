import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'perfil01_widget.dart' show Perfil01Widget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Perfil01Model extends FlutterFlowModel<Perfil01Widget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getVersion1] action in Perfil_01 widget.
  String? versionactual;
  InstantTimer? instantTimer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}
