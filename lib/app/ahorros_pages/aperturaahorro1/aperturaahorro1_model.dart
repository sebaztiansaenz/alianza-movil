import '/app/app_contrasea/cerrar_sesion_movil/cerrar_sesion_movil_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'aperturaahorro1_widget.dart' show Aperturaahorro1Widget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Aperturaahorro1Model extends FlutterFlowModel<Aperturaahorro1Widget> {
  ///  Local state fields for this page.

  List<int> objetivo = [];
  void addToObjetivo(int item) => objetivo.add(item);
  void removeFromObjetivo(int item) => objetivo.remove(item);
  void removeAtIndexFromObjetivo(int index) => objetivo.removeAt(index);
  void insertAtIndexInObjetivo(int index, int item) =>
      objetivo.insert(index, item);
  void updateObjetivoAtIndex(int index, Function(int) updateFn) =>
      objetivo[index] = updateFn(objetivo[index]);

  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  int? cuenta;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}
