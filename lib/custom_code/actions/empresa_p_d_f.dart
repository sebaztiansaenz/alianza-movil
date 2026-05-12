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

//import '/flutter_flow/flutter_flow_theme.dart';

// import '/backend/schema/enums/enums.dart';

import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
//import 'dart:html' as html;
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
//import 'package:flutter/foundation.dart' show kIsWeb;

Future<FFUploadedFile> empresaPDF(
  String nombres,
  String direccion,
  // String paisde,
  String tipoDocument,
  String cc,
  String email,
  String social,
  String nit,
  String businessEmail,
  String whatsApp,
  String telephone,
  String website,
  String commercial,
  String employees,
  String pais,
  String cuidad,
  String fecha,
) async {
  final pdf = pw.Document();
  final currentDate =
      (DateFormat('dd MMMM yyyy', 'es_ES').format(DateTime.now()))
          .toUpperCase();
  ;

  // Load the logo from the URL
  final logoUrl =
      // 'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/Sin-ti%CC%81tulo-2.png?alt=media&token=b89a8a6b-59ca-4b5b-978d-913826013683'; // Replace with the actual URL
      'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/Alianza%20text%20logo.png?alt=media&token=924856ab-ed9b-4ae0-a653-7a6eb47143a1';
  final response = await http.get(Uri.parse(logoUrl));
  final logoImage = pw.MemoryImage(response.bodyBytes);

  final logoBWUrl =
      // 'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/Alianza%20logo.png?alt=media&token=3b5cd6cf-e097-47fe-b508-b884443e729d'; // Replace with the actual URL
      'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/Alianza%20pdf%20logo%20design.png?alt=media&token=52460c6f-9061-42c0-8681-aa5dc3db4c7a';
  final responseBW = await http.get(Uri.parse(logoBWUrl));
  final logoBWImage = pw.MemoryImage(responseBW.bodyBytes);

  final verificationLogoUrl =
      // 'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/Alianza%20logo.png?alt=media&token=3b5cd6cf-e097-47fe-b508-b884443e729d'; // Replace with the actual URL
      'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/validado_logo.png?alt=media&token=73edb90c-658a-4f6f-b2a7-33293a85542f';
  final responseVerificationLogo =
      await http.get(Uri.parse(verificationLogoUrl));
  final verificationLogo = pw.MemoryImage(responseVerificationLogo.bodyBytes);

  pdf.addPage(
    pw.MultiPage(
      // margin: pw.EdgeInsets.symmetric(horizontal: 60, vertical: 4),
      margin: pw.EdgeInsets.only(
        left: 40, // Set the left margin
        top: 4, // Set the top margin
        right: 40, // Set the right margin
        bottom: 15, // Set the bottom margin
      ),
      header: (pw.Context context) {
        return pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            //pw.Image(logoImage, width: 120, height: 100),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.SizedBox(height: 48),
                //pw.Image(logoImage, width: 120, height: 100),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.Image(logoImage, width: 160, height: 110),
                    pw.SizedBox(width: 8),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.SizedBox(height: 10),
                        pw.Text('VINCULACION DE TERCEROS',
                            style: pw.TextStyle(
                              fontSize: 9,
                              fontWeight: pw.FontWeight.bold,
                            )),
                        pw.Text('EMPRESAS',
                            style: pw.TextStyle(
                              fontSize: 9,
                              fontWeight: pw.FontWeight.bold,
                            )),
                      ],
                    ),
                  ],
                ),
              ],
            ),
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
                pw.SizedBox(height: 20),
                pw.Container(
                  width: double.infinity, // Make the container take full width
                  alignment:
                      pw.Alignment.centerRight, // Align the Column to the right
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment
                        .end, // Align text to the right within the Column
                    children: [
                      pw.Text(
                        currentDate,
                        style: pw.TextStyle(
                          fontSize: 14,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(' Fecha de solicitud',
                          style: pw.TextStyle(fontSize: 12, lineSpacing: 10)),
                      // Add more widgets here if needed
                    ],
                  ),
                ),
                pw.SizedBox(height: 10),
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
                      'INFORMACION DE LA EMPRESA',
                      style: pw.TextStyle(
                        fontSize: 8,
                        color: PdfColors.white,
                      ),
                      textAlign: pw.TextAlign.left, // Aligning text to the left
                    ),
                  ),
                ),
                pw.SizedBox(height: 10),
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
                                'Razón social ',
                                style: pw.TextStyle(
                                  fontSize: 7,
                                  lineSpacing: 8,
                                ),
                              ),
                              pw.SizedBox(height: 4),
                              pw.Text(
                                '$social',
                                style: pw.TextStyle(
                                  fontSize: 9,
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
                                  'Nit',
                                  style: pw.TextStyle(
                                    fontSize: 7,
                                    lineSpacing: 8,
                                  ),
                                ),
                                pw.SizedBox(height: 4),
                                pw.Text(
                                  '$nit',
                                  style: pw.TextStyle(
                                    fontSize: 9,
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
                // Second inputs
                pw.Container(
                  width: double.infinity,
                  height: 24,
                  child: pw.Row(
                    children: [
                      // First fixed-width container
                      pw.Container(
                        width: 165,
                        height: 24,
                        color: PdfColor.fromHex('#E9ECF7'),
                        child: pw.Padding(
                          padding: pw.EdgeInsets.only(left: 8),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text(
                                'Correo electrónico',
                                style: pw.TextStyle(
                                  fontSize: 7,
                                  lineSpacing: 8,
                                ),
                              ),
                              pw.SizedBox(height: 4),
                              pw.Text(
                                '$businessEmail',
                                style: pw.TextStyle(
                                  fontSize: 9,
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
                                'WhatsApp',
                                style: pw.TextStyle(
                                  fontSize: 7,
                                  lineSpacing: 8,
                                ),
                              ),
                              pw.SizedBox(height: 4),
                              pw.Text(
                                '$whatsApp',
                                style: pw.TextStyle(
                                  fontSize: 9,
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
                                'Teléfono',
                                style: pw.TextStyle(
                                  fontSize: 7,
                                  lineSpacing: 8,
                                ),
                              ),
                              pw.SizedBox(height: 4),
                              pw.Text(
                                '$telephone',
                                style: pw.TextStyle(
                                  fontSize: 9,
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
                                  ' Página web',
                                  style: pw.TextStyle(
                                    fontSize: 7,
                                    lineSpacing: 8,
                                  ),
                                ),
                                pw.SizedBox(height: 4),
                                pw.Text(
                                  '$website',
                                  style: pw.TextStyle(
                                    fontSize: 9,
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
                // Third inputs
                pw.Container(
                  width: double.infinity,
                  height: 24,
                  child: pw.Row(
                    children: [
                      // First fixed-width container

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
                                  ' Actividad comercial',
                                  style: pw.TextStyle(
                                    fontSize: 7,
                                    lineSpacing: 8,
                                  ),
                                ),
                                pw.SizedBox(height: 4),
                                pw.Text(
                                  '$commercial',
                                  style: pw.TextStyle(
                                    fontSize: 9,
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
                                'Numero de empleados',
                                style: pw.TextStyle(
                                  fontSize: 7,
                                  lineSpacing: 8,
                                ),
                              ),
                              pw.SizedBox(height: 4),
                              pw.Text(
                                '$employees',
                                style: pw.TextStyle(
                                  fontSize: 9,
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
                                ' País',
                                style: pw.TextStyle(
                                  fontSize: 7,
                                  lineSpacing: 8,
                                ),
                              ),
                              pw.SizedBox(height: 4),
                              pw.Text(
                                '$pais',
                                style: pw.TextStyle(
                                  fontSize: 9,
                                  //fontWeight: pw.FontWeight.bold,
                                  lineSpacing: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(height: 3),
                // Fourth input fields
                pw.Container(
                  width: double.infinity,
                  height: 24,
                  child: pw.Row(
                    children: [
                      // First fixed-width container

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
                                  ' Ciudad y departamento ',
                                  style: pw.TextStyle(
                                    fontSize: 7,
                                    lineSpacing: 8,
                                  ),
                                ),
                                pw.SizedBox(height: 4),
                                pw.Text(
                                  '$cuidad',
                                  style: pw.TextStyle(
                                    fontSize: 9,
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
                      pw.Container(
                        width: 300,
                        height: 24,
                        color: PdfColor.fromHex('#E9ECF7'),
                        child: pw.Padding(
                          padding: pw.EdgeInsets.only(left: 8),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text(
                                'Dirección',
                                style: pw.TextStyle(
                                  fontSize: 7,
                                  lineSpacing: 8,
                                ),
                              ),
                              pw.SizedBox(height: 4),
                              pw.Text(
                                '$direccion',
                                style: pw.TextStyle(
                                  fontSize: 9,
                                  // fontWeight: pw.FontWeight.bold,
                                  lineSpacing: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(height: 10),
                //REPRESENTANTE LEGAL section
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
                      'REPRESENTANTE LEGAL',
                      style: pw.TextStyle(
                        fontSize: 8,
                        color: PdfColors.white,
                      ),
                      textAlign: pw.TextAlign.left, // Aligning text to the left
                    ),
                  ),
                ),

                pw.SizedBox(height: 10),
                pw.Container(
                  width: double.infinity,
                  height: 24,
                  child: pw.Row(
                    children: [
                      // First fixed-width container
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
                                  'Nombre y apellidos',
                                  style: pw.TextStyle(
                                    fontSize: 7,
                                    lineSpacing: 8,
                                  ),
                                ),
                                pw.SizedBox(height: 4),
                                pw.Text(
                                  '$nombres',
                                  style: pw.TextStyle(
                                    fontSize: 9,
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
                                'Tipo de documento',
                                style: pw.TextStyle(
                                  fontSize: 7,
                                  lineSpacing: 8,
                                ),
                              ),
                              pw.SizedBox(height: 4),
                              pw.Text(
                                '$tipoDocument',
                                style: pw.TextStyle(
                                  fontSize: 9,
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
                                'No. de documento',
                                style: pw.TextStyle(
                                  fontSize: 7,
                                  lineSpacing: 8,
                                ),
                              ),
                              pw.SizedBox(height: 4),
                              pw.Text(
                                '$cc',
                                style: pw.TextStyle(
                                  fontSize: 9,
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
                                'Fecha de expedición',
                                style: pw.TextStyle(
                                  fontSize: 7,
                                  lineSpacing: 8,
                                ),
                              ),
                              pw.SizedBox(height: 4),
                              pw.Text(
                                '$fecha',
                                style: pw.TextStyle(
                                  fontSize: 9,
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
                                  'Correo electronico',
                                  style: pw.TextStyle(
                                    fontSize: 7,
                                    lineSpacing: 8,
                                  ),
                                ),
                                pw.SizedBox(height: 4),
                                pw.Text(
                                  '$email',
                                  style: pw.TextStyle(
                                    fontSize: 9,
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
                pw.SizedBox(height: 18),
                pw.Text('CLAUSULAS',
                    style: pw.TextStyle(
                        fontSize: 11, fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 7),
                pw.RichText(
                  textDirection: pw.TextDirection.ltr,
                  text: pw.TextSpan(
                    text: '',
                    style: pw.TextStyle(fontSize: 11),
                    children: [
                      pw.TextSpan(
                        text: '[TERCERO VINCULADO], ',
                        style: pw.TextStyle(
                            fontSize: 11, fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text:
                            'Fecha de expedición Correo electronico , con la rma de este documento se aceptan los siguientes términos:',
                        style: pw.TextStyle(fontSize: 9),
                      ),
                    ],
                  ),
                  textAlign: pw.TextAlign.left,
                ),
                pw.SizedBox(height: 7),
                pw.RichText(
                  textDirection: pw.TextDirection.ltr,
                  text: pw.TextSpan(
                    text: '',
                    style: pw.TextStyle(fontSize: 11),
                    children: [
                      pw.TextSpan(
                        text: 'PRIMERO: ',
                        style: pw.TextStyle(
                            fontSize: 11, fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text:
                            'La información aquí suministrada es condencial y necesaria para la vinculación como tercero en ALIANZA CAPITAL DE AHORRO Y CREDITO FIMUTUAL, reconozco y acepto que en el evento que la información por mí suministrada en este Sitio Web o aplicación no sea de mi propiedad, induzca a una falsedad o sea violatoria del bien jurídico tutelado denominado',
                        style: pw.TextStyle(fontSize: 9),
                      ),
                      pw.TextSpan(
                        text:
                            ' de la protección de la información y de los datos',
                        style: pw.TextStyle(
                            fontSize: 9, fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text:
                            ' podré incurrir en tipos penales previstos por la legislación colombiana.',
                        style: pw.TextStyle(fontSize: 9),
                      ),
                    ],
                  ),
                  textAlign: pw.TextAlign.left,
                ),
                pw.SizedBox(height: 7),
                pw.Text(
                    'Así mismo, entiendo que autorizo a ALIANZA CAPITAL DE AHORRO Y CREDITO FIMUTUAL con relación a:',
                    style: pw.TextStyle(fontSize: 9)),
                pw.SizedBox(height: 7),
                pw.Text(
                    'I. Autorización Reporte y Consulta de Información ante los Operadores de Bancos de Datos de Información Financiera y/o Crediticia (Ley 1266 de 2008 y Ley 2157 de 2021). Autorizo de ALIANZA CAPITAL DE AHORRO Y CREDITO FIMUTUAL, como responsable del Tratamiento de datos; sus Encargados del Tratamiento; a quien él les haya transmitido o transferido la información, incluyendo la transferencia a terceros países, aliados, y/o a quien el futuro ostente sus derechos, para que obtenga toda la información relativa a mis datos personales nancieros, crediticios, comerciales y de servicios registrados ante cualquier banco de datos, mi comportamiento crediticio y comercial, el cumplimiento de mis obligaciones, en el sector nanciero y real, datos nancieros e información relacionada con mi situación laboral e ingresos salariales ante operadores de información crediticia, de seguridad social, administradoras de fondos y cesantías, centrales de riesgo, notarías, Registraduría Nacional del Estado Civil, Contraloría General de la República, Procuraduría General de la Nación, DIAN, O cinas de Registro, cajas de compensación, proveedores tecnológicos de Nómina y Facturación electrónica, Administradoras de Fondos de Pensiones y de Cesantías y Operadores de Información a través de las cuales se liquidan cesantías, aportes de seguridad social y para scales, tales como Aportes en Línea, SOI, SIMPLE, PILA, entre otras; así mismo para que soliciten o veri quen información sobre mis activos, bienes o derechos en entidades públicas o privadas, o información que se encuentre en buscadores públicos, listas restrictivas, listas vinculantes para Colombia, redes sociales o publicaciones físicas o electrónicas, bien fuere en Colombia o en el exterior. El resultado del análisis para acceder al producto me será informado a través de alguno de los medios de contacto que he suministrado. De igual manera, autorizo, para que, con nes estadísticos, de control, supervisión y de información, reporte a las Centrales de Información, mis datos de contacto, el desarrollo, novedades, extinción y cumplimiento de las obligaciones contraídas o que llegue a contraer con ALIANZA CAPITAL DE AHORRO Y CREDITO FIMUTUAL y/o a quien el futuro ostente sus derechos. Estas autorizaciones de reporte y consulta de información tendrán las mismas nalidades legítimas estipuladas para el tratamiento de información personal cuya autorización y detalle se señala a continuación.',
                    style: pw.TextStyle(fontSize: 9)),
                // pw.SizedBox(height: 10),
                // pw.Text(
                //     'Cesantías y Operadores de Información a través de las cuales se liquidan cesantías, aportes de seguridad social y para scales, tales como Aportes en Línea, SOI, SIMPLE, PILA, entre otras; así mismo para que soliciten o veri quen información sobre mis activos, bienes o derechos en entidades públicas o privadas, o información que se encuentre en buscadores públicos, listas restrictivas, listas vinculantes para Colombia, redes sociales o publicaciones físicas o electrónicas, bien fuere en Colombia o en el exterior. El resultado del análisis para acceder al producto me será informado a través de alguno de los medios de contacto que he suministrado. De igual manera, autorizo, para que, con nes estadísticos, de control, supervisión y de información, reporte a las Centrales de Información, mis datos de contacto, el desarrollo, novedades, extinción y cumplimiento de las obligaciones contraídas o que llegue a contraer con ALIANZA CAPITAL DE AHORRO Y CREDITO FIMUTUAL y/o a quien el futuro ostente sus derechos. Estas autorizaciones de reporte y consulta de información tendrán las mismas nalidades legítimas estipuladas para el tratamiento de información personal cuya autorización y detalle se señala a continuación.',
                //     style: pw.TextStyle(fontSize: 10)),
                // pw.SizedBox(height: 10),
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
      // footer: (pw.Context context) {
      //   return pw.Center(
      //     child: pw.Column(children: [
      //       pw.Text(
      //           'Este documento incorpora firma electronica, de acuerdo a la ley N° 51 de $currentDate ',
      //           style: pw.TextStyle(fontSize: 10),
      //           textAlign: pw.TextAlign.center),
      //       pw.SizedBox(height: 10),
      //     ]),
      //   );
      // },
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

  //Second Page

  pdf.addPage(
    pw.MultiPage(
      // margin: pw.EdgeInsets.symmetric(horizontal: 60, vertical: 4),
      margin: pw.EdgeInsets.only(
        left: 40, // Set the left margin
        top: 4, // Set the top margin
        right: 40, // Set the right margin
        bottom: 15, // Set the bottom margin
      ),
      header: (pw.Context context) {
        return pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            //pw.Image(logoImage, width: 120, height: 100),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.SizedBox(height: 48),
                //pw.Image(logoImage, width: 120, height: 100),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.Image(logoImage, width: 160, height: 110),
                    pw.SizedBox(width: 8),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.SizedBox(height: 10),
                        pw.Text('VINCULACION DE TERCEROS',
                            style: pw.TextStyle(
                              fontSize: 9,
                              fontWeight: pw.FontWeight.bold,
                            )),
                        pw.Text('EMPRESAS',
                            style: pw.TextStyle(
                              fontSize: 9,
                              fontWeight: pw.FontWeight.bold,
                            )),
                      ],
                    ),
                  ],
                ),
              ],
            ),
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
                pw.SizedBox(height: 8),
                pw.Text(
                    ' II. Autorización para el Tratamiento de la Información Personal (Ley 1581 de 2012). Sin perjuicio del derecho que me asiste a escoger los canales de contacto y habiendo sido debidamente informado sobre los medios de comunicación que serán utilizados por ALIANZA CAPITAL DE AHORRO Y CREDITO FIMUTUAL para el ejercicio de la relación contractual y comercial, autorizo de manera libre, voluntaria, expresa e informada a ALIANZA CAPITAL DE AHORRO Y CREDITO FIMUTUAL en calidad de Responsable del Tratamiento de datos; a sus encargados del tratamiento o a quien la asociación les haya transmitido o transferido la información, incluyendo la transferencia a terceros países, y/o a quien en el futuro ostente sus derechos, a ser contactado utilizando la información suministrada en el presente Formulario para las nalidades previstas en este documento, a través de los siguientes canales: i) línea telefónica; ii) correo electrónico; iii) Servicio de Mensajes Cortos (SMS); iv) aplicaciones de mensajería instantánea o formal; y/o v) redes sociales. Declaro conocer y entender que, en caso de que requiera actualizar o modi car mis canales de contacto, puedo realizarlo a través de las Líneas autorizadas e informadas en la página WEB de la asociación. Autorizo a ALIANZA CAPITAL DE AHORRO Y CREDITO FIMUTUAL, en calidad de responsable del Tratamiento de datos; a sus Encargados del Tratamiento de datos o a quien haya transmitido o transferido la información, aliados y/o a quien el futuro ostente sus derechos, incluyendo la transferencia a terceros países, y/o a quien en el futuro ostente sus derechos, para que lleve a cabo el tratamiento de mis datos personales, incluyendo datos biométricos. En virtud de dicha autorización de tratamiento, ALIANZA CAPITAL DE AHORRO Y CREDITO FIMUTUAL podrá solicitar, consultar, compartir, recolectar, almacenar, informar, usar, circular, reportar, transferir, trasmitir, procesar, divulgar, recti car, modi car, aclarar, retirar, suprimir y/o actualizar mis datos e información personal, la cual, es suministrada por mí a través de todos los canales de contacto con ALIANZA CAPITAL DE AHORRO Y CREDITO FIMUTUAL, así como la página web. Así mismo, autorizo a ALIANZA CAPITAL DE AHORRO Y CREDITO FIMUTUAL, en calidad de responsable del Tratamiento; a sus Encargados del Tratamiento o a quien él les haya transmitido o transferido la información, aliados, incluyendo la transferencia a terceros países, y/o a quien el futuro ostente sus derechos, para que de forma directa o a través de una entidad certi cada como operador biométrico, realice la validación de mi identidad y mis características físicas (huellas dactilares y/o rostro), en caso de ser persona natural. Declaro que conozco y entiendo que no estoy obligado a suministrar y/o autorizar el tratamiento de los datos personales de menores de edad. De igual manera, declaro que conozco y entiendo que no estoy obligado a suministrar y/o autorizar el tratamiento de datos personales sensibles; no obstante, autorizo a ALIANZA CAPITAL DE AHORRO Y CREDITO FIMUTUAL el tratamiento de estos datos, de conformidad con lo establecido en el Artículo 5 y 6 de la Ley 1581 de 2023 y el Artículo 6 del Decreto 1377 de 2013, incluyendo de forma expresa mis datos biométricos y los datos asociados al origen racial o étnico, exclusivamente para las nalidades previstas en el presente documento; así mismo, conozco que la información biométrica consultada en las bases de datos respectivas no podrá ser almacenada, ni usada por ALIANZA CAPITAL DE AHORRO Y CREDITO FIMUTUAL, sus Encargados del Tratamiento o a quien él les haya transmitido o transferido la información, aliados, incluyendo la transferencia a terceros países y/o a quien el futuro ostente sus derechos, para complementar otras bases de datos, ni para nes distintos a los expresados en la presente autorización y en la Ley. Mis datos e información personal, debidamente autorizados a través del presente formulario, podrán ser sujetos de tratamiento por ALIANZA CAPITAL DE AHORRO Y CREDITO FIMUTUAL, sus Encargados del Tratamiento o a quien él les haya transmitido o transferido la información, aliados, incluyendo la transferencia a terceros países y/o a quien el futuro ostente sus derechos, en consecuencia, acepto ser contactado(a) mediante: i) línea telefónica; ii) correo electrónico; iii) Servicio de Mensajes Cortos (SMS); iv) v) aplicaciones de mensajería instantánea o formal; y/o vi) redes sociales. El tratamiento por la presente autorización permitido a ALIANZA CAPITAL DE AHORRO Y CREDITO FIMUTUAL, sus Encargados del Tratamiento o a quien él les haya transmitido o transferido la información, aliados, incluyendo la transferencia a terceros países y/o a quien el futuro ostente sus derechos podrá tener por objeto las nalidades legitimas de: i) cumplir las obligaciones contractuales y reglamentarias, prevención del lavado de activos y nanciación del terrorismo, así como para la prestación de los servicios contratados; ii) atender y dar solución a las solicitudes, peticiones, quejas o reclamos formulados a ALIANZA CAPITAL DE AHORRO Y CREDITO FIMUTUAL; iii) crear y actualizar los per les transaccionales; iv) realizar gestiones de cobranza; v) informar sobre los cambios realizados a los productos y servicios del portafolio de ALIANZA CAPITAL DE AHORRO Y CREDITO FIMUTUAL; vi) analizar las tendencias y comportamientos de consumo de los consumidores nancieros; vii) para mi vinculación como cliente, tercero y/o prospecto, aprobación de operaciones de crédito, apertura y/o uso de los servicios y/o productos ofrecidos por  ALIANZA CAPITAL DE AHORRO Y CREDITO FIMUTUAL; viii) recibir información sobre campañas, estrategias promocionales, ofertas comerciales y publicidad de productos de ALIANZA CAPITAL DE AHORRO Y CREDITO FIMUTUAL y de aliados de éste, sean éstas presentes o futuras; ix) recibir cualquier tipo de información y/o comunicación que ALIANZA CAPITAL DE AHORRO Y CREDITO FIMUTUAL estime necesario y general, para que se adelanten todos los procesos de relacionamiento (soportados o no en tecnología), para un abordaje y conocimiento integral del cliente de todos mis productos y soluciones contratadas con ALIANZA CAPITAL DE AHORRO Y CREDITO FIMUTUAL, entre otros permitidos por la Ley. Conozco y entiendo que como Titular de la información tengo derecho a conocer, actualizar, recti car mis datos personales, solicitar prueba de la autorización otorgada para el tratamiento de la información, informarme sobre el uso que se ha dado a los mismos, revocar la autorización, solicitar la supresión de mis datos cuando sea procedente y acceder en forma gratuita a los mismos. Conozco que, para ejercer los derechos sobre mis datos personales podré comunicarme a las Líneas de Atención suministradas en la página WEB. Para conocer la Política de Protección de Datos Personales y Política de Cobranzas, podré ingresar a la pagina WEB.',
                    style: pw.TextStyle(fontSize: 9)),
                pw.SizedBox(height: 7),
                pw.Text(
                    'III. Autorización para Compartir Datos Personales con Entidades Pertenecientes al Grupo Económico, vinculados económicos, personas jurídicas o naturales, con base en las disposiciones de ALIANZA CAPITAL DE AHORRO Y CREDITO FIMUTUAL. Autorizo a ALIANZA CAPITAL DE AHORRO Y CREDITO FIMUTUAL y/o a cualquier otra Entidad o Unidad de Negocio interna que represente sus derechos, a compartir mi información personal, nanciera, crediticia y comercial como Cliente de ALIANZA CAPITAL DE AHORRO Y CREDITO FIMUTUAL con cualquiera otra persona o Entidad Vinculada al Grupo Económico al que pertenece y/o llegue a pertenecer ALIANZA CAPITAL DE AHORRO Y CREDITO FIMUTUAL o la Entidad que represente sus derechos, para realizar el mismo tratamiento y con las mismas nalidades mencionadas en el numeral anterior',
                    style: pw.TextStyle(fontSize: 9)),
              ],
            ),
            pw.Positioned(
              right: -183, // Push the text outside the main content area
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

  //Third Page

  pdf.addPage(
    pw.MultiPage(
      // margin: pw.EdgeInsets.symmetric(horizontal: 60, vertical: 4),
      margin: pw.EdgeInsets.only(
        left: 40, // Set the left margin
        top: 4, // Set the top margin
        right: 40, // Set the right margin
        bottom: 15, // Set the bottom margin
      ),
      header: (pw.Context context) {
        return pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            //pw.Image(logoImage, width: 120, height: 100),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.SizedBox(height: 48),
                //pw.Image(logoImage, width: 120, height: 100),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.Image(logoImage, width: 160, height: 110),
                    pw.SizedBox(width: 8),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.SizedBox(height: 10),
                        pw.Text('VINCULACION DE TERCEROS',
                            style: pw.TextStyle(
                              fontSize: 9,
                              fontWeight: pw.FontWeight.bold,
                            )),
                        pw.Text('EMPRESAS',
                            style: pw.TextStyle(
                              fontSize: 9,
                              fontWeight: pw.FontWeight.bold,
                            )),
                      ],
                    ),
                  ],
                ),
              ],
            ),
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
                pw.SizedBox(height: 6),
                pw.Text(
                    'Declaro haber leído el contenido de este documento, así como comprenderlo en su alcance e implicación, aceptando los Términos y Condiciones. El documento y mi aceptación tendrán validez marcando la casilla de aceptación en el formulario de solicitud de ALIANZA CAPITAL DE AHORRO Y CREDITO FIMUTUAL y/o de quien en el futuro represente u ostente sus derechos, así como, sus obligaciones.',
                    style: pw.TextStyle(fontSize: 8.5)),
                pw.SizedBox(height: 6),
                pw.Text(
                    ' Las deniciones contenidas en la presente autorización que se encuentren en mayúscula tendrán el signi cado que así se haya determinado en la Política de Protección de Datos Personales de ALIANZA CAPITAL DE AHORRO Y CREDITO FIMUTUAL, la cual podrá ser consultada en la página web',
                    style: pw.TextStyle(fontSize: 8.5)),
                pw.SizedBox(height: 6),
                pw.RichText(
                  textDirection: pw.TextDirection.ltr,
                  text: pw.TextSpan(
                    text: '',
                    style: pw.TextStyle(fontSize: 8.5),
                    children: [
                      pw.TextSpan(
                        text: 'SEGUNDO:',
                        style: pw.TextStyle(
                            fontSize: 8.5, fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text:
                            ' Declaración de origen de Fondos- Declaro que: a.) los recursos que se giren por medio de las alianzas o autorizaciones tienen un origen lícito y provienen directamente del desarrollo de la actividad económica y ocupación señalada en la sección actividad económica inscrita en los documentos legales de la compañía. b.) Las cifras aquí reportadas, no provienen de ninguna actividad ilícita de las contempladas en el código penal colombiano o en cualquier otra norma concordante. c.) Admitiré con previa autorización que terceros efectúen depósitos a nombre propio o de las obligaciones incurridas con ALIANZA CAPITAL DE AHORRO Y CREDITO FIMUTUAL',
                        style: pw.TextStyle(fontSize: 8.5),
                      ),
                    ],
                  ),
                  textAlign: pw.TextAlign.left,
                ),
                pw.SizedBox(height: 6),
                pw.RichText(
                  textDirection: pw.TextDirection.ltr,
                  text: pw.TextSpan(
                    text: '',
                    style: pw.TextStyle(fontSize: 8.5),
                    children: [
                      pw.TextSpan(
                        text: 'TERCERO:',
                        style: pw.TextStyle(
                            fontSize: 8.5, fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text:
                            ' Acepto el tratamiento de datos personales, el cual me fue informado durante el proceso realizado. Y que puedo encontrar en la página WEB de ALIANZA CAPITAL DE AHORRO Y CREDITO FIMUTUAL.',
                        style: pw.TextStyle(fontSize: 8.5),
                      ),
                    ],
                  ),
                  textAlign: pw.TextAlign.left,
                ),
                pw.SizedBox(height: 6),
                pw.RichText(
                  textDirection: pw.TextDirection.ltr,
                  text: pw.TextSpan(
                    text: '',
                    style: pw.TextStyle(fontSize: 8.5),
                    children: [
                      pw.TextSpan(
                        text: 'CUARTO:',
                        style: pw.TextStyle(
                            fontSize: 8.5, fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text:
                            ' Acepto que las comunicaciones con ALIANZA CAPITAL DE AHORRO Y CREDITO FIMUTUAL sean enviadas al buzón de mi servicio a través de la APP o página WEB. De igual manera serán reportados con base en la información suministrada por el tercero.',
                        style: pw.TextStyle(fontSize: 8.5),
                      ),
                    ],
                  ),
                  textAlign: pw.TextAlign.left,
                ),
                pw.SizedBox(height: 6),
                pw.RichText(
                  textDirection: pw.TextDirection.ltr,
                  text: pw.TextSpan(
                    text: '',
                    style: pw.TextStyle(fontSize: 8.5),
                    children: [
                      pw.TextSpan(
                        text: 'QUINTO:',
                        style: pw.TextStyle(
                            fontSize: 8.5, fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text:
                            ' Declaro que los representantes de la compañía no son personas expuestas políticamente en Colombia, ni en ningún país diferente a Colombia, ni su cónyuge, ni familiar hasta el segundo grado de consanguinidad o segundo de a nidad o primero civil de una persona expuesta políticamente. Igualmente declaro que no estoy cobijado por el articulo 30-A de la Ley 1908 de 2019, ni tengo residencia scal en ningún país diferente a Colombia.',
                        style: pw.TextStyle(fontSize: 8.5),
                      ),
                    ],
                  ),
                  textAlign: pw.TextAlign.left,
                ),
                pw.SizedBox(height: 6),
                pw.RichText(
                  textDirection: pw.TextDirection.ltr,
                  text: pw.TextSpan(
                    text: '',
                    style: pw.TextStyle(fontSize: 8.5),
                    children: [
                      pw.TextSpan(
                        text: 'SEXTO:',
                        style: pw.TextStyle(
                            fontSize: 8.5, fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text:
                            ' En observancia del artículo 7 del Decreto 2364 de 2012, convengo con ALIANZA CAPITAL DE AHORRO Y CREDITO FIMUTUAL y acepto que el presente documento será rmado electrónicamente mediante el mecanismo OTP (One Time Password) digitado en un dispositivo móvil, ordenador u otra herramienta que autorice ALIANZA CAPITAL DE AHORRO Y CREDITO FIMUTUAL, reconociendo que dicha rma tiene los mismos efectos de mi rma manuscrita, cumpliendo con los atributos dispuestos en el parágrafo del artículo 28 de la Ley 527 de 1999 y el citado Decreto Reglamentario. Para estos efectos, mani esto que: I). Leí y veri qué el presente documento; II). Mantendré actualizados en todo momento los datos de noti cación como lo son el teléfono y el correo electrónico; III). Y reportaré de forma inmediata cualquier circunstancia que pueda poner en riesgo la seguridad de la OTP. Para todos los efectos, los documentos rmados electrónicamente serán custodiados por ALIANZA CAPITAL DE AHORRO Y CREDITO FIMUTUAL y/o la empresa que haga sus veces en este proceso.',
                        style: pw.TextStyle(fontSize: 8.5),
                      ),
                    ],
                  ),
                  textAlign: pw.TextAlign.left,
                ),
                pw.SizedBox(height: 6),
                pw.RichText(
                  textDirection: pw.TextDirection.ltr,
                  text: pw.TextSpan(
                    text: '',
                    style: pw.TextStyle(fontSize: 8.5),
                    children: [
                      pw.TextSpan(
                        text: 'SEPTIMO:',
                        style: pw.TextStyle(
                            fontSize: 8.5, fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text:
                            ' Los pagos de terceros se realizarán con base en las indicaciones ALIANZA CAPITAL DE AHORRO Y CREDITO FIMUTUAL, de los siguientes conceptos:',
                        style: pw.TextStyle(fontSize: 8.5),
                      ),
                    ],
                  ),
                  textAlign: pw.TextAlign.left,
                ),
                pw.SizedBox(height: 6),
                // (a)
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  mainAxisSize: pw.MainAxisSize.max,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('a)', style: pw.TextStyle(fontSize: 8.5)),
                    pw.SizedBox(width: 6),
                    pw.Expanded(
                      child: pw.Text(
                        'Los pagos de origen de descuento de nómina, realizados a nombre de terceros, empleados a liados a ALIANZA CAPITAL DE AHORRO Y CREDITO FIMUTUAL en la modalidad de ahorro, serán depositados a mas tardar al tercer día calendario del pago de nomina del mes. Nota: Si este día, llegara a ser festivo, se realizará a más tardar al día hábil siguiente.',
                        style: pw.TextStyle(fontSize: 8.5),
                        softWrap: true, // Enable text wrapping
                      ),
                    ),
                  ],
                ),
                // (b)
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  mainAxisSize: pw.MainAxisSize.max,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('b)', style: pw.TextStyle(fontSize: 8.5)),
                    pw.SizedBox(width: 6),
                    pw.Expanded(
                      child: pw.Text(
                        'Los pagos de origen de descuento de nómina, realizados a nombre de terceros, empleados a liados a ALIANZA CAPITAL DE AHORRO Y CREDITO FIMUTUAL en la modalidad de crédito, serán depositados a más tardar al primer día calendario del pago de nómina del mes. Nota: Si este día, llegara a ser festivo, se realizará a más tardar al día hábil siguiente.',
                        style: pw.TextStyle(fontSize: 8.5),
                        softWrap: true, // Enable text wrapping
                      ),
                    ),
                  ],
                ),
                // (c)
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  mainAxisSize: pw.MainAxisSize.max,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('c)', style: pw.TextStyle(fontSize: 8.5)),
                    pw.SizedBox(width: 6),
                    pw.Expanded(
                      child: pw.Text(
                        'Todos los pagos anticipados de origen de liquidación de acreencias laborales, por retiro de los empleados, sin importar su naturaleza, deben ser veri cados con el departamento de créditos de ALIANZA CAPITAL DE AHORRO Y CREDITO FIMUTUAL, en aras de aplicar, la cláusula de pago anticipado de créditos del reglamento de créditos de ALIANZA CAPITAL DE AHORRO Y CREDITO FIMUTUAL.',
                        style: pw.TextStyle(fontSize: 8.5),
                        softWrap: true, // Enable text wrapping
                      ),
                    ),
                  ],
                ),
                pw.SizedBox(height: 72),
                // Last part
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  mainAxisSize: pw.MainAxisSize.max,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    // pw.Text('c)', style: pw.TextStyle(fontSize: 8.3)),
                    pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text('$nombres',
                              style: pw.TextStyle(
                                fontSize: 13,
                                fontWeight: pw.FontWeight.bold,
                              )),
                          //pw.Text('CC $cc', style: pw.TextStyle(fontSize: 13)),
                          pw.RichText(
                            textDirection: pw.TextDirection.ltr,
                            text: pw.TextSpan(
                              text: '',
                              style: pw.TextStyle(fontSize: 13),
                              children: [
                                pw.TextSpan(
                                  text: 'CC ',
                                  style: pw.TextStyle(fontSize: 13),
                                ),
                                pw.TextSpan(
                                  text: '$cc',
                                  style: pw.TextStyle(
                                      fontSize: 13,
                                      fontWeight: pw.FontWeight.bold),
                                ),
                              ],
                            ),
                            textAlign: pw.TextAlign.left,
                          ),
                          pw.Text('Representante Legal',
                              style: pw.TextStyle(fontSize: 8.5)),
                          pw.SizedBox(width: 6),
                          pw.Text('FIRMA ELECTRONICA',
                              style: pw.TextStyle(fontSize: 8.5)),
                        ]),
                    pw.Image(verificationLogo, height: 50),
                    // pw.SizedBox(width: 6),
                  ],
                ),
              ],
            ),
            pw.Positioned(
              right: -183, // Push the text outside the main content area
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

  final pdfBytes = await pdf.save();

  return FFUploadedFile(name: 'example.pdf', bytes: pdfBytes);
}
