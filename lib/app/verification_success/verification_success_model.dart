import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'verification_success_widget.dart' show VerificationSuccessWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VerificationSuccessModel
    extends FlutterFlowModel<VerificationSuccessWidget> {
  ///  Local state fields for this page.

  bool load = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getJson] action in VerificationSuccess widget.
  dynamic? ciudad;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? cuenta;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
