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
import 'detalles_transaccion_retiro_copy_model.dart';
export 'detalles_transaccion_retiro_copy_model.dart';

class DetallesTransaccionRetiroCopyWidget extends StatefulWidget {
  const DetallesTransaccionRetiroCopyWidget({
    super.key,
    required this.status,
    required this.idTransaccion,
    required this.apellidosynombres,
    required this.monto,
    required this.fecha,
    this.whitInfo,
    required this.typetransaction,
    required this.detalles,
    required this.fecharetiro,
    bool? iscadat,
    required this.list,
    required this.isNovedad,
    required this.messaje,
  }) : this.iscadat = iscadat ?? false;

  final String? status;
  final String? idTransaccion;
  final String? apellidosynombres;
  final double? monto;
  final DateTime? fecha;
  final WithdrawalInfoStruct? whitInfo;
  final String? typetransaction;
  final String? detalles;
  final DateTime? fecharetiro;
  final bool iscadat;
  final int? list;
  final bool? isNovedad;
  final String? messaje;

  static String routeName = 'DetallesTransaccionRetiroCopy';
  static String routePath = '/detallesTransaccionRetiroCopy';

  @override
  State<DetallesTransaccionRetiroCopyWidget> createState() =>
      _DetallesTransaccionRetiroCopyWidgetState();
}

class _DetallesTransaccionRetiroCopyWidgetState
    extends State<DetallesTransaccionRetiroCopyWidget> {
  late DetallesTransaccionRetiroCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetallesTransaccionRetiroCopyModel());

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
                          if (widget!.status == 'PENDING')
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
                          if (widget!.status == 'REJECTED')
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
                          if ((widget!.status == 'APPROVED') &&
                              (widget!.iscadat != true) &&
                              (widget!.isNovedad != true))
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
                          if (widget!.iscadat == true)
                            Image.asset(
                              'assets/images/Group_126_(1).png',
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
                          if (widget!.isNovedad == true)
                            Image.network(
                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/l2hchl2ma69n/Group_126_(2).png',
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
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AutoSizeText(
                                    '-',
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
                                  AutoSizeText(
                                    valueOrDefault<String>(
                                      functions.formatAmount(widget!.monto!),
                                      'Sin monto',
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
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: AutoSizeText(
                                  valueOrDefault<String>(
                                    () {
                                      if (widget!.status == 'PENDING') {
                                        return 'Transacción pendiente';
                                      } else if ((widget!.status ==
                                              'APPROVED') &&
                                          (widget!.isNovedad != true)) {
                                        return 'Transacción exitosa';
                                      } else if (widget!.status == 'REJECTED') {
                                        return 'Transacción rechazada';
                                      } else if ((widget!.status ==
                                              'APPROVED') &&
                                          (widget!.isNovedad == true)) {
                                        return 'Debito exitoso';
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
                                        color: valueOrDefault<Color>(
                                          () {
                                            if (widget!.status == 'PENDING') {
                                              return Color(0xFFB2B2B2);
                                            } else if ((widget!.status ==
                                                    'APPROVED') &&
                                                (widget!.iscadat != true) &&
                                                (widget!.isNovedad != true)) {
                                              return Color(0xFF002CE9);
                                            } else if (widget!.status ==
                                                'REJECTED') {
                                              return Color(0xFFFF6700);
                                            } else if (widget!.iscadat ==
                                                true) {
                                              return Color(0xFF2CA964);
                                            } else if ((widget!.status ==
                                                    'APPROVED') &&
                                                (widget!.isNovedad == true)) {
                                              return Color(0xFFFF4545);
                                            } else {
                                              return Color(0xFFB2B2B2);
                                            }
                                          }(),
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
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
                                        (widget!.iscadat != true) &&
                                                (widget!.isNovedad != true)
                                            ? 'Transferencia ACH'
                                            : 'Transferencia Interna',
                                        'Transferencia ACH',
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                            widget!.whitInfo?.bankName,
                                            'Banco',
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
                                    if (widget!.isNovedad != true)
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AutoSizeText(
                                            valueOrDefault<String>(
                                              widget!.whitInfo?.accountType,
                                              'Tipo de cuenta',
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
                                    if (widget!.iscadat != true)
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
                              Expanded(
                                flex: 2,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (widget!.isNovedad != true)
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AuthUserStreamWidget(
                                            builder: (context) => AutoSizeText(
                                              valueOrDefault<String>(
                                                widget!.iscadat == true
                                                    ? valueOrDefault<String>(
                                                        '${valueOrDefault(currentUserDocument?.nit, '')}-0${valueOrDefault<String>(
                                                          widget!.list
                                                              ?.toString(),
                                                          '0',
                                                        )}',
                                                        '0',
                                                      )
                                                    : valueOrDefault<String>(
                                                        widget!.whitInfo
                                                            ?.accountNumber,
                                                        'Número de cuenta',
                                                      ),
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
                                          ),
                                          AutoSizeText(
                                            'Número de cuenta',
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
                                    if ((widget!.status == 'APPROVED') &&
                                        (widget!.iscadat != true) &&
                                        (widget!.isNovedad != true))
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AutoSizeText(
                                            '${dateTimeFormat(
                                              "d/M/y",
                                              getCurrentTimestamp,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            )}${dateTimeFormat(
                                              "Hm",
                                              getCurrentTimestamp,
                                              locale:
                                                  FFLocalizations.of(context)
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
                              20.0, 37.0, 20.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 74.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x0F000000),
                                  offset: Offset(
                                    0.0,
                                    2.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color:
                                    FlutterFlowTheme.of(context).customColor5,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(14.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    'Detalles',
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
                                  AutoSizeText(
                                    valueOrDefault<String>(
                                      widget!.isNovedad == true
                                          ? widget!.messaje
                                          : widget!.detalles,
                                      '- - -',
                                    ),
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
                                ].divide(SizedBox(height: 4.0)),
                              ),
                            ),
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
