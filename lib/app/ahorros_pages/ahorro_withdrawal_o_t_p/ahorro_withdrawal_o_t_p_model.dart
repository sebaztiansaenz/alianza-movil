import '/app/otros/animacionmenu/animacionmenu_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/pages/sucess_mensaje/sucess_mensaje_widget.dart';
import '/pages/sucess_mensaje_error/sucess_mensaje_error_widget.dart';
import 'dart:async';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'ahorro_withdrawal_o_t_p_widget.dart' show AhorroWithdrawalOTPWidget;
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AhorroWithdrawalOTPModel
    extends FlutterFlowModel<AhorroWithdrawalOTPWidget> {
  ///  Local state fields for this page.

  int? otp = 0;

  bool reenviar = false;

  bool isUnique = false;

  String? cusCode = '';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in AhorroWithdrawalOTP widget.
  int? count;
  InstantTimer? instantTimer;
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  String? _pinCodeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingresa el código OTP enviado a tu correo electrónico';
    }
    if (val.length < 6) {
      return 'Requires 6 characters.';
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (sendGridEmailOTPahorro Copy)] action in Row widget.
  ApiCallResponse? apiResulteml;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 60000;
  int timerMilliseconds = 60000;
  String timerValue = StopWatchTimer.getDisplayTime(
    60000,
    hours: false,
    minute: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  AhorrosRecord? ahorro;
  // Model for animacionmenu component.
  late AnimacionmenuModel animacionmenuModel;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
    pinCodeControllerValidator = _pinCodeControllerValidator;
    animacionmenuModel = createModel(context, () => AnimacionmenuModel());
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();

    timerController.dispose();
    animacionmenuModel.dispose();
  }
}
