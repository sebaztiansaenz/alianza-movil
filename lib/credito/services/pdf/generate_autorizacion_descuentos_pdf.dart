import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'credito_pdf_assets.dart';
import 'credito_pdf_pagare_layout.dart';
import 'credito_pdf_shared.dart';

const _clausulasAutorizacion =
    'Cláusula Primera – Continuidad y descuento irrevocable. LA AUTORIZACIÓN DE DESCUENTO APLICA AL EMPLEADOR ACTUAL Y A CUALQUIER EMPLEADOR FUTURO, SIN NECESIDAD DE NUEVO DOCUMENTO. Es el núcleo del contrato de libranza y debe mantenerse con el lenguaje "expreso e irrevocable". '
    'Cláusula Segunda – Liquidación y saldo exigible. Ante terminación del contrato laboral por cualquier causa, el empleador retiene y gira el saldo acelerado de la deuda desde la liquidación final. '
    'Cláusula Tercera – Traslado de obligación y deber de información. El asociado debe notificar a Alianza Capital en 5 días hábiles si cambia de empleador. '
    'Cláusula Cuarta – Tratamiento de datos personales (Ley 1581 de 2012). El asociado autoriza expresamente a Alianza Capital a recolectar, almacenar, usar, circular y suprimir sus datos personales para los fines del presente contrato, incluyendo la consulta y reporte a centrales de riesgo (DataCrédito, TransUnion). '
    'Cláusula Quinta – Intereses de mora y aceleración del plazo. En caso de incumplimiento de dos o más cuotas consecutivas, o de una sola cuota con más de 30 días de mora, Alianza Capital queda facultada para declarar el vencimiento anticipado de la totalidad de la obligación y cobrar intereses de mora a la tasa máxima legal permitida. '
    'Cláusula Sexta – Domicilio contractual y notificaciones. Las partes acuerdan como domicilio contractual la ciudad de Bogotá D.C. Cualquier notificación legal se hará al correo electrónico y número WhatsApp registrados en este documento. '
    'Cláusula Séptima – Firma electrónica y validez del documento (Ley 527 de 1999). Las partes reconocen que la firma electrónica aplicada mediante la plataforma Zapsign tiene plena validez y fuerza probatoria equivalente a la firma manuscrita, conforme a la Ley 527 de 1999. '
    'Cláusula Octava – Seguro de vida deudor. El asociado autoriza el descuento del seguro de vida deudor incluido en la primera cuota, el cual cubre el saldo insoluto del crédito en caso de fallecimiento o incapacidad total y permanente. '
    'Cláusula Novena – Resolución de conflictos. En caso de controversia derivada del presente contrato, las partes se someten en primera instancia a conciliación ante un Centro de Conciliación autorizado y, de no lograrse acuerdo, a los jueces civiles del Circuito de Bogotá D.C.';

pw.Widget _autField({
  required String label,
  required String value,
  int flex = 1,
  double height = 28,
}) {
  return pw.Expanded(
    flex: flex,
    child: pw.Container(
      height: height,
      padding: const pw.EdgeInsets.all(4),
      decoration: pw.BoxDecoration(
        border: pw.Border.all(color: PdfColors.white, width: 0.5),
        color: PdfColors.grey200,
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            creditoPdfSafe(label),
            style: creditoPdfStyle(fontSize: 5, color: PdfColors.grey700),
          ),
          pw.Text(
            creditoPdfSafe(value),
            style: creditoPdfStyle(fontSize: 8),
          ),
        ],
      ),
    ),
  );
}

pw.Widget _autSectionHeader(String title) => pw.Container(
      width: double.infinity,
      color: PdfColor(0.0, 0.0, 0.8),
      padding: const pw.EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: pw.Text(
        creditoPdfSafe(title),
        style: creditoPdfStyle(fontSize: 9, color: PdfColors.white),
      ),
    );

pw.Widget _autFooter(CreditoPdfAssets assets, String nombre, String cedula) {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Container(
        width: double.infinity,
        height: 64,
        decoration: pw.BoxDecoration(
          border: pw.Border.all(
            color: PdfColors.grey400,
            width: 1,
            style: pw.BorderStyle.dashed,
          ),
        ),
        child: pw.Align(
          alignment: pw.Alignment.bottomCenter,
          child: pw.Padding(
            padding: const pw.EdgeInsets.only(bottom: 5),
            child: pw.Text(
              'Espacio para firma electrónica',
              style: creditoPdfStyle(fontSize: 8, color: PdfColors.grey600),
            ),
          ),
        ),
      ),
      pw.SizedBox(height: 16),
      pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                creditoPdfSafe(nombre),
                style: creditoPdfStyle(fontSize: 10, fontWeight: pw.FontWeight.bold),
              ),
              pw.Text(
                'CC: ${creditoPdfSafe(cedula)}',
                style: creditoPdfStyle(fontSize: 8),
              ),
              pw.Text('FIRMA ELECTRÓNICA', style: creditoPdfStyle(fontSize: 8)),
            ],
          ),
          pw.Row(
            children: [
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Text(
                    'ALIANZA CAPITAL',
                    style: creditoPdfStyle(fontSize: 10, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.Text('Dpto. Financiero', style: creditoPdfStyle(fontSize: 8)),
                ],
              ),
              pw.SizedBox(width: 8),
              assets.selloBytes.isNotEmpty
                  ? pw.Image(pw.MemoryImage(assets.selloBytes), width: 40, height: 40)
                  : pw.Container(
                      width: 40,
                      height: 40,
                      decoration: const pw.BoxDecoration(
                        shape: pw.BoxShape.circle,
                        color: PdfColors.grey300,
                      ),
                      child: pw.Center(
                        child: pw.Text('SELLO', style: creditoPdfStyle(fontSize: 8)),
                      ),
                    ),
            ],
          ),
        ],
      ),
      pw.Container(
        alignment: pw.Alignment.bottomRight,
        margin: const pw.EdgeInsets.only(top: 8),
        child: assets.vigiladoBytes.isNotEmpty
            ? pw.Image(pw.MemoryImage(assets.vigiladoBytes), width: 120, height: 30)
            : pw.Container(
                width: 120,
                height: 30,
                color: PdfColors.grey300,
                child: pw.Center(
                  child: pw.Text(
                    'VIGILADO: SUPERINTENDENCIA DE LA\nECONOMÍA SOLIDARIA',
                    style: creditoPdfStyle(fontSize: 6),
                    textAlign: pw.TextAlign.center,
                  ),
                ),
              ),
      ),
    ],
  );
}

/// Autorización descuentos nómina — diseño custom action FlutterFlow.
Future<Uint8List> buildAutorizacionDescuentosPdf({
  required String nombres,
  required String tipoDocumento,
  required String numeroDocumento,
  required String fechaExpedicion,
  required String ciudadExpedicion,
  required String correoElectronico,
  required String whatsapp,
  required String otroTelefono,
  required String tipoLineaCredito,
}) async {
  await creditoPdfEnsureFonts();
  final pdf = creditoPdfNewDocument();
  final assets = await creditoPdfLoadAssets();
  creditoPdfAddAutorizacionPage(
    pdf,
    assets: assets,
    nombres: nombres,
    tipoDocumento: tipoDocumento,
    numeroDocumento: numeroDocumento,
    fechaExpedicion: fechaExpedicion,
    ciudadExpedicion: ciudadExpedicion,
    correoElectronico: correoElectronico,
    whatsapp: whatsapp,
    otroTelefono: otroTelefono,
    tipoLineaCredito: tipoLineaCredito,
  );
  return creditoPdfSave(pdf);
}

void creditoPdfAddAutorizacionPage(
  pw.Document pdf, {
  required CreditoPdfAssets assets,
  required String nombres,
  required String tipoDocumento,
  required String numeroDocumento,
  required String fechaExpedicion,
  required String ciudadExpedicion,
  required String correoElectronico,
  required String whatsapp,
  required String otroTelefono,
  required String tipoLineaCredito,
}) {
  final now = DateTime.now();
  final currentDate = '${now.day}/${now.month}/${now.year}';

  // Página fija (3.ª del PDF unificado) — misma área útil que pagaré.
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      margin: pagarePageMargin,
      build: (context) => pw.SizedBox(
        height: pagareAlturaUtil(context),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.stretch,
          children: [
          pw.Expanded(
            child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
            pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Image(assets.logo, width: 150, height: 80),
                pw.SizedBox(width: 20),
                pw.Container(width: 3, height: 60, color: PdfColors.orange),
                pw.SizedBox(width: 15),
                pw.Container(
                  width: 230,
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.SizedBox(height: 8),
                      pw.Text(
                        creditoPdfSafe(
                          'AUTORIZACIÓN DE DESCUENTOS POR NÓMINA\nOTROS CONCEPTOS\nDIRECCIÓN DE TALENTO HUMANO',
                        ),
                        style: creditoPdfStyle(
                          fontSize: 11,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(width: 12),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.end,
                  children: [
                    pw.Container(
                      margin: const pw.EdgeInsets.only(top: -20),
                      child: pw.Image(assets.logoBw, height: 55),
                    ),
                    pw.SizedBox(height: 25),
                    pw.Text(
                      currentDate,
                      style: creditoPdfStyle(
                        fontSize: 11,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Text('Fecha', style: creditoPdfStyle(fontSize: 9)),
                  ],
                ),
              ],
            ),
            pw.SizedBox(height: 10),
            _autSectionHeader('DESCRIPCIÓN DE PRODUCTO'),
            pw.SizedBox(height: 4),
            pw.Row(
              children: [
                _autField(
                  label: 'Tipo de línea de crédito',
                  value: tipoLineaCredito,
                  flex: 4,
                ),
                _autField(label: 'Fecha', value: currentDate, flex: 1),
              ],
            ),
            pw.SizedBox(height: 6),
            _autSectionHeader('INFORMACIÓN DEL ASOCIADO'),
            pw.SizedBox(height: 4),
            pw.Container(
              width: double.infinity,
              padding: const pw.EdgeInsets.all(3),
              decoration: pw.BoxDecoration(
                border: pw.Border.all(color: PdfColors.white, width: 0.5),
                color: PdfColors.grey200,
              ),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    'Nombres y Apellidos',
                    style: creditoPdfStyle(fontSize: 5, color: PdfColors.grey700),
                  ),
                  pw.Text(
                    creditoPdfSafe(nombres),
                    style: creditoPdfStyle(fontSize: 8),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            pw.SizedBox(height: 2),
            pw.Row(
              children: [
                _autField(label: 'Tipo de documento', value: tipoDocumento),
                _autField(label: 'Número de documento', value: numeroDocumento),
                _autField(label: 'Fecha de expedición', value: fechaExpedicion),
                _autField(
                  label: 'Ciudad y departamento de expedición',
                  value: ciudadExpedicion,
                  flex: 2,
                ),
              ],
            ),
            pw.SizedBox(height: 6),
            _autSectionHeader('DATOS DE CONTACTO Y FIRMA ELECTRÓNICA'),
            pw.SizedBox(height: 4),
            pw.Row(
              children: [
                _autField(
                  label: 'Correo electrónico',
                  value: correoElectronico,
                  flex: 3,
                ),
                _autField(label: 'WhatsApp', value: whatsapp),
                _autField(label: 'Otro teléfono', value: otroTelefono),
              ],
            ),
            pw.SizedBox(height: 8),
            pw.Expanded(
              child: pw.Text(
                creditoPdfSafe(_clausulasAutorizacion),
                style: creditoPdfStyle(fontSize: 7.2, lineSpacing: 1.4),
                textAlign: pw.TextAlign.justify,
              ),
            ),
          ],
            ),
          ),
          _autFooter(assets, nombres, numeroDocumento),
        ],
        ),
      ),
    ),
  );
}
