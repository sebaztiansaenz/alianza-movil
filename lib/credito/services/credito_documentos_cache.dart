import 'dart:typed_data';

/// PDFs generados en memoria durante la sesión del flujo de oferta.
class CreditoDocumentosCache {
  static Uint8List? pagareBytes;
  static Uint8List? autorizacionBytes;

  /// Pagaré + autorización en un solo PDF (3 páginas) para ZapSign.
  static Uint8List? documentosFirmaBytes;

  /// ID del doc `HabilitarCredito/{id}` — va en `external_id` de ZapSign (webhook).
  static String? habilitarCreditoDocId;

  static void clear() {
    pagareBytes = null;
    autorizacionBytes = null;
    documentosFirmaBytes = null;
    habilitarCreditoDocId = null;
  }

  static bool get listo =>
      documentosFirmaBytes != null && documentosFirmaBytes!.isNotEmpty;
}
