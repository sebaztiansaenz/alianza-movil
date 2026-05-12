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

import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

Future<List<TotalRetiroAhorroStruct>> withdrawalTotalAhorros(
    List<String> ahorrosIds) async {
  if (ahorrosIds.isEmpty) {
    return [];
  }

  try {
    // 🔥 OPTIMIZACIÓN: UNA SOLA QUERY con "whereIn"
    Map<String, double> totalesPorId = {};

    // Inicializar todos los IDs con 0
    for (String id in ahorrosIds) {
      totalesPorId[id] = 0.0;
    }

    // Dividir en chunks de 10 (límite de Firestore para "whereIn")
    const chunkSize = 10;
    for (int i = 0; i < ahorrosIds.length; i += chunkSize) {
      final chunk = ahorrosIds.sublist(
        i,
        i + chunkSize > ahorrosIds.length ? ahorrosIds.length : i + chunkSize,
      );

      // UNA query para hasta 10 IDs
      final querySnapshot = await FirebaseFirestore.instance
          .collection('transactions')
          .where('ahorrosId', whereIn: chunk)
          .where('transactionType', isEqualTo: 'Withdrawal')
          .where('status', whereIn: ['APPROVED', 'PENDING']).get();

      // Sumar por cada ID
      for (var doc in querySnapshot.docs) {
        final data = doc.data();
        final ahorroId = data['ahorrosId'] as String?;
        final amount = data['amount'];

        if (ahorroId != null && amount is num) {
          totalesPorId[ahorroId] =
              (totalesPorId[ahorroId] ?? 0.0) + amount.toDouble();
        }
      }
    }

    // Crear lista de resultados en el mismo orden que la entrada
    List<TotalRetiroAhorroStruct> resultados = [];
    for (String id in ahorrosIds) {
      resultados.add(TotalRetiroAhorroStruct(
        total: totalesPorId[id] ?? 0.0,
        ahorroid: id,
      ));
    }

    return resultados;
  } catch (e) {
    // En caso de error, retornar lista con totales en 0
    return ahorrosIds
        .map((id) => TotalRetiroAhorroStruct(
              total: 0.0,
              ahorroid: id,
            ))
        .toList();
  }
}
