import 'dart:math' as math;

import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/session_inactivity.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Flujo de 3 pasos: líneas desde Firestore `Services` (ServiceMainType = Credito).
class CreditoSimuladorCreditoPage extends StatefulWidget {
  const CreditoSimuladorCreditoPage({super.key});

  @override
  State<CreditoSimuladorCreditoPage> createState() =>
      _CreditoSimuladorCreditoPageState();
}

class _CreditoSimuladorCreditoPageState extends State<CreditoSimuladorCreditoPage> with SessionActivityOnInitMixin {
  static const String _kFont = 'Satoshi';
  static const Color _kMuted = Color(0xFF707070);
  static const Color _kTitle = Color(0xFF202020);
  static const Color _kIconBg = Color(0xFFF0F2FB);
  static const Color _kOrangeBrand = Color(0xFFFF6700);

  int _step = 1;
  ServicesRecord? _servicioSeleccionado;
  final TextEditingController _montoCtrl = TextEditingController();
  final TextEditingController _plazoCtrl = TextEditingController();
  double _cuotaResultado = 0;
  double _montoResultado = 0;
  int _plazoResultado = 0;

  String get _lineaLabel =>
      _servicioSeleccionado == null
          ? ''
          : _displayLineaCredito(_servicioSeleccionado!);

  /// MV en Firestore = porcentaje mensual vencido (ej. 1 → 1%).
  double get _tasaMensual {
    final mv = _servicioSeleccionado?.mv ?? 0;
    return mv / 100.0;
  }

  @override
  void dispose() {
    _montoCtrl.dispose();
    _plazoCtrl.dispose();
    super.dispose();
  }

  static String _displayLineaCredito(ServicesRecord s) {
    final name = s.typesOfProductName.trim();
    final lower = name.toLowerCase();
    if (lower.startsWith('credito ')) {
      return name.substring(8).trim();
    }
    return name;
  }

  static int _parseMontoColombiano(String text) {
    final digits = text.replaceAll(RegExp(r'[^\d]'), '');
    if (digits.isEmpty) return 0;
    return int.tryParse(digits) ?? 0;
  }

  void _selectServicio(ServicesRecord servicio) {
    setState(() {
      _servicioSeleccionado = servicio;
      _step = 2;
    });
  }

  double _cuotaFija(double monto, int plazo, double tasaMensual) {
    if (plazo <= 0 || monto <= 0 || tasaMensual <= 0) return 0;
    final r = tasaMensual;
    final pow = math.pow(1 + r, plazo).toDouble();
    return monto * (r * pow) / (pow - 1);
  }

  void _calcular() {
    final monto = _parseMontoColombiano(_montoCtrl.text).toDouble();
    final plazo = int.tryParse(_plazoCtrl.text.replaceAll(RegExp(r'[^\d]'), '')) ?? 0;
    final tasa = _tasaMensual;

    if (_servicioSeleccionado == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selecciona una línea de crédito.')),
      );
      return;
    }
    if (tasa <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Esta línea no tiene tasa MV configurada. Contacta a un asesor.',
          ),
        ),
      );
      return;
    }
    if (monto <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor ingresa un monto válido.')),
      );
      return;
    }
    if (plazo <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor ingresa el número de meses.')),
      );
      return;
    }

    setState(() {
      _montoResultado = monto;
      _plazoResultado = plazo;
      _cuotaResultado = _cuotaFija(monto, plazo, tasa);
      _step = 3;
    });
  }

  void _volverASimular() {
    setState(() => _step = 2);
  }

  void _handleBack() {
    if (_step == 3) {
      _volverASimular();
    } else if (_step == 2) {
      setState(() {
        _step = 1;
        _servicioSeleccionado = null;
        _montoCtrl.clear();
        _plazoCtrl.clear();
      });
    } else {
      Navigator.of(context).maybePop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final topPad = valueOrDefault<double>(
      MediaQuery.sizeOf(context).height * 0.07584,
      64.0,
    );

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: topPad),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                  8.0,
                  0,
                  24.0,
                  10.0,
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: _handleBack,
                      icon: const Icon(Icons.arrow_back, color: _kTitle),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(
                        minWidth: 44,
                        minHeight: 44,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Simulador de crédito',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: _kFont,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: _kTitle,
                              letterSpacing: 0,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: _buildStepBody(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepBody(BuildContext context) {
    switch (_step) {
      case 1:
        return _buildStep1(context);
      case 2:
        return _buildStep2(context);
      case 3:
        return _buildStep3(context);
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildStep1(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Selecciona la línea de crédito que deseas solicitar.',
            style: TextStyle(
              fontFamily: _kFont,
              fontSize: 14,
              color: _kMuted,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 20),
          StreamBuilder<List<ServicesRecord>>(
            stream: queryServicesRecord(
              queryBuilder: (q) =>
                  q.where('ServiceMainType', isEqualTo: 'Credito'),
            ),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 32),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              final servicios = snapshot.data!
                ..sort(
                  (a, b) => a.typesOfProductName.compareTo(b.typesOfProductName),
                );
              if (servicios.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Text(
                    'No hay líneas de crédito disponibles en este momento.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: _kFont,
                      fontSize: 14,
                      color: _kMuted,
                    ),
                  ),
                );
              }
              return Column(
                children: servicios.map((s) {
                  final label = _displayLineaCredito(s);
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      child: InkWell(
                        onTap: () => _selectServicio(s),
                        borderRadius: BorderRadius.circular(16),
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFFEAEAEA)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.02),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 18,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        label,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: _kFont,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color: _kTitle,
                                            ),
                                      ),
                                      if (s.hasMv() && s.mv > 0) ...[
                                        const SizedBox(height: 4),
                                        Text(
                                          'Tasa ref. ${s.mv.toStringAsFixed(s.mv.truncateToDouble() == s.mv ? 0 : 1)}% M.V.',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: _kFont,
                                                fontSize: 12,
                                                color: _kMuted,
                                              ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  color: Colors.grey.shade400,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLineaChip(BuildContext context) {
    final mv = _servicioSeleccionado?.mv ?? 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: _kIconBg,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFD3D8F2)),
          ),
          child: Text(
            'Línea: $_lineaLabel',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: _kFont,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: _kTitle,
                ),
          ),
        ),
        if (mv > 0) ...[
          const SizedBox(height: 6),
          Text(
            'Tasa de referencia: ${mv.toStringAsFixed(mv.truncateToDouble() == mv ? 0 : 1)}% mensual vencido (MV)',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: _kFont,
                  fontSize: 12,
                  color: _kMuted,
                ),
          ),
        ],
      ],
    );
  }

  Widget _buildStep2(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Configura tu crédito.',
            style: TextStyle(
              fontFamily: _kFont,
              fontSize: 14,
              color: _kMuted,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 12),
          _buildLineaChip(context),
          const SizedBox(height: 24),
          Text(
            '¿Cuánto dinero necesitas?',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: _kFont,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF404040),
                ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _montoCtrl,
            keyboardType: TextInputType.number,
            inputFormatters: const [_ColombianPesoInputFormatter()],
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: _kFont,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: _kTitle,
                  letterSpacing: 0,
                ),
            decoration: InputDecoration(
              prefixText: '\$ ',
              prefixStyle: const TextStyle(
                fontFamily: _kFont,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: _kMuted,
              ),
              hintText: 'Ej. 5.000.000',
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.all(16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFD0D0D0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFD0D0D0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: _kTitle, width: 1.5),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            '¿En cuánto tiempo deseas pagarlo?',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: _kFont,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF404040),
                ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _plazoCtrl,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: _kFont,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: _kTitle,
                ),
            decoration: InputDecoration(
              suffix: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Text(
                  'meses',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: _kFont,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: _kMuted,
                      ),
                ),
              ),
              hintText: 'Ej. 24',
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.all(16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFD0D0D0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFD0D0D0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: _kTitle, width: 1.5),
              ),
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: _calcular,
              style: ElevatedButton.styleFrom(
                backgroundColor: _kOrangeBrand,
                foregroundColor: Colors.white,
                padding: EdgeInsets.zero,
                minimumSize: const Size(double.infinity, 48),
                maximumSize: const Size(double.infinity, 48),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: Text(
                'Simular crédito',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: _kFont,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultRow(
    BuildContext context, {
    required String label,
    required String value,
    bool alignEnd = false,
  }) {
    return Column(
      crossAxisAlignment:
          alignEnd ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: _kFont,
                fontSize: 12,
                color: const Color(0xFFA0A0A0),
              ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: _kFont,
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: _kTitle,
              ),
        ),
      ],
    );
  }

  Widget _buildStep3(BuildContext context) {
    final cuotaTxt = functions.formatAmount(_cuotaResultado);
    final montoTxt = functions.formatAmount(_montoResultado);
    final mv = _servicioSeleccionado?.mv ?? 0;
    final tasaTxt = mv > 0
        ? '${mv.toStringAsFixed(mv.truncateToDouble() == mv ? 0 : 1)}% M.V.'
        : '—';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Este es el cálculo proyectado de tu solicitud.',
            style: TextStyle(
              fontFamily: _kFont,
              fontSize: 14,
              color: _kMuted,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFEAEAEA)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: _kIconBg,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      _lineaLabel,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: _kFont,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF1834B1),
                          ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Cuota mensual estimada',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: _kFont,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: _kMuted,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  cuotaTxt,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: _kFont,
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    color: _kTitle,
                    letterSpacing: -0.5,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(height: 1, color: Color(0xFFF0F0F0)),
                const SizedBox(height: 16),
                _buildResultRow(context, label: 'Monto solicitado', value: montoTxt),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _buildResultRow(
                        context,
                        label: 'Plazo',
                        value: '$_plazoResultado meses',
                      ),
                    ),
                    Expanded(
                      child: _buildResultRow(
                        context,
                        label: 'Tasa aplicada',
                        value: tasaTxt,
                        alignEnd: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Valores referenciales según la línea seleccionada. La cuota final puede variar al aprobar el crédito.',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: _kFont,
                        fontSize: 11,
                        color: _kMuted,
                        lineHeight: 1.35,
                      ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: _volverASimular,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: _kTitle,
                      side: const BorderSide(color: _kTitle),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Volver a simular',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: _kFont,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      context.pushNamed(UnderDevelopmentWidget.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _kOrangeBrand,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Continuar con la solicitud',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: _kFont,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Formato colombiano: separador de miles con punto (ej. 5.000.000).
class _ColombianPesoInputFormatter extends TextInputFormatter {
  const _ColombianPesoInputFormatter();

  static String _formatDigits(String digits) {
    if (digits.isEmpty) return '';
    final buf = StringBuffer();
    for (var i = 0; i < digits.length; i++) {
      if (i > 0 && (digits.length - i) % 3 == 0) {
        buf.write('.');
      }
      buf.write(digits[i]);
    }
    return buf.toString();
  }

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digits = newValue.text.replaceAll(RegExp(r'[^\d]'), '');
    if (digits.isEmpty) {
      return const TextEditingValue(text: '');
    }
    final formatted = _formatDigits(digits);
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
