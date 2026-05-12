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

// Import FirebaseAuth package
import 'package:firebase_auth/firebase_auth.dart';

Future<String?> changeUserPassword(String? newPassword) async {
  // Check if newPassword is null or empty
  if (newPassword == null || newPassword.isEmpty) {
    return 'New password cannot be empty';
  }

  try {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    // Check if the user is logged in
    if (user != null) {
      // Update the user's password
      await user.updatePassword(newPassword);
      // Optionally, you can return a success message or null
      return null;
    } else {
      // No user is currently logged in
      return 'No user logged in';
    }
  } catch (e) {
    // Handle exceptions
    return 'Failed to update password: $e';
  }
}
