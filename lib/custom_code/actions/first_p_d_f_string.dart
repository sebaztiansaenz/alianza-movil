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
import 'dart:convert'; // For base64 encoding
import 'package:printing/printing.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

Future<String> firstPDFString(
  String nombres,
  // String direccion,
  String paisde,
  String tipoDocument,
  // String fechaNacimiento,
  // String email,
  // String numero,
  // String fechaLugar,
  // String telefono,
  String cc,
  String nit,
  String empresa,
) async {
  final pdf = pw.Document();
  final currentDate =
      DateFormat('dd MMMM yyyy', 'es_ES').format(DateTime.now());

  // Load the logo from the URL
  final logoUrl =
      // 'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/Sin-ti%CC%81tulo-2.png?alt=media&token=b89a8a6b-59ca-4b5b-978d-913826013683'; // Replace with the actual URL
      'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/Alianza%20Pdf%20logo.png?alt=media&token=69805315-febc-43ef-9716-181c14efba26';
  final response = await http.get(Uri.parse(logoUrl));
  final logoImage = pw.MemoryImage(response.bodyBytes);

  final logoBWUrl =
      // 'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/Alianza%20logo.png?alt=media&token=3b5cd6cf-e097-47fe-b508-b884443e729d'; // Replace with the actual URL
      'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/Alianza%20pdf%20logo%20design.png?alt=media&token=52460c6f-9061-42c0-8681-aa5dc3db4c7a';
  final responseBW = await http.get(Uri.parse(logoBWUrl));
  final logoBWImage = pw.MemoryImage(responseBW.bodyBytes);

  pdf.addPage(
    pw.MultiPage(
      //margin: pw.EdgeInsets.symmetric(horizontal: 60, vertical: 4),
      margin: pw.EdgeInsets.only(
        left: 60, // Set the left margin
        top: 4, // Set the top margin
        right: 60, // Set the right margin
        bottom: 20, // Set the bottom margin
      ),
      header: (pw.Context context) {
        return pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Image(logoImage, width: 120, height: 100),
            pw.Image(logoBWImage, height: 60),
          ],
        );
      },
      build: (pw.Context context) => [
        pw.Stack(
          overflow: pw.Overflow.visible,
          children: [
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.SizedBox(height: 20),
                pw.Center(
                  child: pw.Text('APERTURA LÍNEA DE AHORRO DE NOMINA',
                      style: pw.TextStyle(
                          fontSize: 16, fontWeight: pw.FontWeight.bold)),
                ),
                pw.SizedBox(height: 16),
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
                pw.SizedBox(height: 16),
                pw.RichText(
                  textDirection: pw.TextDirection.ltr,
                  text: pw.TextSpan(
                    text: ' ',
                    style: pw.TextStyle(fontSize: 13),
                    children: [
                      pw.TextSpan(
                        text: 'Solicito la apertura de ',
                        style: pw.TextStyle(fontSize: 13),
                      ),
                      pw.TextSpan(
                        text: 'LÍNEA DE AHORRO DE NOMINA',
                        style: pw.TextStyle(
                            fontSize: 13, fontWeight: pw.FontWeight.bold),
                      ),
                    ],
                  ),
                  textAlign: pw.TextAlign.left,
                ),
                pw.SizedBox(height: 16),
                pw.Text(
                    'La cual será usada para propósitos de ahorro y/o inversión de mis recursos. Acepto que he leído los términos y condiciones, así como el contenidodereglamento (s) del producto que establece la:',
                    style: pw.TextStyle(fontSize: 12)),
                pw.SizedBox(height: 16),
                pw.Text('LÍNEA DE AHORRO DE NOMINA',
                    style: pw.TextStyle(
                        fontSize: 12,
                        lineSpacing: 10,
                        fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 24),
                pw.Text(
                  'Aperturada en Alianza Solidaria de Ahorro y Crédito y que lo ha puestoadisposición de la ',
                  style: pw.TextStyle(fontSize: 12),
                ),
                pw.Row(children: [
                  pw.Text(
                    'página web ',
                    style: pw.TextStyle(fontSize: 12, lineSpacing: 10),
                  ),
                  pw.UrlLink(
                    destination: 'http://www.alianzacapital.co',
                    child: pw.Text(
                      'http://www.alianzacapital.co',
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
                pw.RichText(
                  textDirection: pw.TextDirection.ltr,
                  text: pw.TextSpan(
                    text: ' ',
                    style: pw.TextStyle(fontSize: 13),
                    children: [
                      pw.TextSpan(
                        text:
                            '1. He leído y declaro conocer el reglamento (s) que establecen condiciones, las características y que rigen la ',
                        style: pw.TextStyle(fontSize: 13),
                      ),
                      pw.TextSpan(
                        text: 'LÍNEA DE AHORRO DE NOMINA',
                        style: pw.TextStyle(
                            fontSize: 13, fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text:
                            ' y lo acepto en su integridad de manera libre y espontánea',
                        style: pw.TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                  textAlign: pw.TextAlign.left,
                ),
                pw.SizedBox(height: 10),
                pw.Text(
                    '2. Conozco que, en caso de tener dudas al respecto del producto, puedo ingresar a ',
                    style: pw.TextStyle(fontSize: 12, lineSpacing: 10)),
                pw.Row(children: [
                  pw.UrlLink(
                    destination: 'http://www.alianzacapital.co',
                    child: pw.Text(
                      'www.alianzacapital.co',
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
                    'info@alianzacapital.co',
                    style: pw.TextStyle(
                      fontSize: 12,
                      lineSpacing: 10,
                      color: PdfColors.blue,
                      decoration: pw.TextDecoration.underline,
                    ),
                  ),
                ]),
                pw.SizedBox(height: 10),
                pw.Text(
                    '3. El siguiente documento contiene firma electronica segun Ley 527 de 1999, Ley de Comercio Electrónico, que regula el comercio electrónico y sientalasbases para la existencia y exigibilidad de las mas firmas digitales. Decreto2364 de 2012 que diferencia entre firma electrónica y firma digital comotipoespecifíco de firma electrónica.',
                    style: pw.TextStyle(fontSize: 12)),
                pw.SizedBox(height: 24),
                pw.Text('De acuerdo con lo anterior, atentamente.',
                    style: pw.TextStyle(fontSize: 12)),
                pw.SizedBox(height: 54),
                pw.Center(
                  child: pw.Column(children: [
                    pw.Text('$nombres',
                        style: pw.TextStyle(
                          fontSize: 16,
                          fontWeight: pw.FontWeight.bold,
                        )),
                    pw.Text('CC $cc', style: pw.TextStyle(fontSize: 14)),
                    pw.Text('FIRMA ELECTRONICA',
                        style: pw.TextStyle(fontSize: 14)),
                  ]),
                ),
              ],
            ),
            pw.Positioned(
              right: -183, // Push the text outside the main content area
              top: 320, // Adjust top offset as needed
              // child: pw.Transform.rotate(
              //   angle: 3.14159 / 2,
              //   child: pw.Row(
              //     mainAxisAlignment:
              //         pw.MainAxisAlignment.start, // Align content to the start
              //     children: [
              //       pw.Column(
              //           crossAxisAlignment: pw.CrossAxisAlignment.center,
              //           children: [
              //             pw.Container(
              //               width: 44,
              //               height: 0.5,
              //               color: PdfColors.black,
              //             ),
              //             pw.Text('VIGILADO', style: pw.TextStyle(fontSize: 9)),
              //             pw.Container(
              //               width: 44,
              //               height: 0.5,
              //               color: PdfColors.black,
              //             ),
              //           ]),
              //       pw.SizedBox(width: 2),
              //       pw.Column(
              //           crossAxisAlignment: pw.CrossAxisAlignment.center,
              //           children: [
              //             pw.Text('SUPERINTENDENCIA DE LA',
              //                 style: pw.TextStyle(fontSize: 5)),
              //             pw.Text('ECONOMIA SOLIDARIA',
              //                 style: pw.TextStyle(fontSize: 5)),
              //           ]),
              //     ],
              //   ),
              // ),
              child: pw.Transform.rotate(
                angle: 3.14159 / 2, // Rotate 90 degrees counterclockwise
                child: pw.Text("SUPERINTENDENCIA DE LA ECONOMIA SOLIDARIA",
                    style: pw.TextStyle(fontSize: 11)),
              ),
            ),
          ],
        ),
      ],
      footer: (pw.Context context) {
        return pw.Center(
          child: pw.Column(children: [
            pw.Text(
                'Este documento incorpora firma electronica, de acuerdo a la ley N° 51 de $currentDate ',
                style: pw.TextStyle(fontSize: 10),
                textAlign: pw.TextAlign.center),
            pw.SizedBox(height: 10),
          ]),
        );
      },
    ),
  );
  // Second page
  pdf.addPage(
    pw.MultiPage(
      //margin: pw.EdgeInsets.symmetric(horizontal: 60, vertical: 4),
      margin: pw.EdgeInsets.only(
        left: 60, // Set the left margin
        top: 4, // Set the top margin
        right: 60, // Set the right margin
        bottom: 20, // Set the bottom margin
      ),
      header: (pw.Context context) {
        return pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Image(logoImage, width: 120, height: 100),
            pw.Image(logoBWImage, height: 60),
          ],
        );
      },
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
                    pw.Text('Dirección de Talento Humano',
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
                // pw.Text(
                //     'Yo $nombres identificado(a) con cédula de ciudadanía $cc autorizo a la empresa $empresa con NIT $nit para descontarme por nómina, el valor del aporte anteriormente mencionaod. Este descuento será un aporte a mí, línea de ahorro mi nómina en la empresa ALIANZA SOLIDARIA DE AHORRO Y CRÉDITO FIMUTUAL identificada con NIT 901.813.044-1',
                //     style: pw.TextStyle(fontSize: 12, lineSpacing: 10)),
                pw.RichText(
                  textDirection: pw.TextDirection.ltr,
                  text: pw.TextSpan(
                    text: ' ',
                    style: pw.TextStyle(fontSize: 13),
                    children: [
                      pw.TextSpan(
                        text: 'Yo ',
                        style: pw.TextStyle(fontSize: 13),
                      ),
                      pw.TextSpan(
                        text: '$nombres',
                        style: pw.TextStyle(
                            fontSize: 13, fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: ' identificado(a) concedula de ciudadania ',
                        style: pw.TextStyle(fontSize: 13),
                      ),
                      pw.TextSpan(
                        text: '$cc',
                        style: pw.TextStyle(
                            fontSize: 13, fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: ' autorizo a la empresa ',
                        style: pw.TextStyle(fontSize: 13),
                      ),
                      pw.TextSpan(
                        text: '$empresa',
                        style: pw.TextStyle(
                            fontSize: 13, fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: ' con NIT ',
                        style: pw.TextStyle(fontSize: 13),
                      ),
                      pw.TextSpan(
                        text: '$nit',
                        style: pw.TextStyle(
                            fontSize: 13, fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text:
                            ' para descontarmepor nomina, el valor del aporte anteriormente mencionado. Estedescuento sera un aporte a mi ',
                        style: pw.TextStyle(fontSize: 13),
                      ),
                      pw.TextSpan(
                        text: 'LINEA DE AHORRO DE NOMINA',
                        style: pw.TextStyle(
                            fontSize: 13, fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text:
                            ' en la empresa ALIANZA SOLIDARIA DE AHORROYCREDITOFIMUTUAL identificada con NIT 901813044-1.',
                        style: pw.TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                  textAlign: pw.TextAlign.left,
                ),
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
              ],
            ),
            pw.Positioned(
              left: -183, // Push the text outside the main content area
              top: 320, // Adjust top offset as needed
              child: pw.Transform.rotate(
                angle: 3.14159 / 2, // Rotate 90 degrees counterclockwise
                child: pw.Text("SUPERINTENDENCIA DE LA ECONOMIA SOLIDARIA",
                    style: pw.TextStyle(fontSize: 11)),
              ),
            ),
          ],
        ),
      ],
      footer: (pw.Context context) {
        return pw.Center(
          child: pw.Column(children: [
            pw.Text(
                'Este documento incorpora firma electronica, de acuerdo a la ley N° 51 de $currentDate',
                style: pw.TextStyle(fontSize: 10),
                textAlign: pw.TextAlign.center),
            pw.SizedBox(height: 10),
          ]),
        );
      },
    ),
  );

  pdf.addPage(
    pw.MultiPage(
      margin: pw.EdgeInsets.only(
        left: 60, // Set the left margin
        top: 4, // Set the top margin
        right: 60, // Set the right margin
        bottom: 20, // Set the bottom margin
      ),
      header: (pw.Context context) {
        return pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Image(logoImage, width: 120, height: 100),
            pw.Image(logoBWImage, height: 60),
            // pw.Text("Información de Titularidad del asociado",
            //     style:
            //         pw.TextStyle(fontSize: 13, fontWeight: pw.FontWeight.bold)),
          ],
        );
      },
      build: (pw.Context context) => [
        pw.Stack(
          overflow: pw.Overflow.visible,
          children: [
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Center(
                  child: pw.Column(children: [
                    pw.Text('CONTRATO LINEAS DE AHORRO ALIANZA',
                        style: pw.TextStyle(
                            fontSize: 16, fontWeight: pw.FontWeight.bold)),
                    pw.SizedBox(height: 20),
                  ]),
                ),
                pw.SizedBox(height: 16),
                pw.Text(currentDate,
                    style: pw.TextStyle(
                        fontSize: 14, fontWeight: pw.FontWeight.bold)),
                pw.Text('Fecha apertura',
                    style: pw.TextStyle(fontSize: 12, lineSpacing: 10)),
                pw.SizedBox(height: 16),
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
                pw.SizedBox(height: 20),
                pw.Center(
                  child: pw.Text("CLAUSULAS",
                      style: pw.TextStyle(
                          fontSize: 16, fontWeight: pw.FontWeight.bold)),
                ),
                pw.SizedBox(height: 16),
                pw.RichText(
                  textDirection: pw.TextDirection.ltr,
                  text: pw.TextSpan(
                    text: ' ',
                    style: pw.TextStyle(fontSize: 13),
                    children: [
                      pw.TextSpan(
                        text: 'ASOCIADO, ',
                        style: pw.TextStyle(
                            fontSize: 13,
                            fontWeight: pw.FontWeight.bold,
                            lineSpacing: 10),
                      ),
                      pw.TextSpan(
                        text: 'con la firma de este contrato de apertura de ',
                        style: pw.TextStyle(fontSize: 13, lineSpacing: 10),
                      ),
                      pw.TextSpan(
                        text: 'LINEA DE AHORRO, ',
                        style: pw.TextStyle(
                            fontSize: 13,
                            fontWeight: pw.FontWeight.bold,
                            lineSpacing: 10),
                      ),
                      pw.TextSpan(
                        text: 'confirmo que acepto las siguientes clausulas:',
                        style: pw.TextStyle(fontSize: 13, lineSpacing: 10),
                      ),
                    ],
                  ),
                  textAlign: pw.TextAlign.left,
                ),
                pw.SizedBox(height: 16),
                pw.RichText(
                  textDirection: pw.TextDirection.ltr,
                  text: pw.TextSpan(
                    text: ' ',
                    style: pw.TextStyle(fontSize: 13),
                    children: [
                      pw.TextSpan(
                        text: 'PRIMERO: ',
                        style: pw.TextStyle(
                            fontSize: 13,
                            fontWeight: pw.FontWeight.bold,
                            lineSpacing: 12),
                      ),
                      pw.TextSpan(
                        text:
                            'La información aquí suministrada por mí es confidencial y necesaria para la vinculación como asociado ahorrador en FIMUTUAL, la gestión y aprobación de cualquier producto u operación y/o la atención de mis solicitudes, peticiones, quejas o reclamos. Declaro que la información suministrada en el Sitio Web o la Aplicación es de mi titularidad, concuerda con la realidad y asumo plena responsabilidad por la veracidad de esta; cualquier inexactitud podrá acarrear las consecuencias expuestas en el Reglamento de productos, sin responsabilidad alguna por parte de FIMUTUAL, frente a terceros. Reconozco y acepto que en el evento que la información por mí suministrada en este Sitio Web o aplicación no sea de mi propiedad, induzca a una falsedad personal o sea violatoria del bien jurídico tutelado denominado ',
                        style: pw.TextStyle(fontSize: 13, lineSpacing: 12),
                      ),
                      pw.TextSpan(
                        text:
                            'de la protección de la información y de los datos ',
                        style: pw.TextStyle(
                            fontSize: 13,
                            fontWeight: pw.FontWeight.bold,
                            lineSpacing: 12),
                      ),
                      pw.TextSpan(
                        text:
                            'podré incurrir en tipos penales previstos por la legislación colombiana.',
                        style: pw.TextStyle(fontSize: 13, lineSpacing: 12),
                      ),
                    ],
                  ),
                  textAlign: pw.TextAlign.left,
                ),
                pw.SizedBox(height: 16),
                pw.Text(
                    "Así mismo, entiendo que autorizo a FIMUTUAL con relación a:",
                    style: pw.TextStyle(fontSize: 13, lineSpacing: 12)),
                pw.SizedBox(height: 20),
                pw.Text(
                    "I. Autorización Reporte y Consulta de Información ante los OperadoresdeBancos de Datos de Información Financiera y/o Crediticia (Ley 1266de2008 y Ley 2157 de 2021). Autorizo de FIMUTUAL, como responsabledel Tratamiento; sus",
                    style: pw.TextStyle(fontSize: 13, lineSpacing: 12)),
              ],
            ),
            pw.Positioned(
              left: -183, // Push the text outside the main content area
              top: 320, // Adjust top offset as needed
              child: pw.Transform.rotate(
                angle: 3.14159 / 2, // Rotate 90 degrees counterclockwise
                child: pw.Text("SUPERINTENDENCIA DE LA ECONOMIA SOLIDARIA",
                    style: pw.TextStyle(fontSize: 11)),
              ),
            ),
          ],
        ),
      ],
      footer: (pw.Context context) {
        return pw.Center(
          child: pw.Column(children: [
            pw.Text(
                'Este documento incorpora firma electronica, de acuerdo a la ley N° 51 de $currentDate ',
                style: pw.TextStyle(fontSize: 10),
                textAlign: pw.TextAlign.center),
            pw.SizedBox(height: 10),
          ]),
        );
      },
    ),
  );

  pdf.addPage(
    pw.MultiPage(
      margin: pw.EdgeInsets.only(
        left: 60, // Set the left margin
        top: 4, // Set the top margin
        right: 60, // Set the right margin
        bottom: 20, // Set the bottom margin
      ),
      header: (pw.Context context) {
        return pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Image(logoImage, width: 120, height: 100),
            pw.Image(logoBWImage, height: 60),
          ],
        );
      },
      build: (pw.Context context) => [
        pw.Stack(
          overflow: pw.Overflow.visible,
          children: [
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                // pw.Text(
                //     "Así mismo, entiendo que autorizo a FIMUTUAL con relación a:",
                //     style: pw.TextStyle(fontSize: 13, lineSpacing: 10)),
                pw.SizedBox(height: 16),
                pw.Text(
                    "Encargados del Tratamiento; a quien él les haya transmitidoo transferido la información, incluyendo la transferencia a terceros países, aliados, y/o a quien el futuro ostente sus derechos, para que obtenga todalainformación relativa a mis datos personales financieros, crediticios, comerciales y de servicios registrados ante cualquier banco de datos, mi comportamiento crediticio y comercial, el cumplimiento de mis obligaciones, en el sector financiero y real, datos financieros e información relacionadaconmi situación laboral e ingresos salariales ante operadores de informacióncrediticia, de seguridad social, administradoras de fondos y cesantías, centrales de riesgo, notarías, Registraduría Nacional del EstadoCivil, Contraloría General de la República, Procuraduría General de la Nación, DIAN, Oficinas de Registro, cajas de compensación, proveedores tecnológicosdeNómina y Facturación electrónica, Administradoras de Fondos de Pensionesyde Cesantías y Operadores de Información a través de las cuales se liquidancesantías, aportes de seguridad social y parafiscales, tales como AportesenLínea, SOI, SIMPLE, PILA, entre otras; así mismo para que solicitenoverifiquen información sobre mis activos, bienes o derechos en entidadespúblicas o privadas, o información que se encuentre en buscadores públicos, listas restrictivas, listas vinculantes para Colombia, redes socialesopublicaciones físicas o electrónicas, bien fuere en Colombia o en el exterior. El resultado del análisis para acceder al producto me será informado atravésde alguno de los",
                    style: pw.TextStyle(fontSize: 13, lineSpacing: 12)),
              ],
            ),
            pw.Positioned(
              left: -183, // Push the text outside the main content area
              top: 320, // Adjust top offset as needed
              child: pw.Transform.rotate(
                angle: 3.14159 / 2, // Rotate 90 degrees counterclockwise
                child: pw.Text("SUPERINTENDENCIA DE LA ECONOMIA SOLIDARIA",
                    style: pw.TextStyle(fontSize: 11)),
              ),
            ),
          ],
        ),
      ],
      footer: (pw.Context context) {
        return pw.Center(
          child: pw.Column(children: [
            pw.Text(
                'Este documento incorpora firma electronica, de acuerdo a la ley N° 51 de $currentDate',
                style: pw.TextStyle(fontSize: 10),
                textAlign: pw.TextAlign.center),
            pw.SizedBox(height: 10),
          ]),
        );
      },
    ),
  );

  pdf.addPage(
    pw.MultiPage(
      margin: pw.EdgeInsets.only(
        left: 60, // Set the left margin
        top: 4, // Set the top margin
        right: 60, // Set the right margin
        bottom: 20, // Set the bottom margin
      ),
      header: (pw.Context context) {
        return pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Image(logoImage, width: 120, height: 100),
            pw.Image(logoBWImage, height: 60),
          ],
        );
      },
      build: (pw.Context context) => [
        pw.Stack(
          overflow: pw.Overflow.visible,
          children: [
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.SizedBox(height: 16),
                pw.Text(
                    "medios de contacto que he suministrado. De igual manera, autorizo, para que, con fines estadísticos, de control, supervisiónydeinformación, reporte a las Centrales de Información, mis datos de contacto, el desarrollo, novedades, extinción y cumplimiento de las obligaciones contraídaso que llegue a contraer con FIMUTUAL y/o a quien el futuro ostentesusderechos. Estas autorizaciones de reporte y consulta de información tendránlas mismas finalidades legítimas estipuladas para el tratamientodeinformación personal cuya autorización y detalle se señala a continuación.",
                    style: pw.TextStyle(fontSize: 13, lineSpacing: 12)),
                pw.SizedBox(height: 16),
                pw.Text(
                    "II. Autorización para el Tratamiento de la Información Personal (Ley 1581 de2012). Sin perjuicio del derecho que me asiste a escoger los canalesdecontacto y habiendo sido debidamente informado sobre los mediosdecomunicación que serán utilizados por FIMUTUAL para el ejerciciodelarelación contractual y comercial, autorizo de manera libre, voluntaria, expresae informada a FIMUTUAL en calidad de Responsable del Tratamiento; asusencargados del tratamiento o a quien la asociación les haya transmitidootransferido la información, incluyendo la transferencia a terceros países, y/oaquien en el futuro ostente sus derechos, a ser contactado utilizandolainformación suministrada en el presente Formulario para las finalidadesprevistas en este documento, a través de los siguientes canales: i) líneatelefónica; ii) correo electrónico; iii) Servicio de Mensajes Cortos (SMS); iv) aplicaciones de mensajería instantánea o formal; y/o v) redes sociales. Declaro conocer y entender que, en caso de que requiera actualizar omodificar mis canales de contacto, puedo realizarlo a través de las Líneasautorizadas e informadas en la página WEB de la asociación. Autorizoa",
                    style: pw.TextStyle(fontSize: 13, lineSpacing: 12)),
              ],
            ),
            pw.Positioned(
              left: -183, // Push the text outside the main content area
              top: 320, // Adjust top offset as needed
              child: pw.Transform.rotate(
                angle: 3.14159 / 2, // Rotate 90 degrees counterclockwise
                child: pw.Text("SUPERINTENDENCIA DE LA ECONOMIA SOLIDARIA",
                    style: pw.TextStyle(fontSize: 11)),
              ),
            ),
          ],
        ),
      ],
      footer: (pw.Context context) {
        return pw.Center(
          child: pw.Column(children: [
            pw.Text(
                'Este documento incorpora firma electronica, de acuerdo a la ley N° 51 de $currentDate',
                style: pw.TextStyle(fontSize: 10),
                textAlign: pw.TextAlign.center),
            pw.SizedBox(height: 10),
          ]),
        );
      },
    ),
  );

  pdf.addPage(
    pw.MultiPage(
      margin: pw.EdgeInsets.only(
        left: 60, // Set the left margin
        top: 4, // Set the top margin
        right: 60, // Set the right margin
        bottom: 20, // Set the bottom margin
      ),
      header: (pw.Context context) {
        return pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Image(logoImage, width: 120, height: 100),
            pw.Image(logoBWImage, height: 60),
          ],
        );
      },
      build: (pw.Context context) => [
        pw.Stack(
          overflow: pw.Overflow.visible,
          children: [
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.SizedBox(height: 16),
                pw.Text(
                    "FIMUTUAL, en calidad de responsable del Tratamiento; a sus Encargadosdel Tratamiento o a quien haya transmitido o transferido la información, aliadosy/o a quien el futuro ostente sus derechos, incluyendo la transferenciaaterceros países, y/o a quien en el futuro ostente sus derechos, para quellevea cabo el tratamiento de mis datos personales, incluyendo datos biométricos. En virtud de dicha autorización de tratamiento, FIMUTUAL podrá solicitar, consultar, compartir, recolectar, almacenar, informar, usar, circular, reportar, transferir, trasmitir, procesar, divulgar, rectificar, modificar, aclarar, retirar, suprimir y/o actualizar mis datos e información personal, la cual, essuministrada por mí a través de todos los canales de contacto con FIMUTUAL, así como la página web. Así mismo, autorizo a FIMUTUAL, en calidadderesponsable del Tratamiento; a sus Encargados del Tratamiento o a quienél les haya transmitido o transferido la información, aliados, incluyendolatransferencia a terceros países, y/o a quien el futuro ostente sus derechos, para que de forma directa o a través de una entidad certificadacomooperador biométrico, realice la validación de mi identidad y mis característicasfísicas (huellas dactilares y/o rostro). Declaro que conozco y entiendoquenoestoy obligado a suministrar y/o autorizar el tratamiento de los datospersonales de menores de edad. De igual manera, declaro que conozcoyentiendo que no estoy obligado a suministrar y/o autorizar el tratamientodedatos personales sensibles; no obstante, autorizo a FIMUTUAL el tratamientode estos datos, de conformidad con lo establecido en el Artículo 5 y 6delaLey 1581 de 2023 y el Artículo 6 del Decreto 1377 de 2013, incluyendodeforma expresa mis datos biométricos y los datos asociados al origen racial oétnico, exclusivamente para las finalidades previstas en el presentedocumento; así mismo, conozco que la información biométrica consultadaenlas bases de datos respectivas no podrá ser almacenada, ni usadapor",
                    style: pw.TextStyle(fontSize: 13, lineSpacing: 9)),
                pw.SizedBox(height: 16),
              ],
            ),
            pw.Positioned(
              left: -183, // Push the text outside the main content area
              top: 320, // Adjust top offset as needed
              child: pw.Transform.rotate(
                angle: 3.14159 / 2, // Rotate 90 degrees counterclockwise
                child: pw.Text("SUPERINTENDENCIA DE LA ECONOMIA SOLIDARIA",
                    style: pw.TextStyle(fontSize: 11)),
              ),
            ),
          ],
        ),
      ],
      footer: (pw.Context context) {
        return pw.Center(
          child: pw.Column(children: [
            pw.Text(
                'Este documento incorpora firma electronica, de acuerdo a la ley N° 51 de $currentDate',
                style: pw.TextStyle(fontSize: 10),
                textAlign: pw.TextAlign.center),
            pw.SizedBox(height: 10),
          ]),
        );
      },
    ),
  );

  pdf.addPage(
    pw.MultiPage(
      margin: pw.EdgeInsets.only(
        left: 60, // Set the left margin
        top: 4, // Set the top margin
        right: 60, // Set the right margin
        bottom: 20, // Set the bottom margin
      ),
      header: (pw.Context context) {
        return pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Image(logoImage, width: 120, height: 100),
            pw.Image(logoBWImage, height: 60),
          ],
        );
      },
      build: (pw.Context context) => [
        pw.Stack(
          overflow: pw.Overflow.visible,
          children: [
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.SizedBox(height: 16),
                pw.Text(
                    "FIMUTUAL, sus Encargados del Tratamiento o a quien él les haya transmitidoo transferido la información, aliados, incluyendo la transferencia a tercerospaíses y/o a quien el futuro ostente sus derechos, para complementar otrasbases de datos, ni para fines distintos a los expresados en la presenteautorización y en la Ley. Mis datos e información personal, debidamenteautorizados a través del presente formulario, podrán ser sujetosdetratamiento por FIMUTUAL, sus Encargados del Tratamiento o a quienél leshaya transmitido o transferido la información, aliados, incluyendolatransferencia a terceros países y/o a quien el futuro ostente sus derechos, enconsecuencia, acepto ser contactado(a) mediante: i) línea telefónica; ii) correoelectrónico; iii) Servicio de Mensajes Cortos (SMS); iv) v) aplicacionesdemensajería instantánea o formal; y/o vi) redes sociales. El tratamientopor lapresente autorización permitido a FIMUTUAL, sus Encargados del Tratamientoo a quien él les haya transmitido o transferido la información, aliados, incluyendo la transferencia a terceros países y/o a quien el futuro ostentesusderechos podrá tener por objeto las finalidades legitimas de: i) cumplir lasobligaciones contractuales y reglamentarias, prevención del lavado de activosy financiación del terrorismo, así como para la prestación de los servicioscontratados; ii) atender y dar solución a las solicitudes, peticiones, quejasoreclamos formulados a FIMUTUAL; iii) crear y actualizar los perfilestransaccionales; iv) realizar gestiones de cobranza; v) informar sobreloscambios realizados a los productos y servicios del portafolio de FIMUTUAL; vi) analizar las tendencias y comportamientos de consumo de los consumidoresfinancieros; vii) para mi vinculación como cliente y/o prospecto, aprobaciónde operaciones de crédito, apertura y/o uso de los servicios y/o productosofrecidos por FIMUTUAL; viii) recibir información sobre campañas, estrategias promocionales, ofertas comerciales y publicidad de productosde",
                    style: pw.TextStyle(fontSize: 13, lineSpacing: 12)),
              ],
            ),
            pw.Positioned(
              left: -183, // Push the text outside the main content area
              top: 320, // Adjust top offset as needed
              child: pw.Transform.rotate(
                angle: 3.14159 / 2, // Rotate 90 degrees counterclockwise
                child: pw.Text("SUPERINTENDENCIA DE LA ECONOMIA SOLIDARIA",
                    style: pw.TextStyle(fontSize: 11)),
              ),
            ),
          ],
        ),
      ],
      footer: (pw.Context context) {
        return pw.Center(
          child: pw.Column(children: [
            pw.Text(
                'Este documento incorpora firma electronica, de acuerdo a la ley N° 51 de $currentDate',
                style: pw.TextStyle(fontSize: 10),
                textAlign: pw.TextAlign.center),
            pw.SizedBox(height: 10),
          ]),
        );
      },
    ),
  );

  pdf.addPage(
    pw.MultiPage(
      margin: pw.EdgeInsets.only(
        left: 60, // Set the left margin
        top: 4, // Set the top margin
        right: 60, // Set the right margin
        bottom: 20, // Set the bottom margin
      ),
      header: (pw.Context context) {
        return pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Image(logoImage, width: 120, height: 100),
            pw.Image(logoBWImage, height: 60),
          ],
        );
      },
      build: (pw.Context context) => [
        pw.Stack(
          overflow: pw.Overflow.visible,
          children: [
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.SizedBox(height: 16),
                pw.Text(
                    "FIMUTUAL y de aliados de éste, sean éstas presentes o futuras; ix) recibir cualquier tipo de información y/o comunicación que FIMUTUALestimenecesario y general, para que se adelanten todos los procesosderelacionamiento (soportados o no en tecnología), para un abordajeyconocimiento integral del cliente de todos mis productos y solucionescontratadas con FIMUTUAL, entre otros permitidos por la Ley. Conozcoyentiendo que como Titular de la información tengo derecho a conocer, actualizar, rectificar mis datos personales, solicitar prueba de la autorizaciónotorgada para el tratamiento de la información, informarme sobre el usoquese ha dado a los mismos, revocar la autorización, solicitar la supresióndemisdatos cuando sea procedente y acceder en forma gratuita a los mismos. Conozco que, para ejercer los derechos sobre mis datos personales podrécomunicarme a las Líneas de Atención suministradas en la página WEB. Paraconocer la Política de Protección de Datos Personales y Política de Cobranzas, podré ingresar a la pagina WEB.",
                    style: pw.TextStyle(fontSize: 13, lineSpacing: 12)),
                pw.SizedBox(height: 16),
                pw.Text(
                    "III. Autorización para Compartir Datos Personales con EntidadesPertenecientes al Grupo Económico, vinculados económicos, personasjurídicas o naturales, con base en las disposiciones de FIMUTUAL. AutorizoaFIMUTUAL y/o a cualquier otra Entidad o Unidad de Negocio internaquerepresente sus derechos, a compartir mi información personal, financiera, crediticia y comercial como Cliente de FIMUTUAL con cualquiera otra personao Entidad Vinculada al Grupo Económico al que pertenece y/o llegueapertenecer FIMUTUAL o la Entidad que represente sus derechos, para realizar el mismo tratamiento y con las mismas finalidades mencionadas en el numeral anterior. Declaro haber leído el contenido de este documento, así comocomprenderlo en su alcance e implicación, aceptando los TérminosyCondiciones. El documento y mi aceptación tendrán validez marcandola",
                    style: pw.TextStyle(fontSize: 13, lineSpacing: 12)),
              ],
            ),
            pw.Positioned(
              left: -183, // Push the text outside the main content area
              top: 320, // Adjust top offset as needed
              child: pw.Transform.rotate(
                angle: 3.14159 / 2, // Rotate 90 degrees counterclockwise
                child: pw.Text("SUPERINTENDENCIA DE LA ECONOMIA SOLIDARIA",
                    style: pw.TextStyle(fontSize: 11)),
              ),
            ),
          ],
        ),
      ],
      footer: (pw.Context context) {
        return pw.Center(
          child: pw.Column(children: [
            pw.Text(
                'Este documento incorpora firma electronica, de acuerdo a la ley N° 51 de $currentDate',
                style: pw.TextStyle(fontSize: 10),
                textAlign: pw.TextAlign.center),
            pw.SizedBox(height: 10),
          ]),
        );
      },
    ),
  );

  pdf.addPage(
    pw.MultiPage(
      margin: pw.EdgeInsets.only(
        left: 60, // Set the left margin
        top: 4, // Set the top margin
        right: 60, // Set the right margin
        bottom: 20, // Set the bottom margin
      ),
      header: (pw.Context context) {
        return pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Image(logoImage, width: 120, height: 100),
            pw.Image(logoBWImage, height: 60),
          ],
        );
      },
      build: (pw.Context context) => [
        pw.Stack(
          overflow: pw.Overflow.visible,
          children: [
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.SizedBox(height: 16),
                pw.Text(
                    "casilla de aceptación en el formulario de solicitud de FIMUTUAL y/o de quien en el futuro represente u ostente sus derechos, así como, sus obligaciones",
                    style: pw.TextStyle(fontSize: 13, lineSpacing: 12)),
                pw.SizedBox(height: 10),
                pw.Text(
                    "Las definiciones contenidas en la presente autorización que se encuentren en mayúscula tendrán el significado que así se haya determinado en la Política de Protección de Datos Personales de FIMUTUAl, la cual podrá ser consultada en la página web.",
                    style: pw.TextStyle(fontSize: 13, lineSpacing: 12)),
                pw.SizedBox(height: 16),
                pw.RichText(
                  textDirection: pw.TextDirection.ltr,
                  text: pw.TextSpan(
                    text: '',
                    style: pw.TextStyle(fontSize: 13),
                    children: [
                      pw.TextSpan(
                        text: 'SEGUNDO: ',
                        style: pw.TextStyle(
                            fontSize: 13,
                            fontWeight: pw.FontWeight.bold,
                            lineSpacing: 10),
                      ),
                      pw.TextSpan(
                        text:
                            'Declaración de origen de Fondos- Declaro que: a.) Mis recursos tienen un origen lícito y provienen directamente del desarrollo de la actividad económica y ocupación señalada en la sección actividad económica. b.) Los ingresos aquí reportados, no provienen de ninguna actividad ilícita de las contempladas en el código penal colombiano o en cualquier otra norma concordante. c.) No admitiré que terceros efectúen depósitos a nombre mío en los productos solicitados, de los cuales desconozca su origen',
                        style: pw.TextStyle(fontSize: 13, lineSpacing: 12),
                      ),
                    ],
                  ),
                  textAlign: pw.TextAlign.left,
                ),
                pw.SizedBox(height: 16),
                pw.RichText(
                  textDirection: pw.TextDirection.ltr,
                  text: pw.TextSpan(
                    text: '',
                    style: pw.TextStyle(fontSize: 13),
                    children: [
                      pw.TextSpan(
                        text: 'TERCERO: ',
                        style: pw.TextStyle(
                            fontSize: 13,
                            fontWeight: pw.FontWeight.bold,
                            lineSpacing: 12),
                      ),
                      pw.TextSpan(
                        text:
                            'Acepto el reglamento de AHORRO FIMUTUAL, Acuerdo 002 aprobado por junta directiva,',
                        style: pw.TextStyle(
                            fontSize: 13,
                            decoration: pw.TextDecoration.underline,
                            lineSpacing: 12),
                      ),
                      pw.TextSpan(
                        text:
                            'el caul me fue informado durante el proceso realizado.',
                        style: pw.TextStyle(fontSize: 13, lineSpacing: 12),
                      ),
                    ],
                  ),
                  textAlign: pw.TextAlign.left,
                ),
                pw.SizedBox(height: 16),
                pw.RichText(
                  textDirection: pw.TextDirection.ltr,
                  text: pw.TextSpan(
                    text: '',
                    style: pw.TextStyle(fontSize: 13),
                    children: [
                      pw.TextSpan(
                        text: 'CUARTO: ',
                        style: pw.TextStyle(
                            fontSize: 13,
                            fontWeight: pw.FontWeight.bold,
                            lineSpacing: 12),
                      ),
                      pw.TextSpan(
                        text:
                            'Acepto que los extractos y otras comunicaciones con FIMUTUAL sean enviadas al buzón de mi servicio a través de la APP o pagina WEB.',
                        style: pw.TextStyle(fontSize: 13, lineSpacing: 12),
                      ),
                    ],
                  ),
                  textAlign: pw.TextAlign.left,
                ),
                pw.SizedBox(height: 16),
                pw.RichText(
                  textDirection: pw.TextDirection.ltr,
                  text: pw.TextSpan(
                    text: '',
                    style: pw.TextStyle(fontSize: 13),
                    children: [
                      pw.TextSpan(
                        text: 'QUINTO: ',
                        style: pw.TextStyle(
                            fontSize: 13,
                            fontWeight: pw.FontWeight.bold,
                            lineSpacing: 12),
                      ),
                      pw.TextSpan(
                        text:
                            'Declaro que no soy una persona expuesta políticamente en Colombia ni en ningún país diferente a Colombia, ni soy cónyuge, ni familiar hasta el segundo grado de consanguinidad o segundo de afinidad o primero civil de una persona expuesta políticamente. Igualmente declaro que no estoy cobijado por el articulo 30-A de la Ley 1908 de 2019, ni tengo residencia fiscal en ningún país diferente a Colombia.',
                        style: pw.TextStyle(fontSize: 13, lineSpacing: 12),
                      ),
                    ],
                  ),
                  textAlign: pw.TextAlign.left,
                ),
              ],
            ),
            pw.Positioned(
              left: -183, // Push the text outside the main content area
              top: 320, // Adjust top offset as needed
              child: pw.Transform.rotate(
                angle: 3.14159 / 2, // Rotate 90 degrees counterclockwise
                child: pw.Text("SUPERINTENDENCIA DE LA ECONOMIA SOLIDARIA",
                    style: pw.TextStyle(fontSize: 11)),
              ),
            ),
          ],
        ),
      ],
      footer: (pw.Context context) {
        return pw.Center(
          child: pw.Column(children: [
            pw.Text(
                'Este documento incorpora firma electronica, de acuerdo a la ley N° 51 de $currentDate',
                style: pw.TextStyle(fontSize: 10),
                textAlign: pw.TextAlign.center),
            pw.SizedBox(height: 10),
          ]),
        );
      },
    ),
  );

  pdf.addPage(
    pw.MultiPage(
      margin: pw.EdgeInsets.only(
        left: 60, // Set the left margin
        top: 4, // Set the top margin
        right: 60, // Set the right margin
        bottom: 20, // Set the bottom margin
      ),
      header: (pw.Context context) {
        return pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Image(logoImage, width: 120, height: 100),
            pw.Image(logoBWImage, height: 60),
          ],
        );
      },
      build: (pw.Context context) => [
        pw.Stack(
          overflow: pw.Overflow.visible,
          children: [
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.SizedBox(height: 16),
                pw.RichText(
                  textDirection: pw.TextDirection.ltr,
                  text: pw.TextSpan(
                    text: '',
                    style: pw.TextStyle(fontSize: 13),
                    children: [
                      pw.TextSpan(
                        text: 'SEXTO: ',
                        style: pw.TextStyle(
                            fontSize: 13,
                            fontWeight: pw.FontWeight.bold,
                            lineSpacing: 12),
                      ),
                      pw.TextSpan(
                        text:
                            'En observancia del artículo 7 del Decreto 2364 de 2012, convengo con FIMUTUAL y acepto que el presente documento ',
                        style: pw.TextStyle(fontSize: 13, lineSpacing: 12),
                      ),
                      pw.TextSpan(
                        text:
                            'será firmado lect ónicamente mediante el mecanismo OTP (One Time Password) digitado en un dispositivo móvil, ordenador u otra herramienta que autorice FIMUTUAL, reconociendo que dicha firma tiene los mismos efectos de mi firma manuscrita,',
                        style: pw.TextStyle(
                            fontSize: 13,
                            decoration: pw.TextDecoration.underline,
                            lineSpacing: 12),
                      ),
                      pw.TextSpan(
                        text:
                            ' cumpliendo con los atributos dispuestos en el parágrafo del artículo 28 de la Ley 527 de 1999 y el citado Decreto Reglamentario. Para estos efectos, manifiesto que: I). Leí y verifiqué el presente documento; II). Mantendré actualizados en todo momento los datos del celular personal y el correo electrónico; III). Y reportaré de forma inmediata cualquier circunstancia que pueda poner en riesgo la seguridad de la OTP. Para todos los efectos, los documentos firmados electrónicamente serán custodiados por FIMUTUAL y/o la empresa que haga sus veces en este proceso.',
                        style: pw.TextStyle(fontSize: 13, lineSpacing: 12),
                      ),
                    ],
                  ),
                  textAlign: pw.TextAlign.left,
                ),
                pw.SizedBox(height: 80),
                pw.Center(
                  child: pw.Column(children: [
                    pw.Text('$nombres',
                        style: pw.TextStyle(
                          fontSize: 16,
                          fontWeight: pw.FontWeight.bold,
                        )),
                    pw.Text('CC $cc', style: pw.TextStyle(fontSize: 14)),
                    pw.Text('FIRMA ELECTRONICA',
                        style: pw.TextStyle(fontSize: 14)),
                  ]),
                ),
              ],
            ),
            pw.Positioned(
              left: -183, // Push the text outside the main content area
              top: 320, // Adjust top offset as needed
              child: pw.Transform.rotate(
                angle: 3.14159 / 2, // Rotate 90 degrees counterclockwise
                child: pw.Text("SUPERINTENDENCIA DE LA ECONOMIA SOLIDARIA",
                    style: pw.TextStyle(fontSize: 11)),
              ),
            ),
          ],
        ),
      ],
      footer: (pw.Context context) {
        return pw.Center(
          child: pw.Column(children: [
            pw.Text(
                'Este documento incorpora firma electronica, de acuerdo a la ley N° 51 de $currentDate',
                style: pw.TextStyle(fontSize: 10),
                textAlign: pw.TextAlign.center),
            pw.SizedBox(height: 10),
          ]),
        );
      },
    ),
  );

  final pdfBytes = await pdf.save();

  final pdfBase64 = base64Encode(pdfBytes);
  return pdfBase64;

//   final output = await getTemporaryDirectory();
//   final file = File("${output.path}/example.pdf");
//   await file.writeAsBytes(await pdf.save());

//   final fileBytes = await file.readAsBytes();
//   final uploadedFile = FFUploadedFile(name: 'example.pdf', bytes: fileBytes);
//   return uploadedFile;
}

// if (kIsWeb) {
//   // For web: Use html.AnchorElement to trigger a download
//   final blob = html.Blob([pdfBytes]);
//   final url = html.Url.createObjectUrlFromBlob(blob);
//   final anchor = html.AnchorElement(href: url)
//     ..target = 'blank'
//     ..download = 'example.pdf'
//     ..click();
//   html.Url.revokeObjectUrl(url);

//   // Return a placeholder FFUploadedFile for compatibility
//   return FFUploadedFile(name: 'example.pdf', bytes: pdfBytes);
// } else {
//   // For mobile/desktop: Use getTemporaryDirectory()
//   final output = await getTemporaryDirectory();
//   final file = File("${output.path}/example.pdf");
//   await file.writeAsBytes(pdfBytes);

//   final fileBytes = await file.readAsBytes();
//   return FFUploadedFile(name: 'example.pdf', bytes: fileBytes);
// }
// }
