import '/app/otros/animacionmenu/animacionmenu_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
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
import 'movimientoscdat_model.dart';
export 'movimientoscdat_model.dart';

class MovimientoscdatWidget extends StatefulWidget {
  const MovimientoscdatWidget({
    super.key,
    required this.cdat,
  });

  final CdatsRecord? cdat;

  static String routeName = 'movimientoscdat';
  static String routePath = '/movimientoscdat';

  @override
  State<MovimientoscdatWidget> createState() => _MovimientoscdatWidgetState();
}

class _MovimientoscdatWidgetState extends State<MovimientoscdatWidget> {
  late MovimientoscdatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MovimientoscdatModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().lastAction = getCurrentTimestamp;
      safeSetState(() {});
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

    return StreamBuilder<List<ConfirmacionretirosRecord>>(
      stream: queryConfirmacionretirosRecord(
        parent: widget!.cdat?.reference,
        queryBuilder: (confirmacionretirosRecord) =>
            confirmacionretirosRecord.orderBy('fecharetiro', descending: true),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<ConfirmacionretirosRecord>
            movimientoscdatConfirmacionretirosRecordList = snapshot.data!;

        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.06636,
                            56.0,
                          ),
                          20.0,
                          0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 60.0,
                              icon: Icon(
                                Icons.arrow_back_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 30.0,
                              ),
                              onPressed: () async {
                                context.pop();
                              },
                            ),
                          ),
                          AutoSizeText(
                            'Mis movimientos',
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Satoshi',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                    ),
                    if (movimientoscdatConfirmacionretirosRecordList.length > 0)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final months = functions
                                .monthsTillDate(
                                    movimientoscdatConfirmacionretirosRecordList
                                        .elementAtOrNull(
                                            movimientoscdatConfirmacionretirosRecordList
                                                    .length -
                                                1)!
                                        .fecharetiro!)
                                .toList();

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: months.length,
                              itemBuilder: (context, monthsIndex) {
                                final monthsItem = months[monthsIndex];
                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (functions
                                              .countSameMonth(
                                                  movimientoscdatConfirmacionretirosRecordList
                                                      .toList(),
                                                  monthsItem)
                                              .toString() !=
                                          '0')
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, -1.0),
                                          child: AutoSizeText(
                                            valueOrDefault<String>(
                                              functions.isCurrentMonth(
                                                      monthsItem)
                                                  ? 'Este mes'
                                                  : '${functions.monthInSpanish(monthsItem)} ${dateTimeFormat(
                                                      "y",
                                                      monthsItem,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    )}',
                                              'Este mes',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      if (movimientoscdatConfirmacionretirosRecordList
                                              .length >
                                          0)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 24.0, 0.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final cdatsssss =
                                                  movimientoscdatConfirmacionretirosRecordList
                                                      .where((e) => functions
                                                          .isSameMonthCopy(
                                                              e.fecharetiro!,
                                                              monthsItem))
                                                      .toList()
                                                      .sortedList(
                                                          keyOf: (e) =>
                                                              e.fechaSolicitud!,
                                                          desc: false)
                                                      .toList();

                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: cdatsssss.length,
                                                itemBuilder:
                                                    (context, cdatsssssIndex) {
                                                  final cdatsssssItem =
                                                      cdatsssss[cdatsssssIndex];
                                                  return InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if (cdatsssssItem
                                                              .tipodeoperacion ==
                                                          'entrante') {
                                                        context.pushNamed(
                                                          DetallesTransaccionCopyCopyWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'status':
                                                                serializeParam(
                                                              cdatsssssItem
                                                                  .estados,
                                                              ParamType.String,
                                                            ),
                                                            'idTransaccion':
                                                                serializeParam(
                                                              cdatsssssItem.id
                                                                  .toString(),
                                                              ParamType.String,
                                                            ),
                                                            'apellidosynombres':
                                                                serializeParam(
                                                              cdatsssssItem
                                                                  .nombreusuario,
                                                              ParamType.String,
                                                            ),
                                                            'monto':
                                                                serializeParam(
                                                              cdatsssssItem
                                                                  .monto,
                                                              ParamType.double,
                                                            ),
                                                            'banco':
                                                                serializeParam(
                                                              cdatsssssItem
                                                                  .numbredebanco,
                                                              ParamType.String,
                                                            ),
                                                            'fecha':
                                                                serializeParam(
                                                              cdatsssssItem
                                                                  .fechaSolicitud,
                                                              ParamType
                                                                  .DateTime,
                                                            ),
                                                            'typetransaction':
                                                                serializeParam(
                                                              cdatsssssItem
                                                                  .tipodeoperacion,
                                                              ParamType.String,
                                                            ),
                                                            'detalles':
                                                                serializeParam(
                                                              cdatsssssItem
                                                                  .observaciones,
                                                              ParamType.String,
                                                            ),
                                                            'cdats':
                                                                serializeParam(
                                                              widget!.cdat
                                                                  ?.reference,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                            'iscdat':
                                                                serializeParam(
                                                              cdatsssssItem
                                                                      .isahorrocdat ==
                                                                  true,
                                                              ParamType.bool,
                                                            ),
                                                            'tipocuenta':
                                                                serializeParam(
                                                              cdatsssssItem
                                                                  .tipodecuenta,
                                                              ParamType.String,
                                                            ),
                                                            'numerocuenta':
                                                                serializeParam(
                                                              cdatsssssItem
                                                                  .cuentanumero,
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            '__transition_info__':
                                                                TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .rightToLeft,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      300),
                                                            ),
                                                          },
                                                        );
                                                      } else {
                                                        context.pushNamed(
                                                          DetallesTransaccionRetiroCopyCopyWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'status':
                                                                serializeParam(
                                                              cdatsssssItem
                                                                  .estados,
                                                              ParamType.String,
                                                            ),
                                                            'idTransaccion':
                                                                serializeParam(
                                                              cdatsssssItem.id
                                                                  .toString(),
                                                              ParamType.String,
                                                            ),
                                                            'apellidosynombres':
                                                                serializeParam(
                                                              cdatsssssItem
                                                                  .nombreusuario,
                                                              ParamType.String,
                                                            ),
                                                            'monto':
                                                                serializeParam(
                                                              cdatsssssItem
                                                                  .monto,
                                                              ParamType.double,
                                                            ),
                                                            'fecha':
                                                                serializeParam(
                                                              cdatsssssItem
                                                                  .fechaSolicitud,
                                                              ParamType
                                                                  .DateTime,
                                                            ),
                                                            'typetransaction':
                                                                serializeParam(
                                                              cdatsssssItem
                                                                  .tipodeoperacion,
                                                              ParamType.String,
                                                            ),
                                                            'detalles':
                                                                serializeParam(
                                                              cdatsssssItem
                                                                  .observaciones,
                                                              ParamType.String,
                                                            ),
                                                            'fecharetiro':
                                                                serializeParam(
                                                              cdatsssssItem
                                                                  .fecharetiro,
                                                              ParamType
                                                                  .DateTime,
                                                            ),
                                                            'banco':
                                                                serializeParam(
                                                              cdatsssssItem
                                                                  .numbredebanco,
                                                              ParamType.String,
                                                            ),
                                                            'numerobanco':
                                                                serializeParam(
                                                              cdatsssssItem
                                                                  .cuentanumero,
                                                              ParamType.String,
                                                            ),
                                                            'tipocuentabanco':
                                                                serializeParam(
                                                              cdatsssssItem
                                                                  .tipodecuenta,
                                                              ParamType.String,
                                                            ),
                                                            'ahorroCdat':
                                                                serializeParam(
                                                              widget!.cdat
                                                                  ?.isAhorroCdat,
                                                              ParamType.bool,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            '__transition_info__':
                                                                TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .rightToLeft,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      300),
                                                            ),
                                                          },
                                                        );
                                                      }
                                                    },
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    12.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    AutoSizeText(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        cdatsssssItem.tipodeoperacion ==
                                                                                'entrante'
                                                                            ? 'Deposito'
                                                                            : 'Débito ',
                                                                        'Débito ',
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Satoshi',
                                                                            color:
                                                                                valueOrDefault<Color>(
                                                                              cdatsssssItem.tipodeoperacion == 'entrante' ? Color(0xFF002CE9) : FlutterFlowTheme.of(context).customColor4,
                                                                              FlutterFlowTheme.of(context).customColor4,
                                                                            ),
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                    AutoSizeText(
                                                                      '${dateTimeFormat(
                                                                        "d",
                                                                        cdatsssssItem
                                                                            .fecharetiro,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )} ${functions.monthInSpanish(monthsItem)}',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Satoshi',
                                                                            color:
                                                                                Color(0xB2262632),
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          4.0)),
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    AutoSizeText(
                                                                      '${cdatsssssItem.tipodeoperacion == 'entrante' ? ' ' : '-'}${functions.formatAmount(cdatsssssItem.monto)}',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .end,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Satoshi',
                                                                            color:
                                                                                valueOrDefault<Color>(
                                                                              () {
                                                                                if ((cdatsssssItem.estados == 'completado') && (cdatsssssItem.isahorrocdat != true)) {
                                                                                  return Color(0xFF002CE9);
                                                                                } else if ((cdatsssssItem.estados == 'completado') && (cdatsssssItem.isahorrocdat == true)) {
                                                                                  return Color(0xFF002CE9);
                                                                                } else {
                                                                                  return FlutterFlowTheme.of(context).customColor4;
                                                                                }
                                                                              }(),
                                                                              FlutterFlowTheme.of(context).customColor4,
                                                                            ),
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        AutoSizeText(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            cdatsssssItem.estados,
                                                                            '-',
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.end,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Satoshi',
                                                                                color: Color(0xB2262632),
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                        if (cdatsssssItem.estados ==
                                                                            'pendiente')
                                                                          Container(
                                                                            width:
                                                                                16.0,
                                                                            height:
                                                                                16.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              image: DecorationImage(
                                                                                fit: BoxFit.cover,
                                                                                image: Image.network(
                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/n6ee1v6229dt/Frame_(9).png',
                                                                                ).image,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        if ((cdatsssssItem.estados ==
                                                                                'completado') &&
                                                                            (cdatsssssItem.isahorrocdat !=
                                                                                true))
                                                                          Container(
                                                                            width:
                                                                                16.0,
                                                                            height:
                                                                                16.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              image: DecorationImage(
                                                                                fit: BoxFit.cover,
                                                                                image: Image.network(
                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/78jq31kirah9/Frame_(11).png',
                                                                                ).image,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        if ((cdatsssssItem.estados ==
                                                                                'completado') &&
                                                                            (cdatsssssItem.isahorrocdat ==
                                                                                true))
                                                                          Container(
                                                                            width:
                                                                                16.0,
                                                                            height:
                                                                                16.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              image: DecorationImage(
                                                                                fit: BoxFit.contain,
                                                                                image: Image.network(
                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/toxin4y5vzsu/Frame_(35).png',
                                                                                ).image,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        if (cdatsssssItem.estados ==
                                                                            'rechazado')
                                                                          Container(
                                                                            width:
                                                                                16.0,
                                                                            height:
                                                                                16.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              image: DecorationImage(
                                                                                fit: BoxFit.cover,
                                                                                image: Image.network(
                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/u84a8sqyce6v/Frame_(10).png',
                                                                                ).image,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          4.0)),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                AutoSizeText(
                                                                  'ID: #${valueOrDefault<String>(
                                                                    cdatsssssItem
                                                                        .id
                                                                        .toString(),
                                                                    '123',
                                                                  )}',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Satoshi',
                                                                        color: Color(
                                                                            0xB2262632),
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    AutoSizeText(
                                                                      'Ver detalles',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Satoshi',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                    Icon(
                                                                      Icons
                                                                          .keyboard_arrow_right,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          16.0,
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          4.0)),
                                                                ),
                                                              ],
                                                            ),
                                                            Divider(
                                                              thickness: 2.0,
                                                              color: Color(
                                                                  0x4FD9D9D9),
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 8.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
              if (responsiveVisibility(
                context: context,
                phone: false,
                desktop: false,
              ))
                wrapWithModel(
                  model: _model.animacionmenuModel,
                  updateCallback: () => safeSetState(() {}),
                  child: AnimacionmenuWidget(),
                ),
            ],
          ),
        );
      },
    );
  }
}
