import '/app/detallesinversioncdat_copy2/detallesinversioncdat_copy2_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'a_h_o_r_r_o_scdat2_copy_copy_copy_widget.dart'
    show AHORROScdat2CopyCopyCopyWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AHORROScdat2CopyCopyCopyModel
    extends FlutterFlowModel<AHORROScdat2CopyCopyCopyWidget> {
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
