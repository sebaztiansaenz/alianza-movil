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
import 'retiro2new_widget.dart' show Retiro2newWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Retiro2newModel extends FlutterFlowModel<Retiro2newWidget> {
  ///  Local state fields for this page.

  DocumentReference? seleccionado;

  bool historico = false;

  int? index = 0;

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

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in retiro2new widget.
  List<AhorrosRecord>? ahorross;
  // Stores action output result for [Custom Action - getTotalForAccount] action in retiro2new widget.
  List<TotalDepositoAhorroStruct>? transactionsTotal;
  // Stores action output result for [Custom Action - withdrawalTotalAhorros] action in retiro2new widget.
  List<TotalRetiroAhorroStruct>? withdrawalTotal;
  InstantTimer? instantTimer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}
