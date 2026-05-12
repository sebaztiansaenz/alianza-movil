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

import 'package:http/http.dart' as http; // Import the http package
import 'dart:convert'; // Import to handle JSON conversion

Future<String> getIpAddress() async {
  const String url = 'https://api.ipify.org?format=json';

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['ip'];
    } else {
      throw Exception('Failed to get IP address');
    }
  } catch (e) {
    print('Error fetching IP address: $e');
    return 'Error';
  }
}
