import '/app/app_registro/o_t_p_code_nomina/o_t_p_code_nomina_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ahorro_de_nominaedit_model.dart';
export 'ahorro_de_nominaedit_model.dart';

class AhorroDeNominaeditWidget extends StatefulWidget {
  const AhorroDeNominaeditWidget({
    super.key,
    required this.ahorroref,
    double? monto,
  }) : this.monto = monto ?? 0.0;

  final DocumentReference? ahorroref;
  final double monto;

  static String routeName = 'Ahorro_de_nominaedit';
  static String routePath = '/ahorroDeNominaedit';

  @override
  State<AhorroDeNominaeditWidget> createState() =>
      _AhorroDeNominaeditWidgetState();
}

class _AhorroDeNominaeditWidgetState extends State<AhorroDeNominaeditWidget> {
  late AhorroDeNominaeditModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AhorroDeNominaeditModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().lastAction = getCurrentTimestamp;
      safeSetState(() {});
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 10000),
        callback: (timer) async {
          if (functions.past5Mins(FFAppState().lastAction!)) {
            GoRouter.of(context).prepareAuthEvent();
            await authManager.signOut();
            GoRouter.of(context).clearRedirectLocation();

            context.goNamedAuth(
                CierredeSesionWidget.routeName, context.mounted);

            _model.instantTimer?.cancel();
          }
        },
        startImmediately: false,
      );
    });

    _model.amountTextController ??= TextEditingController();
    _model.amountFocusNode ??= FocusNode();

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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 250.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    FlutterFlowTheme.of(context).fondo,
                    FlutterFlowTheme.of(context).secondary
                  ],
                  stops: [0.0, 1.0],
                  begin: AlignmentDirectional(-1.0, 0.0),
                  end: AlignmentDirectional(1.0, 0),
                ),
              ),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/bkLysY.png',
                    ).image,
                  ),
                  gradient: LinearGradient(
                    colors: [
                      FlutterFlowTheme.of(context).fondo,
                      FlutterFlowTheme.of(context).secondary
                    ],
                    stops: [0.0, 1.0],
                    begin: AlignmentDirectional(-1.0, 0.0),
                    end: AlignmentDirectional(1.0, 0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0.0,
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.07584,
                        64.0,
                      ),
                      0.0,
                      0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.safePop();
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                            AutoSizeText(
                              'Mi ahorro',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Satoshi',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.02133,
                                      18.0,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ].divide(SizedBox(width: 8.0)),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0,
                                  valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.04266,
                                    36.0,
                                  ),
                                  0.0,
                                  0.0),
                              child: Image.asset(
                                'assets/images/WhZhVG.tif.png',
                                width: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).width * 0.12051,
                                  47.0,
                                ),
                                height: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.05569,
                                  47.0,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0,
                                  valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.01896,
                                    16.0,
                                  ),
                                  0.0,
                                  0.0),
                              child: AutoSizeText(
                                'Mi ahorro de nómina actual',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Satoshi',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      fontSize: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.02844,
                                        24.0,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).customColor4,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        0.0,
                        valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.01422,
                          12.0,
                        ),
                        0.0,
                        valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.01422,
                          12.0,
                        )),
                    child: AutoSizeText(
                      valueOrDefault<String>(
                        functions.formatAmount(valueOrDefault<double>(
                          widget!.monto,
                          0.0,
                        )),
                        '\$0',
                      ),
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Satoshi',
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            fontSize: valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.02844,
                              24.0,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      20.0,
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.02370,
                        20.0,
                      ),
                      20.0,
                      20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: AutoSizeText(
                                  'Modificar mi ahorro',
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
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
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 48.0, 0.0, 100.0),
                                    child: TextFormField(
                                      controller: _model.amountTextController,
                                      focusNode: _model.amountFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.amountTextController',
                                        Duration(milliseconds: 100),
                                        () => safeSetState(() {}),
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: false,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .customColor5,
                                              fontSize: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .height *
                                                    0.01659,
                                                14.0,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .customColor5,
                                              fontSize: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .height *
                                                    0.01659,
                                                14.0,
                                              ),
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .customColor5,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            color: FlutterFlowTheme.of(context)
                                                .customColor5,
                                            fontSize: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.01896,
                                              16.0,
                                            ),
                                            letterSpacing: 0.0,
                                          ),
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                              decimal: true),
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .customColor5,
                                      validator: _model
                                          .amountTextControllerValidator
                                          .asValidator(context),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp('^\\d*\\.?\\d{0,2}\$'))
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-0.01, -0.31),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 54.0, 0.0, 0.0),
                                      child: AutoSizeText(
                                        valueOrDefault<String>(
                                          functions.formatAmount(
                                              valueOrDefault<double>(
                                            double.tryParse(_model
                                                .amountTextController.text),
                                            0.0,
                                          )),
                                          '\$0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Satoshi',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .height *
                                                    0.03318,
                                                28.0,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ].divide(SizedBox(height: 8.0)),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 60.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            _model.otp =
                                random_data.randomInteger(100001, 999999);
                            safeSetState(() {});
                            _model.apiResultxl4 =
                                await SendGridEmailOTPEditNominaCall.call(
                              name: currentUserDisplayName,
                              date: dateTimeFormat(
                                "d/M/y",
                                getCurrentTimestamp,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                              otpCode: _model.otp?.toString(),
                              email: currentUserEmail,
                            );

                            if ((_model.apiResultxl4?.succeeded ?? true)) {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                useSafeArea: true,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: OTPCodeNominaWidget(
                                        code: _model.otp!.toString(),
                                        email: currentUserEmail,
                                        nomina: true,
                                        ahorroref: widget!.ahorroref,
                                        nuevomontoahorro: double.tryParse(
                                            _model.amountTextController.text),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            } else {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                useSafeArea: true,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: OTPCodeNominaWidget(
                                        code: _model.otp!.toString(),
                                        email: currentUserEmail,
                                        nomina: true,
                                        ahorroref: widget!.ahorroref,
                                        nuevomontoahorro: double.tryParse(
                                            _model.amountTextController.text),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            }

                            safeSetState(() {});
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
                            color: FlutterFlowTheme.of(context).customColor4,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Satoshi',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.01896,
                                    16.0,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ],
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
