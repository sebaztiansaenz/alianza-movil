import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'perfil07_widget.dart' show Perfil07Widget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Perfil07Model extends FlutterFlowModel<Perfil07Widget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  InstantTimer? instantTimer;
  // State field(s) for ingresos widget.
  FocusNode? ingresosFocusNode1;
  TextEditingController? ingresosTextController1;
  String? Function(BuildContext, String?)? ingresosTextController1Validator;
  // State field(s) for ingresos widget.
  FocusNode? ingresosFocusNode2;
  TextEditingController? ingresosTextController2;
  String? Function(BuildContext, String?)? ingresosTextController2Validator;
  // State field(s) for ingresos widget.
  FocusNode? ingresosFocusNode3;
  TextEditingController? ingresosTextController3;
  String? Function(BuildContext, String?)? ingresosTextController3Validator;
  // State field(s) for ingresos widget.
  FocusNode? ingresosFocusNode4;
  TextEditingController? ingresosTextController4;
  String? Function(BuildContext, String?)? ingresosTextController4Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
    ingresosFocusNode1?.dispose();
    ingresosTextController1?.dispose();

    ingresosFocusNode2?.dispose();
    ingresosTextController2?.dispose();

    ingresosFocusNode3?.dispose();
    ingresosTextController3?.dispose();

    ingresosFocusNode4?.dispose();
    ingresosTextController4?.dispose();
  }
}
