import 'package:cloud_firestore/cloud_firestore.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/credito/services/credito_documentos_cache.dart';
import '/credito/widgets/credito_oferta_estado.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Persistencia del flujo de oferta de crédito en `user` y `HabilitarCredito`.
class CreditoOfertaFirestoreService {
  static Future<String?> _habilitarCreditoDocId() async {
    final cached = CreditoDocumentosCache.habilitarCreditoDocId;
    if (cached != null && cached.isNotEmpty) return cached;

    final uid = currentUserUid;
    if (uid.isEmpty) return null;
    final snap = await FirebaseFirestore.instance
        .collection('HabilitarCredito')
        .where('usuarioUid', isEqualTo: uid)
        .limit(1)
        .get();
    if (snap.docs.isEmpty) return null;
    final id = snap.docs.first.id;
    CreditoDocumentosCache.habilitarCreditoDocId = id;
    return id;
  }

  /// Tras aceptar términos y generar documentos (pantalla de carga).
  static Future<void> registrarAceptacionYDocumentos({
    required int montoPreAprobado,
    required int cuotaMensual,
    required int plazoAprobadoMeses,
  }) async {
    final ref = currentUserReference;
    if (ref == null) return;

    await ref.update(
      createUserRecordData(
        respuestaCredito: true,
        estadoOfertaCredito: CreditoOfertaEstado.pendienteFirma,
        creditofecha: getCurrentTimestamp,
        montoPreAprobado: montoPreAprobado,
        cuotaMensual: cuotaMensual,
        plazoAprobadoMeses: plazoAprobadoMeses,
      ),
    );
  }

  static Future<void> registrarRechazoOferta() async {
    final ref = currentUserReference;
    if (ref == null) return;

    await ref.update(
      createUserRecordData(
        respuestaCredito: false,
        estadoOfertaCredito: CreditoOfertaEstado.rechazado,
      ),
    );
  }

  static Future<void> registrarEnDesembolso() async {
    final ref = currentUserReference;
    if (ref == null) return;

    await ref.update(
      createUserRecordData(
        estadoOfertaCredito: CreditoOfertaEstado.enDesembolso,
      ),
    );
  }

  /// Copia de respaldo en app; el enlace definitivo (Storage) lo pone [zapsignWebhook].
  static Future<void> guardarUrlsDocumentos({
    String? pagareUrl,
    String? autorizacionNominaUrl,
  }) async {
    final ref = currentUserReference;
    if (ref != null) {
      await ref.update(
        createUserRecordData(
          creditoDocPagareUrl: pagareUrl,
          creditoDocAutorizacionNominaUrl: autorizacionNominaUrl,
        ),
      );
    }

    final hbId = await _habilitarCreditoDocId();
    if (hbId == null) return;

    final hbData = <String, dynamic>{};
    if (pagareUrl != null) hbData['creditoDocPagareUrl'] = pagareUrl;
    if (autorizacionNominaUrl != null) {
      hbData['creditoDocAutorizacionNominaUrl'] = autorizacionNominaUrl;
    }
    if (hbData.isEmpty) return;

    await FirebaseFirestore.instance
        .collection('HabilitarCredito')
        .doc(hbId)
        .update(hbData);
  }
}
