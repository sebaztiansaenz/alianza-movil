// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

Future<FFUploadedFile> firstSignedPDF(
  String nombres,
  String paisde,
  String tipoDocument,
  String empresa,
  String cc,
  String signatureID,
  String nit,
) async {
  final pdf = pw.Document();
  final currentDate =
      DateFormat('dd MMMM yyyy', 'es_ES').format(DateTime.now());

  // Load the logo from the URL
  final logoUrl =
      'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/Sin-ti%CC%81tulo-2.png?alt=media&token=b89a8a6b-59ca-4b5b-978d-913826013683'; // Replace with the actual URL
  final response = await http.get(Uri.parse(logoUrl));
  final logoImage = pw.MemoryImage(response.bodyBytes);

  pdf.addPage(
    pw.MultiPage(
      build: (pw.Context context) => [
        pw.Stack(
          overflow: pw.Overflow.visible,
          children: [
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Image(logoImage, width: 120, height: 100),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: [
                        pw.Text('NIT 901.813.044-1',
                            style: pw.TextStyle(fontSize: 10)),
                        pw.Text('Ciudad de Bogota',
                            style: pw.TextStyle(fontSize: 10)),
                        pw.Text('Calle 98 # 22 - 64 OFC 710',
                            style: pw.TextStyle(fontSize: 10)),
                        pw.Text('Whatsapp 315 779 2999',
                            style: pw.TextStyle(fontSize: 10)),
                      ],
                    ),
                  ],
                ),
                pw.SizedBox(height: 20),
                pw.Center(
                  child: pw.Text('APERTURA LINEA DE AHORRO MI NOMINA',
                      style: pw.TextStyle(
                          fontSize: 16, fontWeight: pw.FontWeight.bold)),
                ),
                pw.SizedBox(height: 10),
                pw.Text(currentDate,
                    style: pw.TextStyle(
                        fontSize: 14, fontWeight: pw.FontWeight.bold)),
                pw.Text('Fecha apertura',
                    style: pw.TextStyle(fontSize: 12, lineSpacing: 10)),
                pw.SizedBox(height: 10),
                pw.SizedBox(height: 10),
                pw.Row(
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('$nombres',
                            style: pw.TextStyle(
                                fontSize: 14,
                                fontWeight: pw.FontWeight.bold,
                                lineSpacing: 10)),
                        pw.Text('Nombres y Apellidos',
                            style: pw.TextStyle(fontSize: 12, lineSpacing: 10)),
                      ],
                    ),
                    pw.SizedBox(width: 64),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('$cc',
                            style: pw.TextStyle(
                                fontSize: 14, fontWeight: pw.FontWeight.bold)),
                        pw.Text('CC',
                            style: pw.TextStyle(fontSize: 12, lineSpacing: 10)),
                      ],
                    ),
                  ],
                ),
                pw.SizedBox(height: 24),
                pw.Text(
                    'Solicito la apertura de LÍNEA DE AHORRO MI NOMINA, la cual será usada para propósitos de ahorro y/o inversión de mis recursos.',
                    style: pw.TextStyle(fontSize: 12, lineSpacing: 10)),
                pw.SizedBox(height: 24),
                pw.Text(
                    'Acepto que he leído los términos y condiciones, así como el contenido de reglamento (s) del producto que establece la LÍNEA DE AHORRO MI NOMINA aperturada en Alianza Solidaria de Ahorro y Crédito y que lo ha puesto a disposición de la página web ',
                    style: pw.TextStyle(fontSize: 12, lineSpacing: 10)),
                pw.Row(children: [
                  pw.UrlLink(
                    destination: 'http://www.alianzasolidaria.co',
                    child: pw.Text(
                      'www.alianzasolidaria.co',
                      style: pw.TextStyle(
                        fontSize: 12,
                        lineSpacing: 10,
                        color: PdfColors.blue,
                        decoration: pw.TextDecoration.underline,
                      ),
                    ),
                  ),
                  pw.Text(
                    ', así mismo manifiesto que:',
                    style: pw.TextStyle(fontSize: 12, lineSpacing: 10),
                  ),
                ]),
                pw.SizedBox(height: 24),
                pw.Text(
                    '1. He leído y declaro conocer el reglamento (s) que establecen condiciones, las características y que rigen la LÍNEA DE AHORRO MI NOMINA y lo acepto en su integridad de manera libre y espontánea.',
                    style: pw.TextStyle(fontSize: 12, lineSpacing: 10)),
                pw.SizedBox(height: 10),
                pw.Text(
                    '2. Conozco que, en caso de tener dudas al respecto del producto, puedo ingresar a ',
                    style: pw.TextStyle(fontSize: 12, lineSpacing: 10)),
                pw.Row(children: [
                  pw.UrlLink(
                    destination: 'http://www.alianzasolidaria.co',
                    child: pw.Text(
                      'www.alianzasolidaria.co',
                      style: pw.TextStyle(
                        fontSize: 12,
                        lineSpacing: 10,
                        color: PdfColors.blue,
                        decoration: pw.TextDecoration.underline,
                      ),
                    ),
                  ),
                  pw.Text(
                    ' para obtener más información o puedo contactarme vía ',
                    style: pw.TextStyle(fontSize: 12, lineSpacing: 10),
                  ),
                ]),
                pw.Row(children: [
                  pw.Text(
                    'WhatsApp al 315 779 2999 o al correo ',
                    style: pw.TextStyle(fontSize: 12, lineSpacing: 10),
                  ),
                  pw.Text(
                    'info@alianzasolidaria.co',
                    style: pw.TextStyle(
                      fontSize: 12,
                      lineSpacing: 10,
                      color: PdfColors.blue,
                      decoration: pw.TextDecoration.underline,
                    ),
                  ),
                ]),
                pw.SizedBox(height: 32),
                pw.Text('De acuerdo con lo anterior, atentamente.',
                    style: pw.TextStyle(fontSize: 12, lineSpacing: 10)),
                pw.SizedBox(height: 64),
                pw.Center(
                  child: pw.Column(children: [
                    pw.Text('$nombres',
                        style: pw.TextStyle(
                            fontSize: 16,
                            fontWeight: pw.FontWeight.bold,
                            lineSpacing: 10)),
                    pw.Text('CC $cc',
                        style: pw.TextStyle(fontSize: 14, lineSpacing: 10)),
                    pw.Text('FIRMA ELECTRONICA',
                        style: pw.TextStyle(fontSize: 14, lineSpacing: 10)),
                  ]),
                ),
                // pw.Center(
                //   child: pw.Column(children: [
                //     pw.Text('Firmado el $currentDate por $nombres con CC $numero ',
                //         style: pw.TextStyle(fontSize: 14)),
                //     pw.Text('Firma ID xxxxxxxx', style: pw.TextStyle(fontSize: 14)),
                //   ]),
                // ),
              ],
            ),
            pw.Positioned(
              right: -245, // Push the text outside the main content area
              top: 320, // Adjust top offset as needed
              child: pw.Transform.rotate(
                angle: 3.14159 / 2, // Rotate 90 degrees counterclockwise
                child: pw.Text(
                  'Este documento incorpora firma electrónica, de acuerdo a la ley N° 51 de $currentDate',
                  style: pw.TextStyle(
                    fontSize: 10,
                    color: PdfColors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
      footer: (pw.Context context) {
        return pw.Center(
          child: pw.Column(children: [
            pw.Text('Firmado el $currentDate por $nombres con CC $cc ',
                style: pw.TextStyle(fontSize: 11, lineSpacing: 9),
                textAlign: pw.TextAlign.center),
            pw.Text('Firma ID $signatureID', style: pw.TextStyle(fontSize: 11)),
          ]),
        );
      },
    ),
  );

  pdf.addPage(
    pw.MultiPage(
      build: (pw.Context context) => [
        pw.Stack(
          overflow: pw.Overflow.visible,
          children: [
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Center(
                  child: pw.Column(children: [
                    pw.Text('AUTORIZACIÓN DESCUENTOS POR NOMINA',
                        style: pw.TextStyle(
                            fontSize: 14,
                            fontWeight: pw.FontWeight.bold,
                            lineSpacing: 10)),
                    pw.Text('OTROS CONCEPTOS',
                        style: pw.TextStyle(fontSize: 14, lineSpacing: 10)),
                    pw.Text('Dirección de talento humano',
                        style: pw.TextStyle(fontSize: 14, lineSpacing: 10)),
                  ]),
                ),
                pw.SizedBox(height: 14),
                pw.Text(currentDate,
                    style: pw.TextStyle(
                        fontSize: 14,
                        fontWeight: pw.FontWeight.bold,
                        lineSpacing: 10)),
                pw.Text('Fecha apertura',
                    style: pw.TextStyle(fontSize: 12, lineSpacing: 10)),
                pw.SizedBox(height: 14),
                pw.Container(
                  width: double.infinity,
                  color: PdfColors.grey300,
                  padding: pw.EdgeInsets.all(8),
                  child: pw.Center(
                    child: pw.Text(
                      'INFORMACIÓN',
                      style: pw.TextStyle(
                        fontSize: 12,
                        lineSpacing: 10,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                ),
                pw.SizedBox(height: 10),
                pw.Row(
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('$nombres',
                            style: pw.TextStyle(
                                fontSize: 14,
                                fontWeight: pw.FontWeight.bold,
                                lineSpacing: 10)),
                        pw.Text('Nombres y Apellidos',
                            style: pw.TextStyle(fontSize: 12, lineSpacing: 10)),
                      ],
                    ),
                    pw.SizedBox(width: 64),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('$cc',
                            style: pw.TextStyle(
                                fontSize: 14,
                                fontWeight: pw.FontWeight.bold,
                                lineSpacing: 10)),
                        pw.Text('CC',
                            style: pw.TextStyle(fontSize: 12, lineSpacing: 10)),
                      ],
                    ),
                  ],
                ),
                pw.SizedBox(height: 14),
                pw.Row(
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('$tipoDocument',
                            style: pw.TextStyle(
                                fontSize: 14,
                                fontWeight: pw.FontWeight.bold,
                                lineSpacing: 10)),
                        pw.Text('Tipo de contrato',
                            style: pw.TextStyle(fontSize: 12, lineSpacing: 10)),
                      ],
                    ),
                    pw.SizedBox(width: 64),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('$paisde',
                            style: pw.TextStyle(
                                fontSize: 14,
                                fontWeight: pw.FontWeight.bold,
                                lineSpacing: 10)),
                        pw.Text('Valor Aporte',
                            style: pw.TextStyle(fontSize: 12, lineSpacing: 10)),
                      ],
                    ),
                    pw.SizedBox(width: 64),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('$empresa',
                            style: pw.TextStyle(
                                fontSize: 14,
                                fontWeight: pw.FontWeight.bold,
                                lineSpacing: 10)),
                        pw.Text('Empresa',
                            style: pw.TextStyle(fontSize: 12, lineSpacing: 10)),
                      ],
                    ),
                  ],
                ),
                pw.SizedBox(height: 10),
                pw.Container(
                  width: double.infinity,
                  color: PdfColors.grey300,
                  padding: pw.EdgeInsets.all(8),
                  child: pw.Center(
                    child: pw.Text(
                      'AUTORIZACIÓN',
                      style: pw.TextStyle(
                        fontSize: 12,
                        lineSpacing: 10,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                ),
                pw.SizedBox(height: 20),
                pw.Text(
                    'Yo $nombres identificado(a) con cédula de ciudadanía $cc autorizo a la empresa $empresa con NIT $nit para descontarme por nómina, el valor del aporte anteriormente mencionaod. Este descuento será un aporte a mí, línea de ahorro mi nómina en la empresa ALIANZA SOLIDARIA DE AHORRO Y CRÉDITO FIMUTUAL identificada con NIT 901.813.044-1',
                    style: pw.TextStyle(fontSize: 12, lineSpacing: 10)),
                pw.SizedBox(height: 24),
                pw.Text('De acuerdo con lo anterior, atentamente.',
                    style: pw.TextStyle(fontSize: 12, lineSpacing: 10)),
                pw.SizedBox(height: 72),
                pw.Center(
                  child: pw.Column(children: [
                    pw.Text('$nombres',
                        style: pw.TextStyle(
                            fontSize: 16, fontWeight: pw.FontWeight.bold)),
                    pw.Text('CC $cc',
                        style: pw.TextStyle(fontSize: 14, lineSpacing: 10)),
                    pw.Text('FIRMA ELECTRONICA',
                        style: pw.TextStyle(fontSize: 14, lineSpacing: 10)),
                  ]),
                ),
                pw.SizedBox(height: 64),
                // pw.Center(
                //   child: pw.Column(children: [
                //     pw.Text('Firmado el $currentDate por $nombres con CC $numero ',
                //         style: pw.TextStyle(fontSize: 14)),
                //     pw.Text('Firma ID xxxxxxxx', style: pw.TextStyle(fontSize: 14)),
                //   ]),
                // ),
              ],
            ),
            pw.Positioned(
              right: -245, // Push the text outside the main content area
              top: 320, // Adjust top offset as needed
              child: pw.Transform.rotate(
                angle: 3.14159 / 2, // Rotate 90 degrees counterclockwise
                child: pw.Text(
                  'Este documento incorpora firma electrónica, de acuerdo a la ley N° 51 de $currentDate',
                  style: pw.TextStyle(
                    fontSize: 10,
                    color: PdfColors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
      footer: (pw.Context context) {
        return pw.Center(
          child: pw.Column(children: [
            pw.Text('Firmado el $currentDate por $nombres con CC $cc ',
                style: pw.TextStyle(fontSize: 11, lineSpacing: 9),
                textAlign: pw.TextAlign.center),
            pw.Text('Firma ID $signatureID', style: pw.TextStyle(fontSize: 11)),
          ]),
        );
      },
    ),
  );

  final output = await getTemporaryDirectory();
  final file = File("${output.path}/example.pdf");
  await file.writeAsBytes(await pdf.save());

  final fileBytes = await file.readAsBytes();
  final uploadedFile = FFUploadedFile(name: 'example.pdf', bytes: fileBytes);
  return uploadedFile;
}

Future<String> uploadFile(String filePath) async {
  // Implement the file upload logic here, which returns the file URL
  // This could be Firebase Storage, AWS S3, etc.
  return "uploaded_file_url";
}
