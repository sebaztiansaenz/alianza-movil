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

import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<dynamic>> transactionsTotalBySavingsType(
  List<String> ahorrosIds,
) async {
  // Mapa acumulador { savingsType: total }
  Map<String, double> totalsByType = {};

  for (String ahorrosId in ahorrosIds) {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('transactions')
        .where('ahorrosId', isEqualTo: ahorrosId)
        .where('transactionType', isEqualTo: 'Depositado')
        .where('status', isEqualTo: 'APPROVED')
        .get();

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      var data = doc.data() as Map<String, dynamic>?;

      if (data != null &&
          data.containsKey('amount') &&
          data.containsKey('savingsType')) {
        String savingsType = data['savingsType']?.toString() ?? 'Desconocido';
        double amount = (data['amount'] as num?)?.toDouble() ?? 0.0;

        // Sumar al acumulador
        totalsByType[savingsType] = (totalsByType[savingsType] ?? 0.0) + amount;
      }
    }
  }

  // Convertir a lista de JSON [{savingsType: ..., total: ...}, ...]
  List<Map<String, dynamic>> result = totalsByType.entries.map((entry) {
    return {
      "savingsType": entry.key,
      "total": entry.value,
    };
  }).toList();

  return result;
}
