import '/app/ahorros_pages/ahorro_bank_account_type/ahorro_bank_account_type_widget.dart';
import '/app/ahorros_pages/banks/banks_widget.dart';
import '/app/otros/animacionmenu/animacionmenu_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'ahorro_add_bank_widget.dart' show AhorroAddBankWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AhorroAddBankModel extends FlutterFlowModel<AhorroAddBankWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for accountNumber widget.
  FocusNode? accountNumberFocusNode;
  TextEditingController? accountNumberTextController;
  String? Function(BuildContext, String?)? accountNumberTextControllerValidator;
  String? _accountNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'número';
    }

    if (val.length > 20) {
      return 'Error';
    }

    return null;
  }

  // State field(s) for accountNumber2 widget.
  FocusNode? accountNumber2FocusNode;
  TextEditingController? accountNumber2TextController;
  String? Function(BuildContext, String?)?
      accountNumber2TextControllerValidator;
  // Model for animacionmenu component.
  late AnimacionmenuModel animacionmenuModel;

  @override
  void initState(BuildContext context) {
    accountNumberTextControllerValidator =
        _accountNumberTextControllerValidator;
    animacionmenuModel = createModel(context, () => AnimacionmenuModel());
  }

  @override
  void dispose() {
    accountNumberFocusNode?.dispose();
    accountNumberTextController?.dispose();

    accountNumber2FocusNode?.dispose();
    accountNumber2TextController?.dispose();

    animacionmenuModel.dispose();
  }
}
