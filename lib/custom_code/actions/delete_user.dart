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

Future<String?> deleteUser() async {
  try {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    // Check if the user is logged in
    if (user != null) {
      // Delete the user's account
      await user.delete();
      // Return null to indicate success
      return null;
    } else {
      // No user is currently logged in
      return 'No user logged in';
    }
  } catch (e) {
    // Handle exceptions and return the error message
    return 'Failed to delete user: $e';
  }
}
