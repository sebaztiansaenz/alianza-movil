import '/app/ahorros_pages/ahorro_options/ahorro_options_widget.dart';
import '/app/otros/animacionmenu/animacionmenu_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'ahorro_extracto_widget.dart' show AhorroExtractoWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AhorroExtractoModel extends FlutterFlowModel<AhorroExtractoWidget> {
  ///  Local state fields for this page.

  bool isLoading = false;

  String year = '2025';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  InstantTimer? instantTimer;
  // State field(s) for months widget.
  String? monthsValue;
  FormFieldController<String>? monthsValueController;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validateCopy;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  AhorrosRecord? ahorrosAccountCopy;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<TransactionsRecord>? transactions;
  // Stores action output result for [Custom Action - bankStatementPDF] action in Button widget.
  FFUploadedFile? accountStatementCopy;
  // Stores action output result for [Custom Action - sendPDF] action in Button widget.
  bool? didStatementSendCopy;
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
