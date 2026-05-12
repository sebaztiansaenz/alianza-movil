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
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'detalles_transaccion_retiro_copy_copy_model.dart';
export 'detalles_transaccion_retiro_copy_copy_model.dart';

class DetallesTransaccionRetiroCopyCopyWidget extends StatefulWidget {
  const DetallesTransaccionRetiroCopyCopyWidget({
    super.key,
    required this.status,
    required this.idTransaccion,
    required this.apellidosynombres,
    required this.monto,
    required this.fecha,
    required this.typetransaction,
    required this.detalles,
    required this.fecharetiro,
    this.banco,
    this.numerobanco,
    this.tipocuentabanco,
    required this.ahorroCdat,
  });

  final String? status;
  final String? idTransaccion;
  final String? apellidosynombres;
  final double? monto;
  final DateTime? fecha;
  final String? typetransaction;
  final String? detalles;
  final DateTime? fecharetiro;
  final String? banco;
  final String? numerobanco;
  final String? tipocuentabanco;
  final bool? ahorroCdat;

  static String routeName = 'DetallesTransaccionRetiroCopyCopy';
  static String routePath = '/detallesTransaccionRetiroCopyCopy';

  @override
  State<DetallesTransaccionRetiroCopyCopyWidget> createState() =>
      _DetallesTransaccionRetiroCopyCopyWidgetState();
}

class _DetallesTransaccionRetiroCopyCopyWidgetState
    extends State<DetallesTransaccionRetiroCopyCopyWidget> {
  late DetallesTransaccionRetiroCopyCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => DetallesTransaccionRetiroCopyCopyModel());

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
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 60.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
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
                  ],
                ),
              ),
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if ((widget!.status == 'completado') &&
                              (widget!.ahorroCdat != true))
                            Image.asset(
                              'assets/images/Group_126.png',
                              width: valueOrDefault<double>(
                                MediaQuery.sizeOf(context).width * 0.25641,
                                100.0,
                              ),
                              height: valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.11848,
                                100.0,
                              ),
                              fit: BoxFit.contain,
                            ),
                          if (widget!.status == 'rechazado')
                            Image.asset(
                              'assets/images/Group_127_(2).png',
                              width: valueOrDefault<double>(
                                MediaQuery.sizeOf(context).width * 0.25641,
                                100.0,
                              ),
                              height: valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.11848,
                                100.0,
                              ),
                              fit: BoxFit.contain,
                            ),
                          if ((widget!.status == 'completado') &&
                              (widget!.ahorroCdat == true))
                            Image.network(
                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/0ke3g4m2bf4t/Group_126_(1).png',
                              width: valueOrDefault<double>(
                                MediaQuery.sizeOf(context).width * 0.25641,
                                100.0,
                              ),
                              height: valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.11848,
                                100.0,
                              ),
                              fit: BoxFit.contain,
                            ),
                          if (widget!.status == 'pendiente')
                            Image.asset(
                              'assets/images/Group_125.png',
                              width: valueOrDefault<double>(
                                MediaQuery.sizeOf(context).width * 0.25641,
                                100.0,
                              ),
                              height: valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.11848,
                                100.0,
                              ),
                              fit: BoxFit.contain,
                            ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 24.0, 24.0, 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AutoSizeText(
                                '- ${valueOrDefault<String>(
                                  functions.formatAmount(widget!.monto!),
                                  'Sin monto',
                                )}',
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: AutoSizeText(
                                  valueOrDefault<String>(
                                    () {
                                      if (widget!.status == 'completado') {
                                        return 'Transacción exitosa';
                                      } else if (widget!.status ==
                                          'rechazado') {
                                        return 'Transacción rechazada';
                                      } else {
                                        return 'Transacción pendiente';
                                      }
                                    }(),
                                    'Transacción pendiente',
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Satoshi',
                                        color: () {
                                          if ((widget!.status ==
                                                  'completado') &&
                                              (widget!.ahorroCdat == true)) {
                                            return Color(0xFF2CA964);
                                          } else if (widget!.status ==
                                              'rechazado') {
                                            return FlutterFlowTheme.of(context)
                                                .customColor4;
                                          } else if (widget!.status ==
                                              'pendiente') {
                                            return Color(0xFFB2B2B2);
                                          } else {
                                            return Color(0xFF002CE9);
                                          }
                                        }(),
                                        fontSize: valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.02844,
                                          24.0,
                                        ),
                                        letterSpacing: 0.8,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: AutoSizeText(
                                      valueOrDefault<String>(
                                        widget!.ahorroCdat == true
                                            ? 'Transferencia Interna'
                                            : 'Transferencia ACH',
                                        '-',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            fontSize: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.01896,
                                              16.0,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  AutoSizeText(
                                    'Tipo de movimiento',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: Color(0xB3262632),
                                          fontSize: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.01659,
                                            14.0,
                                          ),
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ].divide(SizedBox(height: 4.0)),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      valueOrDefault<String>(
                                        widget!.idTransaccion,
                                        'ID',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            fontSize: valueOrDefault<double>(
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
                                      'ID de Transacción',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            color: Color(0xB3262632),
                                            fontSize: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.01659,
                                              14.0,
                                            ),
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ].divide(SizedBox(height: 4.0)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFEEF1FA),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AutoSizeText(
                                          valueOrDefault<String>(
                                            widget!.banco,
                                            '- - -',
                                          ),
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize:
                                                    valueOrDefault<double>(
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.01659,
                                                  14.0,
                                                ),
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ].divide(SizedBox(height: 4.0)),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AutoSizeText(
                                          valueOrDefault<String>(
                                            widget!.tipocuentabanco,
                                            '- - -',
                                          ),
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
                                          'Tipo de cuenta',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize:
                                                    valueOrDefault<double>(
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.01659,
                                                  14.0,
                                                ),
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ].divide(SizedBox(height: 4.0)),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AutoSizeText(
                                          valueOrDefault<String>(
                                            widget!.apellidosynombres,
                                            'Nombres',
                                          ),
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
                                          'Nombres y apellidos',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize:
                                                    valueOrDefault<double>(
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.01659,
                                                  14.0,
                                                ),
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ].divide(SizedBox(height: 4.0)),
                                    ),
                                  ].divide(SizedBox(height: 24.0)),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AutoSizeText(
                                          valueOrDefault<String>(
                                            widget!.numerobanco,
                                            '- - -',
                                          ),
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
                                          'Número de cuenta',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize:
                                                    valueOrDefault<double>(
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.01659,
                                                  14.0,
                                                ),
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ].divide(SizedBox(height: 4.0)),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AutoSizeText(
                                          '${dateTimeFormat(
                                            "d/M/y",
                                            getCurrentTimestamp,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          )}${dateTimeFormat(
                                            "Hm",
                                            getCurrentTimestamp,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          )}',
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
                                          'Hora y fecha de solicitud',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize:
                                                    valueOrDefault<double>(
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.01659,
                                                  14.0,
                                                ),
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ].divide(SizedBox(height: 4.0)),
                                    ),
                                    if ((widget!.status == 'APPROVED') ||
                                        (widget!.status == 'REJECTED'))
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AutoSizeText(
                                            valueOrDefault<String>(
                                              '${dateTimeFormat(
                                                "d/M/y",
                                                widget!.fecharetiro,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              )} ${dateTimeFormat(
                                                "Hm",
                                                widget!.fecharetiro,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              )}',
                                              '-',
                                            ),
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
                                            'Fecha de ejecución',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize:
                                                      valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.01659,
                                                    14.0,
                                                  ),
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ].divide(SizedBox(height: 4.0)),
                                      ),
                                  ].divide(SizedBox(height: 24.0)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 0.0, 40.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                'Observaciones',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Satoshi',
                                      fontSize: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.01896,
                                        16.0,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              AutoSizeText(
                                valueOrDefault<String>(
                                  widget!.detalles,
                                  '- - -',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Satoshi',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.01659,
                                        14.0,
                                      ),
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ].divide(SizedBox(height: 4.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ].divide(SizedBox(height: 12.0)),
          ),
        ),
      ),
    );
  }
}
