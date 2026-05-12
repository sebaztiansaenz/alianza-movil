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

// Importaciones adicionales para PDF
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'dart:typed_data';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:async'; // Para TimeoutException

Future<FFUploadedFile> firstPDFCopy(
  String imagenAlianza,
  String imageBandera,
  String tipoLineaAhorro,
  String fechaApertura,
  String nombresApellidos,
  String tipoDocumento,
  String numeroDocumento,
  String fechaExpedicion,
  String ciudadExpedicion,
  String direccionResidencia,
  String ciudadResidencia,
  String barrio,
  String correoElectronico,
  String whatsapp,
  String otroTelefono,
  String nombreFirma,
  String cedulaFirma,
  String selloVerificado,
  String imagenVigilado,
  // Nuevos parámetros para página 2
  String razonSocial,
  String sigla,
  String nit,
  String tipoContrato,
  String ubicacion,
  String valorDescuento,
  String tiempo,
) async {
  // Crear el documento PDF
  final pdf = pw.Document();

  // Define colores para el documento
  final colorAzul = PdfColor(0, 0, 0.8); // Azul oscuro para encabezados
  final colorBlancoLetras =
      PdfColor(1, 1, 1); // Blanco para texto en encabezados
  final colorGrisFondo =
      PdfColor(0.95, 0.95, 0.95); // Gris claro para fondos de campos
  final colorNegroTitulos = PdfColor(0, 0, 0); // Negro para títulos de campos

  // Función para cargar imágenes desde URL
  Future<Uint8List> loadNetworkImage(String url) async {
    try {
      final response = await http.get(Uri.parse(url)).timeout(
        Duration(seconds: 3),
        onTimeout: () {
          throw TimeoutException(
              'Timeout al cargar imagen', Duration(seconds: 3));
        },
      );
      if (response.statusCode == 200) {
        return response.bodyBytes;
      } else {
        return Uint8List(0);
      }
    } catch (e) {
      return Uint8List(0);
    }
  }

  // Cargar todas las imágenes en paralelo
  final List<Future<Uint8List>> imageFutures = [
    loadNetworkImage(imagenAlianza),
    loadNetworkImage(imageBandera),
    loadNetworkImage(selloVerificado),
    loadNetworkImage(imagenVigilado),
  ];

  final List<Uint8List> imageResults = await Future.wait(imageFutures);

// Asignar los resultados
  final logoAlianzaBytes = imageResults[0];
  final logoBanderaBytes = imageResults[1];
  final selloVerificadoBytes = imageResults[2];
  final imagenVigiladoBytes = imageResults[3];

  // PÁGINA 1: APERTURA LÍNEA DE AHORRO NÓMINA (sin cambios)
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.symmetric(horizontal: 40, vertical: 36),
      build: (context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // 1. Encabezado con logos
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Row(
                  children: [
                    // Logo Alianza (izquierda)
                    logoAlianzaBytes.isNotEmpty
                        ? pw.Image(pw.MemoryImage(logoAlianzaBytes),
                            width: 160, height: 80)
                        : pw.Container(
                            width: 160,
                            height: 80,
                            color: PdfColors.orange100,
                            child: pw.Center(
                              child: pw.Text(
                                'ALIANZA\nCAPITAL',
                                style: pw.TextStyle(
                                    color: PdfColors.blue800,
                                    fontWeight: pw.FontWeight.bold),
                                textAlign: pw.TextAlign.center,
                              ),
                            ),
                          ),
                    pw.SizedBox(width: 8),
                    pw.Container(width: 2, height: 40, color: PdfColors.orange),
                    pw.SizedBox(width: 8),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('APERTURA',
                            style: pw.TextStyle(
                                fontSize: 12, fontWeight: pw.FontWeight.bold)),
                        pw.Text(tipoLineaAhorro,
                            style: pw.TextStyle(fontSize: 10)),
                      ],
                    ),
                  ],
                ),
                // Logo Bandera (derecha)
                logoBanderaBytes.isNotEmpty
                    ? pw.Image(pw.MemoryImage(logoBanderaBytes),
                        width: 40, height: 40)
                    : pw.Container(
                        width: 40,
                        height: 40,
                        color: PdfColors.orange300,
                      ),
              ],
            ),
            pw.SizedBox(height: 10),

            // 2. Descripción de Producto
            pw.Container(
              width: double.infinity,
              color: colorAzul,
              padding:
                  const pw.EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: pw.Text(
                'DESCRIPCIÓN DE PRODUCTO',
                textAlign: pw.TextAlign.left,
                style: pw.TextStyle(
                    color: colorBlancoLetras,
                    fontSize: 11,
                    fontWeight: pw.FontWeight.bold),
              ),
            ),
            pw.SizedBox(height: 4),

            // Campos de descripción de producto
            pw.Row(
              children: [
                pw.Expanded(
                  flex: 5,
                  child: pw.Container(
                    padding: const pw.EdgeInsets.all(3),
                    decoration: pw.BoxDecoration(color: colorGrisFondo),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'Tipo de línea de ahorro',
                          style: pw.TextStyle(
                              fontSize: 7, color: colorNegroTitulos),
                        ),
                        pw.SizedBox(height: 1),
                        pw.Text(
                          tipoLineaAhorro,
                          style: pw.TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
                pw.SizedBox(width: 4),
                pw.Expanded(
                  flex: 2,
                  child: pw.Container(
                    padding: const pw.EdgeInsets.all(3),
                    decoration: pw.BoxDecoration(color: colorGrisFondo),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'Fecha de apertura',
                          style: pw.TextStyle(
                              fontSize: 7, color: colorNegroTitulos),
                        ),
                        pw.SizedBox(height: 1),
                        pw.Text(
                          fechaApertura,
                          style: pw.TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            pw.SizedBox(height: 8),

            // 3. Información del Asociado
            pw.Container(
              width: double.infinity,
              color: colorAzul,
              padding:
                  const pw.EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: pw.Text(
                'INFORMACIÓN DEL ASOCIADO',
                textAlign: pw.TextAlign.left,
                style: pw.TextStyle(
                    color: colorBlancoLetras,
                    fontSize: 11,
                    fontWeight: pw.FontWeight.bold),
              ),
            ),
            pw.SizedBox(height: 4),

            // Nombres y apellidos
            pw.Container(
              width: double.infinity,
              padding: const pw.EdgeInsets.all(3),
              decoration: pw.BoxDecoration(color: colorGrisFondo),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('Nombres y Apellidos',
                      style:
                          pw.TextStyle(fontSize: 7, color: colorNegroTitulos)),
                  pw.SizedBox(height: 1),
                  pw.Text(nombresApellidos, style: pw.TextStyle(fontSize: 10)),
                ],
              ),
            ),
            pw.SizedBox(height: 4),

            // Fila de datos de documento
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Expanded(
                  child: pw.Container(
                    padding: const pw.EdgeInsets.all(3),
                    decoration: pw.BoxDecoration(color: colorGrisFondo),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Tipo de documento',
                            style: pw.TextStyle(
                                fontSize: 7, color: colorNegroTitulos)),
                        pw.SizedBox(height: 1),
                        pw.Text(tipoDocumento,
                            style: pw.TextStyle(fontSize: 10)),
                      ],
                    ),
                  ),
                ),
                pw.SizedBox(width: 2),
                pw.Expanded(
                  child: pw.Container(
                    padding: const pw.EdgeInsets.all(3),
                    decoration: pw.BoxDecoration(color: colorGrisFondo),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Número de documento',
                            style: pw.TextStyle(
                                fontSize: 7, color: colorNegroTitulos)),
                        pw.SizedBox(height: 1),
                        pw.Text(numeroDocumento,
                            style: pw.TextStyle(fontSize: 10)),
                      ],
                    ),
                  ),
                ),
                pw.SizedBox(width: 2),
                pw.Expanded(
                  child: pw.Container(
                    padding: const pw.EdgeInsets.all(3),
                    decoration: pw.BoxDecoration(color: colorGrisFondo),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Fecha de expedición',
                            style: pw.TextStyle(
                                fontSize: 7, color: colorNegroTitulos)),
                        pw.SizedBox(height: 1),
                        pw.Text(fechaExpedicion,
                            style: pw.TextStyle(fontSize: 10)),
                      ],
                    ),
                  ),
                ),
                pw.SizedBox(width: 2),
                pw.Expanded(
                  child: pw.Container(
                    padding: const pw.EdgeInsets.all(3),
                    decoration: pw.BoxDecoration(color: colorGrisFondo),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Ciudad y departamento de expedición',
                            style: pw.TextStyle(
                                fontSize: 7, color: colorNegroTitulos)),
                        pw.SizedBox(height: 1),
                        pw.Text(ciudadExpedicion,
                            style: pw.TextStyle(fontSize: 10)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            pw.SizedBox(height: 4),

            // Dirección de residencia
            pw.Container(
              width: double.infinity,
              padding: const pw.EdgeInsets.all(3),
              decoration: pw.BoxDecoration(color: colorGrisFondo),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('Dirección de residencia',
                      style:
                          pw.TextStyle(fontSize: 7, color: colorNegroTitulos)),
                  pw.SizedBox(height: 1),
                  pw.Text(direccionResidencia,
                      style: pw.TextStyle(fontSize: 10)),
                ],
              ),
            ),
            pw.SizedBox(height: 4),

            // Ciudad y barrio
            pw.Row(
              children: [
                pw.Expanded(
                  flex: 3,
                  child: pw.Container(
                    padding: const pw.EdgeInsets.all(3),
                    decoration: pw.BoxDecoration(color: colorGrisFondo),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Ciudad y departamento de residencia',
                            style: pw.TextStyle(
                                fontSize: 7, color: colorNegroTitulos)),
                        pw.SizedBox(height: 1),
                        pw.Text(ciudadResidencia,
                            style: pw.TextStyle(fontSize: 10)),
                      ],
                    ),
                  ),
                ),
                pw.SizedBox(width: 4),
                pw.Expanded(
                  flex: 2,
                  child: pw.Container(
                    padding: const pw.EdgeInsets.all(3),
                    decoration: pw.BoxDecoration(color: colorGrisFondo),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Barrio',
                            style: pw.TextStyle(
                                fontSize: 7, color: colorNegroTitulos)),
                        pw.SizedBox(height: 1),
                        pw.Text(barrio, style: pw.TextStyle(fontSize: 10)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            pw.SizedBox(height: 8),

            // 4. Datos de Contacto y Firma Electrónica
            pw.Container(
              width: double.infinity,
              color: colorAzul,
              padding:
                  const pw.EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: pw.Text(
                'DATOS DE CONTACTO Y FIRMA ELECTRÓNICA',
                textAlign: pw.TextAlign.left,
                style: pw.TextStyle(
                    color: colorBlancoLetras,
                    fontSize: 11,
                    fontWeight: pw.FontWeight.bold),
              ),
            ),
            pw.SizedBox(height: 4),

            // Datos de contacto
            pw.Row(
              children: [
                pw.Expanded(
                  child: pw.Container(
                    padding: const pw.EdgeInsets.all(3),
                    decoration: pw.BoxDecoration(color: colorGrisFondo),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Correo electrónico',
                            style: pw.TextStyle(
                                fontSize: 7, color: colorNegroTitulos)),
                        pw.SizedBox(height: 1),
                        pw.Text(correoElectronico,
                            style: pw.TextStyle(fontSize: 10)),
                      ],
                    ),
                  ),
                ),
                pw.SizedBox(width: 4),
                pw.Expanded(
                  child: pw.Container(
                    padding: const pw.EdgeInsets.all(3),
                    decoration: pw.BoxDecoration(color: colorGrisFondo),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('WhatsApp',
                            style: pw.TextStyle(
                                fontSize: 7, color: colorNegroTitulos)),
                        pw.SizedBox(height: 1),
                        pw.Text(whatsapp, style: pw.TextStyle(fontSize: 10)),
                      ],
                    ),
                  ),
                ),
                pw.SizedBox(width: 4),
                pw.Expanded(
                  child: pw.Container(
                    padding: const pw.EdgeInsets.all(3),
                    decoration: pw.BoxDecoration(color: colorGrisFondo),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Otro teléfono',
                            style: pw.TextStyle(
                                fontSize: 7, color: colorNegroTitulos)),
                        pw.SizedBox(height: 1),
                        pw.Text(otroTelefono,
                            style: pw.TextStyle(fontSize: 10)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            pw.SizedBox(height: 6),

            // 5. Texto legal
            pw.Text(
              'Dicho producto será usado para propósitos de ahorro y/o inversión de mis recursos. Acepto que he leído los términos y condiciones, así como el contenido de reglamentación del producto que establece el consejo de ALIANZA CAPITAL y que se ha puesto a disposición de la página web http://www.alianzacapital.co, así mismo manifiesto que:',
              style: pw.TextStyle(fontSize: 7),
              textAlign: pw.TextAlign.justify,
            ),
            pw.SizedBox(height: 3),

            // Párrafos numerados
            pw.Padding(
              padding: const pw.EdgeInsets.only(left: 8),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    '1. He leído y declaro conocer el reglamento (s) que establecen condiciones, las características y que rigen la Línea de Ahorro y lo acepto en su integridad de manera libre y espontánea',
                    style: pw.TextStyle(fontSize: 7),
                    textAlign: pw.TextAlign.justify,
                  ),
                  pw.SizedBox(height: 2),
                  pw.Text(
                    '2. Conozco que, en caso de tener dudas al respecto del producto, puedo ingresar a http://www.alianzacapital.co para obtener más información o puedo contactarme vía WhatsApp al 312.799.2999 o al correo info@alianza-capital.co',
                    style: pw.TextStyle(fontSize: 7),
                    textAlign: pw.TextAlign.justify,
                  ),
                  pw.SizedBox(height: 2),
                  pw.Text(
                    '3. El siguiente documento contiene firma electrónica según Ley 527 de 1999, Ley de Comercio Electrónico, que regula el comercio electrónico y sienta las bases para la existencia y exigibilidad de las más firmas digitales. Decreto 2364 de 2012, que diferencia entre firma electrónica y firma digital como tipo específico de firma electrónica.',
                    style: pw.TextStyle(fontSize: 7),
                    textAlign: pw.TextAlign.justify,
                  ),
                ],
              ),
            ),
            pw.SizedBox(height: 4),
            pw.Text(
              'De acuerdo con lo anterior, atentamente:',
              style: pw.TextStyle(fontSize: 7),
              textAlign: pw.TextAlign.justify,
            ),
            pw.SizedBox(height: 4),

            // Todo alineado hacia abajo desde aquí
            pw.Expanded(
              child: pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  // 6. Espacio para firma electrónica
                  pw.Container(
                    width: double.infinity,
                    height: 80,
                    decoration: pw.BoxDecoration(
                      border: pw.Border(
                        top: pw.BorderSide(
                            color: PdfColors.grey400,
                            width: 1,
                            style: pw.BorderStyle.dashed),
                        left: pw.BorderSide(
                            color: PdfColors.grey400,
                            width: 1,
                            style: pw.BorderStyle.dashed),
                        right: pw.BorderSide(
                            color: PdfColors.grey400,
                            width: 1,
                            style: pw.BorderStyle.dashed),
                        bottom: pw.BorderSide(
                            color: PdfColors.grey400,
                            width: 1,
                            style: pw.BorderStyle.dashed),
                      ),
                    ),
                    child: pw.Stack(
                      children: [
                        pw.Positioned(
                          bottom: 5,
                          left: 0,
                          right: 0,
                          child: pw.Center(
                            child: pw.Text(
                              'Espacio para firma electrónica',
                              style: pw.TextStyle(
                                  fontSize: 8, color: PdfColors.grey600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  pw.SizedBox(height: 20),

                  // 7. Footer con firma y sello
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      // Datos del firmante a la izquierda
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(nombreFirma,
                              style: pw.TextStyle(
                                  fontSize: 10,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.Text('CC: $cedulaFirma',
                              style: pw.TextStyle(fontSize: 8)),
                          pw.Text('FIRMA ELECTRÓNICA',
                              style: pw.TextStyle(fontSize: 8)),
                        ],
                      ),

                      // Datos de Alianza y sello a la derecha
                      pw.Row(
                        children: [
                          pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.end,
                            children: [
                              pw.Text('ALIANZA CAPITAL',
                                  style: pw.TextStyle(
                                      fontSize: 10,
                                      fontWeight: pw.FontWeight.bold)),
                              pw.Text('Dpto. Financiero',
                                  style: pw.TextStyle(fontSize: 8)),
                            ],
                          ),
                          pw.SizedBox(width: 8),
                          selloVerificadoBytes.isNotEmpty
                              ? pw.Image(pw.MemoryImage(selloVerificadoBytes),
                                  width: 40, height: 40)
                              : pw.Container(
                                  width: 40,
                                  height: 40,
                                  decoration: pw.BoxDecoration(
                                    shape: pw.BoxShape.circle,
                                    color: PdfColors.grey300,
                                  ),
                                  child: pw.Center(
                                    child: pw.Text('SELLO',
                                        style: pw.TextStyle(fontSize: 8)),
                                  ),
                                ),
                        ],
                      ),
                    ],
                  ),
                  pw.SizedBox(height: 4),

                  // 8. Pie de página legal
                  pw.Container(
                    margin: const pw.EdgeInsets.only(top: 6),
                    child: pw.Text(
                      'La presente constancia constituye una copia simple de su original creado de forma electrónica y almacenado en los sistemas de almacenamiento de Zapsign. Por tal razón este documento no es representativo del valor en depósito y por lo tanto no legitima a su tenedor, no es transferible, ni negociable. Ley 527 de 1999 y el decreto de Ley 019 de 2012, por medio de la cual se dene y reglamenta el acceso y uso de los mensajes de datos, del comercio electrónico y de las rmas digitales, y se establecen las entidades de certicación y se dictan otras disposiciones',
                      style:
                          pw.TextStyle(fontSize: 6, color: PdfColors.grey600),
                      textAlign: pw.TextAlign.justify,
                    ),
                  ),

                  // Footer con imagen de vigilado
                  pw.Container(
                    alignment: pw.Alignment.bottomRight,
                    margin: const pw.EdgeInsets.only(top: 8),
                    child: imagenVigiladoBytes.isNotEmpty
                        ? pw.Image(pw.MemoryImage(imagenVigiladoBytes),
                            width: 120, height: 30)
                        : pw.Container(
                            width: 120,
                            height: 30,
                            color: PdfColors.grey300,
                            child: pw.Center(
                              child: pw.Text(
                                'VIGILADO: SUPERINTENDENCIA DE LA\nECONOMÍA SOLIDARIA',
                                style: pw.TextStyle(fontSize: 6),
                                textAlign: pw.TextAlign.center,
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    ),
  );

  // PÁGINA 2: AUTORIZACIÓN DESCUENTO POR NÓMINA
  // pdf.addPage(
  //   pw.Page(
  //     pageFormat: PdfPageFormat.a4,
  //     margin: const pw.EdgeInsets.symmetric(horizontal: 40, vertical: 36),
  //     build: (context) {
  //       return pw.Column(
  //         crossAxisAlignment: pw.CrossAxisAlignment.start,
  //         children: [
  //           // Encabezado con logos
  //           pw.Row(
  //             mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
  //             children: [
  //               pw.Row(
  //                 children: [
  //                   logoAlianzaBytes.isNotEmpty
  //                       ? pw.Image(pw.MemoryImage(logoAlianzaBytes),
  //                           width: 160, height: 80)
  //                       : pw.Container(
  //                           width: 160,
  //                           height: 80,
  //                           color: PdfColors.orange100,
  //                           child: pw.Center(
  //                             child: pw.Text(
  //                               'ALIANZA\nCAPITAL',
  //                               style: pw.TextStyle(
  //                                   color: PdfColors.blue800,
  //                                   fontWeight: pw.FontWeight.bold),
  //                               textAlign: pw.TextAlign.center,
  //                             ),
  //                           ),
  //                         ),
  //                   pw.SizedBox(width: 8),
  //                   pw.Container(width: 2, height: 40, color: PdfColors.orange),
  //                   pw.SizedBox(width: 8),
  //                   pw.Column(
  //                     crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                     children: [
  //                       pw.Text('AUTORIZACIÓN',
  //                           style: pw.TextStyle(
  //                               fontSize: 12, fontWeight: pw.FontWeight.bold)),
  //                       pw.Text('DESCUENTO POR NÓMINA',
  //                           style: pw.TextStyle(fontSize: 10)),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //               logoBanderaBytes.isNotEmpty
  //                   ? pw.Image(pw.MemoryImage(logoBanderaBytes),
  //                       width: 40, height: 40)
  //                   : pw.Container(
  //                       width: 40,
  //                       height: 40,
  //                       color: PdfColors.orange300,
  //                     ),
  //             ],
  //           ),
  //           pw.SizedBox(height: 10),

  //           // Descripción de Producto
  //           pw.Container(
  //             width: double.infinity,
  //             color: colorAzul,
  //             padding:
  //                 const pw.EdgeInsets.symmetric(vertical: 5, horizontal: 10),
  //             child: pw.Text(
  //               'DESCRIPCIÓN DE PRODUCTO',
  //               textAlign: pw.TextAlign.left,
  //               style: pw.TextStyle(
  //                   color: colorBlancoLetras,
  //                   fontSize: 11,
  //                   fontWeight: pw.FontWeight.bold),
  //             ),
  //           ),
  //           pw.SizedBox(height: 4),

  //           pw.Row(
  //             children: [
  //               pw.Expanded(
  //                 flex: 5,
  //                 child: pw.Container(
  //                   padding: const pw.EdgeInsets.all(3),
  //                   decoration: pw.BoxDecoration(color: colorGrisFondo),
  //                   child: pw.Column(
  //                     crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                     children: [
  //                       pw.Text('Tipo de línea de ahorro',
  //                           style: pw.TextStyle(
  //                               fontSize: 7, color: colorNegroTitulos)),
  //                       pw.SizedBox(height: 1),
  //                       pw.Text(tipoLineaAhorro,
  //                           style: pw.TextStyle(fontSize: 10)),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //               pw.SizedBox(width: 4),
  //               pw.Expanded(
  //                 flex: 2,
  //                 child: pw.Container(
  //                   padding: const pw.EdgeInsets.all(3),
  //                   decoration: pw.BoxDecoration(color: colorGrisFondo),
  //                   child: pw.Column(
  //                     crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                     children: [
  //                       pw.Text('Fecha de apertura',
  //                           style: pw.TextStyle(
  //                               fontSize: 7, color: colorNegroTitulos)),
  //                       pw.SizedBox(height: 1),
  //                       pw.Text(fechaApertura,
  //                           style: pw.TextStyle(fontSize: 10)),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //           pw.SizedBox(height: 8),

  //           // Información del Asociado
  //           pw.Container(
  //             width: double.infinity,
  //             color: colorAzul,
  //             padding:
  //                 const pw.EdgeInsets.symmetric(vertical: 5, horizontal: 10),
  //             child: pw.Text(
  //               'INFORMACIÓN DEL ASOCIADO',
  //               textAlign: pw.TextAlign.left,
  //               style: pw.TextStyle(
  //                   color: colorBlancoLetras,
  //                   fontSize: 11,
  //                   fontWeight: pw.FontWeight.bold),
  //             ),
  //           ),
  //           pw.SizedBox(height: 4),

  //           // Nombres y apellidos
  //           pw.Container(
  //             width: double.infinity,
  //             padding: const pw.EdgeInsets.all(3),
  //             decoration: pw.BoxDecoration(color: colorGrisFondo),
  //             child: pw.Column(
  //               crossAxisAlignment: pw.CrossAxisAlignment.start,
  //               children: [
  //                 pw.Text('Nombres y Apellidos',
  //                     style:
  //                         pw.TextStyle(fontSize: 7, color: colorNegroTitulos)),
  //                 pw.SizedBox(height: 1),
  //                 pw.Text(nombresApellidos, style: pw.TextStyle(fontSize: 10)),
  //               ],
  //             ),
  //           ),
  //           pw.SizedBox(height: 4),

  //           // Fila de datos de documento
  //           pw.Row(
  //             mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
  //             children: [
  //               pw.Expanded(
  //                 child: pw.Container(
  //                   padding: const pw.EdgeInsets.all(3),
  //                   decoration: pw.BoxDecoration(color: colorGrisFondo),
  //                   child: pw.Column(
  //                     crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                     children: [
  //                       pw.Text('Tipo de documento',
  //                           style: pw.TextStyle(
  //                               fontSize: 7, color: colorNegroTitulos)),
  //                       pw.SizedBox(height: 1),
  //                       pw.Text(tipoDocumento,
  //                           style: pw.TextStyle(fontSize: 10)),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //               pw.SizedBox(width: 2),
  //               pw.Expanded(
  //                 child: pw.Container(
  //                   padding: const pw.EdgeInsets.all(3),
  //                   decoration: pw.BoxDecoration(color: colorGrisFondo),
  //                   child: pw.Column(
  //                     crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                     children: [
  //                       pw.Text('Número de documento',
  //                           style: pw.TextStyle(
  //                               fontSize: 7, color: colorNegroTitulos)),
  //                       pw.SizedBox(height: 1),
  //                       pw.Text(numeroDocumento,
  //                           style: pw.TextStyle(fontSize: 10)),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //               pw.SizedBox(width: 2),
  //               pw.Expanded(
  //                 child: pw.Container(
  //                   padding: const pw.EdgeInsets.all(3),
  //                   decoration: pw.BoxDecoration(color: colorGrisFondo),
  //                   child: pw.Column(
  //                     crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                     children: [
  //                       pw.Text('Fecha de expedición',
  //                           style: pw.TextStyle(
  //                               fontSize: 7, color: colorNegroTitulos)),
  //                       pw.SizedBox(height: 1),
  //                       pw.Text(fechaExpedicion,
  //                           style: pw.TextStyle(fontSize: 10)),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //               pw.SizedBox(width: 2),
  //               pw.Expanded(
  //                 child: pw.Container(
  //                   padding: const pw.EdgeInsets.all(3),
  //                   decoration: pw.BoxDecoration(color: colorGrisFondo),
  //                   child: pw.Column(
  //                     crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                     children: [
  //                       pw.Text('Ciudad y departamento de expedición',
  //                           style: pw.TextStyle(
  //                               fontSize: 7, color: colorNegroTitulos)),
  //                       pw.SizedBox(height: 1),
  //                       pw.Text(ciudadExpedicion,
  //                           style: pw.TextStyle(fontSize: 10)),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //           pw.SizedBox(height: 4),

  //           // Dirección de residencia
  //           pw.Container(
  //             width: double.infinity,
  //             padding: const pw.EdgeInsets.all(3),
  //             decoration: pw.BoxDecoration(color: colorGrisFondo),
  //             child: pw.Column(
  //               crossAxisAlignment: pw.CrossAxisAlignment.start,
  //               children: [
  //                 pw.Text('Dirección de residencia',
  //                     style:
  //                         pw.TextStyle(fontSize: 7, color: colorNegroTitulos)),
  //                 pw.SizedBox(height: 1),
  //                 pw.Text(direccionResidencia,
  //                     style: pw.TextStyle(fontSize: 10)),
  //               ],
  //             ),
  //           ),
  //           pw.SizedBox(height: 4),

  //           // Ciudad y barrio
  //           pw.Row(
  //             children: [
  //               pw.Expanded(
  //                 flex: 3,
  //                 child: pw.Container(
  //                   padding: const pw.EdgeInsets.all(3),
  //                   decoration: pw.BoxDecoration(color: colorGrisFondo),
  //                   child: pw.Column(
  //                     crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                     children: [
  //                       pw.Text('Ciudad y departamento de residencia',
  //                           style: pw.TextStyle(
  //                               fontSize: 7, color: colorNegroTitulos)),
  //                       pw.SizedBox(height: 1),
  //                       pw.Text(ciudadResidencia,
  //                           style: pw.TextStyle(fontSize: 10)),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //               pw.SizedBox(width: 4),
  //               pw.Expanded(
  //                 flex: 2,
  //                 child: pw.Container(
  //                   padding: const pw.EdgeInsets.all(3),
  //                   decoration: pw.BoxDecoration(color: colorGrisFondo),
  //                   child: pw.Column(
  //                     crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                     children: [
  //                       pw.Text('Barrio',
  //                           style: pw.TextStyle(
  //                               fontSize: 7, color: colorNegroTitulos)),
  //                       pw.SizedBox(height: 1),
  //                       pw.Text(barrio, style: pw.TextStyle(fontSize: 10)),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //           pw.SizedBox(height: 8),

  //           // Datos de Contacto y Firma Electrónica
  //           pw.Container(
  //             width: double.infinity,
  //             color: colorAzul,
  //             padding:
  //                 const pw.EdgeInsets.symmetric(vertical: 5, horizontal: 10),
  //             child: pw.Text(
  //               'DATOS DE CONTACTO Y FIRMA ELECTRÓNICA',
  //               textAlign: pw.TextAlign.left,
  //               style: pw.TextStyle(
  //                   color: colorBlancoLetras,
  //                   fontSize: 11,
  //                   fontWeight: pw.FontWeight.bold),
  //             ),
  //           ),
  //           pw.SizedBox(height: 4),

  //           // Datos de contacto
  //           pw.Row(
  //             children: [
  //               pw.Expanded(
  //                 child: pw.Container(
  //                   padding: const pw.EdgeInsets.all(3),
  //                   decoration: pw.BoxDecoration(color: colorGrisFondo),
  //                   child: pw.Column(
  //                     crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                     children: [
  //                       pw.Text('Correo electrónico',
  //                           style: pw.TextStyle(
  //                               fontSize: 7, color: colorNegroTitulos)),
  //                       pw.SizedBox(height: 1),
  //                       pw.Text(correoElectronico,
  //                           style: pw.TextStyle(fontSize: 10)),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //               pw.SizedBox(width: 4),
  //               pw.Expanded(
  //                 child: pw.Container(
  //                   padding: const pw.EdgeInsets.all(3),
  //                   decoration: pw.BoxDecoration(color: colorGrisFondo),
  //                   child: pw.Column(
  //                     crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                     children: [
  //                       pw.Text('WhatsApp',
  //                           style: pw.TextStyle(
  //                               fontSize: 7, color: colorNegroTitulos)),
  //                       pw.SizedBox(height: 1),
  //                       pw.Text(whatsapp, style: pw.TextStyle(fontSize: 10)),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //               pw.SizedBox(width: 4),
  //               pw.Expanded(
  //                 child: pw.Container(
  //                   padding: const pw.EdgeInsets.all(3),
  //                   decoration: pw.BoxDecoration(color: colorGrisFondo),
  //                   child: pw.Column(
  //                     crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                     children: [
  //                       pw.Text('Otro teléfono',
  //                           style: pw.TextStyle(
  //                               fontSize: 7, color: colorNegroTitulos)),
  //                       pw.SizedBox(height: 1),
  //                       pw.Text(otroTelefono,
  //                           style: pw.TextStyle(fontSize: 10)),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //           pw.SizedBox(height: 8),

  //           // Información Empresa
  //           pw.Container(
  //             width: double.infinity,
  //             color: colorAzul,
  //             padding:
  //                 const pw.EdgeInsets.symmetric(vertical: 5, horizontal: 10),
  //             child: pw.Text(
  //               'INFORMACIÓN EMPRESA',
  //               textAlign: pw.TextAlign.left,
  //               style: pw.TextStyle(
  //                   color: colorBlancoLetras,
  //                   fontSize: 11,
  //                   fontWeight: pw.FontWeight.bold),
  //             ),
  //           ),
  //           pw.SizedBox(height: 4),

  //           // Razón social
  //           pw.Container(
  //             width: double.infinity,
  //             padding: const pw.EdgeInsets.all(3),
  //             decoration: pw.BoxDecoration(color: colorGrisFondo),
  //             child: pw.Column(
  //               crossAxisAlignment: pw.CrossAxisAlignment.start,
  //               children: [
  //                 pw.Text('Razón social',
  //                     style:
  //                         pw.TextStyle(fontSize: 7, color: colorNegroTitulos)),
  //                 pw.SizedBox(height: 1),
  //                 pw.Text(razonSocial, style: pw.TextStyle(fontSize: 10)),
  //               ],
  //             ),
  //           ),
  //           pw.SizedBox(height: 4),

  //           // Fila sigla, nit, tipo contrato
  //           pw.Row(
  //             children: [
  //               pw.Expanded(
  //                 child: pw.Container(
  //                   padding: const pw.EdgeInsets.all(3),
  //                   decoration: pw.BoxDecoration(color: colorGrisFondo),
  //                   child: pw.Column(
  //                     crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                     children: [
  //                       pw.Text('Sigla',
  //                           style: pw.TextStyle(
  //                               fontSize: 7, color: colorNegroTitulos)),
  //                       pw.SizedBox(height: 1),
  //                       pw.Text(sigla, style: pw.TextStyle(fontSize: 10)),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //               pw.SizedBox(width: 4),
  //               pw.Expanded(
  //                 child: pw.Container(
  //                   padding: const pw.EdgeInsets.all(3),
  //                   decoration: pw.BoxDecoration(color: colorGrisFondo),
  //                   child: pw.Column(
  //                     crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                     children: [
  //                       pw.Text('Nit',
  //                           style: pw.TextStyle(
  //                               fontSize: 7, color: colorNegroTitulos)),
  //                       pw.SizedBox(height: 1),
  //                       pw.Text(nit, style: pw.TextStyle(fontSize: 10)),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //               pw.SizedBox(width: 4),
  //               pw.Expanded(
  //                 child: pw.Container(
  //                   padding: const pw.EdgeInsets.all(3),
  //                   decoration: pw.BoxDecoration(color: colorGrisFondo),
  //                   child: pw.Column(
  //                     crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                     children: [
  //                       pw.Text('Tipo de contrato',
  //                           style: pw.TextStyle(
  //                               fontSize: 7, color: colorNegroTitulos)),
  //                       pw.SizedBox(height: 1),
  //                       pw.Text(tipoContrato,
  //                           style: pw.TextStyle(fontSize: 10)),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //           pw.SizedBox(height: 4),

  //           // Ubicación
  //           pw.Container(
  //             width: double.infinity,
  //             padding: const pw.EdgeInsets.all(3),
  //             decoration: pw.BoxDecoration(color: colorGrisFondo),
  //             child: pw.Column(
  //               crossAxisAlignment: pw.CrossAxisAlignment.start,
  //               children: [
  //                 pw.Text('Ubicación laboral',
  //                     style:
  //                         pw.TextStyle(fontSize: 7, color: colorNegroTitulos)),
  //                 pw.SizedBox(height: 1),
  //                 pw.Text(ubicacion, style: pw.TextStyle(fontSize: 10)),
  //               ],
  //             ),
  //           ),
  //           pw.SizedBox(height: 8),

  //           // Descripción Aporte
  //           pw.Container(
  //             width: double.infinity,
  //             color: colorAzul,
  //             padding:
  //                 const pw.EdgeInsets.symmetric(vertical: 5, horizontal: 10),
  //             child: pw.Text(
  //               'DESCRIPCIÓN APORTE',
  //               textAlign: pw.TextAlign.left,
  //               style: pw.TextStyle(
  //                   color: colorBlancoLetras,
  //                   fontSize: 11,
  //                   fontWeight: pw.FontWeight.bold),
  //             ),
  //           ),
  //           pw.SizedBox(height: 4),

  //           // Valor descuento y tiempo
  //           pw.Row(
  //             children: [
  //               pw.Expanded(
  //                 child: pw.Container(
  //                   padding: const pw.EdgeInsets.all(3),
  //                   decoration: pw.BoxDecoration(color: colorGrisFondo),
  //                   child: pw.Column(
  //                     crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                     children: [
  //                       pw.Text('Valor de descuento',
  //                           style: pw.TextStyle(
  //                               fontSize: 7, color: colorNegroTitulos)),
  //                       pw.SizedBox(height: 1),
  //                       pw.Text(valorDescuento,
  //                           style: pw.TextStyle(fontSize: 10)),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //               pw.SizedBox(width: 4),
  //               pw.Expanded(
  //                 child: pw.Container(
  //                   padding: const pw.EdgeInsets.all(3),
  //                   decoration: pw.BoxDecoration(color: colorGrisFondo),
  //                   child: pw.Column(
  //                     crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                     children: [
  //                       pw.Text('Tiempo de ejecución',
  //                           style: pw.TextStyle(
  //                               fontSize: 7, color: colorNegroTitulos)),
  //                       pw.SizedBox(height: 1),
  //                       pw.Text(tiempo, style: pw.TextStyle(fontSize: 10)),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //           pw.SizedBox(height: 8),

  //           // Párrafo de autorización
  //           pw.Text(
  //             'Actuando en calidad de ASOCIADO, autorizo a la EMPRESA a realizar descuento por nómina, el valor del aporte mencionado a ALIANZA CAPITAL.',
  //             style: pw.TextStyle(fontSize: 9),
  //             textAlign: pw.TextAlign.justify,
  //           ),
  //           pw.SizedBox(height: 4),
  //           pw.Text(
  //             'De acuerdo a lo anterior, atentamente:',
  //             style: pw.TextStyle(fontSize: 9),
  //             textAlign: pw.TextAlign.justify,
  //           ),

  //           // Todo alineado hacia abajo desde aquí
  //           pw.Expanded(
  //             child: pw.Column(
  //               mainAxisAlignment: pw.MainAxisAlignment.end,
  //               children: [
  //                 // Espacio para firma electrónica
  //                 pw.Container(
  //                   width: double.infinity,
  //                   height: 80,
  //                   decoration: pw.BoxDecoration(
  //                     border: pw.Border(
  //                       top: pw.BorderSide(
  //                           color: PdfColors.grey400,
  //                           width: 1,
  //                           style: pw.BorderStyle.dashed),
  //                       left: pw.BorderSide(
  //                           color: PdfColors.grey400,
  //                           width: 1,
  //                           style: pw.BorderStyle.dashed),
  //                       right: pw.BorderSide(
  //                           color: PdfColors.grey400,
  //                           width: 1,
  //                           style: pw.BorderStyle.dashed),
  //                       bottom: pw.BorderSide(
  //                           color: PdfColors.grey400,
  //                           width: 1,
  //                           style: pw.BorderStyle.dashed),
  //                     ),
  //                   ),
  //                   child: pw.Stack(
  //                     children: [
  //                       pw.Positioned(
  //                         bottom: 5,
  //                         left: 0,
  //                         right: 0,
  //                         child: pw.Center(
  //                           child: pw.Text(
  //                             'Espacio para firma electrónica',
  //                             style: pw.TextStyle(
  //                                 fontSize: 8, color: PdfColors.grey600),
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //                 pw.SizedBox(height: 20),

  //                 // Footer con firma y sello
  //                 pw.Row(
  //                   mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     // Datos del firmante a la izquierda
  //                     pw.Column(
  //                       crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                       children: [
  //                         pw.Text(nombreFirma,
  //                             style: pw.TextStyle(
  //                                 fontSize: 10,
  //                                 fontWeight: pw.FontWeight.bold)),
  //                         pw.Text('CC: $cedulaFirma',
  //                             style: pw.TextStyle(fontSize: 8)),
  //                         pw.Text('FIRMA ELECTRÓNICA',
  //                             style: pw.TextStyle(fontSize: 8)),
  //                       ],
  //                     ),

  //                     // Datos de Alianza y sello a la derecha
  //                     pw.Row(
  //                       children: [
  //                         pw.Column(
  //                           crossAxisAlignment: pw.CrossAxisAlignment.end,
  //                           children: [
  //                             pw.Text('ALIANZA CAPITAL',
  //                                 style: pw.TextStyle(
  //                                     fontSize: 10,
  //                                     fontWeight: pw.FontWeight.bold)),
  //                             pw.Text('Dpto. Financiero',
  //                                 style: pw.TextStyle(fontSize: 8)),
  //                           ],
  //                         ),
  //                         pw.SizedBox(width: 8),
  //                         selloVerificadoBytes.isNotEmpty
  //                             ? pw.Image(pw.MemoryImage(selloVerificadoBytes),
  //                                 width: 40, height: 40)
  //                             : pw.Container(
  //                                 width: 40,
  //                                 height: 40,
  //                                 decoration: pw.BoxDecoration(
  //                                   shape: pw.BoxShape.circle,
  //                                   color: PdfColors.grey300,
  //                                 ),
  //                                 child: pw.Center(
  //                                   child: pw.Text('SELLO',
  //                                       style: pw.TextStyle(fontSize: 8)),
  //                                 ),
  //                               ),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //                 pw.SizedBox(height: 4),

  //                 // Pie de página legal
  //                 pw.Container(
  //                   margin: const pw.EdgeInsets.only(top: 6),
  //                   child: pw.Text(
  //                     'La presente constancia constituye una copia simple de su original creado de forma electrónica y almacenado en los sistemas de almacenamiento de Zapsign. Por tal razón este documento no es representativo del valor en depósito y por lo tanto no legitima a su tenedor, no es transferible, ni negociable. Ley 527 de 1999 y el decreto de Ley 019 de 2012, por medio de la cual se dene y reglamenta el acceso y uso de los mensajes de datos, del comercio electrónico y de las rmas digitales, y se establecen las entidades de certicación y se dictan otras disposiciones',
  //                     style:
  //                         pw.TextStyle(fontSize: 6, color: PdfColors.grey600),
  //                     textAlign: pw.TextAlign.justify,
  //                   ),
  //                 ),

  //                 // Footer con imagen de vigilado
  //                 pw.Container(
  //                   alignment: pw.Alignment.bottomRight,
  //                   margin: const pw.EdgeInsets.only(top: 8),
  //                   child: imagenVigiladoBytes.isNotEmpty
  //                       ? pw.Image(pw.MemoryImage(imagenVigiladoBytes),
  //                           width: 120, height: 30)
  //                       : pw.Container(
  //                           width: 120,
  //                           height: 30,
  //                           color: PdfColors.grey300,
  //                           child: pw.Center(
  //                             child: pw.Text(
  //                               'VIGILADO: SUPERINTENDENCIA DE LA\nECONOMÍA SOLIDARIA',
  //                               style: pw.TextStyle(fontSize: 6),
  //                               textAlign: pw.TextAlign.center,
  //                             ),
  //                           ),
  //                         ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   ),
  // );

  // PÁGINA 3: CONTRATO APERTURA LÍNEA DE AHORRO - PÁGINA 1
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.symmetric(horizontal: 40, vertical: 36),
      build: (context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Encabezado
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Row(
                  children: [
                    logoAlianzaBytes.isNotEmpty
                        ? pw.Image(pw.MemoryImage(logoAlianzaBytes),
                            width: 160, height: 80)
                        : pw.Container(
                            width: 160,
                            height: 80,
                            color: PdfColors.orange100,
                            child: pw.Center(
                              child: pw.Text(
                                'ALIANZA\nCAPITAL',
                                style: pw.TextStyle(
                                    color: PdfColors.blue800,
                                    fontWeight: pw.FontWeight.bold),
                                textAlign: pw.TextAlign.center,
                              ),
                            ),
                          ),
                    pw.SizedBox(width: 8),
                    pw.Container(width: 2, height: 40, color: PdfColors.orange),
                    pw.SizedBox(width: 8),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('CONTRATO APERTURA',
                            style: pw.TextStyle(
                                fontSize: 12, fontWeight: pw.FontWeight.bold)),
                        pw.Text('LÍNEA DE AHORRO',
                            style: pw.TextStyle(fontSize: 10)),
                      ],
                    ),
                  ],
                ),
                logoBanderaBytes.isNotEmpty
                    ? pw.Image(pw.MemoryImage(logoBanderaBytes),
                        width: 40, height: 40)
                    : pw.Container(
                        width: 40,
                        height: 40,
                        color: PdfColors.orange300,
                      ),
              ],
            ),
            pw.SizedBox(height: 20),

            // Contenido del contrato - todo el texto proporcionado
            pw.Text(
              'ASOCIADO, con la firma de este contrato de apertura de LÍNEA DE AHORRO, confirmo que acepto las siguientes cláusulas:\n\u00A0\nPRIMERO: La información aquí suministrada por mí es confidencial y necesaria para la vinculación como asociado ahorrador en ALIANZA CAPITAL, la gestión y aprobación de cualquier producto u operación y/o la atención de mis solicitudes, peticiones, quejas o reclamos. Declaro que la información suministrada en el Sitio Web o la Aplicación es de mi titularidad, concuerda con la realidad y asumo plena responsabilidad por la veracidad de esta; cualquier inexactitud podrá acarrear las consecuencias expuestas en el Reglamento de productos, sin responsabilidad alguna por parte de ALIANZA CAPITAL, frente a terceros. Reconozco y acepto que en el evento que la información por mí suministrada en este Sitio Web o aplicación no sea de mi propiedad, induzca a una falsedad personal o sea violatoria del bien jurídico tutelado denominado "de la protección de la información y de los datos" podré incurrir en tipos penales previstos por la legislación colombiana.\n\u00A0\nAsi mismo, entiendo que autorizo a ALIANZA CAPITAL con relación a:\n\u00A0\nI. Autorización, Reporte y Consulta de Información ante los Operadores de Bancos de Datos de Información Financiera y/o Crediticia (Ley 1266 de 2008 y Ley 2157 de 2021). Autorizo de ALIANZA CAPITAL, como responsable del Tratamiento; sus Encargados del Tratamiento; a quien él les haya transmitido o transferido la información, incluyendo la transferencia a terceros países, aliados, y/o a quien el futuro ostente sus derechos, para que obtenga toda la información relativa a mis datos personales financieros, crediticios, comerciales y de servicios registrados ante cualquier banco de datos, mi comportamiento crediticio y comercial, el cumplimiento de mis obligaciones, en el sector financiero y real, datos financieros e información relacionada con mi situación laboral e ingresos salariales ante operadores de información crediticia, de seguridad social, administradoras de fondos y cesantías, centrales de riesgo, notarías, Registraduría Nacional del Estado Civil, Contraloría General de la República, Procuraduría General de la Nación, DIAN, Oficinas de Registro, cajas de compensación, proveedores tecnológicos de Nómina y Facturación electrónica, Administradoras de Fondos de Pensiones y de Cesantías y Operadores de Información a través de las cuales se liquidan cesantías, aportes de seguridad social y parafiscales, tales como Aportes en Línea, SOI, SIMPLE, PILA, entre otras; así mismo para que soliciten o verifiquen información sobre mis activos, bienes o derechos en entidades públicas o privadas, o información que se encuentre en buscadores públicos, listas restrictivas, listas vinculantes para Colombia, redes sociales o publicaciones físicas o electrónicas, bien fuere en Colombia o en el exterior. El resultado del análisis para acceder al producto me será informado a través de alguno de los medios de contacto que he suministrado. De igual manera, autorizo, para que, con fines estadísticos, de control, supervisión y de información, reporte a las Centrales de Información, mis datos de contacto, el desarrollo, novedades, extinción y cumplimiento de las obligaciones contraídas o que llegue a contraer con ALIANZA CAPITAL y/o a quien el futuro ostente sus derechos. Estas autorizaciones de reporte y consulta de información tendrán las mismas finalidades legítimas estipuladas para el tratamiento de información personal, cuya autorización y detalle se señala a continuación.\n\u00A0\n II. Autorización para el Tratamiento de la Información Personal (Ley 1581 de 2012). Sin perjuicio del derecho que me asiste a escoger los canales de contacto y habiendo sido debidamente informado sobre los medios de comunicación que serán utilizados por ALIANZA CAPITAL para el ejercicio de la relación contractual y comercial, autorizo de manera libre, voluntaria, expresa e informada a ALIANZA CAPITAL en calidad de Responsable del Tratamiento; a sus encargados del tratamiento o a quien la asociación les haya transmitido o transferido la información, incluyendo la transferencia a terceros países, y/o a quien en el futuro ostente sus derechos, a ser contactado utilizando la información suministrada en el presente Formulario para las finalidades previstas en este documento, a través de los siguientes canales: i) línea telefónica; ii) correo electrónico; iii) Servicio de Mensajes Cortos (SMS); iv) aplicaciones de mensajería instantánea o formal; y/o v) redes sociales. Declaro conocer y entender que, en caso de que requiera actualizar o modificar mis canales de contacto, puedo realizarlo a través de las Líneas autorizadas e informadas en la página WEB de la asociación. Autorizo a ALIANZA CAPITAL, en calidad de responsable del Tratamiento; a sus Encargados del Tratamiento o a quien haya transmitido o transferido la información, aliados y/o a quien el futuro ostente sus derechos, incluyendo la transferencia a terceros países, y/o a quien en el futuro ostente sus derechos, para que lleve a cabo el tratamiento de mis datos personales, incluyendo datos biométricos. En virtud de dicha autorización de tratamiento, ALIANZA CAPITAL podrá solicitar, consultar, compartir, recolectar, almacenar, informar, usar, circular, reportar, transferir, trasmitir, procesar, divulgar, rectificar, modificar, aclarar, retirar, suprimir y/o actualizar mis datos e información personal, la cual, es suministrada por mí a través de todos los canales de contacto con ALIANZA CAPITAL, así como la página web. Así mismo, autorizo a ALIANZA CAPITAL, en calidad de responsable del Tratamiento; a sus Encargados del Tratamiento o a quien él les haya transmitido o transferido la información, aliados, incluyendo la transferencia a terceros países, y/o a quien el futuro ostente sus derechos, para que de forma directa o a través de una entidad certificada como operador biométrico, realice la validación de mi identidad y mis características físicas (huellas dactilares y/o rostro). Declaro que conozco y entiendo que no estoy obligado a suministrar y/o autorizar el tratamiento de los datos personales de menores de edad.',
              style: pw.TextStyle(
                  fontSize: 9,
                  fontWeight: pw.FontWeight.normal,
                  color: PdfColors.black),
              textAlign: pw.TextAlign.justify,
            ),

            // Resto del contenido del footer
            pw.Expanded(
              child: pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  pw.Text(
                    'La presente constancia constituye una copia simple de su original creado de forma electrónica y almacenado en los sistemas de almacenamiento de Zapsign. Por tal razón este documento no es representativo del valor en depósito y por lo tanto no legitima a su tenedor, no es transferible, ni negociable. Ley 527 de 1999 y el decreto de Ley 019 de 2012, por medio de la cual se dene y reglamenta el acceso y uso de los mensajes de datos, del comercio electrónico y de las rmas digitales, y se establecen las entidades de certicación y se dictan otras disposiciones.',
                    style: pw.TextStyle(fontSize: 6, color: PdfColors.grey600),
                    textAlign: pw.TextAlign.justify,
                  ),
                  pw.Container(
                    alignment: pw.Alignment.bottomRight,
                    margin: const pw.EdgeInsets.only(top: 8),
                    child: imagenVigiladoBytes.isNotEmpty
                        ? pw.Image(pw.MemoryImage(imagenVigiladoBytes),
                            width: 120, height: 30)
                        : pw.Container(
                            width: 120,
                            height: 30,
                            color: PdfColors.grey300,
                            child: pw.Center(
                              child: pw.Text(
                                'VIGILADO: SUPERINTENDENCIA DE LA\nECONOMÍA SOLIDARIA',
                                style: pw.TextStyle(fontSize: 6),
                                textAlign: pw.TextAlign.center,
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    ),
  );

  // PÁGINA 4: CONTRATO APERTURA LÍNEA DE AHORRO - PÁGINA 2
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.symmetric(horizontal: 40, vertical: 36),
      build: (context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Encabezado
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Row(
                  children: [
                    logoAlianzaBytes.isNotEmpty
                        ? pw.Image(pw.MemoryImage(logoAlianzaBytes),
                            width: 160, height: 80)
                        : pw.Container(
                            width: 160,
                            height: 80,
                            color: PdfColors.orange100,
                            child: pw.Center(
                              child: pw.Text(
                                'ALIANZA\nCAPITAL',
                                style: pw.TextStyle(
                                    color: PdfColors.blue800,
                                    fontWeight: pw.FontWeight.bold),
                                textAlign: pw.TextAlign.center,
                              ),
                            ),
                          ),
                    pw.SizedBox(width: 8),
                    pw.Container(width: 2, height: 40, color: PdfColors.orange),
                    pw.SizedBox(width: 8),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('CONTRATO APERTURA',
                            style: pw.TextStyle(
                                fontSize: 12, fontWeight: pw.FontWeight.bold)),
                        pw.Text('LÍNEA DE AHORRO',
                            style: pw.TextStyle(fontSize: 10)),
                      ],
                    ),
                  ],
                ),
                logoBanderaBytes.isNotEmpty
                    ? pw.Image(pw.MemoryImage(logoBanderaBytes),
                        width: 40, height: 40)
                    : pw.Container(
                        width: 40,
                        height: 40,
                        color: PdfColors.orange300,
                      ),
              ],
            ),
            pw.SizedBox(height: 20),

            // Contenido continuación
            pw.Text(
              'De igual manera, declaro que conozco y entiendo que no estoy obligado a suministrar y/o autorizar el tratamiento de datos personales sensibles; no obstante, autorizo a ALIANZA CAPITAL el tratamiento de estos datos, de conformidad con lo establecido en el Artículo 5 y 6 de la Ley 1581 de 2023 y el Artículo 6 del Decreto 1377 de 2013, incluyendo de forma expresa mis datos biométricos y los datos asociados al origen racial o étnico, exclusivamente para las finalidades previstas en el presente documento; así mismo, conozco que la información biométrica consultada en las bases de datos respectivas no podrá ser almacenada, ni usada por ALIANZA CAPITAL, sus Encargados del Tratamiento o a quien él les haya transmitido o transferido la información, aliados, incluyendo la transferencia a terceros países y/o a quien el futuro ostente sus derechos, para complementar otras bases de datos, ni para fines distintos a los expresados en la presente autorización y en la Ley. Mis datos e información personal, debidamente autorizados a través del presente formulario, podrán ser sujetos de tratamiento por ALIANZA CAPITAL, sus Encargados del Tratamiento o a quien él les haya transmitido o transferido la información, aliados, incluyendo la transferencia a terceros países y/o a quien el futuro ostente sus derechos, en consecuencia, acepto ser contactado(a) mediante: i) línea telefónica; ii) correo electrónico; iii) Servicio de Mensajes Cortos (SMS); iv) v) aplicaciones de mensajería instantánea o formal; y/o vi) redes sociales. El tratamiento por la presente autorización permitido a ALIANZA CAPITAL, sus Encargados del Tratamiento o a quien él les haya transmitido o transferido la información, aliados, incluyendo la transferencia a terceros países y/o a quien el futuro ostente sus derechos podrá tener por objeto las finalidades legitimas de: i) cumplir las obligaciones contractuales y reglamentarias, prevención del lavado de activos y financiación del terrorismo, así como para la prestación de los servicios contratados; ii) atender y dar solución a las solicitudes, peticiones, quejas o reclamos formulados a ALIANZA CAPITAL; iii) crear y actualizar los perfiles transaccionales; iv) realizar gestiones de cobranza; v) informar sobre los cambios realizados a los productos y servicios del portafolio de ALIANZA CAPITAL; vi) analizar las tendencias y comportamientos de consumo de los consumidores financieros; vii) para mi vinculación como cliente y/o prospecto, aprobación de operaciones de crédito, apertura y/o uso de los servicios y/o productos ofrecidos por ALIANZA CAPITAL; viii) recibir información sobre campañas, estrategias promocionales, ofertas comerciales y publicidad de productos de ALIANZA CAPITAL y de aliados de éste, sean éstas presentes o futuras; ix) recibir cualquier tipo de información y/o comunicación que ALIANZA CAPITAL estime necesario y general, para que se adelanten todos los procesos de relacionamiento (soportados o no en tecnología), para un abordaje y conocimiento integral del cliente de todos mis productos y soluciones contratadas con ALIANZA CAPITAL, entre otros permitidos por la Ley. Conozco y entiendo que como Titular de la información tengo derecho a conocer, actualizar, rectificar mis datos personales, solicitar prueba de la autorización otorgada para el tratamiento de la información, informarme sobre el uso que se ha dado a los mismos, revocar la autorización, solicitar la supresión de mis datos cuando sea procedente y acceder en forma gratuita a los mismos. Conozco que, para ejercer los derechos sobre mis datos personales podré comunicarme a las Líneas de Atención suministradas en la página WEB. Para conocer la Política de Protección de Datos Personales y Política de Cobranzas, podré ingresar a la pagina WEB.\n\u00A0\nIII. Autorización para Compartir Datos Personales con Entidades Pertenecientes al Grupo Económico, vinculados económicos, personas jurídicas o naturales, con base en las disposiciones de ALIANZA CAPITAL. Autorizo a ALIANZA CAPITAL y/o a cualquier otra Entidad o Unidad de Negocio interna que represente sus derechos, a compartir mi información personal, financiera, crediticia y comercial como Cliente de ALIANZA CAPITAL con cualquiera otra persona o Entidad Vinculada al Grupo Económico al que pertenece y/o llegue a pertenecer ALIANZA CAPITAL o la Entidad que represente sus derechos, para realizar el mismo tratamiento y con las mismas finalidades mencionadas en el numeral anterior. Declaro haber leído el contenido de este documento, así como comprenderlo en su alcance e implicación, aceptando los Términos y Condiciones. El documento y mi aceptación tendrán validez marcando la casilla de aceptación en el formulario de solicitud de ALIANZA CAPITAL y/o de quien en el futuro represente u ostente sus derechos, así como, sus obligaciones.\n\u00A0\nLas definiciones contenidas en la presente autorización que se encuentren en mayúscula tendrán el significado que así se haya determinado en la Política de Protección de Datos Personales de ALIANZA CAPITAL, la cual podrá ser consultada en la página web.\n\u00A0\nSEGUNDO: Declaración de origen de Fondos- Declaro que: a.) Mis recursos tienen un origen lícito y provienen directamente del desarrollo de la actividad económica y ocupación señalada en la sección actividad económica. b.) Los ingresos aquí reportados, no provienen de ninguna actividad ilícita de las contempladas en el código penal colombiano o en cualquier otra norma concordante. c.) No admitiré que terceros efectúen depósitos a nombre mío en los productos solicitados, de los cuales desconozca su origen.\n\u00A0\nTERCERO: Acepto el reglamento de AHORRO ALIANZA CAPITAL, Acuerdo 002 aprobado por junta directiva, el cual me fue informado durante el proceso realizado.',
              style: pw.TextStyle(
                  fontSize: 9,
                  fontWeight: pw.FontWeight.normal,
                  color: PdfColors.black),
              textAlign: pw.TextAlign.justify,
            ),

            // Resto del contenido del footer
            pw.Expanded(
              child: pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  pw.Text(
                    'La presente constancia constituye una copia simple de su original creado de forma electrónica y almacenado en los sistemas de almacenamiento de Zapsign. Por tal razón este documento no es representativo del valor en depósito y por lo tanto no legitima a su tenedor, no es transferible, ni negociable. Ley 527 de 1999 y el decreto de Ley 019 de 2012, por medio de la cual se dene y reglamenta el acceso y uso de los mensajes de datos, del comercio electrónico y de las rmas digitales, y se establecen las entidades de certicación y se dictan otras disposiciones.',
                    style: pw.TextStyle(fontSize: 6, color: PdfColors.grey600),
                    textAlign: pw.TextAlign.justify,
                  ),
                  pw.Container(
                    alignment: pw.Alignment.bottomRight,
                    margin: const pw.EdgeInsets.only(top: 8),
                    child: imagenVigiladoBytes.isNotEmpty
                        ? pw.Image(pw.MemoryImage(imagenVigiladoBytes),
                            width: 120, height: 30)
                        : pw.Container(
                            width: 120,
                            height: 30,
                            color: PdfColors.grey300,
                            child: pw.Center(
                              child: pw.Text(
                                'VIGILADO: SUPERINTENDENCIA DE LA\nECONOMÍA SOLIDARIA',
                                style: pw.TextStyle(fontSize: 6),
                                textAlign: pw.TextAlign.center,
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    ),
  );

  // PÁGINA 5: CONTRATO APERTURA LÍNEA DE AHORRO - PÁGINA 3 (FINAL)
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.symmetric(horizontal: 40, vertical: 36),
      build: (context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Encabezado
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Row(
                  children: [
                    logoAlianzaBytes.isNotEmpty
                        ? pw.Image(pw.MemoryImage(logoAlianzaBytes),
                            width: 160, height: 80)
                        : pw.Container(
                            width: 160,
                            height: 80,
                            color: PdfColors.orange100,
                            child: pw.Center(
                              child: pw.Text(
                                'ALIANZA\nCAPITAL',
                                style: pw.TextStyle(
                                    color: PdfColors.blue800,
                                    fontWeight: pw.FontWeight.bold),
                                textAlign: pw.TextAlign.center,
                              ),
                            ),
                          ),
                    pw.SizedBox(width: 8),
                    pw.Container(width: 2, height: 40, color: PdfColors.orange),
                    pw.SizedBox(width: 8),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('CONTRATO APERTURA',
                            style: pw.TextStyle(
                                fontSize: 12, fontWeight: pw.FontWeight.bold)),
                        pw.Text('LÍNEA DE AHORRO',
                            style: pw.TextStyle(fontSize: 10)),
                      ],
                    ),
                  ],
                ),
                logoBanderaBytes.isNotEmpty
                    ? pw.Image(pw.MemoryImage(logoBanderaBytes),
                        width: 40, height: 40)
                    : pw.Container(
                        width: 40,
                        height: 40,
                        color: PdfColors.orange300,
                      ),
              ],
            ),
            pw.SizedBox(height: 20),

            // Contenido final
            pw.Text(
              'CUARTO: Acepto que los extractos y otras comunicaciones con ALIANZA CAPITAL sean enviadas al buzón de mi servicio a través de la APP o pagina WEB.\n\u00A0\nQUINTO: Declaro que no soy una persona expuesta políticamente en Colombia ni en ningún país diferente a Colombia, ni soy cónyuge, ni familiar hasta el segundo grado de consanguinidad o segundo de anidad o primero civil de una persona expuesta políticamente. Igualmente declaro que no estoy cobijado por el articulo 30-A de la Ley 1908 de 2019, ni tengo residencia scal en ningún país diferente a Colombia.\n\u00A0\nSEXTO: En observancia del artículo 7 del Decreto 2364 de 2012, convengo con ALIANZA CAPITAL y acepto que el presente documento será rmado electrónicamente mediante el mecanismo OTP (One Time Password) digitado en un dispositivo móvil, ordenador u otra herramienta que autorice ALIANZA CAPITAL, reconociendo que dicha rma tiene los mismos efectos de mi rma manuscrita, cumpliendo con los atributos dispuestos en el parágrafo del artículo 28 de la Ley 527 de 1999 y el citado Decreto Reglamentario. Para estos efectos, maniesto que: I). Leí y veriqué el presente documento; II). Mantendré actualizados en todo momento los datos del celular personal y el correo electrónico; III). Y reportaré de forma inmediata cualquier circunstancia que pueda poner en riesgo la seguridad de la OTP. Para todos los efectos, los documentos rmados electrónicamente serán custodiados por ALIANZA CAPITAL y/o la empresa que haga sus veces en este proceso',
              style: pw.TextStyle(
                  fontSize: 9,
                  fontWeight: pw.FontWeight.normal,
                  color: PdfColors.black),
              textAlign: pw.TextAlign.justify,
            ),

            // Contenido con espacios expandidos
            pw.Expanded(
              child: pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  // Espacio para firma electrónica
                  pw.Container(
                    width: double.infinity,
                    height: 80,
                    decoration: pw.BoxDecoration(
                      border: pw.Border(
                        top: pw.BorderSide(
                            color: PdfColors.grey400,
                            width: 1,
                            style: pw.BorderStyle.dashed),
                        left: pw.BorderSide(
                            color: PdfColors.grey400,
                            width: 1,
                            style: pw.BorderStyle.dashed),
                        right: pw.BorderSide(
                            color: PdfColors.grey400,
                            width: 1,
                            style: pw.BorderStyle.dashed),
                        bottom: pw.BorderSide(
                            color: PdfColors.grey400,
                            width: 1,
                            style: pw.BorderStyle.dashed),
                      ),
                    ),
                    child: pw.Stack(
                      children: [
                        pw.Positioned(
                          bottom: 5,
                          left: 0,
                          right: 0,
                          child: pw.Center(
                            child: pw.Text(
                              'Espacio para firma electrónica',
                              style: pw.TextStyle(
                                  fontSize: 8, color: PdfColors.grey600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  pw.SizedBox(height: 20),

                  // 7. Footer con firma y sello
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      // Datos del firmante a la izquierda
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(nombreFirma,
                              style: pw.TextStyle(
                                  fontSize: 10,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.Text('CC: $cedulaFirma',
                              style: pw.TextStyle(fontSize: 8)),
                          pw.Text('FIRMA ELECTRÓNICA',
                              style: pw.TextStyle(fontSize: 8)),
                        ],
                      ),

                      // Datos de Alianza y sello a la derecha
                      pw.Row(
                        children: [
                          pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.end,
                            children: [
                              pw.Text('ALIANZA CAPITAL',
                                  style: pw.TextStyle(
                                      fontSize: 10,
                                      fontWeight: pw.FontWeight.bold)),
                              pw.Text('Dpto. Financiero',
                                  style: pw.TextStyle(fontSize: 8)),
                            ],
                          ),
                          pw.SizedBox(width: 8),
                          selloVerificadoBytes.isNotEmpty
                              ? pw.Image(pw.MemoryImage(selloVerificadoBytes),
                                  width: 40, height: 40)
                              : pw.Container(
                                  width: 40,
                                  height: 40,
                                  decoration: pw.BoxDecoration(
                                    shape: pw.BoxShape.circle,
                                    color: PdfColors.grey300,
                                  ),
                                  child: pw.Center(
                                    child: pw.Text('SELLO',
                                        style: pw.TextStyle(fontSize: 8)),
                                  ),
                                ),
                        ],
                      ),
                    ],
                  ),
                  pw.SizedBox(height: 4),

                  // Pie de página legal
                  pw.Text(
                    'La presente constancia constituye una copia simple de su original creado de forma electrónica y almacenado en los sistemas de almacenamiento de Zapsign. Por tal razón este documento no es representativo del valor en depósito y por lo tanto no legitima a su tenedor, no es transferible, ni negociable. Ley 527 de 1999 y el decreto de Ley 019 de 2012, por medio de la cual se dene y reglamenta el acceso y uso de los mensajes de datos, del comercio electrónico y de las rmas digitales, y se establecen las entidades de certicación y se dictan otras disposiciones.',
                    style: pw.TextStyle(fontSize: 6, color: PdfColors.grey600),
                    textAlign: pw.TextAlign.justify,
                  ),

                  // Imagen vigilado
                  pw.Container(
                    alignment: pw.Alignment.bottomRight,
                    margin: const pw.EdgeInsets.only(top: 8),
                    child: imagenVigiladoBytes.isNotEmpty
                        ? pw.Image(pw.MemoryImage(imagenVigiladoBytes),
                            width: 120, height: 30)
                        : pw.Container(
                            width: 120,
                            height: 30,
                            color: PdfColors.grey300,
                            child: pw.Center(
                              child: pw.Text(
                                'VIGILADO: SUPERINTENDENCIA DE LA\nECONOMÍA SOLIDARIA',
                                style: pw.TextStyle(fontSize: 6),
                                textAlign: pw.TextAlign.center,
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    ),
  );
  // Convertir el PDF a bytes
  final bytes = await pdf.save();

  // Crear y retornar un objeto FFUploadedFile
  return FFUploadedFile(
    name: 'alianza_contrato_completo.pdf',
    bytes: bytes,
    height: 0,
    width: 0,
    blurHash: '',
  );
}
