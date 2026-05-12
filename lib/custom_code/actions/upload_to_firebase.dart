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

import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<String?> uploadToFirebase(
  FFUploadedFile pdfFile,
) async {
  try {
    // Ensure the file bytes are not null
    if (pdfFile.bytes == null) {
      throw Exception('File data is null');
    }

    // Get the current user's UID
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception('No authenticated user');
    }
    final userId = user.uid;

    // Generate a unique file name
    final uuid = Uuid();
    final fileName = '${uuid.v4()}.pdf';

    // Create a reference to the location you want to upload the file to
    final storageRef =
        FirebaseStorage.instance.ref().child('users/$userId/$fileName');

    // Upload the file to Firebase Storage
    final uploadTask = storageRef.putData(pdfFile.bytes!);

    // Wait until the file is uploaded
    await uploadTask;

    // Get the download URL of the uploaded file
    final downloadUrl = await storageRef.getDownloadURL();

    // Return the download URL
    return downloadUrl;
  } catch (e) {
    // Handle any errors
    print('Error uploading file: $e');
    return '';
  }
}
