import '/app/otros/animacionmenu/animacionmenu_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'home_new2_widget.dart' show HomeNew2Widget;
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

class HomeNew2Model extends FlutterFlowModel<HomeNew2Widget> {
  ///  Local state fields for this page.

  double? total = 0.0;

  double? withdrawals = 0.0;

  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  // Stores action output result for [Firestore Query - Query a collection] action in HomeNew2 widget.
  VersionRecord? version;
  // Stores action output result for [Custom Action - getVersion1] action in HomeNew2 widget.
  String? actualizar;
  // Stores action output result for [Firestore Query - Query a collection] action in HomeNew2 widget.
  List<AhorrosRecord>? ahorros127;
  // Stores action output result for [Custom Action - transactionsTotal] action in HomeNew2 widget.
  double? transactionsTotal;
  // Stores action output result for [Custom Action - withdrawalTotal] action in HomeNew2 widget.
  double? withdrawalTotal;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  int? cuenta;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // Model for animacionmenu component.
  late AnimacionmenuModel animacionmenuModel;

  @override
  void initState(BuildContext context) {
    animacionmenuModel = createModel(context, () => AnimacionmenuModel());
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    animacionmenuModel.dispose();
  }
}
