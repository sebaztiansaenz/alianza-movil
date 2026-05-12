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

Future<List<double>> obtenerSumaMesesBeneficios(String empresaId) async {
  List<double> monthlyTotals = List.filled(12, 0.0);

  try {
    print('📌 Iniciando consulta de ahorros para empresaId: $empresaId');

    // Obtener todos los ahorros donde AhorrosDocPdf1 no sea vacío y empresaId coincida
    QuerySnapshot ahorrosSnapshot = await FirebaseFirestore.instance
        .collection('ahorros')
        .where('AhorrosDocPdf1', isNotEqualTo: '')
        .where('empresaId', isEqualTo: empresaId)
        .get();

    print(
        '📊 Cantidad de documentos en ahorros: ${ahorrosSnapshot.docs.length}');

    for (QueryDocumentSnapshot ahorroDoc in ahorrosSnapshot.docs) {
      Map<String, dynamic> ahorroData =
          ahorroDoc.data() as Map<String, dynamic>;

      // Mostrar el documento completo de ahorro
      print('➡️ Ahorro completo: $ahorroData');

      // Suponiendo que 'transactions' está dentro del documento como un array
      List<dynamic> transactionsList = ahorroData['transactions'] ?? [];

      // Filtrar solo transacciones de la empresa actual (por seguridad)
      transactionsList =
          transactionsList.where((t) => t['empresaId'] == empresaId).toList();

      print(
          ' 🔍 Transacciones filtradas por empresaId: ${transactionsList.length}');

      for (var transactionData in transactionsList) {
        if (transactionData.containsKey('taxedBenefit')) {
          double taxedBenefit = transactionData['taxedBenefit'].toDouble();

          // Obtener fecha
          DateTime? transactionDate;
          dynamic dateField = transactionData['date'];
          if (dateField is Timestamp) {
            transactionDate = dateField.toDate().toLocal();
          } else if (dateField is DateTime) {
            transactionDate = dateField.toLocal();
          } else if (dateField is String) {
            transactionDate = DateTime.tryParse(dateField)?.toLocal();
          }

          if (transactionDate != null) {
            int monthIndex = transactionDate.month - 1;
            if (monthIndex >= 0 && monthIndex < 12) {
              monthlyTotals[monthIndex] += taxedBenefit;
              print(
                ' ✅ Transacción | Fecha: ${transactionDate.toIso8601String()} | '
                'Mes: ${monthIndex + 1} | taxedBenefit: $taxedBenefit | '
                'Acumulado en mes: ${monthlyTotals[monthIndex]}',
              );
            }
          } else {
            print(' ⚠️ Transacción sin fecha válida: $dateField');
          }
        } else {
          print(' ⚠️ Transacción no tiene taxedBenefit');
        }
      }
    }

    // Resumen en tabla
    print('📊 ==== RESUMEN FINAL POR MES ==== 📊');
    for (int i = 0; i < 12; i++) {
      print('Mes ${i + 1}: ${monthlyTotals[i]}');
    }
    print('==================================');

    return monthlyTotals;
  } catch (e) {
    print('❌ Error fetching ahorros: $e');
    return List.filled(12, 0.0);
  }
}
