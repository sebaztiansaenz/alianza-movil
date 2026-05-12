import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'detalles_transaccion_copy_copy_model.dart';
export 'detalles_transaccion_copy_copy_model.dart';

class DetallesTransaccionCopyCopyWidget extends StatefulWidget {
  const DetallesTransaccionCopyCopyWidget({
    super.key,
    required this.status,
    required this.idTransaccion,
    required this.apellidosynombres,
    required this.monto,
    required this.banco,
    required this.fecha,
    required this.typetransaction,
    required this.detalles,
    this.cdats,
    required this.iscdat,
    required this.tipocuenta,
    required this.numerocuenta,
  });

  final String? status;
  final String? idTransaccion;
  final String? apellidosynombres;
  final double? monto;
  final String? banco;
  final DateTime? fecha;
  final String? typetransaction;
  final String? detalles;
  final DocumentReference? cdats;
  final bool? iscdat;
  final String? tipocuenta;
  final String? numerocuenta;

  static String routeName = 'DetallesTransaccionCopyCopy';
  static String routePath = '/detallesTransaccionCopyCopy';

  @override
  State<DetallesTransaccionCopyCopyWidget> createState() =>
      _DetallesTransaccionCopyCopyWidgetState();
}

class _DetallesTransaccionCopyCopyWidgetState
    extends State<DetallesTransaccionCopyCopyWidget> {
  late DetallesTransaccionCopyCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetallesTransaccionCopyCopyModel());

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
        body: SingleChildScrollView(
          primary: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: FlutterFlowIconButton(
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
                          ),
                        ].divide(SizedBox(width: 12.0)),
                      ),
                    ],
                  ),
                ),
              ),
              Builder(
                builder: (context) {
                  if ((widget!.status == 'completado') &&
                      (widget!.iscdat != true)) {
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 24.0, 24.0, 24.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).width * 0.25641,
                                  100.0,
                                ),
                                height: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.11848,
                                  100.0,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: Image.asset(
                                      'assets/images/Group_126.png',
                                    ).image,
                                  ),
                                ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  functions.formatAmount(widget!.monto!),
                                  '0',
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .override(
                                      fontFamily: 'Satoshi',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Text(
                                'Transacción Exitosa',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .override(
                                      fontFamily: 'Satoshi',
                                      color: Color(0xFF002CE9),
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ].divide(SizedBox(height: 16.0)),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
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
                              width: valueOrDefault<double>(
                                MediaQuery.sizeOf(context).width * 0.25641,
                                100.0,
                              ),
                              height: valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.11848,
                                100.0,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: Image.asset(
                                    'assets/images/Group_126_(1).png',
                                  ).image,
                                ),
                              ),
                            ),
                            Text(
                              valueOrDefault<String>(
                                functions.formatAmount(widget!.monto!),
                                '0',
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    fontFamily: 'Satoshi',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.02844,
                                      24.0,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              'Transacción Exitosa',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    fontFamily: 'Satoshi',
                                    color: Color(0xFF2CA964),
                                    fontSize: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.02844,
                                      24.0,
                                    ),
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
                  valueOrDefault<String>(
                    (widget!.status == 'completado') && (widget!.iscdat != true)
                        ? 'Transferencia ACH'
                        : 'Inversión CDAT',
                    'Inversión CDAT',
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Satoshi',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.01896,
                          16.0,
                        ),
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              AutoSizeText(
                'Depósito realizado por:',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Satoshi',
                      fontSize: valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.01659,
                        14.0,
                      ),
                      letterSpacing: 0.0,
                    ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: AutoSizeText(
                  valueOrDefault<String>(
                    widget!.idTransaccion,
                    '--',
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Satoshi',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.01896,
                          16.0,
                        ),
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              AutoSizeText(
                'ID de transacción',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Satoshi',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.01659,
                        14.0,
                      ),
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                    ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFEEF1FA),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AutoSizeText(
                                            valueOrDefault<String>(
                                              widget!.banco,
                                              'Banco',
                                            ),
                                            textAlign: TextAlign.start,
                                            maxLines: 2,
                                            minFontSize: 12.0,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  fontSize:
                                                      valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.01896,
                                                    16.0,
                                                  ),
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
                                                  fontSize:
                                                      valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.01659,
                                                    14.0,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (widget!.iscdat != true)
                                      Flexible(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: AuthUserStreamWidget(
                                                builder: (context) =>
                                                    AutoSizeText(
                                                  valueOrDefault<String>(
                                                    currentUserDisplayName,
                                                    'Nombre',
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  maxLines: 2,
                                                  minFontSize: 12.0,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Satoshi',
                                                        fontSize:
                                                            valueOrDefault<
                                                                double>(
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .height *
                                                              0.01896,
                                                          16.0,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            AutoSizeText(
                                              'Apellidos y nombres',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Satoshi',
                                                    fontSize:
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.01659,
                                                      14.0,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (widget!.iscdat == true)
                                      Flexible(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: AutoSizeText(
                                                valueOrDefault<String>(
                                                  widget!.tipocuenta,
                                                  '-',
                                                ),
                                                textAlign: TextAlign.start,
                                                maxLines: 2,
                                                minFontSize: 12.0,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          fontSize:
                                                              valueOrDefault<
                                                                  double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.01896,
                                                            16.0,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                            AutoSizeText(
                                              'Tipo de cuenta',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Satoshi',
                                                    fontSize:
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.01659,
                                                      14.0,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                              ].divide(SizedBox(height: 18.0)),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (widget!.iscdat != true)
                                      Flexible(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AutoSizeText(
                                              '${dateTimeFormat(
                                                "d/M/y",
                                                widget!.fecha,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              )} - ${dateTimeFormat(
                                                "jms",
                                                widget!.fecha,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              )}',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Satoshi',
                                                    fontSize:
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.01896,
                                                      16.0,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                            AutoSizeText(
                                              'Fecha',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Satoshi',
                                                    fontSize:
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.01659,
                                                      14.0,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (widget!.iscdat == true)
                                      Flexible(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AutoSizeText(
                                              valueOrDefault<String>(
                                                widget!.numerocuenta,
                                                '-',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Satoshi',
                                                    fontSize:
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.01896,
                                                      16.0,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                            AutoSizeText(
                                              'Número de cuenta',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Satoshi',
                                                    fontSize:
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.01659,
                                                      14.0,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (widget!.iscdat != true)
                                      Flexible(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AutoSizeText(
                                              valueOrDefault<String>(
                                                widget!.detalles,
                                                'Sin detalles',
                                              ),
                                              textAlign: TextAlign.start,
                                              maxLines: 2,
                                              minFontSize: 10.0,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Satoshi',
                                                    fontSize:
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.01896,
                                                      16.0,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                            AutoSizeText(
                                              'Detalles',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Satoshi',
                                                    fontSize:
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.01659,
                                                      14.0,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (widget!.iscdat == true)
                                      Flexible(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AutoSizeText(
                                              '${dateTimeFormat(
                                                "d/M/y",
                                                widget!.fecha,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              )} - ${dateTimeFormat(
                                                "jms",
                                                widget!.fecha,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              )}',
                                              textAlign: TextAlign.start,
                                              maxLines: 2,
                                              minFontSize: 10.0,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Satoshi',
                                                    fontSize:
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.01896,
                                                      16.0,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                            AutoSizeText(
                                              'Fecha de ejecución',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Satoshi',
                                                    fontSize:
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.01659,
                                                      14.0,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                              ].divide(SizedBox(height: 18.0)),
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
      ),
    );
  }
}
