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

import 'package:cloud_functions/cloud_functions.dart';

Future<bool> adminResetPasswordAction(
  String email,
  String newPassword,
) async {
  // Add your function code here!

// Llama a la Cloud Function 'adminResetPassword'
  final HttpsCallable callable = FirebaseFunctions.instance.httpsCallable(
    'adminResetPassword',
  );
  try {
    // Llama a la función pasando los parámetros
    final result = await callable.call({
      'email': email,
      'newPassword': newPassword,
    });
    // result.data debe ser un booleano (true o false)
    return result.data as bool;
  } catch (error) {
    print("Error en adminResetPasswordAction: $error");
    return false;
  }
}
