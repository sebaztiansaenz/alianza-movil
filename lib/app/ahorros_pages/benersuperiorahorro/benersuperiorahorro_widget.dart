import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'benersuperiorahorro_model.dart';
export 'benersuperiorahorro_model.dart';

class BenersuperiorahorroWidget extends StatefulWidget {
  const BenersuperiorahorroWidget({super.key});

  @override
  State<BenersuperiorahorroWidget> createState() =>
      _BenersuperiorahorroWidgetState();
}

class _BenersuperiorahorroWidgetState extends State<BenersuperiorahorroWidget> {
  late BenersuperiorahorroModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BenersuperiorahorroModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CdatsRecord>>(
      stream: queryCdatsRecord(
        queryBuilder: (cdatsRecord) => cdatsRecord.where(
          'Idusuario',
          isEqualTo: currentUserReference,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }
        List<CdatsRecord> containerCdatsRecordList = snapshot.data!;

        return Container(
          decoration: BoxDecoration(
            color: Color(0x00FFFFFF),
          ),
          child: StreamBuilder<List<AhorrosRecord>>(
            stream: queryAhorrosRecord(
              queryBuilder: (ahorrosRecord) => ahorrosRecord
                  .where(
                    'user',
                    isEqualTo: currentUserReference,
                  )
                  .where(
                    'AhorrosDocPdf1',
                    isNotEqualTo: '',
                  ),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              List<AhorrosRecord> containerAhorrosRecordList = snapshot.data!;

              return Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                decoration: BoxDecoration(
                  color: Color(0x00FFFFFF),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0,
                            valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.07584,
                              64.0,
                            ),
                            0.0,
                            21.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hola,',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Satoshi',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                AuthUserStreamWidget(
                                  builder: (context) => Text(
                                    valueOrDefault<String>(
                                      currentUserDisplayName,
                                      '- - -',
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
                              ].divide(SizedBox(height: 2.0)),
                            ),
                            Flexible(
                              child: Container(
                                width: 106.0,
                                height: 35.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF002CE9),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 18.0,
                                        height: 18.0,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.contain,
                                            image: Image.asset(
                                              'assets/images/Frame_(36).png',
                                            ).image,
                                          ),
                                        ),
                                      ),
                                      if (_model.ahorro == 'ahorro')
                                        Flexible(
                                          child: Text(
                                            valueOrDefault<String>(
                                              functions.formatAmount(
                                                  valueOrDefault<double>(
                                                functions.ahorroBenefitsTotal(
                                                    containerAhorrosRecordList
                                                        .toList()),
                                                0.0,
                                              )),
                                              '\$ 12.000',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      if (_model.cdat == 'cdat')
                                        Flexible(
                                          child: Text(
                                            valueOrDefault<String>(
                                              functions.formatAmount(
                                                  valueOrDefault<double>(
                                                functions.sumaTotal(
                                                    containerCdatsRecordList
                                                        .map((e) =>
                                                            e.saldoDisponible)
                                                        .toList()),
                                                0.0,
                                              )),
                                              '\$ 12.000',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 209.0,
                            height: 52.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).customColor5,
                              borderRadius: BorderRadius.circular(100.0),
                              border: Border.all(
                                color: Color(0xFFE8EBF3),
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.ahorro = 'ahorro';
                                      safeSetState(() {});

                                      context.pushNamed(
                                          AHORROSPage1CopyCopyWidget.routeName);
                                    },
                                    child: Container(
                                      width: 100.0,
                                      height: 44.0,
                                      decoration: BoxDecoration(
                                        color: _model.ahorro == 'ahorro'
                                            ? FlutterFlowTheme.of(context)
                                                .customColor5
                                            : FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                        border: Border.all(
                                          color: _model.ahorro == 'ahorro'
                                              ? FlutterFlowTheme.of(context)
                                                  .customColor5
                                              : Color(0xFFD4D9E9),
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'Ahorro',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.credito = 'credito';
                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      width: 100.0,
                                      height: 44.0,
                                      decoration: BoxDecoration(
                                        color: _model.credito == 'credito'
                                            ? FlutterFlowTheme.of(context)
                                                .secondaryBackground
                                            : FlutterFlowTheme.of(context)
                                                .customColor5,
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                        border: Border.all(
                                          color: _model.credito == 'credito'
                                              ? Color(0xFFD4D9E9)
                                              : FlutterFlowTheme.of(context)
                                                  .customColor5,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'Crédito',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (_model.cdat != 'cdat')
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.cdat = 'cdat';
                                safeSetState(() {});

                                context.pushNamed(
                                  MisinversionesWidget.routeName,
                                  queryParameters: {
                                    'cdat': serializeParam(
                                      containerCdatsRecordList
                                          .where((e) =>
                                              e.reference.id != null &&
                                              e.reference.id != '')
                                          .toList()
                                          .firstOrNull,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'cdat': containerCdatsRecordList
                                        .where((e) =>
                                            e.reference.id != null &&
                                            e.reference.id != '')
                                        .toList()
                                        .firstOrNull,
                                  },
                                );
                              },
                              child: Container(
                                width: 133.0,
                                height: 52.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(24.0),
                                  border: Border.all(
                                    color: Color(0x3FFF6700),
                                    width: 1.5,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 20.0,
                                        height: 20.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          image: DecorationImage(
                                            fit: BoxFit.contain,
                                            image: Image.asset(
                                              'assets/images/Frame_2085664384.png',
                                            ).image,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Inversión',
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
                                ),
                              ),
                            ),
                          if (_model.cdat == 'cdat')
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.cdat = 'cdat';
                                safeSetState(() {});
                              },
                              child: Container(
                                width: 133.0,
                                height: 52.0,
                                decoration: BoxDecoration(
                                  color:
                                      FlutterFlowTheme.of(context).customColor4,
                                  borderRadius: BorderRadius.circular(24.0),
                                  border: Border.all(
                                    color: Color(0x3FFF6700),
                                    width: 1.5,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 20.0,
                                        height: 20.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          image: DecorationImage(
                                            fit: BoxFit.contain,
                                            image: Image.asset(
                                              'assets/images/Frame_2085664384_(1).png',
                                            ).image,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(7.0),
                                        ),
                                      ),
                                      Text(
                                        'Inversión',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                ),
                              ),
                            ),
                        ].divide(SizedBox(width: 8.0)),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
