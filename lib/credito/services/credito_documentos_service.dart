import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/credito/services/credito_documentos_cache.dart';
import '/credito/services/credito_numero_letras.dart';
import '/credito/services/pdf/generate_credito_documentos_firma_pdf.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

/// Genera y cachea los PDF de crédito (pagaré + autorización nómina).
class CreditoDocumentosService {
  static String _dash(String? v) =>
      (v == null || v.trim().isEmpty) ? '-' : v.trim();

  static String _fmtDate(dynamic v) {
    if (v is Timestamp) {
      return DateFormat('d/M/y').format(v.toDate());
    }
    if (v is DateTime) {
      return DateFormat('d/M/y').format(v);
    }
    return '-';
  }

  static String _pickHb(Map<String, dynamic>? hb, List<String> keys) {
    if (hb == null) return '';
    for (final k in keys) {
      final v = hb[k];
      if (v == null) continue;
      final s = v.toString().trim();
      if (s.isNotEmpty && s != '-') return s;
    }
    return '';
  }

  static String _ciudadDepto(UserRecord? u) {
    if (u == null) return '-';
    final c = u.ciudad.trim();
    final d = u.departamento.trim();
    if (c.isEmpty && d.isEmpty) return '-';
    if (d.isEmpty) return c;
    if (c.isEmpty) return d;
    return '$c, $d';
  }

  static String _ciudadExpedicionUsuario(UserRecord? u) {
    if (u == null) return '-';
    final ce = u.ciudadExpedicion.trim();
    final dep = u.departamento.trim();
    if (ce.isNotEmpty && dep.isNotEmpty) return '$ce, $dep';
    if (ce.isNotEmpty) return ce;
    return _ciudadDepto(u);
  }

  static String _nombresCliente(UserRecord? u, Map<String, dynamic>? hb) {
    final desdeHb = _pickHb(hb, ['nombreapp', 'nombreApp', 'nombre_completo']);
    if (desdeHb.isNotEmpty) return desdeHb;

    if (u != null) {
      final compuesto = '${u.nombre.trim()} ${u.apellido.trim()}'.trim();
      if (compuesto.isNotEmpty) return compuesto;
      final display = u.displayName.trim();
      if (display.isNotEmpty) return display;
    }
    final authName = currentUserDisplayName.trim();
    if (authName.isNotEmpty) return authName;
    return '-';
  }

  static String _numeroPagare(Map<String, dynamic>? hb, UserRecord? u) {
    if (u != null && u.codigocredito > 0) {
      return '${u.codigocredito}';
    }
    final idHb = hb?['id'];
    if (idHb != null && idHb.toString().trim().isNotEmpty) {
      return idHb.toString().trim();
    }
    final idDoc = hb?['_docId']?.toString().trim();
    if (idDoc != null && idDoc.isNotEmpty) return idDoc;
    final uid = u?.uid ?? currentUserUid;
    return uid.isNotEmpty ? uid : '-';
  }

  static String _tipoDocumento(UserRecord? u) {
    if (u == null) return 'C.C.';
    final t = u.tipoDocumento.trim();
    return t.isNotEmpty ? t : 'C.C.';
  }

  static String _numeroDocumento(UserRecord? u) {
    if (u == null) return '-';
    if (u.nroDocumento.trim().isNotEmpty) return u.nroDocumento.trim();
    if (u.nit.trim().isNotEmpty) return u.nit.trim();
    return '-';
  }

  static String _emailUsuario(UserRecord? u) {
    final mail = (u?.email ?? '').trim();
    if (mail.isNotEmpty) return mail;
    final auth = currentUserEmail.trim();
    return auth.isNotEmpty ? auth : '-';
  }

  static String _whatsappUsuario(UserRecord? u) {
    if (u == null) return '-';
    if (u.telefono1.trim().isNotEmpty) return u.telefono1.trim();
    if (u.phoneNumber.trim().isNotEmpty) return u.phoneNumber.trim();
    final auth = currentPhoneNumber.trim();
    return auth.isNotEmpty ? auth : '-';
  }

  static String _direccionUsuario(UserRecord? u, Map<String, dynamic>? hb) {
    if (u != null && u.direccion.trim().isNotEmpty) return u.direccion.trim();
    final r = _pickHb(hb, ['residencia', 'direccion', 'direccionResidencia']);
    return r.isNotEmpty ? r : '-';
  }

  static Future<UserRecord?> _usuarioFirestore() async {
    final ref = currentUserReference;
    if (ref == null) return currentUserDocument;
    try {
      return await UserRecord.getDocumentOnce(ref);
    } catch (_) {
      return currentUserDocument;
    }
  }

  static Future<Map<String, dynamic>?> _habilitarData() async {
    final uid = currentUserUid;
    if (uid.isEmpty) return null;

    final col = FirebaseFirestore.instance.collection('HabilitarCredito');

    Future<QuerySnapshot<Map<String, dynamic>>> byUsuarioUid() => col
        .where('usuarioUid', isEqualTo: uid)
        .limit(1)
        .get();

    var snap = await byUsuarioUid();

    final userRef = currentUserReference;
    if (snap.docs.isEmpty && userRef != null) {
      snap = await col.where('user', isEqualTo: userRef).limit(1).get();
    }

    if (snap.docs.isEmpty) return null;

    final doc = snap.docs.first;
    final data = Map<String, dynamic>.from(doc.data());
    data['_docId'] = doc.id;
    CreditoDocumentosCache.habilitarCreditoDocId = doc.id;
    return data;
  }

  static _DatosCodeudor _codeudorDesdeFuentes(
    UserRecord? u,
    Map<String, dynamic>? hb,
  ) {
    final nombres = _pickHb(hb, [
      'nombresCodeudor',
      'nombreCodeudor',
      'codeudorNombre',
      'nombre_codeudor',
      'nombreCoDeudor',
    ]);
    final tipoDoc = _pickHb(hb, [
      'tipoDocumentoCodeudor',
      'codeudorTipoDocumento',
      'tipo_documento_codeudor',
    ]);
    final numeroDoc = _pickHb(hb, [
      'numeroDocumentoCodeudor',
      'codeudorDocumento',
      'documentoCodeudor',
      'nroDocumentoCodeudor',
    ]);
    final fechaExp = _fmtDate(
      hb?['fechaExpedicionCodeudor'] ?? hb?['codeudorFechaExpedicion'],
    );
    final ciudadExp = _pickHb(hb, [
      'ciudadExpedicionCodeudor',
      'codeudorCiudadExpedicion',
    ]);
    final direccion = _pickHb(hb, [
      'direccionResidenciaCodeudor',
      'codeudorDireccion',
      'direccionCodeudor',
    ]);
    final ciudadRes = _pickHb(hb, [
      'ciudadResidenciaCodeudor',
      'codeudorCiudadResidencia',
    ]);
    final barrio = _pickHb(hb, ['barrioCodeudor', 'codeudorBarrio']);
    final email = _pickHb(hb, [
      'correoElectronicoCodeudor',
      'codeudorEmail',
      'emailCodeudor',
    ]);
    final whatsapp = _pickHb(hb, [
      'whatsappCodeudor',
      'codeudorWhatsapp',
      'telefonoCodeudor',
    ]);
    final otroTel = _pickHb(hb, [
      'otroTelefonoCodeudor',
      'codeudorTelefono2',
    ]);

    return _DatosCodeudor(
      nombres: _dash(nombres.isEmpty ? null : nombres),
      tipoDocumento: _dash(tipoDoc.isEmpty ? null : tipoDoc),
      numeroDocumento: _dash(numeroDoc.isEmpty ? null : numeroDoc),
      fechaExpedicion: fechaExp == '-' ? '-' : fechaExp,
      ciudadExpedicion: _dash(ciudadExp.isEmpty ? null : ciudadExp),
      direccionResidencia: _dash(direccion.isEmpty ? null : direccion),
      ciudadResidencia: _dash(ciudadRes.isEmpty ? null : ciudadRes),
      barrio: _dash(barrio.isEmpty ? null : barrio),
      correoElectronico: _dash(email.isEmpty ? null : email),
      whatsapp: _dash(whatsapp.isEmpty ? null : whatsapp),
      otroTelefono: _dash(otroTel.isEmpty ? null : otroTel),
    );
  }

  static Future<void> generarYCachear({
    required int montoPreAprobado,
    required int cuotaMensual,
    required int plazoAprobadoMeses,
  }) async {
    final habilitarIdPrevio = CreditoDocumentosCache.habilitarCreditoDocId;
    CreditoDocumentosCache.pagareBytes = null;
    CreditoDocumentosCache.autorizacionBytes = null;
    CreditoDocumentosCache.documentosFirmaBytes = null;
    CreditoDocumentosCache.habilitarCreditoDocId = habilitarIdPrevio;

    final u = await _usuarioFirestore();
    final hb = await _habilitarData();
    final now = DateTime.now();
    final codeudor = _codeudorDesdeFuentes(u, hb);

    final nombres = _nombresCliente(u, hb);
    final tipoDoc = _tipoDocumento(u);
    final numeroDoc = _numeroDocumento(u);
    final fechaExp = _fmtDate(u?.fechaExpedicion);
    final ciudadExp = _ciudadExpedicionUsuario(u);
    final email = _emailUsuario(u);
    final whatsapp = _whatsappUsuario(u);
    final otroTel = _dash(u?.telefono2);

    final tipoLinea = _pickHb(hb, ['tipodecredito', 'tipoCredito', 'tipoLinea']);
    final tipoLineaFinal =
        tipoLinea.isNotEmpty ? tipoLinea : 'Crédito de libranza';

    final montoHb = castToType<int>(hb?['montoSolicitud']) ?? 0;
    final plazoHb = castToType<int>(hb?['mesesApagar']) ?? 0;

    final monto = montoPreAprobado > 0
        ? montoPreAprobado
        : (u?.montoPreAprobado ?? 0) > 0
            ? u!.montoPreAprobado
            : montoHb;
    final plazo = plazoAprobadoMeses > 0
        ? plazoAprobadoMeses
        : (u?.plazoAprobadoMeses ?? 0) > 0
            ? u!.plazoAprobadoMeses
            : plazoHb;
    final cuota = cuotaMensual > 0
        ? cuotaMensual
        : (u?.cuotaMensual ?? 0);

    final intereses = ((cuota * plazo) - monto).clamp(0, 1 << 31).toInt();
    final montoFmt = functions.formatAmount(monto.toDouble());
    final interesesFmt = functions.formatAmount(intereses.toDouble());

    final fechaSol = hb?['fechaSolicitud'] ?? u?.creditofecha ?? now;
    final fechaApertura = _fmtDate(fechaSol);

    final numeroPagare = _numeroPagare(hb, u);

    String mesNombre(int month) {
      const meses = [
        '',
        'enero',
        'febrero',
        'marzo',
        'abril',
        'mayo',
        'junio',
        'julio',
        'agosto',
        'septiembre',
        'octubre',
        'noviembre',
        'diciembre',
      ];
      if (month < 1 || month > 12) return '';
      return meses[month];
    }

    final unificado = await buildCreditoDocumentosFirmaPdf(
      tipoLineaCredito: tipoLineaFinal,
      numeroPagare: numeroPagare,
      fechaApertura: fechaApertura,
      nombresPrincipal: nombres,
      tipoDocumentoPrincipal: tipoDoc,
      numeroDocumentoPrincipal: numeroDoc,
      fechaExpedicionPrincipal: fechaExp,
      ciudadExpedicionPrincipal: ciudadExp,
      direccionResidenciaPrincipal: _direccionUsuario(u, hb),
      ciudadResidenciaPrincipal: _ciudadDepto(u),
      barrioPrincipal: _dash(u?.barrio),
      correoElectronicoPrincipal: email,
      whatsappPrincipal: whatsapp,
      otroTelefonoPrincipal: otroTel,
      nombresCodeudor: codeudor.nombres,
      tipoDocumentoCodeudor: codeudor.tipoDocumento,
      numeroDocumentoCodeudor: codeudor.numeroDocumento,
      fechaExpedicionCodeudor: codeudor.fechaExpedicion,
      ciudadExpedicionCodeudor: codeudor.ciudadExpedicion,
      direccionResidenciaCodeudor: codeudor.direccionResidencia,
      ciudadResidenciaCodeudor: codeudor.ciudadResidencia,
      barrioCodeudor: codeudor.barrio,
      correoElectronicoCodeudor: codeudor.correoElectronico,
      whatsappCodeudor: codeudor.whatsapp,
      otroTelefonoCodeudor: codeudor.otroTelefono,
      valorCapitalLetras: creditoMontoEnLetras(monto),
      valorCapitalNumeros: montoFmt,
      valorInteresesLetras: creditoMontoEnLetras(intereses),
      valorInteresesNumeros: interesesFmt,
      diaPagare: '${now.day}',
      mesPagare: mesNombre(now.month),
      anioPagare: '${now.year}',
      ciudadSuscripcion: _dash(u?.ciudad),
      departamentoSuscripcion: _dash(u?.departamento),
      ciudadCumplimiento: _dash(u?.ciudad),
      diaCumplimiento: '${now.day}',
      mesCumplimiento: mesNombre(now.month),
      anioCumplimiento: '${now.year}',
      nombres: nombres,
      tipoDocumento: tipoDoc,
      numeroDocumento: numeroDoc,
      fechaExpedicion: fechaExp,
      ciudadExpedicion: ciudadExp,
      correoElectronico: email,
      whatsapp: whatsapp,
      otroTelefono: otroTel,
    );

    CreditoDocumentosCache.documentosFirmaBytes = unificado;
    CreditoDocumentosCache.pagareBytes = unificado;
    CreditoDocumentosCache.autorizacionBytes = unificado;
  }

  /// Siempre regenera con datos frescos de Firestore (evita PDF cacheado incorrecto).
  static Future<void> asegurarDocumentos({
    required int montoPreAprobado,
    required int cuotaMensual,
    required int plazoAprobadoMeses,
  }) async {
    await generarYCachear(
      montoPreAprobado: montoPreAprobado,
      cuotaMensual: cuotaMensual,
      plazoAprobadoMeses: plazoAprobadoMeses,
    );
  }
}

class _DatosCodeudor {
  const _DatosCodeudor({
    required this.nombres,
    required this.tipoDocumento,
    required this.numeroDocumento,
    required this.fechaExpedicion,
    required this.ciudadExpedicion,
    required this.direccionResidencia,
    required this.ciudadResidencia,
    required this.barrio,
    required this.correoElectronico,
    required this.whatsapp,
    required this.otroTelefono,
  });

  final String nombres;
  final String tipoDocumento;
  final String numeroDocumento;
  final String fechaExpedicion;
  final String ciudadExpedicion;
  final String direccionResidencia;
  final String ciudadResidencia;
  final String barrio;
  final String correoElectronico;
  final String whatsapp;
  final String otroTelefono;
}
