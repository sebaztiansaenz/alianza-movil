import '/app/ahorros_pages/ahorro_contract_type_home/ahorro_contract_type_home_widget.dart';
import '/app/otros/animacionmenu/animacionmenu_widget.dart';
import '/app/otros/app_eliminar/menu_arriba/menu_arriba_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'a_h_o_r_r_o_s_page1_widget.dart' show AHORROSPage1Widget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AHORROSPage1Model extends FlutterFlowModel<AHORROSPage1Widget> {
  ///  Local state fields for this page.

  double? total;

  double? withdrawals;

  bool historico = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in AHORRO_SPage1 widget.
  List<AhorrosRecord>? ahorros;
  // Stores action output result for [Custom Action - transactionsTotal] action in AHORRO_SPage1 widget.
  double? transactionsTotal;
  // Stores action output result for [Custom Action - withdrawalTotal] action in AHORRO_SPage1 widget.
  double? withdrawalTotal;
  InstantTimer? instantTimer;
  // Model for MenuArriba component.
  late MenuArribaModel menuArribaModel;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // Model for animacionmenu component.
  late AnimacionmenuModel animacionmenuModel;

  @override
  void initState(BuildContext context) {
    menuArribaModel = createModel(context, () => MenuArribaModel());
    animacionmenuModel = createModel(context, () => AnimacionmenuModel());
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    menuArribaModel.dispose();
    animacionmenuModel.dispose();
  }
}
