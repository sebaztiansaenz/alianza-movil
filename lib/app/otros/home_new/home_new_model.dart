import '/app/otros/app_eliminar/menu_new/menu_new_widget.dart';
import '/app/verificacion_component1/verificacion_component1_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'home_new_widget.dart' show HomeNewWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeNewModel extends FlutterFlowModel<HomeNewWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in HomeNew widget.
  VersionRecord? version;
  InstantTimer? instantTimer;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  int? cuenta;
  // Model for MenuNew component.
  late MenuNewModel menuNewModel;

  @override
  void initState(BuildContext context) {
    menuNewModel = createModel(context, () => MenuNewModel());
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    menuNewModel.dispose();
  }
}
