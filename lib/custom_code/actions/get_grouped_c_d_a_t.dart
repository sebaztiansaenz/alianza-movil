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

Future<List<BarChartDataStruct>> getGroupedCDAT(int tiempo) async {
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Cdats')
        .where('Tiempo', isEqualTo: tiempo)
        .get();

    // Inicializar todos los meses con 0
    Map<String, Map<String, double>> monthlyData = {
      for (var month in [
        'Enero',
        'Febrero',
        'Marzo',
        'Abril',
        'Mayo',
        'Junio',
        'Julio',
        'Agosto',
        'Septiembre',
        'Octubre',
        'Noviembre',
        'Diciembre'
      ])
        month: {'value1': 0.0, 'value2': 0.0}
    };

    // Lista de futures para procesar subcolecciones en paralelo
    List<Future<void>> futures = [];

    for (var doc in querySnapshot.docs) {
      var data = doc.data() as Map<String, dynamic>;

      // Verificar que el documento tenga el tiempo correcto (doble verificación)
      if (data['Tiempo'] == tiempo) {
        // --- value1: contar Cdats por FechaApertura ---
        Timestamp? aperturaTs = data['FechaApertura'] as Timestamp?;
        if (aperturaTs != null) {
          String aperturaMonth = _getMonthName(aperturaTs.toDate().month);
          monthlyData[aperturaMonth]!['value1'] =
              monthlyData[aperturaMonth]!['value1']! + 1;
        }

        // --- value2: procesar subcolección confirmacionretiros ---
        futures.add(_processRetiros(doc.reference, monthlyData));
      }
    }

    // Esperar que todas las subcolecciones terminen
    await Future.wait(futures);

    // Convertir Map a lista de BarChartDataStruct y ordenar cronológicamente
    List<BarChartDataStruct> result = monthlyData.entries
        .map((entry) => BarChartDataStruct(
              month: entry.key,
              value1: entry.value['value1'] ?? 0.0,
              value2: entry.value['value2'] ?? 0.0,
            ))
        .toList();

    result.sort(
        (a, b) => _getMonthNumber(a.month).compareTo(_getMonthNumber(b.month)));

    // --- DEBUG: imprimir resultado mes a mes ---
    print("=== RESULTADO PARA TIEMPO: $tiempo ===");
    for (var item in result) {
      print(
          "Mes: ${item.month} | value1 (Cdats): ${item.value1} | value2 (Retiros): ${item.value2}");
    }

    return result;
  } catch (e) {
    print('Error fetching CDAT data: $e');
    return [];
  }
}

// Función para procesar la subcolección confirmacionretiros
Future<void> _processRetiros(DocumentReference docRef,
    Map<String, Map<String, double>> monthlyData) async {
  try {
    QuerySnapshot retirosSnapshot =
        await docRef.collection('confirmacionretiros').get();

    print("Procesando retiros para documento: ${docRef.id}");
    print("Cantidad de retiros encontrados: ${retirosSnapshot.docs.length}");

    for (var retiroDoc in retirosSnapshot.docs) {
      var retiroData = retiroDoc.data() as Map<String, dynamic>;
      Timestamp? retiroTs = retiroData['fecharetiro'] as Timestamp?;

      // Convertir monto a double de forma más segura
      double monto = 0.0;
      var montoValue = retiroData['monto'];
      if (montoValue != null) {
        if (montoValue is int) {
          monto = montoValue.toDouble();
        } else if (montoValue is double) {
          monto = montoValue;
        } else if (montoValue is String) {
          monto = double.tryParse(montoValue) ?? 0.0;
        }
      }

      if (retiroTs != null) {
        String retiroMonth = _getMonthName(retiroTs.toDate().month);
        print("Retiro en mes: $retiroMonth, monto: $monto");

        monthlyData[retiroMonth]!['value2'] =
            monthlyData[retiroMonth]!['value2']! + monto;
      } else {
        print("Retiro sin fecha válida, monto: $monto");
      }
    }
  } catch (e) {
    print('Error procesando retiros para ${docRef.id}: $e');
  }
}

// Funciones auxiliares para nombres y números de meses
String _getMonthName(int monthNumber) {
  const months = [
    '',
    'Enero',
    'Febrero',
    'Marzo',
    'Abril',
    'Mayo',
    'Junio',
    'Julio',
    'Agosto',
    'Septiembre',
    'Octubre',
    'Noviembre',
    'Diciembre'
  ];
  return months[monthNumber];
}

int _getMonthNumber(String monthName) {
  const months = {
    'Enero': 1,
    'Febrero': 2,
    'Marzo': 3,
    'Abril': 4,
    'Mayo': 5,
    'Junio': 6,
    'Julio': 7,
    'Agosto': 8,
    'Septiembre': 9,
    'Octubre': 10,
    'Noviembre': 11,
    'Diciembre': 12
  };
  return months[monthName] ?? 0;
}
