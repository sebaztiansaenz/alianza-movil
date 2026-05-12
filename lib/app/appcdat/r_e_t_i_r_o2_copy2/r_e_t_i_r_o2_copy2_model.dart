import '/app/ahorros_pages/depositoahorro1/depositoahorro1_widget.dart';
import '/app/otros/animacionmenu/animacionmenu_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'r_e_t_i_r_o2_copy2_widget.dart' show RETIRO2Copy2Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RETIRO2Copy2Model extends FlutterFlowModel<RETIRO2Copy2Widget> {
  ///  Local state fields for this page.

  int? index = 0;

  double? monto = 9.577777777777778e+111;

  List<TotalDepositoAhorroStruct> totalesAhorro = [];
  void addToTotalesAhorro(TotalDepositoAhorroStruct item) =>
      totalesAhorro.add(item);
  void removeFromTotalesAhorro(TotalDepositoAhorroStruct item) =>
      totalesAhorro.remove(item);
  void removeAtIndexFromTotalesAhorro(int index) =>
      totalesAhorro.removeAt(index);
  void insertAtIndexInTotalesAhorro(
          int index, TotalDepositoAhorroStruct item) =>
      totalesAhorro.insert(index, item);
  void updateTotalesAhorroAtIndex(
          int index, Function(TotalDepositoAhorroStruct) updateFn) =>
      totalesAhorro[index] = updateFn(totalesAhorro[index]);

  List<TotalRetiroAhorroStruct> retirosAhorro = [];
  void addToRetirosAhorro(TotalRetiroAhorroStruct item) =>
      retirosAhorro.add(item);
  void removeFromRetirosAhorro(TotalRetiroAhorroStruct item) =>
      retirosAhorro.remove(item);
  void removeAtIndexFromRetirosAhorro(int index) =>
      retirosAhorro.removeAt(index);
  void insertAtIndexInRetirosAhorro(int index, TotalRetiroAhorroStruct item) =>
      retirosAhorro.insert(index, item);
  void updateRetirosAhorroAtIndex(
          int index, Function(TotalRetiroAhorroStruct) updateFn) =>
      retirosAhorro[index] = updateFn(retirosAhorro[index]);

  List<RetiroscdatStruct> retiro = [];
  void addToRetiro(RetiroscdatStruct item) => retiro.add(item);
  void removeFromRetiro(RetiroscdatStruct item) => retiro.remove(item);
  void removeAtIndexFromRetiro(int index) => retiro.removeAt(index);
  void insertAtIndexInRetiro(int index, RetiroscdatStruct item) =>
      retiro.insert(index, item);
  void updateRetiroAtIndex(int index, Function(RetiroscdatStruct) updateFn) =>
      retiro[index] = updateFn(retiro[index]);

  String? tiempo;

  int? visiblecalculos = 1;

  String? idcuenta;

  double? montomax = 0.0;

  double? ea = 1.0;

  int? list = 0;

  String? idcdat;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in RETIRO2Copy2 widget.
  List<AhorrosRecord>? ahorross;
  // Stores action output result for [Custom Action - getTotalForAccount] action in RETIRO2Copy2 widget.
  List<TotalDepositoAhorroStruct>? transactionsTotal;
  // Stores action output result for [Custom Action - withdrawalTotalAhorros] action in RETIRO2Copy2 widget.
  List<TotalRetiroAhorroStruct>? withdrawalTotal;
  InstantTimer? instantTimer;
  // State field(s) for amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountTextController;
  String? Function(BuildContext, String?)? amountTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  List<AhorrosRecord>? ahorro;
  // Model for animacionmenu component.
  late AnimacionmenuModel animacionmenuModel;

  @override
  void initState(BuildContext context) {
    animacionmenuModel = createModel(context, () => AnimacionmenuModel());
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    amountFocusNode?.dispose();
    amountTextController?.dispose();

    animacionmenuModel.dispose();
  }
}
