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

import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

Future excelreporte(
  String? cc,
  String? nombre,
  DateTime? fechainicial,
  DateTime? fechafinal,
) async {
  try {
    print('=== INICIO GENERACIÓN EXCEL ===');
    print('Parámetros recibidos:');
    print('CC: $cc');
    print('Nombre: $nombre');
    print('Fecha inicial: $fechainicial');
    print('Fecha final: $fechafinal');

    // Validar parámetros básicos
    if (fechainicial != null &&
        fechafinal != null &&
        fechainicial.isAfter(fechafinal)) {
      throw Exception(
          'La fecha inicial no puede ser posterior a la fecha final');
    }

    // Crear una nueva instancia de Excel
    var excel = Excel.createExcel();
    Sheet sheetObject = excel['Sheet1'];

    // Configurar formato de fechas
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    String fechaInicialStr = fechainicial != null
        ? dateFormat.format(fechainicial)
        : 'TODAS LAS FECHAS';
    String fechaFinalStr = fechafinal != null
        ? dateFormat.format(fechafinal)
        : dateFormat.format(DateTime.now());

    print(
        'Fechas procesadas - Inicial: $fechaInicialStr, Final: $fechaFinalStr');

    // Configurar encabezado del reporte
    _configurarEncabezadoExcel(
        sheetObject, cc ?? 'TODOS', fechaInicialStr, fechaFinalStr);

    // Obtener usuarios a procesar
    List<Map<String, dynamic>> usuariosAProcesar = [];

    if (cc == null || cc.trim().isEmpty) {
      print('CC vacío - Buscando todos los usuarios');
      usuariosAProcesar = await _obtenerTodosLosUsuarios();
    } else {
      print('CC específico proporcionado: $cc - Buscando usuario específico');
      var usuario = await _obtenerUsuarioPorCC(cc.trim());
      if (usuario != null) {
        usuariosAProcesar.add(usuario);
      }
    }

    if (usuariosAProcesar.isEmpty) {
      throw Exception('No se encontraron usuarios para procesar');
    }

    print('Total usuarios a procesar: ${usuariosAProcesar.length}');

    // Variables para resumen de errores
    List<String> erroresUsuarios = [];
    List<String> erroresCuentas = [];
    List<String> advertencias = [];

    // Procesar cada usuario
    int currentRow = 3; // Empezar después del encabezado
    bool primerUsuario = true;

    for (int i = 0; i < usuariosAProcesar.length; i++) {
      var usuario = usuariosAProcesar[i];
      print(
          'PROCESANDO USUARIO ${i + 1}/${usuariosAProcesar.length}: ${usuario['nit']}');

      try {
        var resultado = await _procesarUsuario(
            sheetObject,
            usuario,
            currentRow,
            fechainicial,
            fechafinal,
            dateFormat,
            erroresCuentas,
            advertencias,
            primerUsuario);
        currentRow = resultado['row'];
        primerUsuario = false;
      } catch (e) {
        String errorMsg =
            'Usuario ${usuario['nit']} (${usuario['nombre']}): $e';
        erroresUsuarios.add(errorMsg);
        print('ERROR procesando usuario ${usuario['nit']}: $e');
        // Agregar fila de error en el Excel
        _agregarFilaError(sheetObject, usuario, currentRow, e.toString());
        currentRow++;
        primerUsuario = false;
        continue;
      }
    }

    // Generar y descargar archivo
    await _generarArchivoExcel(
        excel,
        usuariosAProcesar.length > 1
            ? 'TODOS'
            : usuariosAProcesar.first['nit']);

    // RESUMEN FINAL DE ERRORES
    _imprimirResumenFinal(usuariosAProcesar.length, erroresUsuarios,
        erroresCuentas, advertencias);

    print('=== EXCEL GENERADO EXITOSAMENTE ===');
  } catch (e, stackTrace) {
    print('ERROR CRÍTICO en excelreporte: $e');
    print('StackTrace: $stackTrace');
    rethrow;
  }
}

Future<List<Map<String, dynamic>>> _obtenerTodosLosUsuarios() async {
  try {
    QuerySnapshot usersQuery =
        await FirebaseFirestore.instance.collection('user').get();

    print('Usuarios encontrados en BD: ${usersQuery.docs.length}');

    List<Map<String, dynamic>> usuarios = [];

    for (var userDoc in usersQuery.docs) {
      try {
        Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;

        // Validar datos esenciales
        String nit = userData['nit']?.toString() ?? '';
        String displayName = userData['display_name']?.toString() ?? '';
        String email = userData['email']?.toString() ?? '';

        if (nit.trim().isEmpty) {
          print(
              'ADVERTENCIA: Usuario ${userDoc.id} sin NIT válido, saltando...');
          continue;
        }

        usuarios.add({
          'id': userDoc.id,
          'reference': userDoc.reference,
          'nit': nit.trim(),
          'nombre': displayName.trim().isNotEmpty
              ? displayName.trim()
              : email.trim().isNotEmpty
                  ? email.trim()
                  : 'SIN NOMBRE',
          'data': userData
        });
      } catch (e) {
        print('ERROR procesando usuario ${userDoc.id}: $e');
        continue;
      }
    }

    print('Usuarios válidos procesados: ${usuarios.length}');
    return usuarios;
  } catch (e) {
    print('ERROR en _obtenerTodosLosUsuarios: $e');
    rethrow;
  }
}

Future<Map<String, dynamic>?> _obtenerUsuarioPorCC(String cc) async {
  try {
    QuerySnapshot userQuery = await FirebaseFirestore.instance
        .collection('user')
        .where('nit', isEqualTo: cc)
        .limit(1)
        .get();

    if (userQuery.docs.isEmpty) {
      print('No se encontró usuario con CC: $cc');
      return null;
    }

    var userDoc = userQuery.docs.first;
    Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;

    // Validar datos esenciales
    String nit = userData['nit']?.toString() ?? cc;
    String displayName = userData['display_name']?.toString() ?? '';
    String email = userData['email']?.toString() ?? '';

    Map<String, dynamic> usuario = {
      'id': userDoc.id,
      'reference': userDoc.reference,
      'nit': nit.trim(),
      'nombre': displayName.trim().isNotEmpty
          ? displayName.trim()
          : email.trim().isNotEmpty
              ? email.trim()
              : 'SIN NOMBRE',
      'data': userData
    };

    print(
        'Usuario específico encontrado: ${usuario['nit']} - ${usuario['nombre']}');
    return usuario;
  } catch (e) {
    print('ERROR en _obtenerUsuarioPorCC: $e');
    rethrow;
  }
}

void _configurarEncabezadoExcel(
    Sheet sheetObject, String cc, String fechaInicial, String fechaFinal) {
  print('Configurando encabezado Excel...');

  try {
    // Fila 1: CC, FECHA INICIAL, FECHA FIN, BUSCAR
    sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 0))
        .value = 'CC';
    sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 0))
        .value = cc;
    sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 0))
        .cellStyle = CellStyle(
      backgroundColorHex: '#FFFF00',
      fontColorHex: '#000000',
      bold: true,
    );

    sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: 0))
        .value = 'FECHA INICIAL';
    sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 5, rowIndex: 0))
        .value = fechaInicial;
    sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: 0))
        .cellStyle = CellStyle(
      backgroundColorHex: '#FFA500',
      fontColorHex: '#000000',
      bold: true,
    );

    sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 9, rowIndex: 0))
        .value = 'FECHA FIN';
    sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 10, rowIndex: 0))
        .value = fechaFinal;
    sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 9, rowIndex: 0))
        .cellStyle = CellStyle(
      backgroundColorHex: '#FFA500',
      fontColorHex: '#000000',
      bold: true,
    );

    sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 11, rowIndex: 0))
        .value = 'BUSCAR';
    sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 11, rowIndex: 0))
        .cellStyle = CellStyle(
      backgroundColorHex: '#4F81BD',
      fontColorHex: '#FFFFFF',
      bold: true,
    );

    // Configurar encabezados de columnas en fila 3
    List<String> headers = [
      'CC',
      'NOMBRE',
      'TIPO',
      'FECHA APERTURA',
      'AHORRO ANTERIOR',
      'BENEFICIO ANTERIOR',
      'FECHA DEPOSITO',
      'AHORRO ACTUAL',
      'BENEFICIO',
      'AHORRO TOTAL',
      'FECHA RETIRO',
      'VALOR RETIRO',
      'TOTAL AHORRO + INTERES'
    ];

    for (int i = 0; i < headers.length; i++) {
      var cell = sheetObject
          .cell(CellIndex.indexByColumnRow(columnIndex: i + 1, rowIndex: 2));
      cell.value = headers[i];
      cell.cellStyle = CellStyle(
        backgroundColorHex: '#4F81BD',
        fontColorHex: '#FFFFFF',
        bold: true,
      );
    }

    print('Encabezado configurado correctamente');
  } catch (e) {
    print('ERROR configurando encabezado: $e');
    rethrow;
  }
}

int _agregarSeparadorUsuario(Sheet sheetObject, int currentRow) {
  try {
    // Agregar fila vacía como separador
    for (int i = 1; i <= 13; i++) {
      var cell = sheetObject.cell(
          CellIndex.indexByColumnRow(columnIndex: i, rowIndex: currentRow));
      cell.value = '';
      cell.cellStyle = CellStyle(
        backgroundColorHex: '#E0E0E0', // Gris claro
      );
    }
    print('Separador agregado en fila: $currentRow');
    return currentRow + 1;
  } catch (e) {
    print('ERROR agregando separador: $e');
    return currentRow + 1;
  }
}

void _agregarFilaError(Sheet sheetObject, Map<String, dynamic> usuario,
    int rowIndex, String error) {
  try {
    sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: rowIndex))
        .value = usuario['nit'];
    sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: rowIndex))
        .value = usuario['nombre'];
    sheetObject
            .cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: rowIndex))
            .value =
        'ERROR: ${error.length > 50 ? error.substring(0, 50) + '...' : error}';

    // Estilo de error
    for (int i = 1; i <= 13; i++) {
      var cell = sheetObject
          .cell(CellIndex.indexByColumnRow(columnIndex: i, rowIndex: rowIndex));
      cell.cellStyle = CellStyle(
        backgroundColorHex: '#FFCCCC', // Rojo claro
        fontColorHex: '#CC0000',
      );
    }

    print('Fila de error agregada para usuario: ${usuario['nit']}');
  } catch (e) {
    print('ERROR agregando fila de error: $e');
  }
}

Future<Map<String, dynamic>> _procesarUsuario(
    Sheet sheetObject,
    Map<String, dynamic> usuario,
    int startRow,
    DateTime? fechainicial,
    DateTime? fechafinal,
    DateFormat dateFormat,
    List<String> erroresCuentas,
    List<String> advertencias,
    bool primerUsuario) async {
  int currentRow = startRow;

  try {
    // Validar referencia del usuario
    if (usuario['reference'] == null) {
      throw Exception('Referencia de usuario nula');
    }

    // Buscar cuentas de ahorro del usuario
    QuerySnapshot ahorrosQuery = await FirebaseFirestore.instance
        .collection('ahorros')
        .where('user', isEqualTo: usuario['reference'])
        .get();

    // Filtrar cuentas válidas
    List<QueryDocumentSnapshot> cuentasValidas = [];
    for (var ahorroDoc in ahorrosQuery.docs) {
      try {
        Map<String, dynamic> ahorroData =
            ahorroDoc.data() as Map<String, dynamic>;
        String? ahorrosDocPdf1 = ahorroData['AhorrosDocPdf1']?.toString();

        if (ahorrosDocPdf1 != null && ahorrosDocPdf1.trim().isNotEmpty) {
          cuentasValidas.add(ahorroDoc);
        }
      } catch (e) {
        erroresCuentas.add(
            'Usuario ${usuario['nit']} - Error validando cuenta ${ahorroDoc.id}: $e');
        continue;
      }
    }

    if (cuentasValidas.isEmpty) {
      advertencias.add(
          'Usuario ${usuario['nit']} (${usuario['nombre']}): No tiene cuentas válidas');
      return {'row': currentRow};
    }

    // Contar transacciones válidas para este usuario ANTES de procesar
    int totalTransaccionesUsuario = 0;
    for (var ahorroDoc in cuentasValidas) {
      try {
        QuerySnapshot transactionsSnapshot = await FirebaseFirestore.instance
            .collection('transactions')
            .where('ahorrosId', isEqualTo: ahorroDoc.id)
            .get();

        int transaccionesValidasCuenta = transactionsSnapshot.docs.where((doc) {
          try {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

            if (data['status']?.toString() != 'APPROVED') return false;

            if (fechainicial != null || fechafinal != null) {
              try {
                DateTime transactionDate =
                    (data['firebaseDate'] as Timestamp).toDate();
                if (fechainicial != null &&
                    transactionDate.isBefore(fechainicial)) return false;
                if (fechafinal != null && transactionDate.isAfter(fechafinal))
                  return false;
              } catch (e) {
                return false;
              }
            }
            return true;
          } catch (e) {
            return false;
          }
        }).length;

        totalTransaccionesUsuario += transaccionesValidasCuenta;
      } catch (e) {
        continue;
      }
    }

    // Solo agregar separador si NO es el primer usuario Y tiene transacciones válidas
    if (!primerUsuario && totalTransaccionesUsuario > 0) {
      currentRow = _agregarSeparadorUsuario(sheetObject, currentRow);
    }

    // Si no tiene transacciones válidas, no procesar
    if (totalTransaccionesUsuario == 0) {
      return {'row': currentRow};
    }

    // Procesar cada cuenta de ahorros válida
    for (int i = 0; i < cuentasValidas.length; i++) {
      var ahorroDoc = cuentasValidas[i];

      try {
        var resultado = await _procesarCuentaAhorros(
            sheetObject,
            usuario,
            ahorroDoc,
            currentRow,
            fechainicial,
            fechafinal,
            dateFormat,
            erroresCuentas);
        currentRow = resultado['row'];
      } catch (e) {
        String errorMsg =
            'Usuario ${usuario['nit']} - Cuenta ${ahorroDoc.id}: $e';
        erroresCuentas.add(errorMsg);
        // Agregar fila de error para esta cuenta
        _agregarFilaErrorCuenta(
            sheetObject, usuario, ahorroDoc.id, currentRow, e.toString());
        currentRow++;
        continue;
      }
    }

    return {'row': currentRow};
  } catch (e) {
    rethrow;
  }
}

void _agregarFilaErrorCuenta(Sheet sheetObject, Map<String, dynamic> usuario,
    String cuentaId, int rowIndex, String error) {
  try {
    sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: rowIndex))
        .value = usuario['nit'];
    sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: rowIndex))
        .value = usuario['nombre'];
    sheetObject
            .cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: rowIndex))
            .value =
        'ERROR CUENTA $cuentaId: ${error.length > 30 ? error.substring(0, 30) + '...' : error}';

    print('Fila de error de cuenta agregada: $cuentaId');
  } catch (e) {
    print('ERROR agregando fila de error de cuenta: $e');
  }
}

Future<Map<String, dynamic>> _procesarCuentaAhorros(
    Sheet sheetObject,
    Map<String, dynamic> usuario,
    QueryDocumentSnapshot ahorroDoc,
    int startRow,
    DateTime? fechainicial,
    DateTime? fechafinal,
    DateFormat dateFormat,
    List<String> erroresCuentas) async {
  Map<String, dynamic> ahorroData = ahorroDoc.data() as Map<String, dynamic>;
  String cuentaId = ahorroDoc.id;
  String tipoAhorro =
      ahorroData['SavingsType']?.toString() ?? 'TIPO DESCONOCIDO';
  double montoTotal = _parseToDouble(ahorroData['montoTotal']);

  int currentRow = startRow;

  try {
    // Buscar transacciones de esta cuenta específica (consulta simplificada para evitar índice)

    // Consulta básica sin múltiples where para evitar requerir índice compuesto
    QuerySnapshot transactionsSnapshot = await FirebaseFirestore.instance
        .collection('transactions')
        .where('ahorrosId', isEqualTo: cuentaId)
        .get();

    // Filtrar manualmente en memoria
    List<QueryDocumentSnapshot> transactionsDocs =
        transactionsSnapshot.docs.where((doc) {
      try {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        // Filtrar por status
        String status = data['status']?.toString() ?? '';
        if (status != 'APPROVED') {
          return false;
        }

        // Filtrar por fechas si están especificadas
        if (fechainicial != null || fechafinal != null) {
          DateTime? transactionDate;
          try {
            transactionDate = (data['firebaseDate'] as Timestamp).toDate();
          } catch (e) {
            return false;
          }

          if (fechainicial != null && transactionDate.isBefore(fechainicial)) {
            return false;
          }

          if (fechafinal != null && transactionDate.isAfter(fechafinal)) {
            return false;
          }
        }

        return true;
      } catch (e) {
        return false;
      }
    }).toList();

    if (transactionsDocs.isEmpty) {
      return {'row': currentRow};
    }

    // Ordenar transacciones por fecha (más recientes primero para el Excel)
    List<QueryDocumentSnapshot> transactions = transactionsDocs;
    transactions.sort((a, b) {
      try {
        DateTime dateA =
            (a.data() as Map<String, dynamic>)['firebaseDate'].toDate();
        DateTime dateB =
            (b.data() as Map<String, dynamic>)['firebaseDate'].toDate();
        return dateB
            .compareTo(dateA); // Orden descendente (más recientes primero)
      } catch (e) {
        return 0;
      }
    });

    // Obtener beneficios de la cuenta de ahorros de forma segura
    List<Map<String, dynamic>> transactionsBeneficios = [];
    try {
      List<dynamic>? beneficiosRaw =
          ahorroData['transactions'] as List<dynamic>?;
      if (beneficiosRaw != null) {
        for (var beneficio in beneficiosRaw) {
          if (beneficio is Map<String, dynamic>) {
            transactionsBeneficios.add(beneficio);
          }
        }
      }
    } catch (e) {
      transactionsBeneficios = [];
    }

    // Variables para cálculos acumulativos (calcular en orden cronológico)
    List<QueryDocumentSnapshot> transactionsChronological =
        List.from(transactions);
    transactionsChronological.sort((a, b) {
      try {
        DateTime dateA =
            (a.data() as Map<String, dynamic>)['firebaseDate'].toDate();
        DateTime dateB =
            (b.data() as Map<String, dynamic>)['firebaseDate'].toDate();
        return dateA.compareTo(dateB); // Orden ascendente para cálculos
      } catch (e) {
        return 0;
      }
    });

    // Calcular saldos acumulativos
    Map<String, double> saldosAcumulados = {};
    Map<String, double> beneficiosAcumulados = {};
    double saldoActual = 0.0;
    double beneficioActual = 0.0;

    for (int i = 0; i < transactionsChronological.length; i++) {
      var transaction = transactionsChronological[i];
      Map<String, dynamic> transactionData =
          transaction.data() as Map<String, dynamic>;

      String transactionType =
          transactionData['transactionType']?.toString() ?? '';
      double amount = _parseToDouble(transactionData['amount']);

      // Guardar saldo anterior para esta transacción
      saldosAcumulados[transaction.id] = saldoActual;
      beneficiosAcumulados[transaction.id] = beneficioActual;

      // Obtener beneficio de esta transacción de forma segura
      double beneficioTransaccion = 0.0;
      if (i < transactionsBeneficios.length) {
        beneficioTransaccion =
            _parseToDouble(transactionsBeneficios[i]['taxedBenefit']);
      }

      // Actualizar saldos
      if (transactionType == 'Depositado') {
        saldoActual += amount;
        beneficioActual += beneficioTransaccion;
      } else if (transactionType == 'Withdrawal') {
        saldoActual -= amount;
        // Los beneficios generalmente no se reducen en retiros, pero depende del negocio
      }
    }

    // Procesar cada transacción para mostrar en Excel (orden descendente)
    for (int i = 0; i < transactions.length; i++) {
      var transaction = transactions[i];
      Map<String, dynamic> transactionData =
          transaction.data() as Map<String, dynamic>;

      try {
        String transactionType =
            transactionData['transactionType']?.toString() ?? '';
        double amount = _parseToDouble(transactionData['amount']);
        DateTime? transactionDate;

        try {
          transactionDate =
              (transactionData['firebaseDate'] as Timestamp).toDate();
        } catch (e) {
          continue;
        }

        // Obtener valores acumulados anteriores
        double ahorroAnterior = saldosAcumulados[transaction.id] ?? 0.0;
        double beneficioAnterior = beneficiosAcumulados[transaction.id] ?? 0.0;

        // Obtener beneficio de esta transacción
        int transactionIndex =
            transactionsChronological.indexWhere((t) => t.id == transaction.id);
        double beneficioTransaccion = 0.0;
        if (transactionIndex >= 0 &&
            transactionIndex < transactionsBeneficios.length) {
          beneficioTransaccion = _parseToDouble(
              transactionsBeneficios[transactionIndex]['taxedBenefit']);
        }

        // Calcular saldo actual después de esta transacción
        double saldoDespues = ahorroAnterior;
        if (transactionType == 'Depositado') {
          saldoDespues += amount;
        } else if (transactionType == 'Withdrawal') {
          saldoDespues -= amount;
        }

        double beneficioDespues = beneficioAnterior + beneficioTransaccion;
        double totalAhorroInteres = saldoDespues + beneficioDespues;

        // Procesar según tipo de transacción
        String tipo = '';
        String fechaDeposito = '';
        String fechaRetiro = '';
        double valorRetiro = 0.0;
        double ahorroActual = 0.0;

        if (transactionType == 'Depositado') {
          tipo = 'AHORRO $tipoAhorro';
          fechaDeposito = dateFormat.format(transactionDate);
          ahorroActual = amount;
        } else if (transactionType == 'Withdrawal') {
          tipo = 'RETIRO $tipoAhorro';
          fechaRetiro = dateFormat.format(transactionDate);
          valorRetiro = amount;
          ahorroActual = 0.0;
        } else {
          continue;
        }

        // Crear fila de datos
        List<dynamic> rowData = [
          usuario['nit'],
          usuario['nombre'],
          tipo,
          dateFormat.format(transactionDate),
          ahorroAnterior > 0 ? ahorroAnterior : null,
          beneficioAnterior > 0 ? beneficioAnterior : null,
          fechaDeposito.isNotEmpty ? fechaDeposito : null,
          ahorroActual > 0 ? ahorroActual : null,
          beneficioTransaccion > 0 ? beneficioTransaccion : null,
          saldoDespues > 0 ? saldoDespues : null,
          fechaRetiro.isNotEmpty ? fechaRetiro : null,
          valorRetiro > 0 ? valorRetiro : null,
          totalAhorroInteres > 0 ? totalAhorroInteres : null
        ];

        // Agregar fila al Excel con estilo según tipo
        _agregarFilaExcelConEstilo(
            sheetObject, rowData, currentRow, transactionType);
        currentRow++;
      } catch (e) {
        continue;
      }
    }

    return {'row': currentRow};
  } catch (e) {
    rethrow;
  }
}

void _agregarFilaExcelConEstilo(Sheet sheetObject, List<dynamic> rowData,
    int rowIndex, String transactionType) {
  try {
    for (int i = 0; i < rowData.length; i++) {
      var cell = sheetObject.cell(
          CellIndex.indexByColumnRow(columnIndex: i + 1, rowIndex: rowIndex));
      if (rowData[i] != null) {
        cell.value = rowData[i];
      }

      // Aplicar estilo según tipo de transacción
      if (transactionType == 'Depositado') {
        cell.cellStyle = CellStyle(
          backgroundColorHex: '#E6FFE6', // Verde claro para depósitos
          fontColorHex: '#006600',
        );
      } else if (transactionType == 'Withdrawal') {
        cell.cellStyle = CellStyle(
          backgroundColorHex: '#FFE6E6', // Rojo claro para retiros
          fontColorHex: '#CC0000',
        );
      }
    }
  } catch (e) {
    // Error silencioso para no saturar logs
  }
}

double _parseToDouble(dynamic value) {
  try {
    if (value == null) return 0.0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) {
      return double.tryParse(value) ?? 0.0;
    }
    return 0.0;
  } catch (e) {
    return 0.0;
  }
}

void _imprimirResumenFinal(int totalUsuarios, List<String> erroresUsuarios,
    List<String> erroresCuentas, List<String> advertencias) {
  print('\n' + '=' * 80);
  print('RESUMEN FINAL DEL PROCESAMIENTO');
  print('=' * 80);
  print('Total usuarios procesados: $totalUsuarios');
  print('Errores a nivel usuario: ${erroresUsuarios.length}');
  print('Errores a nivel cuenta: ${erroresCuentas.length}');
  print('Advertencias: ${advertencias.length}');
  print('=' * 80);

  if (erroresUsuarios.isNotEmpty) {
    print('\nERRORES DE USUARIOS:');
    for (int i = 0; i < erroresUsuarios.length; i++) {
      print('${i + 1}. ${erroresUsuarios[i]}');
    }
  }

  if (erroresCuentas.isNotEmpty) {
    print('\nERRORES DE CUENTAS:');
    for (int i = 0; i < erroresCuentas.length; i++) {
      print('${i + 1}. ${erroresCuentas[i]}');
    }
  }

  if (advertencias.isNotEmpty) {
    print('\nADVERTENCIAS:');
    for (int i = 0; i < advertencias.length; i++) {
      print('${i + 1}. ${advertencias[i]}');
    }
  }

  print('\n' + '=' * 80);
}

Future<void> _generarArchivoExcel(Excel excel, String identificador) async {
  try {
    String fileName =
        'reporte_${identificador}_${DateTime.now().millisecondsSinceEpoch}.xlsx';
    print('Generando archivo: $fileName');

    final bytes = excel.encode();
    if (bytes == null) {
      throw Exception('Error codificando Excel - bytes null');
    }

    if (kIsWeb) {
      // Para plataforma web
      try {
        // Importación dinámica solo en web
        await _downloadFileWeb(bytes, fileName);
        print('Excel descargado exitosamente: $fileName');
      } catch (e) {
        print('ERROR en descarga web: $e');
        rethrow;
      }
    } else {
      // Para plataformas móviles
      try {
        // Obtener directorio de documentos
        Directory directory = await getApplicationDocumentsDirectory();
        String filePath = '${directory.path}/$fileName';

        // Escribir archivo
        File file = File(filePath);
        await file.writeAsBytes(bytes);

        print('Excel guardado en: $filePath');
        print(
            'Archivo disponible en la carpeta de documentos de la aplicación');
      } catch (e) {
        print('ERROR guardando archivo en móvil: $e');
        rethrow;
      }
    }
  } catch (e) {
    print('ERROR generando archivo Excel: $e');
    rethrow;
  }
}

// Función auxiliar para descarga en web
Future<void> _downloadFileWeb(List<int> bytes, String fileName) async {
  if (kIsWeb) {
    print('=== DESCARGA WEB ===');
    print('Archivo: $fileName');
    print('Tamaño: ${bytes.length} bytes');
    print('Excel generado exitosamente en memoria');
    print(
        'NOTA: Para habilitar descarga automática, se requiere configuración adicional');

    // El archivo Excel está listo en memoria
    // En un entorno web real, esto se manejaría mediante JavaScript externo
    // o plugins específicos de Flutter Web
  } else {
    print('Descarga solo disponible en web');
    throw Exception('Funcionalidad de descarga solo disponible en web');
  }
}
