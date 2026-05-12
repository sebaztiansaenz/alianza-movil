import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'version_copy_widget.dart' show VersionCopyWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VersionCopyModel extends FlutterFlowModel<VersionCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in versionCopy widget.
  AhorrosRecord? ahorro;
  // Stores action output result for [Firestore Query - Query a collection] action in versionCopy widget.
  CodigosRecord? codigosCa;
  // Stores action output result for [Backend Call - Create Document] action in versionCopy widget.
  CdatsRecord? readcdat2;
  InstantTimer? instantTimer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}
