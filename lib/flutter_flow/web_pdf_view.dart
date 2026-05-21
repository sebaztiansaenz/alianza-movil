import 'dart:js_interop';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:web/web.dart' as web;

/// Abre el PDF en una pestaña nueva del navegador (visor nativo, pantalla completa).
void openPdfInNewBrowserTab(Uint8List bytes) {
  if (!kIsWeb || bytes.isEmpty) {
    return;
  }

  final blob = web.Blob(
    <web.BlobPart>[bytes.toJS].toJS,
    web.BlobPropertyBag(type: 'application/pdf'),
  );
  final url = web.URL.createObjectURL(blob);
  web.window.open(url, '_blank');
}

/// Descarga el PDF al dispositivo.
void downloadPdfInBrowser(Uint8List bytes, {String fileName = 'contrato_ahorro.pdf'}) {
  if (!kIsWeb || bytes.isEmpty) {
    return;
  }

  final blob = web.Blob(
    <web.BlobPart>[bytes.toJS].toJS,
    web.BlobPropertyBag(type: 'application/pdf'),
  );
  final url = web.URL.createObjectURL(blob);
  final anchor = web.HTMLAnchorElement()
    ..href = url
    ..download = fileName;
  anchor.click();
  web.URL.revokeObjectURL(url);
}
