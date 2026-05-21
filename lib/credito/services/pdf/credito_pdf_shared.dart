import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

pw.Font? _creditoPdfRegular;
pw.Font? _creditoPdfBold;

/// Fuentes con Unicode (evita errores de Helvetica en web).
Future<void> creditoPdfEnsureFonts() async {
  _creditoPdfRegular ??= await PdfGoogleFonts.notoSansRegular();
  _creditoPdfBold ??= await PdfGoogleFonts.notoSansBold();
}

pw.Document creditoPdfNewDocument() {
  if (_creditoPdfRegular == null || _creditoPdfBold == null) {
    throw StateError('Llame creditoPdfEnsureFonts() antes de generar PDF');
  }
  return pw.Document(
    theme: pw.ThemeData.withFont(
      base: _creditoPdfRegular!,
      bold: _creditoPdfBold!,
    ),
  );
}

Future<pw.MemoryImage> creditoPdfLoadLogo(String url) async {
  final r = await http.get(Uri.parse(url));
  return pw.MemoryImage(r.bodyBytes);
}

const creditoLogoUrl =
    'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/Alianza%20Pdf%20logo.png?alt=media&token=69805315-febc-43ef-9716-181c14efba26';

String creditoPdfSafe(String text) {
  return text
      .replaceAll('\u2014', '-')
      .replaceAll('\u2013', '-')
      .replaceAll('—', '-')
      .replaceAll('–', '-');
}

pw.TextStyle creditoPdfStyle({
  double fontSize = 8,
  pw.FontWeight? fontWeight,
  PdfColor? color,
  double? lineSpacing,
}) =>
    pw.TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      lineSpacing: lineSpacing ?? 1.15,
    );

pw.Widget creditoPdfParagraph(String text, {double fontSize = 7.5}) => pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 4),
      child: pw.Text(
        creditoPdfSafe(text),
        style: creditoPdfStyle(fontSize: fontSize),
        textAlign: pw.TextAlign.justify,
      ),
    );

pw.Widget creditoPdfSignatureRow({
  required String docPrincipal,
  required String docCodeudor,
  required String labelPrincipal,
  required String labelCodeudor,
}) =>
    pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.stretch,
      children: [
        pw.SizedBox(height: 8),
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Expanded(
              child: pw.Column(
                children: [
                  pw.Text('C.C.', style: creditoPdfStyle(fontSize: 7)),
                  pw.Text(
                    creditoPdfSafe(docPrincipal),
                    style: creditoPdfStyle(fontSize: 8, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.SizedBox(height: 4),
                  pw.Text(
                    'FIRMADO ELECTRONICAMENTE',
                    style: creditoPdfStyle(fontSize: 6.5),
                  ),
                  pw.Text(
                    'USUARIO (SUSCRIPTOR)',
                    style: creditoPdfStyle(fontSize: 6.5),
                  ),
                ],
              ),
            ),
            pw.SizedBox(width: 12),
            pw.Expanded(
              child: pw.Column(
                children: [
                  pw.Text('C.C.', style: creditoPdfStyle(fontSize: 7)),
                  pw.Text(
                    creditoPdfSafe(docCodeudor),
                    style: creditoPdfStyle(fontSize: 8, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.SizedBox(height: 4),
                  pw.Text(
                    'FIRMADO ELECTRONICAMENTE',
                    style: creditoPdfStyle(fontSize: 6.5),
                  ),
                  pw.Text(
                    'USUARIO CO-DEUDOR',
                    style: creditoPdfStyle(fontSize: 6.5),
                  ),
                ],
              ),
            ),
          ],
        ),
        pw.SizedBox(height: 6),
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Expanded(
              child: creditoPdfSignBox(labelPrincipal),
            ),
            pw.SizedBox(width: 12),
            pw.Expanded(
              child: creditoPdfSignBox(labelCodeudor),
            ),
          ],
        ),
      ],
    );

pw.Widget creditoPdfSignBox(String label) => pw.Container(
      height: 52,
      decoration: pw.BoxDecoration(
        border: pw.Border.all(
          color: PdfColors.grey500,
          width: 0.8,
          style: pw.BorderStyle.dashed,
        ),
      ),
      child: pw.Center(
        child: pw.Padding(
          padding: const pw.EdgeInsets.all(4),
          child: pw.Text(
            creditoPdfSafe(label),
            style: creditoPdfStyle(fontSize: 6.5, color: PdfColors.grey700),
            textAlign: pw.TextAlign.center,
          ),
        ),
      ),
    );

Future<Uint8List> creditoPdfSave(pw.Document pdf) => pdf.save();
