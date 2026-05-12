import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'depositoahorro1_widget.dart' show Depositoahorro1Widget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Depositoahorro1Model extends FlutterFlowModel<Depositoahorro1Widget> {
  ///  Local state fields for this component.

  String? option;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<AhorrosRecord>? ahorroCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
