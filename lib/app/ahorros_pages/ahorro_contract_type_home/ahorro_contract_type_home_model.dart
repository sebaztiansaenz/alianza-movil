import '/app/ahorros_pages/ahorro_options_copy/ahorro_options_copy_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'ahorro_contract_type_home_widget.dart'
    show AhorroContractTypeHomeWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AhorroContractTypeHomeModel
    extends FlutterFlowModel<AhorroContractTypeHomeWidget> {
  ///  Local state fields for this component.

  int? index;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
