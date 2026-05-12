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

import 'package:csv/csv.dart';
import 'dart:typed_data';

Future<FFUploadedFile> createCSV(List<UserRecord> users) async {
  // Convert the users list to a List<List<String>> format for CSV conversion
  List<List<String>> csvData = [
    [
      'CC',
      'Nombre',
      'Fecha Ingreso',
      'Telefono',
      'Correo',
      'Direccion',
      'Ciudad'
    ], // Headers
    ...users.map((user) => [
          user.id ?? '', // CC
          user.displayName ?? '', // Nombre
          user.createdTime?.toIso8601String() ?? '', // Fecha Ingreso
          user.telefono1 ?? '', // Telefono
          user.email ?? '', // Correo
          user.direccion ?? '', // Direccion
          user.ciudad ?? '', // Ciudad
        ])
  ];

  // Convert the csvData to a CSV string
  String csvString = const ListToCsvConverter().convert(csvData);

  // Convert the CSV string to bytes
  Uint8List csvBytes = Uint8List.fromList(csvString.codeUnits);

  // Save the file as an FFUploadedFile
  return FFUploadedFile(
    name: 'user_data.csv',
    bytes: csvBytes,
  );
}
