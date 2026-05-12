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
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:download/download.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

Future<String?> downloadFile(String fileURL) async {
  try {
    // Remove any query parameters from the URL
    String cleanUrl = fileURL.split('?')[0];

    // Get the file extension by splitting at "."
    String fileExtension = cleanUrl.split('.').last;
    String filename = 'downloaded_file.$fileExtension';

    // Make the HTTP request
    final response = await http.get(Uri.parse(fileURL));
    if (response.statusCode == 200) {
      final bytes = response.bodyBytes;

      // Save the file with the detected extension
      final stream = Stream<int>.fromIterable(bytes);
      await download(stream, filename);
      return null;
    } else {
      return 'Request failed with status: ${response.statusCode}.';
    }
  } catch (e) {
    return e.toString();
  }
}
