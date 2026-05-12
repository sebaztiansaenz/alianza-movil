import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'ahorro_bank_account_type_widget.dart' show AhorroBankAccountTypeWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AhorroBankAccountTypeModel
    extends FlutterFlowModel<AhorroBankAccountTypeWidget> {
  ///  Local state fields for this component.

  int? index;

  List<String> typeList = ['Cuenta de ahorros', 'Cuenta corriente'];
  void addToTypeList(String item) => typeList.add(item);
  void removeFromTypeList(String item) => typeList.remove(item);
  void removeAtIndexFromTypeList(int index) => typeList.removeAt(index);
  void insertAtIndexInTypeList(int index, String item) =>
      typeList.insert(index, item);
  void updateTypeListAtIndex(int index, Function(String) updateFn) =>
      typeList[index] = updateFn(typeList[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
