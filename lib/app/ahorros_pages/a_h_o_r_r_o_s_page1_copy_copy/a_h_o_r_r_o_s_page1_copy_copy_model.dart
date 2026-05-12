import '/app/ahorros_pages/depositoahorro1/depositoahorro1_widget.dart';
import '/app/ahorros_pages/retiros1/retiros1_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'a_h_o_r_r_o_s_page1_copy_copy_widget.dart'
    show AHORROSPage1CopyCopyWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AHORROSPage1CopyCopyModel
    extends FlutterFlowModel<AHORROSPage1CopyCopyWidget> {
  ///  Local state fields for this page.

  bool historico = false;

  int? list = 0;

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

  bool? color = false;

  bool? totalCargado;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in AHORRO_SPage1CopyCopy widget.
  List<AhorrosRecord>? ahorrosQuery;
  // Stores action output result for [Custom Action - getTotalForAccount] action in AHORRO_SPage1CopyCopy widget.
  List<TotalDepositoAhorroStruct>? depositosAhorrosTotal;
  // Stores action output result for [Custom Action - withdrawalTotalAhorros] action in AHORRO_SPage1CopyCopy widget.
  List<TotalRetiroAhorroStruct>? withdrawalTotalAhorros;
  InstantTimer? instantTimer;
  // Stores action output result for [Firestore Query - Query a collection] action in AHORRO_SPage1CopyCopy widget.
  VersionRecord? version;
  // Stores action output result for [Custom Action - getVersion1] action in AHORRO_SPage1CopyCopy widget.
  String? actualizar;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}
