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

import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<FFUploadedFile> generateCDATSinglePage(
  String nombres,
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
  String deposito,
  String ea,
  String meses,
  String fechaInicio,
  String fechaFinal,
  String rendimiento,
  String retenciones,
  String ganancias,
  String totalRecibir,
  String anticipo1,
  String anticipo2CapInicial,
  String anticipo3,
  String anticipo4,
  String tipooperacion,
  String valoroperacion,
  String origenrecursos,
  String docemeses,
  String observaciones,
) async {
  final pdf = pw.Document();

  // Obtener fecha actual
  final now = DateTime.now();
  final currentDate = '${now.day}/${now.month}/${now.year}';

  // Variables para firma (adaptadas de las existentes)
  final nombreFirma = nombres; // Usamos el nombre del asociado
  final cedulaFirma = numeroDocumento; // Usamos el número de documento

  // Cargar imágenes de logos desde Firebase
  final logoUrl =
      'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/Alianza%20Pdf%20logo.png?alt=media&token=69805315-febc-43ef-9716-181c14efba26';
  final response = await http.get(Uri.parse(logoUrl));
  final logoImage = pw.MemoryImage(response.bodyBytes);

  final logoBWUrl =
      'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/Alianza%20pdf%20logo%20design.png?alt=media&token=52460c6f-9061-42c0-8681-aa5dc3db4c7a';
  final responseBW = await http.get(Uri.parse(logoBWUrl));
  final logoBWImage = pw.MemoryImage(responseBW.bodyBytes);

  // Cargar imágenes con manejo de errores
  Uint8List selloVerificadoBytes = Uint8List(0);
  Uint8List imagenVigiladoBytes = Uint8List(0);

  try {
    // Cargar imagen del sello
    final selloUrl =
        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/98bwu2s3373e/64af4586-f309-4ab3-aa9d-db083b675bda.jpg';
    final selloResponse = await http.get(Uri.parse(selloUrl));
    if (selloResponse.statusCode == 200) {
      selloVerificadoBytes = selloResponse.bodyBytes;
    }

    // Cargar imagen rectangular para el footer (imagen vigilado)
    final footerImageUrl =
        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/70tcb6sabncz/d0b34d06-f023-4b51-a1fa-249512acd7ff.jpg';
    final footerImageResponse = await http.get(Uri.parse(footerImageUrl));
    if (footerImageResponse.statusCode == 200) {
      imagenVigiladoBytes = footerImageResponse.bodyBytes;
    }
  } catch (e) {
    print('Error cargando imágenes del footer: $e');
  }

  // PRIMERA PÁGINA
  pdf.addPage(
    pw.MultiPage(
      margin: pw.EdgeInsets.only(
        left: 40,
        top: 20,
        right: 40,
        bottom: 40, // Reducido para que el footer esté más pegado abajod
      ),
      footer: (pw.Context context) {
        return pw.Column(
          children: [
            // Espacio para firma electrónica
            pw.Container(
              width: double.infinity,
              height: 80,
              decoration: pw.BoxDecoration(
                border: pw.Border.all(
                    color: PdfColors.grey400,
                    width: 1,
                    style: pw.BorderStyle.dashed),
              ),
              child: pw.Center(
                child: pw.Align(
                  alignment: pw.Alignment.bottomCenter,
                  child: pw.Padding(
                    padding: pw.EdgeInsets.only(bottom: 5),
                    child: pw.Text(
                      'Espacio para firma electrónica',
                      style:
                          pw.TextStyle(fontSize: 8, color: PdfColors.grey600),
                    ),
                  ),
                ),
              ),
            ),
            pw.SizedBox(height: 20),

            // Footer con firma y sello
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                // Datos del firmante a la izquierda
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(nombreFirma,
                        style: pw.TextStyle(
                            fontSize: 10, fontWeight: pw.FontWeight.bold)),
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
                                fontSize: 10, fontWeight: pw.FontWeight.bold)),
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
        );
      },
      build: (pw.Context context) => [
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Header con logo, título y logo naranja
            pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                // Logo grande izquierda
                pw.Image(logoImage, width: 150, height: 80),

                pw.SizedBox(width: 20),

                // Separador vertical naranja
                pw.Container(
                  width: 3,
                  height: 60,
                  color: PdfColors.orange,
                ),

                pw.SizedBox(width: 15),

                // Título con saltos de línea - SOLO 3 LÍNEAS con ancho ampliado
                pw.Container(
                  width: 180, // Ampliado de 150 a 180 para evitar cortes
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.SizedBox(height: 10),
                      pw.Text(
                        'APERTURA DE CONTRATO\nDE AHORRO A TÉRMINO\nCDAT',
                        style: pw.TextStyle(
                            fontSize: 12, fontWeight: pw.FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                pw.Spacer(), // Esto empuja el logo naranja a la derecha

                // Logo naranja arriba a la derecha - COMPLETAMENTE PEGADO ARRIBA
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.end,
                  children: [
                    pw.Container(
                      margin: pw.EdgeInsets.only(
                          top: -20), // Completamente pegado arriba
                      child: pw.Image(logoBWImage, height: 55),
                    ),
                    pw.SizedBox(height: 25), // Espacio mayor para compensar
                    pw.Text(
                      currentDate,
                      style: pw.TextStyle(
                          fontSize: 12, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Fecha apertura',
                      style: pw.TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),

            pw.SizedBox(height: 15),

            // INFORMACIÓN DEL ASOCIADO
            pw.Container(
              width: double.infinity,
              color: PdfColor(0.0, 0.0, 0.8),
              padding: pw.EdgeInsets.symmetric(vertical: 4),
              child: pw.Text(
                '  INFORMACIÓN DEL ASOCIADO',
                style: pw.TextStyle(
                  fontSize: 10,
                  color: PdfColors.white,
                ),
              ),
            ),
            pw.SizedBox(height: 8),

            // Nombres y Apellidos
            pw.Container(
              width: double.infinity,
              height: 25,
              padding: pw.EdgeInsets.all(4),
              decoration: pw.BoxDecoration(
                border: pw.Border.all(color: PdfColors.white, width: 0.5),
                color: PdfColors.grey200,
              ),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    'Nombres y Apellidos',
                    style: pw.TextStyle(fontSize: 5),
                  ),
                  pw.Text(
                    '$nombres',
                    style: pw.TextStyle(fontSize: 9),
                  ),
                ],
              ),
            ),

            pw.SizedBox(height: 2),

            // Documentos
            pw.Row(
              children: [
                pw.Expanded(
                  flex: 20,
                  child: pw.Container(
                    height: 25,
                    padding: pw.EdgeInsets.all(3),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.white, width: 0.5),
                      color: PdfColors.grey200,
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Tipo de documento',
                            style: pw.TextStyle(fontSize: 5)),
                        pw.Text(tipoDocumento,
                            style: pw.TextStyle(fontSize: 8)),
                      ],
                    ),
                  ),
                ),
                pw.Expanded(
                  flex: 20,
                  child: pw.Container(
                    height: 25,
                    padding: pw.EdgeInsets.all(3),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.white, width: 0.5),
                      color: PdfColors.grey200,
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Número de documento',
                            style: pw.TextStyle(fontSize: 5)),
                        pw.Text(numeroDocumento,
                            style: pw.TextStyle(fontSize: 8)),
                      ],
                    ),
                  ),
                ),
                pw.Expanded(
                  flex: 20,
                  child: pw.Container(
                    height: 25,
                    padding: pw.EdgeInsets.all(3),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.white, width: 0.5),
                      color: PdfColors.grey200,
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Fecha de expedición',
                            style: pw.TextStyle(fontSize: 5)),
                        pw.Text(fechaExpedicion,
                            style: pw.TextStyle(fontSize: 8)),
                      ],
                    ),
                  ),
                ),
                pw.Expanded(
                  flex: 40,
                  child: pw.Container(
                    height: 25,
                    padding: pw.EdgeInsets.all(3),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.white, width: 0.5),
                      color: PdfColors.grey200,
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Ciudad y departamento de expedición',
                            style: pw.TextStyle(fontSize: 5)),
                        pw.Text(ciudadExpedicion,
                            style: pw.TextStyle(fontSize: 8)),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            pw.SizedBox(height: 2),

            // Dirección
            pw.Container(
              width: double.infinity,
              height: 25,
              padding: pw.EdgeInsets.all(3),
              decoration: pw.BoxDecoration(
                border: pw.Border.all(color: PdfColors.white, width: 0.5),
                color: PdfColors.grey200,
              ),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('Dirección de residencia',
                      style: pw.TextStyle(fontSize: 5)),
                  pw.Text(direccionResidencia,
                      style: pw.TextStyle(fontSize: 8)),
                ],
              ),
            ),

            pw.SizedBox(height: 2),

            // Ciudad y Barrio
            pw.Row(
              children: [
                pw.Expanded(
                  flex: 75,
                  child: pw.Container(
                    height: 25,
                    padding: pw.EdgeInsets.all(3),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.white, width: 0.5),
                      color: PdfColors.grey200,
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Ciudad y departamento de residencia',
                            style: pw.TextStyle(fontSize: 5)),
                        pw.Text(ciudadResidencia,
                            style: pw.TextStyle(fontSize: 8)),
                      ],
                    ),
                  ),
                ),
                pw.Expanded(
                  flex: 25,
                  child: pw.Container(
                    height: 25,
                    padding: pw.EdgeInsets.all(3),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.white, width: 0.5),
                      color: PdfColors.grey200,
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Barrio', style: pw.TextStyle(fontSize: 5)),
                        pw.Text(barrio, style: pw.TextStyle(fontSize: 8)),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            pw.SizedBox(height: 10),

            // DATOS DE CONTACTO
            pw.Container(
              width: double.infinity,
              color: PdfColor(0.0, 0.0, 0.8),
              padding: pw.EdgeInsets.symmetric(vertical: 4),
              child: pw.Text(
                '  DATOS DE CONTACTO Y FIRMA ELECTRÓNICA',
                style: pw.TextStyle(
                  fontSize: 10,
                  color: PdfColors.white,
                ),
              ),
            ),
            pw.SizedBox(height: 8),

            pw.Row(
              children: [
                pw.Expanded(
                  flex: 60,
                  child: pw.Container(
                    height: 25,
                    padding: pw.EdgeInsets.all(3),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.white, width: 0.5),
                      color: PdfColors.grey200,
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Correo electrónico',
                            style: pw.TextStyle(fontSize: 5)),
                        pw.Text(correoElectronico,
                            style: pw.TextStyle(fontSize: 8)),
                      ],
                    ),
                  ),
                ),
                pw.Expanded(
                  flex: 20,
                  child: pw.Container(
                    height: 25,
                    padding: pw.EdgeInsets.all(3),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.white, width: 0.5),
                      color: PdfColors.grey200,
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('WhatsApp', style: pw.TextStyle(fontSize: 5)),
                        pw.Text(whatsapp, style: pw.TextStyle(fontSize: 8)),
                      ],
                    ),
                  ),
                ),
                pw.Expanded(
                  flex: 20,
                  child: pw.Container(
                    height: 25,
                    padding: pw.EdgeInsets.all(3),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.white, width: 0.5),
                      color: PdfColors.grey200,
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Otro teléfono',
                            style: pw.TextStyle(fontSize: 5)),
                        pw.Text(otroTelefono, style: pw.TextStyle(fontSize: 8)),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            pw.SizedBox(height: 10),

            // INVERSIÓN FINANCIERA
            pw.Container(
              width: double.infinity,
              color: PdfColor(0.0, 0.0, 0.8),
              padding: pw.EdgeInsets.symmetric(vertical: 4),
              child: pw.Text(
                '  INVERSIÓN FINANCIERA',
                style: pw.TextStyle(
                  fontSize: 10,
                  color: PdfColors.white,
                ),
              ),
            ),
            pw.SizedBox(height: 8),

            // Una sola fila con todos los campos
            pw.Row(
              children: [
                // Depósito (30%)
                pw.Expanded(
                  flex: 30,
                  child: pw.Container(
                    height: 25,
                    padding: pw.EdgeInsets.all(3),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.white, width: 0.5),
                      color: PdfColors.grey200,
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Depósito', style: pw.TextStyle(fontSize: 5)),
                        pw.Text('$deposito', style: pw.TextStyle(fontSize: 9)),
                      ],
                    ),
                  ),
                ),
                // E.A (8%)
                pw.Expanded(
                  flex: 8,
                  child: pw.Container(
                    height: 25,
                    padding: pw.EdgeInsets.all(2),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.white, width: 0.5),
                      color: PdfColors.grey200,
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('E.A', style: pw.TextStyle(fontSize: 5)),
                        pw.Text(ea, style: pw.TextStyle(fontSize: 7)),
                      ],
                    ),
                  ),
                ),
                // Meses (8%)
                pw.Expanded(
                  flex: 8,
                  child: pw.Container(
                    height: 25,
                    padding: pw.EdgeInsets.all(2),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.white, width: 0.5),
                      color: PdfColors.grey200,
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Meses', style: pw.TextStyle(fontSize: 5)),
                        pw.Text(meses, style: pw.TextStyle(fontSize: 7)),
                      ],
                    ),
                  ),
                ),
                // Moneda (8%)
                pw.Expanded(
                  flex: 8,
                  child: pw.Container(
                    height: 25,
                    padding: pw.EdgeInsets.all(2),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.white, width: 0.5),
                      color: PdfColors.grey200,
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Moneda', style: pw.TextStyle(fontSize: 5)),
                        pw.Text('COP', style: pw.TextStyle(fontSize: 7)),
                      ],
                    ),
                  ),
                ),
                // Fecha de inicio (19%)
                pw.Expanded(
                  flex: 19,
                  child: pw.Container(
                    height: 25,
                    padding: pw.EdgeInsets.all(2),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.white, width: 0.5),
                      color: PdfColors.grey200,
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Fecha de inicio',
                            style: pw.TextStyle(fontSize: 5)),
                        pw.Text(fechaInicio, style: pw.TextStyle(fontSize: 7)),
                      ],
                    ),
                  ),
                ),
                // Fecha final (19%)
                pw.Expanded(
                  flex: 19,
                  child: pw.Container(
                    height: 25,
                    padding: pw.EdgeInsets.all(2),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.white, width: 0.5),
                      color: PdfColors.grey200,
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Fecha final',
                            style: pw.TextStyle(fontSize: 5)),
                        pw.Text(fechaFinal, style: pw.TextStyle(fontSize: 7)),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            pw.SizedBox(height: 8),

            // Descripción de inversión
            pw.Text(
              'Descripción de inversión',
              style: pw.TextStyle(fontSize: 9),
            ),
            pw.SizedBox(height: 4),

            // Cálculos
            pw.Row(
              children: [
                pw.Expanded(
                  flex: 2,
                  child: pw.Container(
                    height: 25,
                    padding: pw.EdgeInsets.all(3),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.white, width: 0.5),
                      color: PdfColors.grey200,
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Rendimiento',
                            style: pw.TextStyle(fontSize: 5)),
                        pw.Text('$rendimiento',
                            style: pw.TextStyle(fontSize: 8)),
                      ],
                    ),
                  ),
                ),
                pw.Expanded(
                  flex: 2,
                  child: pw.Container(
                    height: 25,
                    padding: pw.EdgeInsets.all(3),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.white, width: 0.5),
                      color: PdfColors.grey200,
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Retefuente', style: pw.TextStyle(fontSize: 5)),
                        pw.Text('$retenciones',
                            style: pw.TextStyle(fontSize: 8)),
                      ],
                    ),
                  ),
                ),
                pw.Container(
                  width: 25,
                  height: 25,
                  child: pw.Center(
                    child: pw.Text('=',
                        style: pw.TextStyle(
                            fontSize: 14, fontWeight: pw.FontWeight.bold)),
                  ),
                ),
                pw.Expanded(
                  flex: 1,
                  child: pw.Container(
                    height: 25,
                    padding: pw.EdgeInsets.all(2),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.white, width: 0.5),
                      color: PdfColors.grey200,
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Ganancias', style: pw.TextStyle(fontSize: 5)),
                        pw.Text('$ganancias', style: pw.TextStyle(fontSize: 7)),
                      ],
                    ),
                  ),
                ),
                pw.Expanded(
                  flex: 1,
                  child: pw.Container(
                    height: 25,
                    padding: pw.EdgeInsets.all(2),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.white, width: 0.5),
                      color: PdfColors.grey200,
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Total a recibir',
                            style: pw.TextStyle(fontSize: 5)),
                        pw.Text('$totalRecibir',
                            style: pw.TextStyle(fontSize: 7)),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            pw.SizedBox(height: 8),

            // Nota anticipos
            pw.Text(
              'La disponibilidad de anticipos de ganancias será efectiva para retiro, cada 3 meses, desde la apertura.',
              style: pw.TextStyle(fontSize: 8),
            ),
            pw.SizedBox(height: 6),

            // Anticipos
            (docemeses == "6" || int.tryParse(docemeses) == 6)
                ? pw.Row(
                    children: [
                      pw.Expanded(
                        flex: 1,
                        child: pw.Container(
                          height: 25,
                          padding: pw.EdgeInsets.all(3),
                          decoration: pw.BoxDecoration(
                            border: pw.Border.all(
                                color: PdfColors.white, width: 0.5),
                            color: PdfColors.grey200,
                          ),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text('Anticipo 1',
                                  style: pw.TextStyle(fontSize: 5)),
                              pw.Text('$anticipo1',
                                  style: pw.TextStyle(fontSize: 8)),
                            ],
                          ),
                        ),
                      ),
                      pw.Expanded(
                        flex: 1,
                        child: pw.Container(
                          height: 25,
                          padding: pw.EdgeInsets.all(3),
                          decoration: pw.BoxDecoration(
                            border: pw.Border.all(
                                color: PdfColors.white, width: 0.5),
                            color: PdfColors.grey200,
                          ),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text('Anticipo 2 + Cap. Inicial',
                                  style: pw.TextStyle(fontSize: 5)),
                              pw.Text('$anticipo2CapInicial',
                                  style: pw.TextStyle(fontSize: 8)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : pw.Row(
                    children: [
                      pw.Expanded(
                        flex: 1,
                        child: pw.Container(
                          height: 25,
                          padding: pw.EdgeInsets.all(3),
                          decoration: pw.BoxDecoration(
                            border: pw.Border.all(
                                color: PdfColors.white, width: 0.5),
                            color: PdfColors.grey200,
                          ),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text('Anticipo 1',
                                  style: pw.TextStyle(fontSize: 5)),
                              pw.Text('$anticipo1',
                                  style: pw.TextStyle(fontSize: 8)),
                            ],
                          ),
                        ),
                      ),
                      pw.Expanded(
                        flex: 1,
                        child: pw.Container(
                          height: 25,
                          padding: pw.EdgeInsets.all(3),
                          decoration: pw.BoxDecoration(
                            border: pw.Border.all(
                                color: PdfColors.white, width: 0.5),
                            color: PdfColors.grey200,
                          ),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text('Anticipo 2',
                                  style: pw.TextStyle(fontSize: 5)),
                              pw.Text('$anticipo2CapInicial',
                                  style: pw.TextStyle(fontSize: 8)),
                            ],
                          ),
                        ),
                      ),
                      pw.Expanded(
                        flex: 1,
                        child: pw.Container(
                          height: 25,
                          padding: pw.EdgeInsets.all(3),
                          decoration: pw.BoxDecoration(
                            border: pw.Border.all(
                                color: PdfColors.white, width: 0.5),
                            color: PdfColors.grey200,
                          ),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text('Anticipo 3',
                                  style: pw.TextStyle(fontSize: 5)),
                              pw.Text('$anticipo3',
                                  style: pw.TextStyle(fontSize: 8)),
                            ],
                          ),
                        ),
                      ),
                      pw.Expanded(
                        flex: 1,
                        child: pw.Container(
                          height: 25,
                          padding: pw.EdgeInsets.all(3),
                          decoration: pw.BoxDecoration(
                            border: pw.Border.all(
                                color: PdfColors.white, width: 0.5),
                            color: PdfColors.grey200,
                          ),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text('Anticipo 4 + Cap. Inicial',
                                  style: pw.TextStyle(fontSize: 5)),
                              pw.Text('$anticipo4',
                                  style: pw.TextStyle(fontSize: 8)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

            pw.SizedBox(height: 8),

            // DECLARACIÓN Y ACEPTACIÓN
            pw.Container(
              width: double.infinity,
              color: PdfColor(0.0, 0.0, 0.8),
              padding: pw.EdgeInsets.symmetric(vertical: 4),
              child: pw.Text(
                '  DECLARACIÓN Y ACEPTACIÓN',
                style: pw.TextStyle(
                  fontSize: 10,
                  color: PdfColors.white,
                ),
              ),
            ),
            pw.SizedBox(height: 6),

            // Texto declaración separado en párrafos
            pw.Text(
              'Solicito la apertura de LÍNEA DE AHORRO CDAT, la cual será usada para propósitos de ahorro y/o inversión de mis recursos.',
              style: pw.TextStyle(fontSize: 7),
            ),
            pw.SizedBox(height: 4),
            pw.Text(
              'Acepto que he leído los términos y condiciones, así como el contenido de reglamento (s) del producto que establece la LÍNEA DE AHORRO CDAT aperturada en Alianza Solidaria de Ahorro y Crédito y que lo ha puesto a disposición de la página web www.alianzacapital.co, así mismo manifiesto que:',
              style: pw.TextStyle(fontSize: 7),
            ),
            pw.SizedBox(height: 4),
            pw.Text(
              '1. He leído y declaro conocer el reglamento (s) que establece las condiciones, las características y que rigen la LÍNEA DE AHORRO CDAT y lo acepto en su integridad de manera libre y espontánea.',
              style: pw.TextStyle(fontSize: 7),
            ),
            pw.SizedBox(height: 4),
            pw.Text(
              '2. Conozco que, en caso de tener dudas al respecto del producto, puedo ingresar a www.alianzacapital.co para obtener más información o puedo contactarme al WhatsApp al 315 779 2999 o al correo info@alianzacapital.co',
              style: pw.TextStyle(fontSize: 7),
            ),
            pw.SizedBox(height: 4),
            pw.Text(
              'De acuerdo con lo anterior, atentamente.',
              style: pw.TextStyle(fontSize: 7),
            ),
          ],
        ),
      ],
    ),
  );

  // SEGUNDA PÁGINA (con footer para "Aprobado Oficial de Cumplimiento")
  pdf.addPage(
    pw.MultiPage(
      margin: pw.EdgeInsets.only(
        left: 40,
        top: 20,
        right: 40,
        bottom: 40, // Reducido para que el footer esté más pegado abajo
      ),
      footer: (pw.Context context) {
        return pw.Column(
          children: [
            // Espacio para firma electrónica
            pw.Container(
              width: double.infinity,
              height: 80,
              decoration: pw.BoxDecoration(
                border: pw.Border.all(
                    color: PdfColors.grey400,
                    width: 1,
                    style: pw.BorderStyle.dashed),
              ),
              child: pw.Center(
                child: pw.Align(
                  alignment: pw.Alignment.bottomCenter,
                  child: pw.Padding(
                    padding: pw.EdgeInsets.only(bottom: 5),
                    child: pw.Text(
                      'Espacio para firma electrónica',
                      style:
                          pw.TextStyle(fontSize: 8, color: PdfColors.grey600),
                    ),
                  ),
                ),
              ),
            ),
            pw.SizedBox(height: 20),

            // Footer con firma y sello - PÁGINA 2 (Oficial de Cumplimiento)
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                // Datos del firmante a la izquierda
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(nombreFirma,
                        style: pw.TextStyle(
                            fontSize: 10, fontWeight: pw.FontWeight.bold)),
                    pw.Text('CC: $cedulaFirma',
                        style: pw.TextStyle(fontSize: 8)),
                    pw.Text('FIRMA ELECTRÓNICA',
                        style: pw.TextStyle(fontSize: 8)),
                  ],
                ),

                // Datos de Oficial de Cumplimiento y sello a la derecha
                pw.Row(
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: [
                        pw.Text('Aprobado Oficial de Cumplimiento',
                            style: pw.TextStyle(
                                fontSize: 10, fontWeight: pw.FontWeight.bold)),
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
        );
      },
      build: (pw.Context context) => [
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Header con logo, título y logo naranja
            pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                // Logo grande izquierda
                pw.Image(logoImage, width: 150, height: 80),

                pw.SizedBox(width: 20),

                // Separador vertical naranja
                pw.Container(
                  width: 3,
                  height: 60,
                  color: PdfColors.orange,
                ),

                pw.SizedBox(width: 15),

                // Título con saltos de línea - SOLO 3 LÍNEAS con ancho ampliado
                pw.Container(
                  width: 250, // Ampliado de 150 a 180 para evitar cortes
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.SizedBox(height: 10),
                      pw.Text(
                        'DECLARACION JURAMENTADA\nDEL ORIGEN DE LOS RECURSOS',
                        style: pw.TextStyle(
                            fontSize: 12, fontWeight: pw.FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                pw.Spacer(), // Esto empuja el logo naranja a la derecha

                // Logo naranja arriba a la derecha - COMPLETAMENTE PEGADO ARRIBA
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.end,
                  children: [
                    pw.Container(
                      margin: pw.EdgeInsets.only(
                          top: -20), // Completamente pegado arriba
                      child: pw.Image(logoBWImage, height: 55),
                    ),
                    pw.SizedBox(height: 25), // Espacio mayor para compensar
                    pw.Text(
                      currentDate,
                      style: pw.TextStyle(
                          fontSize: 12, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Fecha apertura',
                      style: pw.TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),

            pw.SizedBox(height: 15),

            // INFORMACIÓN DEL ASOCIADO
            pw.Container(
              width: double.infinity,
              color: PdfColor(0.0, 0.0, 0.8),
              padding: pw.EdgeInsets.symmetric(vertical: 4),
              child: pw.Text(
                '  INFORMACIÓN DEL ASOCIADO',
                style: pw.TextStyle(
                  fontSize: 10,
                  color: PdfColors.white,
                ),
              ),
            ),
            pw.SizedBox(height: 8),

            // Nombres y Apellidos
            pw.Container(
              width: double.infinity,
              height: 25,
              padding: pw.EdgeInsets.all(4),
              decoration: pw.BoxDecoration(
                border: pw.Border.all(color: PdfColors.white, width: 0.5),
                color: PdfColors.grey200,
              ),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    'Nombres y Apellidos',
                    style: pw.TextStyle(fontSize: 5),
                  ),
                  pw.Text(
                    '$nombres',
                    style: pw.TextStyle(fontSize: 9),
                  ),
                ],
              ),
            ),

            pw.SizedBox(height: 2),

            // Documentos
            pw.Row(
              children: [
                pw.Expanded(
                  flex: 20,
                  child: pw.Container(
                    height: 25,
                    padding: pw.EdgeInsets.all(3),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.white, width: 0.5),
                      color: PdfColors.grey200,
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Tipo de documento',
                            style: pw.TextStyle(fontSize: 5)),
                        pw.Text(tipoDocumento,
                            style: pw.TextStyle(fontSize: 8)),
                      ],
                    ),
                  ),
                ),
                pw.Expanded(
                  flex: 20,
                  child: pw.Container(
                    height: 25,
                    padding: pw.EdgeInsets.all(3),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.white, width: 0.5),
                      color: PdfColors.grey200,
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Número de documento',
                            style: pw.TextStyle(fontSize: 5)),
                        pw.Text(numeroDocumento,
                            style: pw.TextStyle(fontSize: 8)),
                      ],
                    ),
                  ),
                ),
                pw.Expanded(
                  flex: 20,
                  child: pw.Container(
                    height: 25,
                    padding: pw.EdgeInsets.all(3),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.white, width: 0.5),
                      color: PdfColors.grey200,
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Fecha de expedición',
                            style: pw.TextStyle(fontSize: 5)),
                        pw.Text(fechaExpedicion,
                            style: pw.TextStyle(fontSize: 8)),
                      ],
                    ),
                  ),
                ),
                pw.Expanded(
                  flex: 40,
                  child: pw.Container(
                    height: 25,
                    padding: pw.EdgeInsets.all(3),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.white, width: 0.5),
                      color: PdfColors.grey200,
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Ciudad y departamento de expedición',
                            style: pw.TextStyle(fontSize: 5)),
                        pw.Text(ciudadExpedicion,
                            style: pw.TextStyle(fontSize: 8)),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            pw.SizedBox(height: 2),

            // Dirección
            pw.Container(
              width: double.infinity,
              height: 25,
              padding: pw.EdgeInsets.all(3),
              decoration: pw.BoxDecoration(
                border: pw.Border.all(color: PdfColors.white, width: 0.5),
                color: PdfColors.grey200,
              ),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('Dirección de residencia',
                      style: pw.TextStyle(fontSize: 5)),
                  pw.Text(direccionResidencia,
                      style: pw.TextStyle(fontSize: 8)),
                ],
              ),
            ),

            pw.SizedBox(height: 2),

            // Ciudad y Barrio
            pw.Row(
              children: [
                pw.Expanded(
                  flex: 75,
                  child: pw.Container(
                    height: 25,
                    padding: pw.EdgeInsets.all(3),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.white, width: 0.5),
                      color: PdfColors.grey200,
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Ciudad y departamento de residencia',
                            style: pw.TextStyle(fontSize: 5)),
                        pw.Text(ciudadResidencia,
                            style: pw.TextStyle(fontSize: 8)),
                      ],
                    ),
                  ),
                ),
                pw.Expanded(
                  flex: 25,
                  child: pw.Container(
                    height: 25,
                    padding: pw.EdgeInsets.all(3),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.white, width: 0.5),
                      color: PdfColors.grey200,
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Barrio', style: pw.TextStyle(fontSize: 5)),
                        pw.Text(barrio, style: pw.TextStyle(fontSize: 8)),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            pw.SizedBox(height: 10),

            // DATOS DE CONTACTO
            pw.Container(
              width: double.infinity,
              color: PdfColor(0.0, 0.0, 0.8),
              padding: pw.EdgeInsets.symmetric(vertical: 4),
              child: pw.Text(
                '  DATOS DE CONTACTO Y FIRMA ELECTRÓNICA',
                style: pw.TextStyle(
                  fontSize: 10,
                  color: PdfColors.white,
                ),
              ),
            ),
            pw.SizedBox(height: 8),

            pw.Row(
              children: [
                pw.Expanded(
                  flex: 60,
                  child: pw.Container(
                    height: 25,
                    padding: pw.EdgeInsets.all(3),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.white, width: 0.5),
                      color: PdfColors.grey200,
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Correo electrónico',
                            style: pw.TextStyle(fontSize: 5)),
                        pw.Text(correoElectronico,
                            style: pw.TextStyle(fontSize: 8)),
                      ],
                    ),
                  ),
                ),
                pw.Expanded(
                  flex: 20,
                  child: pw.Container(
                    height: 25,
                    padding: pw.EdgeInsets.all(3),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.white, width: 0.5),
                      color: PdfColors.grey200,
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('WhatsApp', style: pw.TextStyle(fontSize: 5)),
                        pw.Text(whatsapp, style: pw.TextStyle(fontSize: 8)),
                      ],
                    ),
                  ),
                ),
                pw.Expanded(
                  flex: 20,
                  child: pw.Container(
                    height: 25,
                    padding: pw.EdgeInsets.all(3),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.white, width: 0.5),
                      color: PdfColors.grey200,
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Otro teléfono',
                            style: pw.TextStyle(fontSize: 5)),
                        pw.Text(otroTelefono, style: pw.TextStyle(fontSize: 8)),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            pw.SizedBox(height: 10),

            // DESCRIPCIÓN DE MOVIMIENTO
            pw.Container(
              width: double.infinity,
              color: PdfColor(0.0, 0.0, 0.8),
              padding: pw.EdgeInsets.symmetric(vertical: 4),
              child: pw.Text(
                '  DESCRIPCIÓN DE MOVIMIENTO',
                style: pw.TextStyle(
                  fontSize: 10,
                  color: PdfColors.white,
                ),
              ),
            ),
            pw.SizedBox(height: 8),

            // Primera fila: Tipo de operación y Valor de la operación
            pw.Row(
              children: [
                pw.Expanded(
                  flex: 1,
                  child: pw.Container(
                    height: 25,
                    padding: pw.EdgeInsets.all(3),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.white, width: 0.5),
                      color: PdfColors.grey200,
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Tipo de operación',
                            style: pw.TextStyle(fontSize: 5)),
                        pw.Text('$tipooperacion',
                            style: pw.TextStyle(fontSize: 8)),
                      ],
                    ),
                  ),
                ),
                pw.Expanded(
                  flex: 1,
                  child: pw.Container(
                    height: 25,
                    padding: pw.EdgeInsets.all(3),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.white, width: 0.5),
                      color: PdfColors.grey200,
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Valor de la operación',
                            style: pw.TextStyle(fontSize: 5)),
                        pw.Text('$valoroperacion',
                            style: pw.TextStyle(fontSize: 8)),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            pw.SizedBox(height: 2),

            // Segunda fila: Origen de los recursos
            pw.Container(
              width: double.infinity,
              height: 25,
              padding: pw.EdgeInsets.all(3),
              decoration: pw.BoxDecoration(
                border: pw.Border.all(color: PdfColors.white, width: 0.5),
                color: PdfColors.grey200,
              ),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('Origen de los recursos',
                      style: pw.TextStyle(fontSize: 5)),
                  pw.Text('$origenrecursos', style: pw.TextStyle(fontSize: 8)),
                ],
              ),
            ),

            pw.SizedBox(height: 10),

            // Texto declarativo
            pw.Text(
              'Indico que todas las declaraciones contenidas en este documento las rindo bajo la gravedad del juramento y con conocimiento de las implicaciones legales que esto conlleva, así mismo declaro que el origen de los recursos, no provienen de ninguna actividad ilícita de las contempladas en el código penal colombiano o en cualquier norma que lo modifique o adicione.',
              style: pw.TextStyle(fontSize: 7),
            ),

            pw.SizedBox(height: 15),

            // Observaciones de la entidad financiera
            pw.Text(
              'Observaciones de la entidad financiera',
              style: pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(
                height: 4), // Espaciado opcional entre título y contenido
            pw.Text(
              observaciones,
              style: pw.TextStyle(fontSize: 7),
            ),
          ],
        ),
      ],
    ),
  );

  // Detectar si estamos en web o móvil/desktop
  if (kIsWeb) {
    final pdfBytes = await pdf.save();

    print('PDF generado para WEB - bytes length: ${pdfBytes.length}');

    final uploadedFile = FFUploadedFile(
      name: 'cdat_contract.pdf',
      bytes: pdfBytes,
    );
    // Justo antes del return uploadedFile:
    FFAppState().update(() {});
    return uploadedFile;
  } else {
    final output = await getTemporaryDirectory();
    final file = File("${output.path}/cdat_contract.pdf");
    final pdfBytes = await pdf.save();
    await file.writeAsBytes(pdfBytes);

    final fileBytes = await file.readAsBytes();

    print('PDF generado para MÓVIL - bytes length: ${fileBytes.length}');

    final uploadedFile =
        FFUploadedFile(name: 'cdat_contract.pdf', bytes: fileBytes);
    // Justo antes del return uploadedFile:
    FFAppState().update(() {});
    return uploadedFile;
  }
}
