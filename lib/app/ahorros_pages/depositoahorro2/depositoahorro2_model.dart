import '/app/ahorros_pages/banks/banks_widget.dart';
import '/app/ahorros_pages/nuevodepositoahorro/nuevodepositoahorro_widget.dart';
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
import '/flutter_flow/random_data_util.dart' as random_data;
import 'depositoahorro2_widget.dart' show Depositoahorro2Widget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Depositoahorro2Model extends FlutterFlowModel<Depositoahorro2Widget> {
  ///  Local state fields for this page.

  bool invalidAmount = false;

  DocumentReference? idahorro;

  List<TotalRetiroAhorroStruct> withdrawals = [];
  void addToWithdrawals(TotalRetiroAhorroStruct item) => withdrawals.add(item);
  void removeFromWithdrawals(TotalRetiroAhorroStruct item) =>
      withdrawals.remove(item);
  void removeAtIndexFromWithdrawals(int index) => withdrawals.removeAt(index);
  void insertAtIndexInWithdrawals(int index, TotalRetiroAhorroStruct item) =>
      withdrawals.insert(index, item);
  void updateWithdrawalsAtIndex(
          int index, Function(TotalRetiroAhorroStruct) updateFn) =>
      withdrawals[index] = updateFn(withdrawals[index]);

  List<TotalDepositoAhorroStruct> total = [];
  void addToTotal(TotalDepositoAhorroStruct item) => total.add(item);
  void removeFromTotal(TotalDepositoAhorroStruct item) => total.remove(item);
  void removeAtIndexFromTotal(int index) => total.removeAt(index);
  void insertAtIndexInTotal(int index, TotalDepositoAhorroStruct item) =>
      total.insert(index, item);
  void updateTotalAtIndex(
          int index, Function(TotalDepositoAhorroStruct) updateFn) =>
      total[index] = updateFn(total[index]);

  ///  State fields for stateful widgets in this page.

  InstantTimer? psetimer;
  // Stores action output result for [Firestore Query - Query a collection] action in depositoahorro2 widget.
  List<AhorrosRecord>? ahorros;
  // Stores action output result for [Custom Action - getTotalForAccount] action in depositoahorro2 widget.
  List<TotalDepositoAhorroStruct>? transactionsTotal;
  // Stores action output result for [Custom Action - withdrawalTotalAhorros] action in depositoahorro2 widget.
  List<TotalRetiroAhorroStruct>? withdrawalTotal;
  // State field(s) for amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountTextController;
  String? Function(BuildContext, String?)? amountTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<TransactionsRecord>? transactions;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    psetimer?.cancel();
    amountFocusNode?.dispose();
    amountTextController?.dispose();
  }
}
