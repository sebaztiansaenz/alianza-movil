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

import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<String?> downloadUploadedFile(FFUploadedFile pdf) async {
  try {
    // Check if the bytes are null
    if (pdf.bytes == null) {
      return 'File data is null';
    }

    // Get the temporary directory of the device.
    final directory = await getApplicationDocumentsDirectory();

    // Create a file path using the directory and the filename from the FFUploadedFile.
    final filePath = '${directory.path}/${pdf.name}';

    // Create the file.
    final file = File(filePath);

    // Write the file bytes to the file. Convert Uint8List to List<int>.
    await file.writeAsBytes(pdf.bytes!.toList());

    // Return null if the operation is successful.
    return null;
  } catch (e) {
    // Return the error message if there's an error.
    return 'Error downloading file: $e';
  }
}
