import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'transactions_details_widget.dart' show TransactionsDetailsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TransactionsDetailsModel
    extends FlutterFlowModel<TransactionsDetailsWidget> {
  ///  Local state fields for this page.

  String? status;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in TransactionsDetails widget.
  TransactionsRecord? transaction;
  // Stores action output result for [Cloud Function - checkPaymentStatus] action in TransactionsDetails widget.
  CheckPaymentStatusCloudFunctionCallResponse? cloudFunctionopb;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
