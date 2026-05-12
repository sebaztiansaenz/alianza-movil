import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'detalles_transaccion_model.dart';
export 'detalles_transaccion_model.dart';

class DetallesTransaccionWidget extends StatefulWidget {
  const DetallesTransaccionWidget({
    super.key,
    required this.status,
    required this.idTransaccion,
    required this.apellidosynombres,
    required this.monto,
    required this.banco,
    required this.fecha,
    this.whitInfo,
    required this.typetransaction,
    required this.detalles,
  });

  final String? status;
  final String? idTransaccion;
  final String? apellidosynombres;
  final double? monto;
  final String? banco;
  final DateTime? fecha;
  final WithdrawalInfoStruct? whitInfo;
  final String? typetransaction;
  final String? detalles;

  static String routeName = 'DetallesTransaccion';
  static String routePath = '/detallesTransaccion';

  @override
  State<DetallesTransaccionWidget> createState() =>
      _DetallesTransaccionWidgetState();
}

class _DetallesTransaccionWidgetState extends State<DetallesTransaccionWidget> {
  late DetallesTransaccionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetallesTransaccionModel());

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

            context.pushNamedAuth(
                CierredeSesionWidget.routeName, context.mounted);

            _model.instantTimer?.cancel();
          }
        },
        startImmediately: false,
      );
    });

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
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 8.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.arrow_back_outlined,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                context.safePop();
                              },
                            ),
                          ].divide(SizedBox(width: 12.0)),
                        ),
                      ],
                    ),
                  ),
                ),
                Builder(
                  builder: (context) {
                    if (widget!.status == 'APPROVED') {
                      return Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 24.0, 24.0, 24.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 36.0,
                                height: 36.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF58E089),
                                  borderRadius: BorderRadius.circular(45.0),
                                ),
                                child: Icon(
                                  Icons.check_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  size: 20.0,
                                ),
                              ),
                              Text(
                                'Transacción exitosa',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .override(
                                      fontFamily: 'Satoshi',
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ].divide(SizedBox(height: 16.0)),
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFEEF1FA),
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 24.0, 24.0, 24.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 36.0,
                                height: 36.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).error,
                                  borderRadius: BorderRadius.circular(45.0),
                                ),
                                child: Icon(
                                  Icons.clear_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  size: 20.0,
                                ),
                              ),
                              AutoSizeText(
                                'Transacción rechazada',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .override(
                                      fontFamily: 'Satoshi',
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ].divide(SizedBox(height: 16.0)),
                          ),
                        ),
                      );
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: AutoSizeText(
                    'Depósito realizado por:',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Satoshi',
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                AutoSizeText(
                  valueOrDefault<String>(
                    widget!.typetransaction == 'Depositado'
                        ? 'PSE'
                        : valueOrDefault<String>(
                            widget!.whitInfo?.bankName,
                            'Bank',
                          ),
                    'PSE',
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Satoshi',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 24.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Divider(
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).alternate,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Image.asset(
                                  'assets/images/1fd.png',
                                  width: 32.0,
                                  height: 32.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    valueOrDefault<String>(
                                      widget!.idTransaccion,
                                      'Id',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  AutoSizeText(
                                    'Id de transacción',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                  ),
                                ],
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Image.asset(
                                  'assets/images/1df.png',
                                  width: 32.0,
                                  height: 32.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AuthUserStreamWidget(
                                    builder: (context) => AutoSizeText(
                                      valueOrDefault<String>(
                                        currentUserDisplayName,
                                        'Nombre',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  AutoSizeText(
                                    'Apellidos y nombres',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                  ),
                                ],
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Image.asset(
                                  'assets/images/2df.png',
                                  width: 32.0,
                                  height: 32.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    valueOrDefault<String>(
                                      functions.formatAmount(widget!.monto!),
                                      'Sin monto',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  AutoSizeText(
                                    'Monto',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                  ),
                                ],
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Image.asset(
                                  'assets/images/3fd.png',
                                  width: 32.0,
                                  height: 32.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    valueOrDefault<String>(
                                      widget!.banco,
                                      'Banco',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  AutoSizeText(
                                    'Banco',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                  ),
                                ],
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Image.asset(
                                  'assets/images/4fd.png',
                                  width: 32.0,
                                  height: 32.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    '${dateTimeFormat(
                                      "d/M/y",
                                      widget!.fecha,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    )} - ${dateTimeFormat(
                                      "jms",
                                      widget!.fecha,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    )}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  AutoSizeText(
                                    'Fecha',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                  ),
                                ],
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Image.asset(
                                  'assets/images/Frame_(4).png',
                                  width: 32.0,
                                  height: 32.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    valueOrDefault<String>(
                                      widget!.detalles,
                                      'Sin detalles',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  AutoSizeText(
                                    'Detalles',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                  ),
                                ],
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                        ].divide(SizedBox(height: 18.0)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 28.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 48.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEF1FA),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(14.0, 0.0, 14.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Image.asset(
                                  'assets/images/Group_123_(1).png',
                                  width: 20.0,
                                  height: 20.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              AutoSizeText(
                                'Ver comprobantes',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Satoshi',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ].divide(SizedBox(width: 8.0)),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 12.0)),
            ),
          ),
        ),
      ),
    );
  }
}
