import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'credito_pdf_assets.dart';
import 'credito_pdf_shared.dart';

const kCreditoAcreedor = 'ALIANZA CAPITAL DE AHORRO Y CREDITO FIMUTUAL';

/// Márgenes plantilla pagaré (más área útil que 40pt laterales).
const pagarePageMargin =
    pw.EdgeInsets.only(left: 28, top: 16, right: 28, bottom: 24);

/// Altura disponible dentro de [pw.Page] (permite [pw.Expanded] sin error de flex).
double pagareAlturaUtil(pw.Context context) =>
    context.page.pageFormat.availableHeight;

bool pagareTieneCodeudor(String nombresCodeudor, String numeroDocumentoCodeudor) {
  final n = nombresCodeudor.trim();
  final c = numeroDocumentoCodeudor.trim();
  if (n.isEmpty || n == '-') return false;
  if (c.isEmpty || c == '-') return false;
  return true;
}

pw.Widget pagareSectionHeader(String title) => pw.Container(
      width: double.infinity,
      color: PdfColor(0.0, 0.0, 0.8),
      padding: const pw.EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      child: pw.Text(
        creditoPdfSafe(title),
        style: creditoPdfStyle(fontSize: 9, color: PdfColors.white),
      ),
    );

pw.Widget pagareField({
  required String label,
  required String value,
  int flex = 1,
  double height = 26,
}) =>
    pw.Expanded(
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
              style: creditoPdfStyle(fontSize: 5.5, color: PdfColors.grey700),
            ),
            pw.Text(
              creditoPdfSafe(value),
              style: creditoPdfStyle(fontSize: 8),
            ),
          ],
        ),
      ),
    );

pw.Widget pagareFullField({
  required String label,
  required String value,
  double height = 26,
}) =>
    pw.Container(
      width: double.infinity,
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
            style: creditoPdfStyle(fontSize: 5.5, color: PdfColors.grey700),
          ),
          pw.Text(
            creditoPdfSafe(value),
            style: creditoPdfStyle(fontSize: 8),
          ),
        ],
      ),
    );

/// Bloques de codeudor (siempre visibles, como en la plantilla).
List<pw.Widget> pagareBloquesCodeudor({
  required String nombresCodeudor,
  required String tipoDocumentoCodeudor,
  required String numeroDocumentoCodeudor,
  required String fechaExpedicionCodeudor,
  required String ciudadExpedicionCodeudor,
  required String direccionResidenciaCodeudor,
  required String ciudadResidenciaCodeudor,
  required String barrioCodeudor,
  required String correoElectronicoCodeudor,
  required String whatsappCodeudor,
  required String otroTelefonoCodeudor,
}) {
  return [
    pw.SizedBox(height: 6),
    pagareSectionHeader('INFORMACIÓN DEL ASOCIADO Y/O SUSCRIPTOR CODEUDOR'),
    pw.SizedBox(height: 3),
    pagareFullField(label: 'Nombres y Apellidos', value: nombresCodeudor),
    pw.SizedBox(height: 2),
    pw.Row(
      children: [
        pagareField(label: 'Tipo de documento', value: tipoDocumentoCodeudor),
        pagareField(label: 'Número de documento', value: numeroDocumentoCodeudor),
        pagareField(label: 'Fecha de expedición', value: fechaExpedicionCodeudor),
        pagareField(
          label: 'Ciudad y departamento de expedición',
          value: ciudadExpedicionCodeudor,
          flex: 2,
        ),
      ],
    ),
    pw.SizedBox(height: 2),
    pagareFullField(
      label: 'Dirección de residencia',
      value: direccionResidenciaCodeudor,
    ),
    pw.SizedBox(height: 2),
    pw.Row(
      children: [
        pagareField(
          label: 'Ciudad y departamento de residencia',
          value: ciudadResidenciaCodeudor,
          flex: 3,
        ),
        pagareField(label: 'Barrio', value: barrioCodeudor),
      ],
    ),
    pw.SizedBox(height: 8),
    pagareSectionHeader(
      'DATOS DE CONTACTO Y FIRMA ELECTRÓNICA DEL ASOCIADO Y/O SUSCRIPTOR CODEUDOR',
    ),
    pw.SizedBox(height: 4),
    pw.Row(
      children: [
        pagareField(
          label: 'Correo electrónico',
          value: correoElectronicoCodeudor,
          flex: 3,
        ),
        pagareField(label: 'WhatsApp', value: whatsappCodeudor),
        pagareField(label: 'Otro teléfono', value: otroTelefonoCodeudor),
      ],
    ),
  ];
}

/// Versión resumida para página 2 (carta de instrucciones).
List<pw.Widget> pagareBloquesCodeudorPagina2({
  required String nombresCodeudor,
  required String tipoDocumentoCodeudor,
  required String numeroDocumentoCodeudor,
  required String fechaExpedicionCodeudor,
  required String ciudadExpedicionCodeudor,
}) {
  return [
    pw.SizedBox(height: 6),
    pagareSectionHeader('INFORMACIÓN DEL ASOCIADO Y/O SUSCRIPTOR CODEUDOR'),
    pw.SizedBox(height: 3),
    pagareFullField(label: 'Nombres y Apellidos', value: nombresCodeudor),
    pw.SizedBox(height: 2),
    pw.Row(
      children: [
        pagareField(label: 'Tipo de documento', value: tipoDocumentoCodeudor),
        pagareField(label: 'Número de documento', value: numeroDocumentoCodeudor),
        pagareField(label: 'Fecha de expedición', value: fechaExpedicionCodeudor),
        pagareField(
          label: 'Ciudad y departamento de expedición',
          value: ciudadExpedicionCodeudor,
          flex: 2,
        ),
      ],
    ),
  ];
}

pw.Widget pagareNumeral(String numero, String texto) => pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 2),
      child: pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.SizedBox(
            width: 18,
            child: pw.Text(
              numero,
              style: creditoPdfStyle(fontSize: 7.5, fontWeight: pw.FontWeight.bold),
            ),
          ),
          pw.Expanded(
            child: pw.Text(
              creditoPdfSafe(texto),
              style: creditoPdfStyle(fontSize: 7.5, lineSpacing: 1.45),
              textAlign: pw.TextAlign.justify,
            ),
          ),
        ],
      ),
    );

pw.Widget pagareFooter({
  required CreditoPdfAssets assets,
  required String paginaLabel,
  required String ccPrincipal,
  required String ccCodeudor,
}) {
  final cajasFirma = pw.Row(
    children: [
      pw.Expanded(
        child: _pagareCajaFirma('ESPACIO PARA FIRMA ELECTRONICA DEUDOR PRINCIPAL'),
      ),
      pw.SizedBox(width: 8),
      pw.Expanded(
        child: _pagareCajaFirma('ESPACIO PARA FIRMA ELECTRONICA CODEUDOR'),
      ),
    ],
  );

  return pw.Column(
    children: [
      cajasFirma,
      pw.SizedBox(height: 8),
      pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'C.C. ${creditoPdfSafe(ccPrincipal)}',
                style: creditoPdfStyle(fontSize: 9, fontWeight: pw.FontWeight.bold),
              ),
              pw.Text('FIRMADO ELECTRONICAMENTE', style: creditoPdfStyle(fontSize: 8)),
              pw.Text('USUARIO (SUSCRIPTOR)', style: creditoPdfStyle(fontSize: 8)),
            ],
          ),
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'C.C. ${creditoPdfSafe(ccCodeudor)}',
                style: creditoPdfStyle(fontSize: 9, fontWeight: pw.FontWeight.bold),
              ),
              pw.Text('FIRMADO ELECTRONICAMENTE', style: creditoPdfStyle(fontSize: 8)),
              pw.Text('USUARIO CO-DEUDOR', style: creditoPdfStyle(fontSize: 8)),
            ],
          ),
          pw.Row(
            children: [
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Text(
                    'ALIANZA CAPITAL',
                    style: creditoPdfStyle(fontSize: 8, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.Text('Dpto. Financiero', style: creditoPdfStyle(fontSize: 7)),
                  pw.Text(
                    creditoPdfSafe(paginaLabel),
                    style: creditoPdfStyle(fontSize: 7, color: PdfColors.grey700),
                  ),
                ],
              ),
              pw.SizedBox(width: 6),
              assets.selloBytes.isNotEmpty
                  ? pw.Image(pw.MemoryImage(assets.selloBytes), width: 32, height: 32)
                  : pw.Container(
                      width: 32,
                      height: 32,
                      decoration: const pw.BoxDecoration(
                        shape: pw.BoxShape.circle,
                        color: PdfColors.grey300,
                      ),
                      child: pw.Center(
                        child: pw.Text('SELLO', style: creditoPdfStyle(fontSize: 7)),
                      ),
                    ),
            ],
          ),
        ],
      ),
      pw.Container(
        alignment: pw.Alignment.bottomRight,
        margin: const pw.EdgeInsets.only(top: 6),
        child: assets.vigiladoBytes.isNotEmpty
            ? pw.Image(pw.MemoryImage(assets.vigiladoBytes), width: 110, height: 26)
            : pw.SizedBox.shrink(),
      ),
    ],
  );
}

pw.Widget _pagareCajaFirma(String label) => pw.Container(
      height: 52,
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
          padding: const pw.EdgeInsets.only(bottom: 4),
          child: pw.Text(
            creditoPdfSafe(label),
            style: creditoPdfStyle(fontSize: 6, color: PdfColors.grey600),
            textAlign: pw.TextAlign.center,
          ),
        ),
      ),
    );

pw.Widget pagareHeaderRow(CreditoPdfAssets assets, String titleBlock) => pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Image(assets.logo, width: 140, height: 72),
        pw.SizedBox(width: 14),
        pw.Container(width: 3, height: 58, color: PdfColors.orange),
        pw.SizedBox(width: 12),
        pw.Expanded(
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.SizedBox(height: 8),
              pw.Text(
                creditoPdfSafe(titleBlock),
                style: creditoPdfStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
              ),
            ],
          ),
        ),
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.end,
          children: [
            pw.Container(
              margin: const pw.EdgeInsets.only(top: -18),
              child: pw.Image(assets.logoBw, height: 52),
            ),
          ],
        ),
      ],
    );

pw.TextStyle pagareBodyStyle() => creditoPdfStyle(fontSize: 7.2, lineSpacing: 1.35);
pw.TextStyle pagareBoldStyle() => creditoPdfStyle(
      fontSize: 7.2,
      fontWeight: pw.FontWeight.bold,
      lineSpacing: 1.35,
    );
