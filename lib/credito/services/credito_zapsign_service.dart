import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/credito/services/credito_documentos_cache.dart';
import '/credito/services/credito_documentos_service.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Firma ZapSign — mismo patrón que línea de ahorro:
/// - [InitiateSignatureCopyCall] + `external_id` = id de `HabilitarCredito`
/// - `pdfName` distinto por documento → el [zapsignWebhook] guarda en Storage y Firestore
class CreditoZapsignService {
  static const String redirectUrl =
      'alianza://alianza.com/creditoIntermissionZapsign';

  static const String pdfNamePagare = 'credito_pagare.pdf';
  static const String pdfNameAutorizacion = 'credito_autorizacion_nomina.pdf';

  /// Pagaré + autorización en un solo envío ZapSign (3 páginas).
  static const String pdfNameDocumentos = 'credito_documentos.pdf';

  static String _phoneDigits() {
    final raw = (currentPhoneNumber).replaceAll(RegExp(r'\D'), '');
    if (raw.length >= 10) return raw;
    final t1 = currentUserDocument?.telefono1 ?? '';
    final d = t1.replaceAll(RegExp(r'\D'), '');
    return d.length >= 10 ? d : '3000000000';
  }

  static Future<String> _habilitarCreditoDocId() async {
    final cached = CreditoDocumentosCache.habilitarCreditoDocId;
    if (cached != null && cached.isNotEmpty) return cached;

    final uid = currentUserUid;
    if (uid.isEmpty) {
      throw Exception('Usuario no autenticado');
    }
    final snap = await FirebaseFirestore.instance
        .collection('HabilitarCredito')
        .where('usuarioUid', isEqualTo: uid)
        .limit(1)
        .get();
    if (snap.docs.isEmpty) {
      throw Exception('No hay expediente HabilitarCredito para este usuario');
    }
    final id = snap.docs.first.id;
    CreditoDocumentosCache.habilitarCreditoDocId = id;
    return id;
  }

  static Future<void> _openSignUrl(String url) async {
    await openExternalSignUrl(url);
  }

  static Future<void> _enviarPdf({
    required String fase,
    required Uint8List bytes,
    required String pdfName,
    required Future<ApiCallResponse> Function(String token, String signerToken)
        placeSignature,
  }) async {
    final habilitarId = await _habilitarCreditoDocId();
    FFAppState().creditoZapsignFase = fase;
    final b64 = base64Encode(bytes);

    final response = await InitiateSignatureCopyCall.call(
      name: currentUserDisplayName,
      pdfString: b64,
      externalId: habilitarId,
      email: currentUserEmail,
      phone: _phoneDigits(),
      redirectURL: redirectUrl,
      pdfName: pdfName,
    );

    if (!(response.succeeded)) {
      final msg = InitiateSignatureCopyCall.errorMessage(response.jsonBody) ??
          'Error ZapSign (${response.statusCode})';
      throw Exception(msg);
    }

    final body = response.jsonBody;
    final signUrl = InitiateSignatureCopyCall.signURL(body);
    final docToken = InitiateSignatureCopyCall.documentToken(body);
    final signerToken = InitiateSignatureCopyCall.signersToken(body);

    if (signUrl == null || signUrl.isEmpty) {
      throw Exception('ZapSign no devolvió enlace de firma');
    }
    if (docToken == null || signerToken == null) {
      throw Exception('ZapSign no devolvió tokens');
    }

    FFAppState().zapsignToken = docToken;
    await placeSignature(docToken, signerToken);
    await _openSignUrl(signUrl);
  }

  /// Abre ZapSign con pagaré (2 págs.) y autorización (1 pág.) en la misma sesión.
  static Future<void> iniciarFirmaDocumentos() async {
    await CreditoDocumentosService.asegurarDocumentos(
      montoPreAprobado: currentUserDocument?.montoPreAprobado ?? 0,
      cuotaMensual: currentUserDocument?.cuotaMensual ?? 0,
      plazoAprobadoMeses: currentUserDocument?.plazoAprobadoMeses ?? 0,
    );
    final bytes = CreditoDocumentosCache.documentosFirmaBytes;
    if (bytes == null || bytes.isEmpty) {
      throw Exception('Genera los documentos antes de firmar');
    }
    await _enviarPdf(
      fase: 'documentos',
      bytes: bytes,
      pdfName: pdfNameDocumentos,
      placeSignature: (t, s) => PlaceSignatureInCreditoDocumentosCall.call(
        token: t,
        signerToken: s,
      ),
    );
  }

  static Future<void> iniciarFirmaPagare() async {
    final bytes = CreditoDocumentosCache.pagareBytes;
    if (bytes == null || bytes.isEmpty) {
      throw Exception('Genera los documentos antes de firmar');
    }
    await _enviarPdf(
      fase: 'pagare',
      bytes: bytes,
      pdfName: pdfNamePagare,
      placeSignature: (t, s) => PlaceSignatureInCreditoPagareCall.call(
        token: t,
        signerToken: s,
      ),
    );
  }

  static Future<void> iniciarFirmaAutorizacion() async {
    final bytes = CreditoDocumentosCache.autorizacionBytes;
    if (bytes == null || bytes.isEmpty) {
      throw Exception('No hay autorización generada');
    }
    await _enviarPdf(
      fase: 'autorizacion',
      bytes: bytes,
      pdfName: pdfNameAutorizacion,
      placeSignature: (t, s) => PlaceSignatureInCreditoAutorizacionCall.call(
        token: t,
        signerToken: s,
      ),
    );
  }
}
