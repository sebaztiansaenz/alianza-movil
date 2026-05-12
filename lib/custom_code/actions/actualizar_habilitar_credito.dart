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

import 'package:cloud_firestore/cloud_firestore.dart';

Future actualizarHabilitarCredito(
  String uid,
  bool habilitar,
  String estado,
  String estadoCivil,
  String personasDependientes,
  String adultosAcargo,
  String residencia,
  String tiempoResidiendo,
  String tipoVivienda,
  String empresaNombre,
  String tiempoEmpleo,
  String tipodeContrato,
  String interrupcionesLab,
  String creditosActivos,
  String cuantoscreditos,
  String fuentesingreso,
  String retrasoPagos,
  String tarjetasActivas,
  String centralRiesgo,
  String inversionActiva,
  String creditoGota,
  int ingresoPromed,
  int gastos,
  int promIngresos,
  int pagoOtrasDeudas,
  int gastosFijos,
  int montoSolicitud,
  int mesesApagar,
) async {
  try {
    final query = await FirebaseFirestore.instance
        .collection('HabilitarCredito')
        .where('usuarioUid', isEqualTo: uid)
        .limit(1)
        .get();

    if (query.docs.isNotEmpty) {
      await query.docs.first.reference.set({
        'habilitar': habilitar,
        'estado': estado,
        'estadoCivil': estadoCivil,
        'personasDependientes': personasDependientes,
        'adultosAcargo': adultosAcargo,
        'residencia': residencia,
        'tiempoResidiendo': tiempoResidiendo,
        'tipoVivienda': tipoVivienda,
        'empresaNombre': empresaNombre,
        'tiempoEmpleo': tiempoEmpleo,
        'tipodeContrato': tipodeContrato,
        'interrupcionesLab': interrupcionesLab,
        'creditosActivos': creditosActivos,
        'cuantoscreditos': cuantoscreditos,
        'fuentesingreso': fuentesingreso,
        'retrasoPagos': retrasoPagos,
        'tarjetasActivas': tarjetasActivas,
        'centralRiesgo': centralRiesgo,
        'inversionActiva': inversionActiva,
        'creditoGota': creditoGota,
        'ingresoPromed': ingresoPromed,
        'gastos': gastos,
        'promIngresos': promIngresos,
        'pagoOtrasDeudas': pagoOtrasDeudas,
        'gastosFijos': gastosFijos,
        'montoSolicitud': montoSolicitud,
        'mesesApagar': mesesApagar,
      }, SetOptions(merge: true));
    } else {
      print('No se encontró documento para uid: $uid');
    }
  } catch (e) {
    print('Error actualizando documento: $e');
    rethrow;
  }
}
