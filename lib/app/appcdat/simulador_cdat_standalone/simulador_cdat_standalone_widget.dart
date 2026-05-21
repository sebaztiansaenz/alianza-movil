import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

/// CDAT simulator without savings-line selection or balance cap.
/// Shows inputs and results on the same screen; "Volver a simular" clears state.
class SimuladorCdatStandaloneWidget extends StatefulWidget {
  const SimuladorCdatStandaloneWidget({super.key});

  static String routeName = 'SimuladorCdatStandalone';
  static String routePath = '/simuladorCdat';

  @override
  State<SimuladorCdatStandaloneWidget> createState() =>
      _SimuladorCdatStandaloneWidgetState();
}

class _SimuladorCdatStandaloneWidgetState
    extends State<SimuladorCdatStandaloneWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  InstantTimer? _instantTimer;

  late TextEditingController _amountController;
  FocusNode? _amountFocusNode;

  String _idcdat = '';
  double? _ea;
  String _tiempo = '';

  bool _showResults = false;
  double _inversionSimulada = 0;
  List<RetiroscdatStruct> _retiros = [];

  static const String _group138Bg =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/1h9oy8v8kq15/Group_138.png';

  /// Same withdrawal schedule as [RETIRO2Copy2Widget] simulate flow.
  List<RetiroscdatStruct> _buildRetiros(double principal, double eaV, String t) {
    final lista = <RetiroscdatStruct>[];
    if (t == '6') {
      lista.add(RetiroscdatStruct(
        monto: valueOrDefault<double>(
          (valueOrDefault<double>(
                    ((principal / 100) * (((eaV) / 12) * 6)),
                    0.0,
                  ) -
                  valueOrDefault<double>(
                    ((principal / 100) * (((eaV) / 12) * 6)) * 0.04,
                    0.0,
                  )) /
              2,
          0.0,
        ),
        fecharetiro: functions.sumarmesess(getCurrentTimestamp, 3),
      ));
      lista.add(RetiroscdatStruct(
        monto: valueOrDefault<double>(
          ((valueOrDefault<double>(
                        ((principal / 100) * (((eaV) / 12) * 6)),
                        0.0,
                      ) -
                      valueOrDefault<double>(
                        ((principal / 100) * (((eaV) / 12) * 6)) * 0.04,
                        0.0,
                      )) /
                  2) +
              principal,
          0.0,
        ),
        fecharetiro: functions.sumarmesess(getCurrentTimestamp, 6),
      ));
    } else {
      lista.add(RetiroscdatStruct(
        monto: valueOrDefault<double>(
          (valueOrDefault<double>(
                    ((principal / 100) * (eaV)),
                    0.0,
                  ) -
                  valueOrDefault<double>(
                    ((principal / 100) * (((eaV) / 12) * 12)) * 0.04,
                    0.0,
                  )) /
              4,
          0.0,
        ),
        fecharetiro: functions.sumarmesess(getCurrentTimestamp, 3),
      ));
      lista.add(RetiroscdatStruct(
        monto: valueOrDefault<double>(
          (valueOrDefault<double>(
                    ((principal / 100) * (eaV)),
                    0.0,
                  ) -
                  valueOrDefault<double>(
                    ((principal / 100) * (((eaV) / 12) * 12)) * 0.04,
                    0.0,
                  )) /
              4,
          0.0,
        ),
        fecharetiro: functions.sumarmesess(getCurrentTimestamp, 6),
      ));
      lista.add(RetiroscdatStruct(
        monto: valueOrDefault<double>(
          (valueOrDefault<double>(
                    ((principal / 100) * (eaV)),
                    0.0,
                  ) -
                  valueOrDefault<double>(
                    ((principal / 100) * (((eaV) / 12) * 12)) * 0.04,
                    0.0,
                  )) /
              4,
          0.0,
        ),
        fecharetiro: functions.sumarmesess(getCurrentTimestamp, 9),
      ));
      lista.add(RetiroscdatStruct(
        monto: valueOrDefault<double>(
          ((valueOrDefault<double>(
                        ((principal / 100) * (eaV)),
                        0.0,
                      ) -
                      valueOrDefault<double>(
                        ((principal / 100) * (((eaV) / 12) * 12)) * 0.04,
                        0.0,
                      )) /
                  4) +
              principal,
          0.0,
        ),
        fecharetiro: functions.sumarmesess(getCurrentTimestamp, 12),
      ));
    }
    return lista;
  }

  double _gananciaNeta(double inv, double eaV, String t) {
    if (t == '6') {
      return valueOrDefault<double>(
        ((((inv / 100) * (((eaV) / 12) * 6))) -
            valueOrDefault<double>(
              (((inv / 100) * (((eaV) / 12) * 6)) * 0.04),
              0.0,
            )),
        0.0,
      );
    }
    return valueOrDefault<double>(
      ((((inv / 100) * (((eaV) / 12) * 12))) -
          valueOrDefault<double>(
            (((inv / 100) * (((eaV) / 12) * 12)) * 0.04),
            0.0,
          )),
      0.0,
    );
  }

  double _totalRecibir(double inv, double eaV, String t) {
    return inv + _gananciaNeta(inv, eaV, t);
  }

  double _totalAnticiposHeader(double inv, double eaV, String t) {
    return _gananciaNeta(inv, eaV, t);
  }

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController();
    _amountFocusNode = FocusNode();

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().lastAction = getCurrentTimestamp;
      safeSetState(() {});
      _instantTimer = InstantTimer.periodic(
        duration: const Duration(milliseconds: 10000),
        callback: (timer) async {
          if (functions.past5Mins(FFAppState().lastAction!)) {
            if (!mounted) {
              return;
            }
            GoRouter.of(context).prepareAuthEvent();
            await authManager.signOut();
            if (!mounted) {
              return;
            }
            GoRouter.of(context).clearRedirectLocation();
            context.goNamedAuth(CierredeSesionWidget.routeName, mounted);
            _instantTimer?.cancel();
          }
        },
        startImmediately: false,
      );
    });
  }

  @override
  void dispose() {
    _instantTimer?.cancel();
    _amountFocusNode?.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _onSimular() {
    FFAppState().lastAction = getCurrentTimestamp;
    if (_idcdat.isEmpty || _ea == null || _tiempo.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Selecciona el plazo de tu CDAT.',
            style: TextStyle(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
          ),
          backgroundColor: FlutterFlowTheme.of(context).secondary,
        ),
      );
      return;
    }
    final principal = double.tryParse(_amountController.text.trim()) ?? 0.0;
    if (principal <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Ingresa un monto válido mayor a 0.',
            style: TextStyle(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
          ),
          backgroundColor: FlutterFlowTheme.of(context).secondary,
        ),
      );
      return;
    }

    setState(() {
      _retiros = _buildRetiros(principal, _ea!, _tiempo);
      _inversionSimulada = principal;
      _showResults = true;
    });
    FocusScope.of(context).unfocus();
  }

  void _onVolverASimular() {
    setState(() {
      _showResults = false;
      _retiros = [];
      _inversionSimulada = 0;
      _amountController.clear();
    });
  }

  Widget _buildCdatTermCards(List<ServicesRecord> services) {
    final cdat = services.map((e) => e).toList();
    return Row(
      children: List.generate(cdat.length, (cdatIndex) {
        final cdatItem = cdat[cdatIndex];
        final selected = _idcdat == cdatItem.reference.id;
        return Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
              cdatIndex > 0 ? 8.0 : 0.0,
              0.0,
              cdatIndex < cdat.length - 1 ? 8.0 : 0.0,
              0.0,
            ),
            child: Opacity(
              opacity: selected ? 1.0 : 0.5,
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    _ea = cdatItem.ea;
                    _idcdat = cdatItem.reference.id;
                    _tiempo =
                        cdatItem.typesOfProductName == '6 meses' ? '6' : '12';
                  });
                },
                child: Container(
                  height: 66.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: valueOrDefault<Color>(
                        _idcdat.isNotEmpty
                            ? FlutterFlowTheme.of(context).customColor4
                            : FlutterFlowTheme.of(context).customColor5,
                        FlutterFlowTheme.of(context).customColor5,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!selected)
                          InkWell(
                            onTap: () {
                              setState(() {
                                _ea = cdatItem.ea;
                                _tiempo = cdatItem.typesOfProductName ==
                                        '6 meses'
                                    ? '6'
                                    : '12';
                              });
                            },
                            child: Container(
                              width: 16.0,
                              height: 16.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(24.0),
                                border: Border.all(color: const Color(0xB2262632)),
                              ),
                            ),
                          ),
                        if (selected)
                          Container(
                            width: 16.0,
                            height: 16.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(24.0),
                              border: Border.all(
                                color: const Color(0xB0FF6700),
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      FlutterFlowTheme.of(context).customColor4,
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                              ),
                            ),
                          ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.only(start: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${valueOrDefault<String>(cdatItem.ea.toString(), '-')} %',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Satoshi',
                                        color: const Color(0xFF002CE9),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    cdatItem.typesOfProductName,
                                    '- -',
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Satoshi',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildSummaryCard(BuildContext context) {
    final inv = _inversionSimulada;
    final eaV = _ea ?? 0.0;
    final t = _tiempo;
    final gan = _gananciaNeta(inv, eaV, t);
    final total = _totalRecibir(inv, eaV, t);

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(
        0.0,
        valueOrDefault<double>(
          MediaQuery.sizeOf(context).height * 0.02844,
          24.0,
        ),
        0.0,
        0.0,
      ),
      child: Container(
        width: double.infinity,
        height: 290.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: Image.network(_group138Bg).image,
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: const AlignmentDirectional(0.01, 0.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              functions.formatAmount(inv),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Satoshi',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            Text(
                              'Inversión',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Satoshi',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          functions.formatAmount(gan),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Satoshi',
                                    color: const Color(0xFF002CE9),
                                    fontSize: 36.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w900,
                                  ),
                        ),
                        Text(
                          'Ganancias',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Satoshi',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Total a recibir',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Satoshi',
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Text(
                              functions.formatAmount(total),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Satoshi',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                            start: valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.02400,
                              20.0,
                            ),
                          ),
                          child: Container(
                            height: 28.0,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEEF1FA),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 16.0,
                                    height: 16.0,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: Image.asset(
                                          'assets/images/Frame_(34).png',
                                        ).image,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 8.0),
                                    child: Text(
                                      '$t meses',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            letterSpacing: 0.0,
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
                ],
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(1.02, -0.51),
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                  end: valueOrDefault<double>(
                    MediaQuery.sizeOf(context).height * 0.04740,
                    40.0,
                  ),
                ),
                child: Text(
                  '${eaV.toString()}% E.A',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Satoshi',
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        fontSize: 11.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnticiposList(BuildContext context) {
    final headerTotal =
        _totalAnticiposHeader(_inversionSimulada, _ea ?? 0.0, _tiempo);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).customColor5,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Disponibilidad de retiros anticipados',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Satoshi',
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Flexible(
                    child: Text(
                      functions.formatAmount(headerTotal),
                      textAlign: TextAlign.end,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Satoshi',
                            color: FlutterFlowTheme.of(context).customColor4,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 16.0),
                child: Column(
                  children: List.generate(_retiros.length, (ahorroIndex) {
                    final ahorroItem = _retiros[ahorroIndex];
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom:
                              ahorroIndex < _retiros.length - 1 ? 24.0 : 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  valueOrDefault<String>(
                                    dateTimeFormat(
                                      'd/M/y',
                                      ahorroItem.fecharetiro,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    '- - - ',
                                  ),
                                  maxLines: 1,
                                  minFontSize: 10.0,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Satoshi',
                                        fontSize: valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.01659,
                                          14.0,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                AutoSizeText(
                                  'Anticipo ${ahorroIndex + 1}',
                                  maxLines: 1,
                                  minFontSize: 8.0,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Satoshi',
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ].divide(const SizedBox(height: 4.0)),
                            ),
                          ),
                          AutoSizeText(
                            functions.formatAmount(ahorroItem.monto),
                            maxLines: 1,
                            minFontSize: 10.0,
                            textAlign: TextAlign.end,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Satoshi',
                                  color: const Color(0xFF002CE9),
                                  fontSize: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height *
                                        0.01659,
                                    14.0,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputForm(BuildContext context) {
    return StreamBuilder<List<ServicesRecord>>(
      stream: queryServicesRecord(
        queryBuilder: (servicesRecord) =>
            servicesRecord.where('ServiceMainType', isEqualTo: 'CDAT'),
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(48.0),
              child: CircularProgressIndicator(),
            ),
          );
        }
        final services = snapshot.data!;
        return SingleChildScrollView(
          padding: EdgeInsetsDirectional.fromSTEB(
            20.0,
            24.0,
            20.0,
            max(24.0, MediaQuery.paddingOf(context).bottom + 24.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tiempo de tu CDAT',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Satoshi',
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 20.0),
                child: _buildCdatTermCards(services),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Monto a simular',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Satoshi',
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 12.0),
                    Container(
                      decoration: const BoxDecoration(),
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Stack(
                          children: [
                            Theme(
                              data: Theme.of(context).copyWith(
                                textSelectionTheme:
                                    const TextSelectionThemeData(
                                  cursorColor: Colors.white,
                                  selectionColor: Color(0x66FFFFFF),
                                  selectionHandleColor: Colors.white,
                                ),
                              ),
                              child: TextFormField(
                                controller: _amountController,
                                focusNode: _amountFocusNode,
                                cursorColor: Colors.white,
                                cursorWidth: 2.0,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_simAmount',
                                  const Duration(milliseconds: 100),
                                  () => safeSetState(() {}),
                                ),
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Satoshi',
                                        color: FlutterFlowTheme.of(context)
                                            .customColor5,
                                        fontSize: valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.01896,
                                          16.0,
                                        ),
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: '0',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Satoshi',
                                        color: FlutterFlowTheme.of(context)
                                            .customColor5,
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .customColor5,
                                ),
                                // Dígitos ocultos: el monto formateado va en la capa superior.
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Satoshi',
                                      color: Colors.transparent,
                                      letterSpacing: 0.0,
                                    ),
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'^\d*\.?\d{0,2}$')),
                                ],
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    top: 12.0),
                                child: Text(
                                  functions.formatAmount(valueOrDefault<double>(
                                    double.tryParse(_amountController.text),
                                    0.0,
                                  )),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Satoshi',
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 32.0),
                child: FFButtonWidget(
                  onPressed: _onSimular,
                  text: 'Simular',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 48.0,
                    color: FlutterFlowTheme.of(context).customColor4,
                    textStyle:
                        FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Satoshi',
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              fontSize: 16.0,
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
        );
      },
    );
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
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                20.0,
                valueOrDefault<double>(
                  MediaQuery.sizeOf(context).height * 0.07110,
                  60.0,
                ),
                20.0,
                12.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () => context.safePop(),
                          child: Icon(
                            Icons.arrow_back_sharp,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.only(start: 8.0),
                          child: AutoSizeText(
                            _showResults ? 'Resultado simulación' : 'Simulador',
                            maxLines: 1,
                            minFontSize: 14.0,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Satoshi',
                                  fontSize: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height *
                                        0.02133,
                                    18.0,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  lineHeight: 1.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/Group_91.png',
                      width: 80.0,
                      height: valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.02844,
                        24.0,
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                ].divide(const SizedBox(width: 4.0)),
              ),
            ),
            Expanded(
              child: _showResults
                  ? SingleChildScrollView(
                      padding: EdgeInsetsDirectional.fromSTEB(
                        20.0,
                        8.0,
                        20.0,
                        max(
                          48.0,
                          MediaQuery.paddingOf(context).bottom + 40.0,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _buildSummaryCard(context),
                          _buildAnticiposList(context),
                          FFButtonWidget(
                            onPressed: _onVolverASimular,
                            text: 'Volver a simular',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 48.0,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Satoshi',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).customColor4,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ],
                      ),
                    )
                  : _buildInputForm(context),
            ),
          ],
        ),
      ),
    );
  }
}
