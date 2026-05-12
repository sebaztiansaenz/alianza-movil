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
import 'package:intl/intl.dart';
import 'dart:typed_data';

Future<FFUploadedFile> generateAlianzaPDF(
  String nombres,
  String direccion,
  String tipoDocumento,
  String ciudad,
  String departamento,
  String fechaNacimiento,
  String numeroDocumento,
  String fechaExpedicion,
  String ciudadExpedicion,
  String email,
  String telefono,
  String empresa,
  String nit,
  String valoraporte,
  String barrio,
) async {
  // Add your function code here!

// Crear documento PDF
  final pdf = pw.Document();

  // Formatear fecha actual
  final currentDate =
      DateFormat('dd MMMM yyyy', 'es_ES').format(DateTime.now());

  // URLs de los logotipos
  final logoUrl =
      'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/Alianza%20Pdf%20logo.png?alt=media&token=69805315-febc-43ef-9716-181c14efba26';
  final logoBWUrl =
      'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/Alianza%20pdf%20logo%20design.png?alt=media&token=52460c6f-9061-42c0-8681-aa5dc3db4c7a';

  // Cargar imágenes desde URL
  final res1 = await http.get(Uri.parse(logoUrl));
  final logoImage = pw.MemoryImage(res1.bodyBytes);

  final res2 = await http.get(Uri.parse(logoBWUrl));
  final logoBWImage = pw.MemoryImage(res2.bodyBytes);

  // Agregar primera página al PDF (según la imagen proporcionada)
  pdf.addPage(
    pw.MultiPage(
      // Configurar márgenes del documento
      margin: pw.EdgeInsets.all(30),

      // Cabecera del documento
      header: (pw.Context context) {
        return pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Logo principal de Alianza
            pw.Image(logoImage, width: 120),

            // Separador vertical y texto "APERTURA LÍNEA DE AHORRO NÓMINA"
            pw.SizedBox(width: 8),
            pw.Container(width: 2, height: 40, color: PdfColors.orange),
            pw.SizedBox(width: 8),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('APERTURA',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                pw.Text('LÍNEA DE AHORRO NÓMINA',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              ],
            ),

            // Logo en esquina superior derecha
            pw.Spacer(),
            pw.Container(
              width: 40,
              height: 40,
              child: pw.Image(logoBWImage),
            ),
          ],
        );
      },

      // Contenido principal del documento
      build: (pw.Context context) => [
        // Sección 1: Descripción del proyecto
        pw.Container(
          color: PdfColors.blue800,
          padding: pw.EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: pw.Text(
            'DESCRIPCIÓN DE PROYECTO',
            style: pw.TextStyle(
              color: PdfColors.white,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),

        // Tabla de tipo de línea de ahorro y fecha de apertura
        pw.Table(
          border: pw.TableBorder.all(color: PdfColors.grey300),
          children: [
            pw.TableRow(
              children: [
                pw.Padding(
                  padding: pw.EdgeInsets.all(4),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('Tipo de línea de ahorro',
                          style: pw.TextStyle(fontSize: 10)),
                    ],
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.all(4),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('Fecha de apertura',
                          style: pw.TextStyle(fontSize: 10)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),

        pw.SizedBox(height: 8),

        // Sección 2: Información del asociado
        pw.Container(
          color: PdfColors.blue800,
          padding: pw.EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: pw.Text(
            'INFORMACIÓN DEL ASOCIADO',
            style: pw.TextStyle(
              color: PdfColors.white,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),

        // Tabla de información personal
        pw.Table(
          border: pw.TableBorder.all(color: PdfColors.grey300),
          children: [
            // Fila 1: Nombre y apellidos, Tipo de documento, etc.
            pw.TableRow(
              decoration: pw.BoxDecoration(color: PdfColors.grey200),
              children: [
                // Nombres y apellidos
                pw.Padding(
                  padding: pw.EdgeInsets.all(4),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('Nombres y apellidos',
                          style: pw.TextStyle(fontSize: 10)),
                      pw.Text(nombres, style: pw.TextStyle(fontSize: 9)),
                    ],
                  ),
                ),
                // Tipo de documento
                pw.Padding(
                  padding: pw.EdgeInsets.all(4),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('Tipo de documento',
                          style: pw.TextStyle(fontSize: 10)),
                      pw.Text(tipoDocumento, style: pw.TextStyle(fontSize: 9)),
                    ],
                  ),
                ),
                // Número del documento
                pw.Padding(
                  padding: pw.EdgeInsets.all(4),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('Número del documento',
                          style: pw.TextStyle(fontSize: 10)),
                      pw.Text(numeroDocumento,
                          style: pw.TextStyle(fontSize: 9)),
                    ],
                  ),
                ),
                // Fecha de expedición
                pw.Padding(
                  padding: pw.EdgeInsets.all(4),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('Fecha de expedición',
                          style: pw.TextStyle(fontSize: 10)),
                      pw.Text(fechaExpedicion,
                          style: pw.TextStyle(fontSize: 9)),
                    ],
                  ),
                ),
                // Ciudad / departamento de expedición
                pw.Padding(
                  padding: pw.EdgeInsets.all(4),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('Ciudad / departamento de expedición',
                          style: pw.TextStyle(fontSize: 10)),
                      pw.Text(ciudadExpedicion,
                          style: pw.TextStyle(fontSize: 9)),
                    ],
                  ),
                ),
              ],
            ),

            // Fila 2: Dirección de residencia, Ciudad/departamento, Sexo
            pw.TableRow(
              children: [
                // Dirección de residencia
                pw.Padding(
                  padding: pw.EdgeInsets.all(4),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('Dirección de residencia',
                          style: pw.TextStyle(fontSize: 10)),
                      pw.Text(direccion, style: pw.TextStyle(fontSize: 9)),
                    ],
                  ),
                ),
                // Ciudad / departamento de residencia (span 3 columnas)
                pw.Padding(
                  padding: pw.EdgeInsets.all(4),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('Ciudad / departamento de residencia',
                          style: pw.TextStyle(fontSize: 10)),
                      pw.Text('$ciudad / $departamento',
                          style: pw.TextStyle(fontSize: 9)),
                    ],
                  ),
                ),
                // Sexo (placeholder para mantener estructura)
                pw.Padding(
                  padding: pw.EdgeInsets.all(4),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('Sexo', style: pw.TextStyle(fontSize: 10)),
                      pw.Text('', style: pw.TextStyle(fontSize: 9)),
                    ],
                  ),
                ),
                // Columnas vacías para mantener estructura
                pw.Container(),
                pw.Container(),
              ],
            ),
          ],
        ),

        pw.SizedBox(height: 8),

        // Sección 3: Datos de contacto y firma electrónica
        pw.Container(
          color: PdfColors.blue800,
          padding: pw.EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: pw.Text(
            'DATOS DE CONTACTO Y FIRMA ELECTRÓNICA',
            style: pw.TextStyle(
              color: PdfColors.white,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),

        // Tabla de contacto
        pw.Table(
          border: pw.TableBorder.all(color: PdfColors.grey300),
          children: [
            pw.TableRow(
              children: [
                // Correo electrónico
                pw.Padding(
                  padding: pw.EdgeInsets.all(4),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('Correo electrónico',
                          style: pw.TextStyle(fontSize: 10)),
                      pw.Text(email, style: pw.TextStyle(fontSize: 9)),
                    ],
                  ),
                ),
                // Teléfono
                pw.Padding(
                  padding: pw.EdgeInsets.all(4),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('WhatsApp', style: pw.TextStyle(fontSize: 10)),
                      pw.Text(telefono, style: pw.TextStyle(fontSize: 9)),
                    ],
                  ),
                ),
                // Otro teléfono
                pw.Padding(
                  padding: pw.EdgeInsets.all(4),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('Otro teléfono',
                          style: pw.TextStyle(fontSize: 10)),
                      pw.Text('', style: pw.TextStyle(fontSize: 9)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),

        pw.SizedBox(height: 16),

        // Texto de condiciones y términos
        pw.Text(
          'Dicho producto será usado para propósitos de ahorro y/o inversión de mis recursos. Acepto que he leído los términos y condiciones, así como el contenido de reglamento(s) del producto que establece el producto aperturado en ALIANZA CAPITAL y que lo ha puesto a disposición de la página web http://www.alianzacapital.co, así mismo manifiesto que:',
          style: pw.TextStyle(fontSize: 9),
        ),

        pw.SizedBox(height: 8),

        // Lista numerada de condiciones
        pw.Padding(
          padding: pw.EdgeInsets.only(left: 5),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Punto 1
              pw.Text(
                '1. He leído y declaro conocer el reglamento (s) que establecen condiciones, las características y que rigen la Línea de Ahorro y lo acepto en su integridad de manera libre y espontánea.',
                style: pw.TextStyle(fontSize: 9),
              ),

              pw.SizedBox(height: 4),

              // Punto 2
              pw.Text(
                '2. Conozco que, en caso de tener dudas al respecto del producto, puedo ingresar a http://www.alianzacapital.co para obtener más información o puedo contactarme vía WhatsApp al 315 779 2999 o al correo info@alianzacapital.co',
                style: pw.TextStyle(fontSize: 9),
              ),

              pw.SizedBox(height: 4),

              // Punto 3
              pw.Text(
                '3. El siguiente documento contiene firma electrónica según Ley 527 de 1999, Ley de Comercio Electrónico, que regula el comercio electrónico y sienta las bases para la existencia y exigibilidad de las mas firmas digitales. Decreto 2364 de 2012, que diferencia entre firma electrónica y firma digital como tipo específico de firma electrónica.',
                style: pw.TextStyle(fontSize: 9),
              ),
            ],
          ),
        ),

        pw.SizedBox(height: 12),

        // Texto final
        pw.Text(
          'De acuerdo con lo anterior, atentamente.',
          style: pw.TextStyle(fontSize: 9),
        ),

        pw.SizedBox(height: 40),

        // Recuadro para la firma
        pw.Container(
          decoration: pw.BoxDecoration(
            border: pw.Border.all(
              color: PdfColors.grey,
              width: 0.5,
              style: pw.BorderStyle.dashed,
            ),
          ),
          height: 70,
          width: 400,
          alignment: pw.Alignment.center,
          child: pw.Text(
            'Espacio para firma electrónica',
            style: pw.TextStyle(color: PdfColors.grey, fontSize: 10),
          ),
        ),

        pw.SizedBox(height: 20),

        // Bloque de firma
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.end,
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            // Columna izquierda: Información del firmante
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  nombres.toUpperCase(),
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold, fontSize: 10),
                ),
                pw.Text(
                  'CC $numeroDocumento',
                  style: pw.TextStyle(fontSize: 9),
                ),
                pw.Text(
                  'FIRMA ELECTRÓNICA',
                  style: pw.TextStyle(fontSize: 9),
                ),
              ],
            ),

            // Columna derecha: Logo ALIANZA CAPITAL
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Text(
                  'ALIANZA CAPITAL',
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold, fontSize: 10),
                ),
                pw.Text(
                  'Dpto. Financiero',
                  style: pw.TextStyle(fontSize: 9),
                ),
              ],
            ),

            // Columna extrema derecha: Sello de certificación
            pw.Container(
              width: 40,
              height: 40,
              decoration: pw.BoxDecoration(
                shape: pw.BoxShape.circle,
                border: pw.Border.all(color: PdfColors.black),
              ),
              child: pw.Center(
                child: pw.Text(
                  'OK',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                ),
              ),
            ),
          ],
        ),

        pw.SizedBox(height: 8),

        // Pie de página con texto legal
        pw.Container(
          padding: pw.EdgeInsets.only(top: 5),
          child: pw.Text(
            'La anterior firma electrónica certifica que cada titular de la cuenta virtual es de Nueva Alianza y es responsable de las acciones de descarga efectuadas en su cuenta. Este archivo no es documento escrito y por ende, al constituir información electrónica, se rige por la ley 527 de 1999, por medio de la cual se define y reglamenta el acceso y uso de los mensajes de datos y de las firmas electrónicas.',
            style: pw.TextStyle(fontSize: 7, color: PdfColors.grey700),
            textAlign: pw.TextAlign.justify,
          ),
        ),

        // Pie de página con supervisión
        pw.Container(
          child: pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.end,
            children: [
              pw.Text(
                'VIGILADO ',
                style: pw.TextStyle(fontSize: 7),
              ),
              pw.Text(
                'SUPERINTENDENCIA DE LA ECONOMÍA SOLIDARIA',
                style: pw.TextStyle(fontSize: 6),
              ),
              pw.SizedBox(width: 5),
              pw.Text(
                '1 de 2',
                style: pw.TextStyle(fontSize: 7),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  // Guardar el documento PDF y convertir a Uint8List
  final List<int> rawBytes = await pdf.save();
  final Uint8List pdfBytes = Uint8List.fromList(rawBytes);

// Retornar el archivo para ser usado en FlutterFlow
  return FFUploadedFile(
    name:
        'alianza_apertura_nomina_${DateTime.now().millisecondsSinceEpoch}.pdf',
    bytes: pdfBytes,
  );
}
