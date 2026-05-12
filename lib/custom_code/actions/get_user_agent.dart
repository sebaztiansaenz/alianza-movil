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

import 'package:device_info_plus/device_info_plus.dart'; // Import device_info_plus
import 'dart:io'; // Import dart:io to check the platform

Future<String> getUserAgent() async {
  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    return 'Android ${androidInfo.version.release}; ${androidInfo.model} (${androidInfo.brand})';
  } else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    return 'iOS ${iosInfo.systemVersion}; ${iosInfo.utsname.machine} (${iosInfo.name})';
  } else {
    // Other platforms like web, macOS, etc.
    WebBrowserInfo webInfo = await deviceInfo.webBrowserInfo;
    return '${webInfo.userAgent}';
  }
}
