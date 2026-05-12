import '/app/appcdat/cdatretiros_copy/cdatretiros_copy_widget.dart';
import '/app/appcdat/cdatsinsaldo/cdatsinsaldo_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'v_e_r_m_a_scdat_widget.dart' show VERMAScdatWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VERMAScdatModel extends FlutterFlowModel<VERMAScdatWidget> {
  ///  Local state fields for this page.

  bool showAnimation = true;

  bool abrirhistorico = false;

  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}
