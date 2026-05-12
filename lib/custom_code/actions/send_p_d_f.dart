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

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<bool> sendPDF(
  String emailToSendTo,
  FFUploadedFile pdfToUpload,
) async {
  // Check if the PDF has bytes to convert
  if (pdfToUpload.bytes == null) {
    return false; // Return false if the PDF is empty or invalid
  }

  const sendGridApiKey = String.fromEnvironment('SENDGRID_API_KEY');
  if (sendGridApiKey.isEmpty) {
    print(
        'sendPDF: define SENDGRID_API_KEY with --dart-define=SENDGRID_API_KEY=...');
    return false;
  }

  try {
    // Convert the PDF to Base64
    Uint8List bytes = pdfToUpload.bytes!;
    String base64PDF = base64Encode(bytes);

    // Construct the email payload
    final Map<String, dynamic> emailPayload = {
      "personalizations": [
        {
          "to": [
            {"email": emailToSendTo}
          ],
          "subject": "Su estado de cuenta"
        }
      ],
      "from": {"email": "notificaciones@alianzasolidaria.co"},
      "content": [
        {
          "type": "text/html",
          "value":
              "<!DOCTYPE html><html lang='es'><head><meta charset='UTF-8'><meta name='viewport' content='width=device-width, initial-scale=1.0'><title>Verificación y afiliación de tu cuenta</title></head><body>...<p>Utiliza la siguiente clave para confirmar y aceptar la verificación de tu cuenta...</p></body></html>"
        }
      ],
      "attachments": [
        {
          "content": base64PDF,
          "filename": "document.pdf",
          "type": "application/pdf",
          "disposition": "attachment"
        }
      ]
    };

    // Send the email via SendGrid API
    final response = await http.post(
      Uri.parse('https://api.sendgrid.com/v3/mail/send'),
      headers: {
        'Authorization': 'Bearer $sendGridApiKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(emailPayload),
    );

    // Check if the request was successful
    if (response.statusCode == 202) {
      return true; // Email sent successfully
    } else {
      print('Failed to send email: ${response.statusCode} - ${response.body}');
      return false; // Email sending failed
    }
  } catch (e) {
    print('Error occurred while sending email: $e');
    return false; // An error occurred
  }
}
