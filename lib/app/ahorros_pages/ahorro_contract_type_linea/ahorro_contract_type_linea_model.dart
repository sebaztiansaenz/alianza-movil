import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'ahorro_contract_type_linea_widget.dart'
    show AhorroContractTypeLineaWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AhorroContractTypeLineaModel
    extends FlutterFlowModel<AhorroContractTypeLineaWidget> {
  ///  Local state fields for this component.

  int? index;

  List<String> typeList = [
    'Ahorro nomina',
    'Ahorro permanente',
    'Ahorro con propósito'
  ];
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
