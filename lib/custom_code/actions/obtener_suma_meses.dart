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

Future<List<double>> obtenerSumaMeses(String empresaId) async {
  // Inicializar lista de 12 meses en cero
  List<double> monthlyTotals = List.filled(12, 0.0);

  try {
    // Obtener transacciones filtradas por empresaId, tipo y status
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('transactions')
        .where('empresaId', isEqualTo: empresaId)
        .where('transactionType', isEqualTo: 'Depositado')
        .where('status', isEqualTo: 'APPROVED')
        .get();

    // Procesar cada documento
    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

      // ✅ Filtrar si no tiene processUrl válido
      if (data['processUrl'] == null ||
          (data['processUrl'] as String).trim().isEmpty) {
        continue;
      }

      // Obtener la fecha
      dynamic dateField = data['date'];
      DateTime? transactionDate;

      if (dateField is Timestamp) {
        transactionDate =
            dateField.toDate().toLocal(); // Convertir a hora local
      } else if (dateField is DateTime) {
        transactionDate = dateField.toLocal();
      } else if (dateField is String) {
        transactionDate = DateTime.tryParse(dateField)?.toLocal();
      }

      // Obtener el monto
      double amount = 0.0;
      if (data.containsKey('amount')) {
        dynamic amountField = data['amount'];
        if (amountField is num) {
          amount = amountField.toDouble();
        } else if (amountField is String) {
          amount = double.tryParse(amountField) ?? 0.0;
        }
      }

      // Agrupar por mes (índice 0-11)
      if (transactionDate != null) {
        int monthIndex = transactionDate.month - 1;
        if (monthIndex >= 0 && monthIndex < 12) {
          monthlyTotals[monthIndex] += amount;
        }
      }
    }

    return monthlyTotals;
  } catch (e) {
    print('Error fetching transactions: $e');
    return List.filled(12, 0.0);
  }
}
