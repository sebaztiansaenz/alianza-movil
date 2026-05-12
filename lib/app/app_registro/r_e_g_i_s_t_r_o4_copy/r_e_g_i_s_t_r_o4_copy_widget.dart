import '/backend/api_requests/api_calls.dart';
import '/components/mensajeconfirmacion_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/sucess_mensaje/sucess_mensaje_widget.dart';
import '/pages/sucess_mensaje_error/sucess_mensaje_error_widget.dart';
import 'dart:ui';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'r_e_g_i_s_t_r_o4_copy_model.dart';
export 'r_e_g_i_s_t_r_o4_copy_model.dart';

class REGISTRO4CopyWidget extends StatefulWidget {
  const REGISTRO4CopyWidget({
    super.key,
    required this.code,
    required this.email,
  });

  final String? code;
  final String? email;

  static String routeName = 'REGISTRO4Copy';
  static String routePath = '/rEGISTRO4Copy';

  @override
  State<REGISTRO4CopyWidget> createState() => _REGISTRO4CopyWidgetState();
}

class _REGISTRO4CopyWidgetState extends State<REGISTRO4CopyWidget> {
  late REGISTRO4CopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => REGISTRO4CopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onStartTimer();
      _model.otpcode = widget!.code;
      safeSetState(() {});
    });

    _model.pinCodeFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Material(
              color: Colors.transparent,
              elevation: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.network(
                      '',
                    ).image,
                  ),
                  gradient: LinearGradient(
                    colors: [Color(0xFF006AD8), Color(0xFF002CE9)],
                    stops: [0.0, 1.0],
                    begin: AlignmentDirectional(-1.0, 0.0),
                    end: AlignmentDirectional(1.0, 0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0.0,
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.07110,
                        60.0,
                      ),
                      0.0,
                      4.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0,
                            valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.01422,
                              12.0,
                            ),
                            8.0,
                            0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      30.0, 0.0, 16.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: Image.asset(
                                      'assets/images/phone.png',
                                      width: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).width *
                                            0.05897,
                                        23.0,
                                      ),
                                      height: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.05688,
                                        48.0,
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: AutoSizeText(
                                    'VERIFICACION OTP',
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.02133,
                                            18.0,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    30.0, 0.0, 16.0, 0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Image.asset(
                                    'assets/images/Group_(10).png',
                                    width: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).width *
                                          0.07179,
                                      28.0,
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0,
                            valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.02370,
                              20.0,
                            ),
                            0.0,
                            valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.01185,
                              10.0,
                            )),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 6.0,
                          decoration: BoxDecoration(
                            color: Color(0xFF678EC9),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 18.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.safePop();
                                },
                                child: Container(
                                  width: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).width * 0.12821,
                                    50.0,
                                  ),
                                  height: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.05925,
                                    50.0,
                                  ),
                                  decoration: BoxDecoration(),
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.04266,
                                    36.0,
                                  ),
                                  height: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.04266,
                                    36.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .customColor4,
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Icon(
                                    Icons.check_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.02844,
                                      24.0,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.04266,
                                    36.0,
                                  ),
                                  height: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.04266,
                                    36.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .customColor4,
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Icon(
                                    Icons.check_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.02844,
                                      24.0,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.04266,
                                    36.0,
                                  ),
                                  height: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.04266,
                                    36.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .customColor4,
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Icon(
                                    Icons.check_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.02844,
                                      24.0,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.04266,
                                    36.0,
                                  ),
                                  height: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.04266,
                                    36.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: AutoSizeText(
                                    '4',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          fontSize: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.01659,
                                            14.0,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                                Container(
                                  width: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.04266,
                                    36.0,
                                  ),
                                  height: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.04266,
                                    36.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0x1FFFFFFF),
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: AutoSizeText(
                                    '5',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          fontSize: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.01659,
                                            14.0,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 4.0)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 44.0, 20.0, 20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/Vector.png',
                            width: valueOrDefault<double>(
                              MediaQuery.sizeOf(context).width * 0.10256,
                              40.0,
                            ),
                            height: valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.04740,
                              40.0,
                            ),
                            fit: BoxFit.contain,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: AutoSizeText(
                            'Hemos enviado un código de 6 dígitos a',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Satoshi',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: AutoSizeText(
                            valueOrDefault<String>(
                              widget!.email,
                              '- - - ',
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Satoshi',
                                  color:
                                      FlutterFlowTheme.of(context).customColor4,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: AutoSizeText(
                            'Verifica tu bandeja de entrada y/o spam.',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Satoshi',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.01659,
                                    14.0,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 36.0, 0.0, 0.0),
                          child: PinCodeTextField(
                            autoDisposeControllers: false,
                            appContext: context,
                            length: 6,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                  fontFamily: 'Satoshi',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                ),
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            enableActiveFill: true,
                            autoFocus: false,
                            focusNode: _model.pinCodeFocusNode,
                            enablePinAutofill: false,
                            errorTextSpace: 16.0,
                            showCursor: true,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            obscureText: true,
                            obscuringCharacter: '●',
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            pinTheme: PinTheme(
                              fieldHeight: valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.05688,
                                48.0,
                              ),
                              fieldWidth: valueOrDefault<double>(
                                MediaQuery.sizeOf(context).width * 0.12308,
                                48.0,
                              ),
                              borderWidth: 1.0,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0),
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                              ),
                              shape: PinCodeFieldShape.box,
                              activeColor: Color(0x00FFFFFF),
                              inactiveColor: Color(0x50FFFFFF),
                              selectedColor:
                                  FlutterFlowTheme.of(context).secondary,
                              activeFillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              inactiveFillColor: Color(0xFFEEF1FA),
                              selectedFillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            controller: _model.pinCodeController,
                            onChanged: (_) {},
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: _model.pinCodeControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: AutoSizeText(
                                '¿No te llegó ningún código?',
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                minFontSize: 10.0,
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Satoshi',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.01659,
                                        14.0,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Builder(
                                  builder: (context) => InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (_model.reintentar) {
                                        _model.otpcode = random_data
                                            .randomInteger(100000, 999999)
                                            .toString();
                                        safeSetState(() {});
                                        _model.code2 =
                                            await SendGridEmailOTPCopyCall.call(
                                          name: FFAppState()
                                              .userInformation
                                              .fullName,
                                          date: dateTimeFormat(
                                            "EEEE d MMM y H:mm",
                                            getCurrentTimestamp,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ),
                                          otpCode: _model.otpcode,
                                          email: widget!.email,
                                          imageURL:
                                              'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/2c6f7b6002e921d88fea7625edb1d76ab1d5946ee2876f9d7329e8a89c35ace1287a70f4e8629e0a806e52e9d0317f070c357651a2011501d29eb29bb84dfcce5f1a003ef66086b450b1d88bb2928e790b73d36d700d0919a8f5f2c0edf9b87ad482a6b8.webp?alt=media&token=9d10cd74-7c9c-4967-a5f1-0aed5564796f',
                                        );

                                        _model.timerController.onStopTimer();
                                        _model.timerController.onResetTimer();

                                        _model.reintentar = false;
                                        safeSetState(() {});
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 1.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(dialogContext)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: SucessMensajeWidget(
                                                  titulo: 'Código reenviado!',
                                                  descripcion:
                                                      'Verifica tu bandeja de entrado y/o spam.',
                                                ),
                                              ),
                                            );
                                          },
                                        );

                                        _model.timerController.onStartTimer();
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .clearSnackBars();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Error!',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .error,
                                          ),
                                        );
                                      }

                                      safeSetState(() {});
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 0.0),
                                          child: AutoSizeText(
                                            'Reenviar código (',
                                            textAlign: TextAlign.start,
                                            maxLines: 1,
                                            minFontSize: 10.0,
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  color: valueOrDefault<Color>(
                                                    _model.reintentar == true
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                  ),
                                                  fontSize:
                                                      valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.01659,
                                                    14.0,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          child: FlutterFlowTimer(
                                            initialTime:
                                                _model.timerInitialTimeMs,
                                            getDisplayTime: (value) =>
                                                StopWatchTimer.getDisplayTime(
                                              value,
                                              hours: false,
                                              minute: false,
                                              milliSecond: false,
                                            ),
                                            controller: _model.timerController,
                                            updateStateInterval:
                                                Duration(milliseconds: 1000),
                                            onChanged: (value, displayTime,
                                                shouldUpdate) {
                                              _model.timerMilliseconds = value;
                                              _model.timerValue = displayTime;
                                              if (shouldUpdate)
                                                safeSetState(() {});
                                            },
                                            onEnded: () async {
                                              _model.reintentar = true;
                                              safeSetState(() {});
                                            },
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  color: valueOrDefault<Color>(
                                                    _model.reintentar == true
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                  ),
                                                  fontSize:
                                                      valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.01659,
                                                    14.0,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 0.0),
                                          child: AutoSizeText(
                                            ')',
                                            textAlign: TextAlign.end,
                                            maxLines: 1,
                                            minFontSize: 10.0,
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  color: valueOrDefault<Color>(
                                                    _model.reintentar == true
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                  ),
                                                  fontSize:
                                                      valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.01659,
                                                    14.0,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 140.0,
                                  child: Divider(
                                    height: 1.0,
                                    thickness: 2.0,
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                  ),
                                ),
                              ],
                            ),
                          ].divide(SizedBox(width: 8.0)),
                        ),
                        Builder(
                          builder: (context) => Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0,
                                valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.04740,
                                  40.0,
                                ),
                                0.0,
                                valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.04740,
                                  40.0,
                                )),
                            child: FFButtonWidget(
                              onPressed: () async {
                                if (_model.pinCodeController!.text ==
                                    _model.otpcode) {
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: GestureDetector(
                                          onTap: () {
                                            FocusScope.of(dialogContext)
                                                .unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: MensajeconfirmacionWidget(),
                                        ),
                                      );
                                    },
                                  );

                                  await Future.delayed(
                                    Duration(
                                      milliseconds: 1000,
                                    ),
                                  );

                                  context.pushNamed(
                                    REGISTRO5MainWidget.routeName,
                                    extra: <String, dynamic>{
                                      '__transition_info__': TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: GestureDetector(
                                          onTap: () {
                                            FocusScope.of(dialogContext)
                                                .unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: SucessMensajeErrorWidget(
                                            titulo: 'Código incorrecto!',
                                            descripcion:
                                                'Por favor, vuelva a intentarlo.',
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }
                              },
                              text: 'Continuar',
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.05688,
                                  48.0,
                                ),
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color:
                                    FlutterFlowTheme.of(context).customColor4,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Satoshi',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.02370,
                                        20.0,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
