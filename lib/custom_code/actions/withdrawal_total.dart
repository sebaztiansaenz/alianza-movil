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

Future<double> withdrawalTotal(List<String> ahorrosIds) async {
  double total = 0.0;

  for (String ahorrosId in ahorrosIds) {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('transactions')
        .where('ahorrosId', isEqualTo: ahorrosId)
        .where('transactionType', isEqualTo: 'Withdrawal')
        .where('status', isNotEqualTo: 'REJECTED')
        .get();

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      var data = doc.data() as Map<String, dynamic>?; // Ensure null safety
      if (data != null && data.containsKey('amount')) {
        total += (data['amount'] as num?)?.toDouble() ?? 0.0;
      }
    }
  }

  return total;
}
