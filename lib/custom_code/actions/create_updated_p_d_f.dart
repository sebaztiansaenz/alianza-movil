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
import 'package:intl/intl.dart';
import 'dart:convert'; // For base64 encoding
import 'dart:typed_data';
// import 'dart:html' as html; // For web
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart'; // For mobile and desktop
import 'dart:io'; // For mobile and desktop
import 'package:http/http.dart' as http;

Future<String> createUpdatedPDF(
    String name,
    String sexo,
    String fechaNacimiento,
    String ciudadNacimiento,
    String tipoDocumento,
    String nroDocumento,
    String fechaExpedicion,
    String ciudadExpedicion,
    String direccionResidencia,
    String ciudadDepartamentoResidencia,
    String barrio,
    String email,
    String whatsAppNumber,
    String phone,
    bool flgPPE,
    bool flgRelativesPPE,
    String relativeFullName,
    String relativeDocumentId,
    bool salario,
    bool pension,
    bool honorarios,
    bool otros,
    String ingresos) async {
  final pdf = pw.Document();

  // Function to format and return the filled text in uppercase
  String toUpperCase(String value) => value.toUpperCase();
  final logoUrl =
      'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/Alianza%20text%20logo.png?alt=media&token=924856ab-ed9b-4ae0-a653-7a6eb47143a1'; // Replace with the actual URL
  final response = await http.get(Uri.parse(logoUrl));
  final logoImage = pw.MemoryImage(response.bodyBytes);

  final logoBWUrl =
      'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/Alianza%20logo.png?alt=media&token=3b5cd6cf-e097-47fe-b508-b884443e729d'; // Replace with the actual URL
  final responseBW = await http.get(Uri.parse(logoBWUrl));
  final logoBWImage = pw.MemoryImage(responseBW.bodyBytes);

  // Create the PDF content
  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      // margin: pw.EdgeInsets.all(30), // for equal 20 points margin on all sides
      margin: pw.EdgeInsets.symmetric(horizontal: 30, vertical: 4),
      build: (pw.Context context) => [
        pw.SizedBox(height: 6),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.start,
          children: [
            pw.Image(logoImage, width: 160, height: 110),
            pw.SizedBox(width: 8),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.SizedBox(height: 10),
                pw.Text('FORMULARIO UNICO DE VINCULACION Y/O',
                    style: pw.TextStyle(
                      fontSize: 9,
                      fontWeight: pw.FontWeight.bold,
                    )),
                pw.Text('AFILIACIÓN ALIANZA',
                    style: pw.TextStyle(
                      fontSize: 9,
                      fontWeight: pw.FontWeight.bold,
                    )),
              ],
            ),
          ],
        ),
        pw.SizedBox(height: 8),
        pw.Container(
          width: double.infinity,
          height: 14,
          color: PdfColor.fromInt(
              0xFF1834B1), // Using hex color for the blue background
          child: pw.Padding(
            //padding:
            //    pw.EdgeInsets.only(left: 12), // Adding left padding of 8 units
            padding: pw.EdgeInsets.symmetric(
              horizontal: 12, // Horizontal padding for left and right
              vertical: 3, // Vertical padding to center the text
            ),
            child: pw.Text(
              'INFORMACION PERSONAL AFILIADO',
              style: pw.TextStyle(
                fontSize: 8,
                color: PdfColors.white,
              ),
              textAlign: pw.TextAlign.left, // Aligning text to the left
            ),
          ),
        ),
        // pw.SizedBox(height: 15),
        // pw.Text(
        //   'Por favor, asegúrese de que toda la información esté correctamente diligenciada.',
        //   style: pw.TextStyle(fontSize: 10, fontStyle: pw.FontStyle.italic),
        // ),
        pw.SizedBox(height: 9),
        // First input fields
        pw.Container(
          width: double.infinity,
          height: 24,
          child: pw.Row(
            children: [
              // First fixed-width container
              pw.Container(
                width: 380,
                height: 24,
                color: PdfColor.fromHex('#E9ECF7'),
                child: pw.Padding(
                  padding: pw.EdgeInsets.only(left: 8),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Nombres y Apellidos',
                        style: pw.TextStyle(
                          fontSize: 7,
                          lineSpacing: 8,
                        ),
                      ),
                      pw.SizedBox(height: 4),
                      pw.Text(
                        '$name',
                        style: pw.TextStyle(
                          fontSize: 10,
                          // fontWeight: pw.FontWeight.bold,
                          lineSpacing: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              pw.SizedBox(width: 2),
              // Second container that should expand to fill the remaining space
              pw.Expanded(
                child: pw.Container(
                  height: 24,
                  color: PdfColor.fromHex('#E9ECF7'),
                  child: pw.Padding(
                    padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'Sexo',
                          style: pw.TextStyle(
                            fontSize: 7,
                            lineSpacing: 8,
                          ),
                        ),
                        pw.SizedBox(height: 4),
                        pw.Text(
                          '$sexo',
                          style: pw.TextStyle(
                            fontSize: 10,
                            // fontWeight: pw.FontWeight.bold,
                            lineSpacing: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        pw.SizedBox(height: 3),
        // Second Input Fields
        pw.Container(
          width: double.infinity,
          height: 24,
          child: pw.Row(
            children: [
              // First fixed-width container
              pw.Container(
                width: 90,
                height: 24,
                color: PdfColor.fromHex('#E9ECF7'),
                child: pw.Padding(
                  padding: pw.EdgeInsets.only(left: 8),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Fecha de Nacimiento',
                        style: pw.TextStyle(
                          fontSize: 7,
                          lineSpacing: 8,
                        ),
                      ),
                      pw.SizedBox(height: 4),
                      pw.Text(
                        '$fechaNacimiento',
                        style: pw.TextStyle(
                          fontSize: 10,
                          // fontWeight: pw.FontWeight.bold,
                          lineSpacing: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              pw.SizedBox(width: 2),
              // Second container that should expand to fill the remaining space
              pw.Expanded(
                child: pw.Container(
                  height: 24,
                  color: PdfColor.fromHex('#E9ECF7'),
                  child: pw.Padding(
                    padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'Ciudad y Departamento de Nacimiento',
                          style: pw.TextStyle(
                            fontSize: 7,
                            lineSpacing: 8,
                          ),
                        ),
                        pw.SizedBox(height: 4),
                        pw.Text(
                          '$ciudadNacimiento',
                          style: pw.TextStyle(
                            fontSize: 10,
                            // fontWeight: pw.FontWeight.bold,
                            lineSpacing: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        pw.SizedBox(height: 9),
        // Third Input Fields
        pw.Container(
          width: double.infinity,
          height: 24,
          child: pw.Row(
            children: [
              // First fixed-width container
              pw.Container(
                width: 90,
                height: 24,
                color: PdfColor.fromHex('#E9ECF7'),
                child: pw.Padding(
                  padding: pw.EdgeInsets.only(left: 8),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Tipo de Documento',
                        style: pw.TextStyle(
                          fontSize: 7,
                          lineSpacing: 8,
                        ),
                      ),
                      pw.SizedBox(height: 4),
                      pw.Text(
                        '$tipoDocumento',
                        style: pw.TextStyle(
                          fontSize: 5,
                          // fontWeight: pw.FontWeight.bold,
                          lineSpacing: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              pw.SizedBox(width: 2),
              pw.Container(
                width: 90,
                height: 24,
                color: PdfColor.fromHex('#E9ECF7'),
                child: pw.Padding(
                  padding: pw.EdgeInsets.only(left: 8),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Numero de Documento',
                        style: pw.TextStyle(
                          fontSize: 7,
                          lineSpacing: 8,
                        ),
                      ),
                      pw.SizedBox(height: 4),
                      pw.Text(
                        '$nroDocumento',
                        style: pw.TextStyle(
                          fontSize: 10,
                          // fontWeight: pw.FontWeight.bold,
                          lineSpacing: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              pw.SizedBox(width: 2),
              pw.Container(
                width: 90,
                height: 24,
                color: PdfColor.fromHex('#E9ECF7'),
                child: pw.Padding(
                  padding: pw.EdgeInsets.only(left: 8),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Fecha de Expedicion',
                        style: pw.TextStyle(
                          fontSize: 7,
                          lineSpacing: 8,
                        ),
                      ),
                      pw.SizedBox(height: 4),
                      pw.Text(
                        '$fechaExpedicion',
                        style: pw.TextStyle(
                          fontSize: 10,
                          //fontWeight: pw.FontWeight.bold,
                          lineSpacing: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              pw.SizedBox(width: 2),
              // Second container that should expand to fill the remaining space
              pw.Expanded(
                child: pw.Container(
                  height: 24,
                  color: PdfColor.fromHex('#E9ECF7'),
                  child: pw.Padding(
                    padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          ' Ciudad y Departamento de Expedicion',
                          style: pw.TextStyle(
                            fontSize: 7,
                            lineSpacing: 8,
                          ),
                        ),
                        pw.SizedBox(height: 4),
                        pw.Text(
                          '$ciudadExpedicion',
                          style: pw.TextStyle(
                            fontSize: 10,
                            //fontWeight: pw.FontWeight.bold,
                            lineSpacing: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        pw.SizedBox(height: 9),
        // Fourth Input Fields
        pw.Container(
          width: double.infinity,
          height: 24,
          child: pw.Row(
            children: [
              // Second container that should expand to fill the remaining space
              pw.Expanded(
                child: pw.Container(
                  height: 24,
                  color: PdfColor.fromHex('#E9ECF7'),
                  child: pw.Padding(
                    padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'Direccion de Residencia',
                          style: pw.TextStyle(
                            fontSize: 7,
                            lineSpacing: 8,
                          ),
                        ),
                        pw.SizedBox(height: 4),
                        pw.Text(
                          '$direccionResidencia',
                          style: pw.TextStyle(
                            fontSize: 10,
                            //fontWeight: pw.FontWeight.bold,
                            lineSpacing: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        pw.SizedBox(height: 3),
        //Fifth input field
        pw.Container(
          width: double.infinity,
          height: 24,
          child: pw.Row(
            children: [
              // First fixed-width container
              pw.Container(
                width: 380,
                height: 24,
                color: PdfColor.fromHex('#E9ECF7'),
                child: pw.Padding(
                  padding: pw.EdgeInsets.only(left: 8),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Ciudad y Departamento de Residencia',
                        style: pw.TextStyle(
                          fontSize: 6,
                          lineSpacing: 7,
                        ),
                      ),
                      pw.SizedBox(height: 4),
                      pw.Text(
                        '$ciudadDepartamentoResidencia',
                        style: pw.TextStyle(
                          fontSize: 9,
                          //fontWeight: pw.FontWeight.bold,
                          lineSpacing: 9,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              pw.SizedBox(width: 2),
              // Second container that should expand to fill the remaining space
              pw.Expanded(
                child: pw.Container(
                  height: 24,
                  color: PdfColor.fromHex('#E9ECF7'),
                  child: pw.Padding(
                    padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'Barrio',
                          style: pw.TextStyle(
                            fontSize: 6,
                            lineSpacing: 7,
                          ),
                        ),
                        pw.SizedBox(height: 4),
                        pw.Text(
                          '$barrio',
                          style: pw.TextStyle(
                            fontSize: 9,
                            //fontWeight: pw.FontWeight.bold,
                            lineSpacing: 9,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        pw.SizedBox(height: 9),
        // DATOS DE CONTACTO Y FIRMA ELECTRONICA
        pw.Container(
          width: double.infinity,
          height: 14,
          color: PdfColor.fromInt(
              0xFF1834B1), // Using hex color for the blue background
          child: pw.Padding(
            //padding:
            //    pw.EdgeInsets.only(left: 12), // Adding left padding of 8 units
            padding: pw.EdgeInsets.symmetric(
              horizontal: 12, // Horizontal padding for left and right
              vertical: 3, // Vertical padding to center the text
            ),
            child: pw.Text(
              'DATOS DE CONTACTO Y FIRMA ELECTRONICA',
              style: pw.TextStyle(
                fontSize: 8,
                color: PdfColors.white,
              ),
              textAlign: pw.TextAlign.left, // Aligning text to the left
            ),
          ),
        ),
        pw.SizedBox(height: 9),
        //Fifth input field
        pw.Container(
          width: double.infinity,
          height: 24,
          child: pw.Row(
            children: [
              // Third container that should expand to fill the remaining space
              pw.Expanded(
                child: pw.Container(
                  height: 24,
                  color: PdfColor.fromHex('#E9ECF7'),
                  child: pw.Padding(
                    padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'Correo Electronico',
                          style: pw.TextStyle(
                            fontSize: 6,
                            lineSpacing: 7,
                          ),
                        ),
                        pw.SizedBox(height: 4),
                        pw.Text(
                          '$email',
                          style: pw.TextStyle(
                            fontSize: 9,
                            //fontWeight: pw.FontWeight.bold,
                            lineSpacing: 9,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              pw.SizedBox(width: 2),
              // First fixed-width container
              pw.Container(
                width: 90,
                height: 24,
                color: PdfColor.fromHex('#E9ECF7'),
                child: pw.Padding(
                  padding: pw.EdgeInsets.only(left: 8),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'WhatsApp',
                        style: pw.TextStyle(
                          fontSize: 6,
                          lineSpacing: 7,
                        ),
                      ),
                      pw.SizedBox(height: 4),
                      pw.Text(
                        '$whatsAppNumber',
                        style: pw.TextStyle(
                          fontSize: 9,
                          //fontWeight: pw.FontWeight.bold,
                          lineSpacing: 9,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              pw.SizedBox(width: 2),
              // Second fixed-width container
              pw.Container(
                width: 90,
                height: 24,
                color: PdfColor.fromHex('#E9ECF7'),
                child: pw.Padding(
                  padding: pw.EdgeInsets.only(left: 8),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Otro Telefono',
                        style: pw.TextStyle(
                          fontSize: 6,
                          lineSpacing: 7,
                        ),
                      ),
                      pw.SizedBox(height: 4),
                      pw.Text(
                        '$phone',
                        style: pw.TextStyle(
                          fontSize: 9,
                          //fontWeight: pw.FontWeight.bold,
                          lineSpacing: 9,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        pw.SizedBox(height: 9),
        // INFORMACION PERSONA EXPUESTA POLITICAMENTE (PEP)
        pw.Container(
          width: double.infinity,
          height: 14,
          color: PdfColor.fromInt(
              0xFF1834B1), // Using hex color for the blue background
          child: pw.Padding(
            //padding:
            //    pw.EdgeInsets.only(left: 12), // Adding left padding of 8 units
            padding: pw.EdgeInsets.symmetric(
              horizontal: 12, // Horizontal padding for left and right
              vertical: 3, // Vertical padding to center the text
            ),
            child: pw.Text(
              'INFORMACION PERSONA EXPUESTA POLITICAMENTE (PEP)',
              style: pw.TextStyle(
                fontSize: 8,
                color: PdfColors.white,
              ),
              textAlign: pw.TextAlign.left, // Aligning text to the left
            ),
          ),
        ),
        pw.SizedBox(height: 9),
        // First checkbox
        pw.Row(children: [
          pw.SizedBox(width: 14),
          pw.Text(
            '¿Es usted una persona politicamente expuesta (Decreto 830 de 2021)?',
            style: pw.TextStyle(
              fontSize: 8,
            ),
            textAlign: pw.TextAlign.left, // Aligning text to the left
          ),
          pw.SizedBox(width: 10),
          pw.Checkbox(
            value: flgPPE,
            name: 'Sii',
            width: 12, // Custom width for the checkbox
            height: 12, // Custom height for the checkbox
            activeColor: PdfColors.white,
            checkColor: PdfColors.black,
            decoration: pw.BoxDecoration(
              borderRadius:
                  pw.BorderRadius.all(pw.Radius.circular(6)), // Rounded corners
              border: pw.Border.all(
                color: PdfColors.black, // Border color
                width: 1, // Border width
              ),
            ),
          ),
          pw.SizedBox(width: 2),
          pw.Text(
            'Si',
            style: pw.TextStyle(
              fontSize: 8,
            ),
          ),
          pw.SizedBox(width: 10),
          pw.Checkbox(
            value: !flgPPE,
            name: 'Noo',
            width: 12, // Custom width for the checkbox
            height: 12, // Custom height for the checkbox
            activeColor: PdfColors.white,
            checkColor: PdfColors.black,
            decoration: pw.BoxDecoration(
              borderRadius:
                  pw.BorderRadius.all(pw.Radius.circular(6)), // Rounded corners
              border: pw.Border.all(
                color: PdfColors.black, // Border color
                width: 1, // Border width
              ),
            ),
          ),
          pw.SizedBox(width: 2),
          pw.Text(
            'No',
            style: pw.TextStyle(
              fontSize: 8,
            ),
          ),
        ]),
        pw.SizedBox(height: 4),
        // Second checkbox
        pw.Row(children: [
          pw.SizedBox(width: 14),
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                '¿Tiene familiares hasta segundo grado de consanguinidad,',
                style: pw.TextStyle(
                  fontSize: 8,
                ),
                textAlign: pw.TextAlign.left, // Aligning text to the left
              ),
              pw.Text(
                'segundo de afinidad y primero civil que sean PEP?',
                style: pw.TextStyle(
                  fontSize: 8,
                ),
                textAlign: pw.TextAlign.left, // Aligning text to the left
              ),
            ],
          ),
          pw.SizedBox(width: 53),
          pw.Checkbox(
            value: flgRelativesPPE,
            name: 'Si',
            width: 12, // Custom width for the checkbox
            height: 12, // Custom height for the checkbox
            activeColor: PdfColors.white,
            checkColor: PdfColors.black,
            decoration: pw.BoxDecoration(
              borderRadius:
                  pw.BorderRadius.all(pw.Radius.circular(6)), // Rounded corners
              shape: pw.BoxShape.circle,
              border: pw.Border.all(
                color: PdfColors.black, // Border color
                width: 1, // Border width
              ),
            ),
          ),
          pw.SizedBox(width: 2),
          pw.Text(
            'Si',
            style: pw.TextStyle(
              fontSize: 8,
            ),
          ),
          pw.SizedBox(width: 10),
          pw.Checkbox(
            value: !flgRelativesPPE,
            name: 'No',
            width: 12, // Custom width for the checkbox
            height: 12, // Custom height for the checkbox
            activeColor: PdfColors.white,
            checkColor: PdfColors.black,
            decoration: pw.BoxDecoration(
              borderRadius: pw.BorderRadius.all(pw.Radius.circular(6)),
              shape: pw.BoxShape.circle, // Rounded corners
              border: pw.Border.all(
                color: PdfColors.black, // Border color
                width: 1, // Border width
              ),
            ),
          ),
          pw.SizedBox(width: 2),
          pw.Text(
            'No',
            style: pw.TextStyle(
              fontSize: 8,
            ),
          ),
        ]),
        pw.SizedBox(height: 8),
        // Grey input fields
        pw.Container(
          width: double.infinity,
          height: 24,
          child: pw.Row(
            children: [
              // Second container that should expand to fill the remaining space
              pw.Expanded(
                child: pw.Container(
                  height: 24,
                  color: PdfColor.fromHex('#F2F2F2'),
                  child: pw.Padding(
                    padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'Nombre y apellido',
                          style: pw.TextStyle(
                            fontSize: 7,
                            lineSpacing: 8,
                          ),
                        ),
                        pw.SizedBox(height: 4),
                        pw.Text(
                          '$relativeFullName',
                          style: pw.TextStyle(
                            fontSize: 10,
                            //fontWeight: pw.FontWeight.bold,
                            lineSpacing: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              pw.SizedBox(width: 2),
              pw.Expanded(
                child: pw.Container(
                  height: 24,
                  color: PdfColor.fromHex('#F2F2F2'),
                  child: pw.Padding(
                    padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'Numero de identificación',
                          style: pw.TextStyle(
                            fontSize: 7,
                            lineSpacing: 8,
                          ),
                        ),
                        pw.SizedBox(height: 4),
                        pw.Text(
                          '$relativeDocumentId',
                          style: pw.TextStyle(
                            fontSize: 10,
                            //fontWeight: pw.FontWeight.bold,
                            lineSpacing: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        pw.SizedBox(height: 9),
        // ORIGEN DE RECURSOS PARA LOS SERVICIOS
        pw.Container(
          width: double.infinity,
          height: 14,
          color: PdfColor.fromInt(
              0xFF1834B1), // Using hex color for the blue background
          child: pw.Padding(
            //padding:
            //    pw.EdgeInsets.only(left: 12), // Adding left padding of 8 units
            padding: pw.EdgeInsets.symmetric(
              horizontal: 12, // Horizontal padding for left and right
              vertical: 3, // Vertical padding to center the text
            ),
            child: pw.Text(
              'ORIGEN DE RECURSOS PARA LOS SERVICIOS',
              style: pw.TextStyle(
                fontSize: 8,
                color: PdfColors.white,
              ),
              textAlign: pw.TextAlign.left, // Aligning text to the left
            ),
          ),
        ),
        pw.SizedBox(height: 9),
        pw.Text(
          '1. Los recursos que entregaré en Ahorro Voluntario Contractual provienen de las siguientes fuentes:',
          style: pw.TextStyle(
            fontSize: 7,
          ),
          textAlign: pw.TextAlign.left, // Aligning text to the left
        ),
        // Number One (1)
        pw.Row(children: [
          pw.Text(
            'Salario',
            style: pw.TextStyle(
              fontSize: 7,
            ),
          ),
          pw.SizedBox(width: 2),
          pw.Checkbox(
            value: salario,
            name: 'Salardo',
            width: 9, // Custom width for the checkbox
            height: 9, // Custom height for the checkbox
            activeColor: PdfColors.white,
            checkColor: PdfColors.black,
            decoration: pw.BoxDecoration(
              borderRadius:
                  pw.BorderRadius.all(pw.Radius.circular(4)), // Rounded corners
              border: pw.Border.all(
                color: PdfColors.black, // Border color
                width: 1, // Border width
              ),
            ),
          ),
          pw.SizedBox(width: 10),
          pw.Text(
            'Pension',
            style: pw.TextStyle(
              fontSize: 7,
            ),
          ),
          pw.SizedBox(width: 2),
          pw.Checkbox(
            value: pension,
            name: 'Pension',
            width: 9, // Custom width for the checkbox
            height: 9, // Custom height for the checkbox
            activeColor: PdfColors.white,
            checkColor: PdfColors.black,
            decoration: pw.BoxDecoration(
              borderRadius:
                  pw.BorderRadius.all(pw.Radius.circular(4)), // Rounded corners
              border: pw.Border.all(
                color: PdfColors.black, // Border color
                width: 1, // Border width
              ),
            ),
          ),
          pw.SizedBox(width: 10),
          pw.Text(
            'Honorarios/comisiones:',
            style: pw.TextStyle(
              fontSize: 7,
            ),
          ),
          pw.SizedBox(width: 2),
          pw.Checkbox(
            value: honorarios,
            name: 'Honorarios',
            width: 9, // Custom width for the checkbox
            height: 9, // Custom height for the checkbox
            activeColor: PdfColors.white,
            checkColor: PdfColors.black,
            decoration: pw.BoxDecoration(
              borderRadius:
                  pw.BorderRadius.all(pw.Radius.circular(4)), // Rounded corners
              border: pw.Border.all(
                color: PdfColors.black, // Border color
                width: 1, // Border width
              ),
            ),
          ),
          pw.SizedBox(width: 10),
          pw.Text(
            'Otros:',
            style: pw.TextStyle(
              fontSize: 7,
            ),
          ),
          pw.SizedBox(width: 2),
          pw.Checkbox(
            value: otros,
            name: 'Otros:',
            width: 9, // Custom width for the checkbox
            height: 9, // Custom height for the checkbox
            activeColor: PdfColors.white,
            checkColor: PdfColors.black,
            decoration: pw.BoxDecoration(
              borderRadius:
                  pw.BorderRadius.all(pw.Radius.circular(4)), // Rounded corners
              border: pw.Border.all(
                color: PdfColors.black, // Border color
                width: 1, // Border width
              ),
            ),
          ),
          pw.SizedBox(width: 10),
          pw.Text(
            '¿Cuales?',
            style: pw.TextStyle(
              fontSize: 7,
            ),
          ),
          pw.SizedBox(width: 8),
          pw.Expanded(
            child: pw.Container(
              height: 10,
              color: PdfColor.fromHex('#E9ECF7'),
              child: pw.Padding(
                padding: pw.EdgeInsets.only(left: 8),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    // pw.SizedBox(height: 4),
                    pw.Text(
                      '$ingresos',
                      style: pw.TextStyle(
                        fontSize: 7,
                        //fontWeight: pw.FontWeight.bold,
                        // lineSpacing: 9,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          pw.SizedBox(height: 2),
        ]),
        pw.Text(
          '2. Declaro que los activos y recursos que poseo y he informado en el presente contrato; así como aquellos que entregaré en virtud a los servicios por FIMUTUAL no provienen de ninguna actividad ilícita de las contempladas en la legislación vigente. ',
          style: pw.TextStyle(
            fontSize: 7,
          ),
          textAlign: pw.TextAlign.left, // Aligning text to the left
        ),
        pw.SizedBox(height: 2),
        pw.Text(
          '3. No admitiré que terceros efectúen depósitos en cuentas a mi nombre con fondos provenientes de actividades ilícitas, ni efectuaré transacciones destinadas a tales actividades o a favor de personas relacionadas con las mismas. ',
          style: pw.TextStyle(
            fontSize: 7,
          ),
          // textAlign: pw.TextAlign.left, // Aligning text to the left
        ),
        pw.SizedBox(height: 2),

        // Text inline with checkbox
        pw.Wrap(children: [
          pw.Text(
            '4. Autorizo a FIMUTUAL a que dé por terminado el Contrato del portafolio de servicios de FIMUTUAL, en caso de infracción de cualquiera de los numerales contenidos en este documento, eximiendo a la Entidad de toda responsabilidad que se derive de información inconsistente, inexacta o insuficiente que yo hubiere proporcionado en este',
            style: pw.TextStyle(
              fontSize: 7,
              // lineSpacing: 6,
            ),
            textAlign: pw.TextAlign.left, // Aligning text to the left
          ),
          pw.Text(
            'documentoo de la violación del mismo.',
            style: pw.TextStyle(
              fontSize: 7,
              // lineSpacing: 6,
            ),
            textAlign: pw.TextAlign.left, // Aligning text to the left
          ),
          pw.SizedBox(width: 10),
          pw.Text(
            'SI AUTORIZO:',
            style: pw.TextStyle(
              fontSize: 7,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(width: 2),
          pw.Checkbox(
            value: true,
            name: 'SI AUTORIZO',
            width: 7, // Custom width for the checkbox
            height: 7, // Custom height for the checkbox
            activeColor: PdfColors.white,
            checkColor: PdfColors.black,
            decoration: pw.BoxDecoration(
              borderRadius:
                  pw.BorderRadius.all(pw.Radius.circular(3)), // Rounded corners
              border: pw.Border.all(
                color: PdfColors.black, // Border color
                width: 1, // Border width
              ),
            ),
          ),
        ]),
        pw.SizedBox(height: 9),
        // AUTORIZACIONES Y DECLARACIONES
        pw.Container(
          width: double.infinity,
          height: 14,
          color: PdfColor.fromInt(
              0xFF1834B1), // Using hex color for the blue background
          child: pw.Padding(
            //padding:
            //    pw.EdgeInsets.only(left: 12), // Adding left padding of 8 units
            padding: pw.EdgeInsets.symmetric(
              horizontal: 12, // Horizontal padding for left and right
              vertical: 3, // Vertical padding to center the text
            ),
            child: pw.Text(
              'AUTORIZACIONES Y DECLARACIONES',
              style: pw.TextStyle(
                fontSize: 8,
                color: PdfColors.white,
              ),
              textAlign: pw.TextAlign.left, // Aligning text to the left
            ),
          ),
        ),
        pw.SizedBox(height: 9),
        // Paragraph 1
        pw.Wrap(children: [
          pw.Text(
            'Declaro que la información aquí suministrada es auténtica y veraz. Autorizo irrevocablemente a FIMUTUAL, para vericarla a través de los medios que considere convenientes. Igualmente, me obligo a actualizar los datos reportados en este formulario, por lo menos una vez al año y/o una vez se produzca cambios en ellos o que',
            style: pw.TextStyle(
              fontSize: 7,
              // lineSpacing: 6,
            ),
            textAlign: pw.TextAlign.left, // Aligning text to the left
          ),
          pw.Text(
            'ALIANZA FIMUTUAL lo requiera.',
            style: pw.TextStyle(
              fontSize: 7,
              // lineSpacing: 6,
            ),
            textAlign: pw.TextAlign.left, // Aligning text to the left
          ),
          pw.SizedBox(width: 10),
          pw.Text(
            'SI AUTORIZO:',
            style: pw.TextStyle(
              fontSize: 7,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(width: 2),
          pw.Checkbox(
            value: true,
            name: 'SI AUTORIZO',
            width: 7, // Custom width for the checkbox
            height: 7, // Custom height for the checkbox
            activeColor: PdfColors.white,
            checkColor: PdfColors.black,
            decoration: pw.BoxDecoration(
              borderRadius:
                  pw.BorderRadius.all(pw.Radius.circular(4)), // Rounded corners
              border: pw.Border.all(
                color: PdfColors.black, // Border color
                width: 1, // Border width
              ),
            ),
          ),
        ]),
        pw.SizedBox(height: 4),
        // Paragraph 2
        pw.Wrap(children: [
          pw.Text(
            'De igual forma autorizo a ALIANZA FIMUTUAL o a quien represente sus derechos u ostente en futuro la calidad de acreedor a reportar, actualizar, solicitar, consultar y divulgar a sus liales a las centrales de información y/o riesgo o cualquier base de datos, toda la información referente a mi comportamiento comercial y/o habitos de pagos. La presente autorización comprende no sólo la facultad de consultar, reportar, procesar y divulgar si no también la de solicitar, consultar y compartir información sobre mis',
            style: pw.TextStyle(
              fontSize: 7,
              // lineSpacing: 6,
            ),
            textAlign: pw.TextAlign.left, // Aligning text to the left
          ),
          pw.Text(
            'relaciones comerciales y el origen de mis recursos con cualquier entidad y/o instituciones de acuerdo con la nalidad del tratamiento de datos autorizada.',
            style: pw.TextStyle(
              fontSize: 7,
              // lineSpacing: 6,
            ),
            textAlign: pw.TextAlign.left, // Aligning text to the left
          ),
          pw.SizedBox(width: 1),
          pw.Text(
            'SI AUTORIZO:',
            style: pw.TextStyle(
              fontSize: 7,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(width: 2),
          pw.Checkbox(
            value: true,
            name: 'SI AUTORIZO',
            width: 7, // Custom width for the checkbox
            height: 7, // Custom height for the checkbox
            activeColor: PdfColors.white,
            checkColor: PdfColors.black,
            decoration: pw.BoxDecoration(
              borderRadius:
                  pw.BorderRadius.all(pw.Radius.circular(3)), // Rounded corners
              border: pw.Border.all(
                color: PdfColors.black, // Border color
                width: 1, // Border width
              ),
            ),
          ),
        ]),
        pw.SizedBox(height: 4),
        // Paragraph 3
        pw.Wrap(children: [
          pw.Text(
            'Autorizo ALIANZA FIMUTUAL, con domicilio en la carrera 98# 22 - 64 Ofic. 709 en Bogota y teléfono (+57) 315 779 2999 a que realice el tratamiento de mis datos personales para los usos y las anualidades descritas en la Política de Tratamiento de datos del ALIANZA FIMUTUAL disponible en la página www.alianzacapital.co y según lo previsto en la Ley 1581 de 2012, la Ley 1266 de 2008, Decreto 1377 de 2013 y demás normas concordantes. Manifiesto que he leído y acepto la Política de Tratamiento de Datos de ALIANZA FIMUTUAL, a través de la cual he sido informado sobre (I) los derechos que me asisten como titular de los datos personales, especialmente a conocer, consultar, actualizar y recticar la información (II) los tratamientos que se realizarán a mis datos , incluida la posible transmisión internacional de datos, y que la nalidad principal de dichos usos es la prestación integral del servicio contractado, (III) los mecanismos para presentar reclamaciones o peticiones relacionadas con el tratamiento de mis datos, (IV) el carácter facultativo de la respuesta a las preguntas de este formulario que puedan versar sobre datos sensibles (ej. la condición de ',
            style: pw.TextStyle(
              fontSize: 7,
              // lineSpacing: 6,
            ),
            textAlign: pw.TextAlign.left, // Aligning text to the left
          ),
          pw.Text(
            'discapacidad), y entiendo que, al suministrar esos datos concedo mi autorización expresa para su tratamiento.',
            style: pw.TextStyle(
              fontSize: 7,
              // lineSpacing: 6,
            ),
            textAlign: pw.TextAlign.left, // Aligning text to the left
          ),
          pw.SizedBox(width: 10),
          pw.Text(
            'SI AUTORIZO:',
            style: pw.TextStyle(
              fontSize: 7,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(width: 2),
          pw.Checkbox(
            value: true,
            name: 'SI AUTORIZO',
            width: 7, // Custom width for the checkbox
            height: 7, // Custom height for the checkbox
            activeColor: PdfColors.white,
            checkColor: PdfColors.black,
            decoration: pw.BoxDecoration(
              borderRadius:
                  pw.BorderRadius.all(pw.Radius.circular(3)), // Rounded corners
              border: pw.Border.all(
                color: PdfColors.black, // Border color
                width: 1, // Border width
              ),
            ),
          ),
        ]),
        pw.SizedBox(height: 4),
        // Paragraph 4
        pw.Wrap(children: [
          pw.Text(
            'Autorizo ALIANZA FIMUTUAL a enviar mensajes con contenido institucional, comercial e informativo de su(s) trámites vigentes a través de siguiente numero (+57) 315 779 2999 y correo electronico info@alianzacapital.co. De no autorizar el envío de recibos y demás comunicaciones o noticaciones a través de correo electrónico, este se remitirá a la dirección física principal informada en este formulario. Si los datos para el envío de información marcados no son correctos o no están',
            style: pw.TextStyle(
              fontSize: 7,
              // lineSpacing: 6,
            ),
            textAlign: pw.TextAlign.left, // Aligning text to the left
          ),
          pw.Text(
            'actualizados.',
            style: pw.TextStyle(
              fontSize: 7,
              // lineSpacing: 6,
            ),
            textAlign: pw.TextAlign.left, // Aligning text to the left
          ),
          pw.SizedBox(width: 10),
          pw.Text(
            'SI AUTORIZO:',
            style: pw.TextStyle(
              fontSize: 7,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(width: 2),
          pw.Checkbox(
            value: true,
            name: 'SI AUTORIZO',
            width: 7, // Custom width for the checkbox
            height: 7, // Custom height for the checkbox
            activeColor: PdfColors.white,
            checkColor: PdfColors.black,
            decoration: pw.BoxDecoration(
              borderRadius:
                  pw.BorderRadius.all(pw.Radius.circular(3)), // Rounded corners
              border: pw.Border.all(
                color: PdfColors.black, // Border color
                width: 1, // Border width
              ),
            ),
          ),
        ]),
        pw.SizedBox(height: 4),
        // Paragraph 5
        pw.Wrap(children: [
          pw.Text(
            'El siguiente documento contiene firma electronica segun Ley 527 de 1999, Ley de Comercio Electrónico, que regula el comercio electrónico y sienta las bases para la existencia y exigibilidadde las firmas digitales. Decreto 2364 de 2012 que diferencia entre firma electrónica y firma digital como tipo específico de firma',
            style: pw.TextStyle(
              fontSize: 7,
              // lineSpacing: 6,
            ),
            textAlign: pw.TextAlign.left, // Aligning text to the left
          ),
          pw.Text(
            'electrónica.',
            style: pw.TextStyle(
              fontSize: 7,
              // lineSpacing: 6,
            ),
            textAlign: pw.TextAlign.left, // Aligning text to the left
          ),
          pw.SizedBox(width: 10),
          pw.Text(
            'SI AUTORIZO:',
            style: pw.TextStyle(
              fontSize: 7,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(width: 2),
          pw.Checkbox(
            value: true,
            name: 'SI AUTORIZO',
            width: 7, // Custom width for the checkbox
            height: 7, // Custom height for the checkbox
            activeColor: PdfColors.white,
            checkColor: PdfColors.black,
            decoration: pw.BoxDecoration(
              borderRadius:
                  pw.BorderRadius.all(pw.Radius.circular(3)), // Rounded corners
              border: pw.Border.all(
                color: PdfColors.black, // Border color
                width: 1, // Border width
              ),
            ),
          ),
        ]),
        pw.SizedBox(height: 36),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.start,
          children: [
            pw.Image(logoBWImage, width: 40, height: 40),
            pw.SizedBox(width: 36),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: [
                pw.SizedBox(height: 12),
                pw.Container(
                  width: 250,
                  height: 0.7,
                  color: PdfColors.black,
                ),
                pw.Text('Firma afiliado', style: pw.TextStyle(fontSize: 10)),
                pw.SizedBox(height: 4),
                pw.Text(
                    'Documento valido con firma electrónica de acuerdo Ley 2069 de 2020 en lo relacionado con el uso de la firma electrónica,',
                    style: pw.TextStyle(fontSize: 7)),
                pw.Text('digital y demás normas que modifiquen o adicionen.',
                    style: pw.TextStyle(fontSize: 7)),
              ],
            ),
          ],
        ),
        // pw.SizedBox(height: 9),
      ],
      footer: (pw.Context context) {
        return pw.Container(
          width: double.infinity, // Ensure full width for the Row
          child: pw.Row(
            mainAxisAlignment:
                pw.MainAxisAlignment.end, // Align content to the start
            children: [
              pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.Container(
                      width: 44,
                      height: 0.5,
                      color: PdfColors.black,
                    ),
                    pw.Text('VIGILADO', style: pw.TextStyle(fontSize: 9)),
                    pw.Container(
                      width: 44,
                      height: 0.5,
                      color: PdfColors.black,
                    ),
                  ]),
              pw.SizedBox(width: 2),
              pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.Text('SUPERINTENDENCIA DE LA',
                        style: pw.TextStyle(fontSize: 5)),
                    pw.Text('ECONOMIA SOLIDARIA',
                        style: pw.TextStyle(fontSize: 5)),
                  ]),
            ],
          ),
        );
      },
    ),
  );

  // Save the PDF as bytes
  final pdfBytes = await pdf.save();

  // Encode PDF bytes to Base64 string
  final pdfBase64 = base64Encode(pdfBytes);

  return pdfBase64;

  // if (kIsWeb) {
  //   // Web: Use html library to trigger download
  //   final blob = html.Blob([pdfBytes], 'application/pdf');
  //   final url = html.Url.createObjectUrlFromBlob(blob);
  //   final anchor = html.AnchorElement(href: url)
  //     ..setAttribute('download', 'example.pdf')
  //     ..click();
  //   html.Url.revokeObjectUrl(url);
  // } else {
  //   // Mobile/Desktop: Use path_provider and dart:io
  //   final output = await getTemporaryDirectory();
  //   final file = File("${output.path}/example.pdf");
  //   await file.writeAsBytes(pdfBytes);
  // }

  // // Creating the FFUploadedFile object
  // final uploadedFile = FFUploadedFile(name: 'example.pdf', bytes: pdfBytes);
  // return uploadedFile;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
