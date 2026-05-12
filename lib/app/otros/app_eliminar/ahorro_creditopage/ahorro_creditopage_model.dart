import '/app/otros/animacionmenu/animacionmenu_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'ahorro_creditopage_widget.dart' show AhorroCreditopageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AhorroCreditopageModel extends FlutterFlowModel<AhorroCreditopageWidget> {
  ///  Local state fields for this page.

  int? index;

  DocumentReference? selectedBankRef;

  double? monto;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  InstantTimer? instantTimer;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'ingrese un monto';
    }

    if (!RegExp('^[0-9]+\$').hasMatch(val)) {
      return 'el numero debe ser de 0-9';
    }
    return null;
  }

  // Model for animacionmenu component.
  late AnimacionmenuModel animacionmenuModel;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
    animacionmenuModel = createModel(context, () => AnimacionmenuModel());
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    animacionmenuModel.dispose();
  }
}
