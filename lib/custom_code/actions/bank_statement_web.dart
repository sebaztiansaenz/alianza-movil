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
import 'package:flutter/foundation.dart'; // Import for kIsWeb

// Platform-specific imports
import 'package:path_provider/path_provider.dart'; // For mobile and desktop
import 'dart:io'; // For mobile and desktop
// import 'dart:html' as html; // For web
import 'package:http/http.dart' as http;

Future<FFUploadedFile> bankStatementWeb(
  String name,
  String cc,
  String month,
  String ahorrosType,
  String ahorrosAccountNumber,
  String previousBalance,
  String currentBalance,
  String benefits,
  String tax,
  //List<TransactionsStruct> transactions,
  List<TransactionsRecord> transactions,
) async {
  final pdf = pw.Document();
  final currentDate =
      DateFormat('dd MMMM yyyy', 'es_ES').format(DateTime.now());

  // Fetch images
  final logoUrl =
      'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/Sin-ti%CC%81tulo-2.png?alt=media&token=b89a8a6b-59ca-4b5b-978d-913826013683';
  final logoBlackUrl =
      'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/Screenshot_2024-08-19_224221-removebg-preview.png?alt=media&token=cd4d6433-3065-4dcf-b249-4f2f78dd35b2';
  final iconUrl =
      'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/docccc.png?alt=media&token=21d44414-ea6a-4127-b5df-22bee4170ff2';
  final bannerUrl =
      'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/PHOTO-2024-08-19-11-18-05.jpg?alt=media&token=bb0d7f86-f999-4930-87a2-99fcc3feef52';

  // Helper function to fetch images
  Future<pw.MemoryImage> fetchImage(String url) async {
    final response = await http.get(Uri.parse(url));
    return pw.MemoryImage(response.bodyBytes);
  }

  final logoImage = await fetchImage(logoUrl);
  final blackLogoImage = await fetchImage(logoBlackUrl);
  final iconImage = await fetchImage(iconUrl);
  final bannerImage = await fetchImage(bannerUrl);

  // Adding details to the PDF using MultiPage
  pdf.addPage(
    pw.MultiPage(
      build: (pw.Context context) => [
        pw.Center(
          child: pw.Image(logoImage, width: 180, height: 140),
        ),
        pw.SizedBox(height: 8),
        pw.Center(
          child: pw.Text('ESTADO DE LINEA AHORRO',
              style:
                  pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
        ),
        pw.SizedBox(height: 24),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('$name',
                    style: pw.TextStyle(fontSize: 16, lineSpacing: 10)),
                pw.RichText(
                  textDirection: pw.TextDirection.ltr,
                  text: pw.TextSpan(
                    text: '',
                    style: pw.TextStyle(fontSize: 16),
                    children: [
                      pw.TextSpan(
                        text: 'CC: ',
                        style: pw.TextStyle(
                            fontSize: 16,
                            fontWeight: pw.FontWeight.bold,
                            lineSpacing: 10),
                      ),
                      pw.TextSpan(
                        text: cc,
                        style: pw.TextStyle(fontSize: 16, lineSpacing: 10),
                      ),
                    ],
                  ),
                  textAlign: pw.TextAlign.left,
                ),
              ],
            ),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.end,
              children: [
                pw.Image(iconImage, width: 36, height: 36),
                pw.SizedBox(width: 24),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.Text('$month',
                        style: pw.TextStyle(fontSize: 14, lineSpacing: 10)),
                    pw.SizedBox(height: 6),
                    pw.Text('Mes de Informe',
                        style: pw.TextStyle(fontSize: 11, lineSpacing: 10)),
                  ],
                ),
                pw.SizedBox(width: 24),
                pw.Container(
                  width: 1,
                  height: 28,
                  color: PdfColors.black,
                ),
                pw.SizedBox(width: 24),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.Text(ahorrosAccountNumber,
                        style: pw.TextStyle(fontSize: 14, lineSpacing: 10)),
                    pw.SizedBox(height: 6),
                    pw.Text(ahorrosType,
                        style: pw.TextStyle(fontSize: 11, lineSpacing: 10)),
                  ],
                ),
              ],
            ),
          ],
        ),
        pw.SizedBox(height: 24),
        pw.Container(
          width: double.infinity,
          height: 26,
          color: PdfColors.blue700,
          child: pw.Center(
            child: pw.Text(
              'RESUMEN',
              style: pw.TextStyle(
                fontSize: 12,
                lineSpacing: 12,
                color: PdfColors.white,
              ),
            ),
          ),
        ),
        pw.SizedBox(height: 20),
        pw.Row(children: [
          pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
            pw.RichText(
              textDirection: pw.TextDirection.ltr,
              text: pw.TextSpan(
                text: '',
                style: pw.TextStyle(fontSize: 16),
                children: [
                  pw.TextSpan(
                    text: 'Saldo Anterior  ',
                    style: pw.TextStyle(fontSize: 16, lineSpacing: 10),
                  ),
                  pw.TextSpan(
                    text: '\$ $previousBalance',
                    style: pw.TextStyle(fontSize: 15, lineSpacing: 10),
                  ),
                ],
              ),
              textAlign: pw.TextAlign.left,
            ),
            pw.SizedBox(height: 12),
            pw.RichText(
              textDirection: pw.TextDirection.ltr,
              text: pw.TextSpan(
                text: '',
                style: pw.TextStyle(fontSize: 16),
                children: [
                  pw.TextSpan(
                    text: 'Saldo Actual  ',
                    style: pw.TextStyle(fontSize: 16, lineSpacing: 10),
                  ),
                  pw.TextSpan(
                    text: '\$ $currentBalance',
                    style: pw.TextStyle(fontSize: 15, lineSpacing: 10),
                  ),
                ],
              ),
              textAlign: pw.TextAlign.left,
            ),
          ]),
          pw.SizedBox(width: 68),
          pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
            pw.RichText(
              textDirection: pw.TextDirection.ltr,
              text: pw.TextSpan(
                text: '',
                style: pw.TextStyle(fontSize: 16),
                children: [
                  pw.TextSpan(
                    text: 'Total Beneficios  ',
                    style: pw.TextStyle(fontSize: 16, lineSpacing: 10),
                  ),
                  pw.TextSpan(
                    text: '\$ $benefits',
                    style: pw.TextStyle(fontSize: 15, lineSpacing: 10),
                  ),
                ],
              ),
              textAlign: pw.TextAlign.left,
            ),
            pw.SizedBox(height: 12),
            pw.RichText(
              textDirection: pw.TextDirection.ltr,
              text: pw.TextSpan(
                text: '',
                style: pw.TextStyle(fontSize: 16),
                children: [
                  pw.TextSpan(
                    text: 'Retefuete  ',
                    style: pw.TextStyle(fontSize: 16, lineSpacing: 10),
                  ),
                  pw.TextSpan(
                    text: '\$ $tax',
                    style: pw.TextStyle(fontSize: 15, lineSpacing: 10),
                  ),
                ],
              ),
              textAlign: pw.TextAlign.left,
            ),
          ]),
        ]),
        pw.SizedBox(height: 24),
        pw.Table.fromTextArray(
          context: context,
          cellStyle: pw.TextStyle(fontSize: 12),
          headerStyle: pw.TextStyle(fontSize: 13, color: PdfColors.white),
          headerDecoration: pw.BoxDecoration(color: PdfColors.blue700),
          border: null, // This removes the cell borders
          cellAlignments: {
            0: pw.Alignment.center, // Center align the first column (Fecha)
            1: pw.Alignment.center, // Center align the second column (Amount)
            2: pw.Alignment.center, // Center align the third column (Status)
            3: pw.Alignment.center, // Center align the fourth column (Method)
          },
          data: <List<String>>[
            <String>['FECHA', 'AMOUNT', 'STATUS', 'METHOD'],
            ...transactions.map((transaction) {
              final formattedDate = transaction.date != null
                  ? DateFormat('dd-MM').format(transaction.firebaseDate!)
                  : 'N/A';
              return [
                formattedDate,
                '\$${transaction.amount.toStringAsFixed(2)}' ?? 'N/A',
                transaction.transactionType == 'Depositado'
                    ? 'PSE'
                    : 'TRANSFERENCIA',
                transaction.transactionType == 'Depositado'
                    ? 'Depositado'
                    : 'Solicitado',
                //transaction.paymentMethod ?? 'N/A',
              ];
            }).toList(),
          ],
        ),
        pw.SizedBox(height: 28),
        pw.RichText(
          textDirection: pw.TextDirection.ltr,
          text: pw.TextSpan(
            text: '',
            style: pw.TextStyle(fontSize: 16),
            children: [
              pw.TextSpan(
                text: 'IMPORTANTE: ',
                style:
                    pw.TextStyle(fontSize: 11, fontWeight: pw.FontWeight.bold),
              ),
              pw.TextSpan(
                text:
                    'El valor del impuesto de retención en la fuente será debitado únicamente sobre los benefcios al momento de realizar un retiro de saldo parcial o total.',
                style: pw.TextStyle(fontSize: 11),
              ),
            ],
          ),
          textAlign: pw.TextAlign.left,
        ),
        pw.SizedBox(height: 28),
        // Add the full-width image banner
        pw.Container(
          width: double.infinity,
          height: 120,
          child: pw.Image(
            bannerImage,
            fit: pw.BoxFit.cover,
          ),
        ),
      ],
      footer: (pw.Context context) {
        return pw.Center(
          child: pw.Column(children: [
            pw.Image(blackLogoImage, width: 40, height: 40),
            pw.SizedBox(height: 14),
            pw.Text(
                'Cualquier diferencia con el saldo, favor comunicarla a nuestras lineas de atencion whastap 315 779 2999',
                style: pw.TextStyle(fontSize: 10, lineSpacing: 9),
                textAlign: pw.TextAlign.center),
            pw.Text('o correo electronico administracion@alianzacapital.co',
                style: pw.TextStyle(fontSize: 10, lineSpacing: 9),
                textAlign: pw.TextAlign.center),
          ]),
        );
      },
    ),
  );

  // Save the PDF as bytes
  final pdfBytes = await pdf.save();

  // if (kIsWeb) {
  //   // Web: Use html library to trigger download
  //   final blob = html.Blob([pdfBytes], 'application/pdf');
  //   final url = html.Url.createObjectUrlFromBlob(blob);
  //   final anchor = html.AnchorElement(href: url)
  //     ..setAttribute('download', 'bank_statement.pdf')
  //     ..click();
  //   html.Url.revokeObjectUrl(url);
  // } else {
  //   // Mobile/Desktop: Use path_provider and dart:io
  //   final output = await getTemporaryDirectory();
  //   final file = File("${output.path}/bank_statement.pdf");
  //   await file.writeAsBytes(pdfBytes);
  // }

  // Creating the FFUploadedFile object
  final uploadedFile =
      FFUploadedFile(name: 'bank_statement.pdf', bytes: pdfBytes);
  return uploadedFile;
}
