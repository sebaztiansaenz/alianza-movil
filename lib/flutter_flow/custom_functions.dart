import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

double sumaTotal(List<double> suma) {
  // passing a list of double sum it all and return the total
  double total = 0.0;
  for (double num in suma) {
    total += num;
  }
  return total;
}

bool listContainsItemCopy(
  List<AhorrosRecord> items,
  ServicesTipoStruct item,
) {
  const String specialType = "Linea de Ahorro de nómina";

  // 0. Verificar si la referencia del item YA está en la lista
  try {
    final alreadyExists = items.any((i) {
      // Acceso seguro al campo service_
      final serviceRef = i.service; // o i.toMap()['service_']
      return serviceRef == item.idServicio;
    });

    if (alreadyExists) {
      return false;
    }
  } catch (e) {
    print('Error checking existing items: $e');
  }

  // 1. Si es tipo nomina → se incluye siempre
  if (item.typesOfProductName == specialType) {
    return true;
  }

  // 2. Contar cuántos NO son tipo nomina
  final nonSpecialCount =
      items.where((i) => i.savingsType != specialType).length;

  if (nonSpecialCount >= 2) {
    return false;
  }

  // 3. Si no es nomina y no hay más restricciones, se puede agregar
  return true;
}

DateTime? febreroDate() {
  // return me the first day of the first month of the current year
// return me the first day of the second month of the current year
  DateTime now = DateTime.now();
  return DateTime(now.year, 2, 1);
}

DateTime? octubreDate() {
  // return me the first day of the first month of the current year
// return me the first day of the second month of the current year
  DateTime now = DateTime.now();
  return DateTime(now.year, 10, 1);
}

DateTime? marzoDate() {
  // return me the first day of the first month of the current year
// return me the first day of the second month of the current year
  DateTime now = DateTime.now();
  return DateTime(now.year, 3, 1);
}

DateTime? abrilDate() {
  // return me the first day of the first month of the current year
// return me the first day of the second month of the current year
  DateTime now = DateTime.now();
  return DateTime(now.year, 4, 1);
}

DateTime? agostoDate() {
  // return me the first day of the first month of the current year
// return me the first day of the second month of the current year
  DateTime now = DateTime.now();
  return DateTime(now.year, 8, 1);
}

DateTime? julioDate() {
  // return me the first day of the first month of the current year
// return me the first day of the second month of the current year
  DateTime now = DateTime.now();
  return DateTime(now.year, 7, 1);
}

DateTime? mayoDate() {
  // return me the first day of the first month of the current year
// return me the first day of the second month of the current year
  DateTime now = DateTime.now();
  return DateTime(now.year, 5, 1);
}

DateTime? junioDate() {
  // return me the first day of the first month of the current year
// return me the first day of the second month of the current year
  DateTime now = DateTime.now();
  return DateTime(now.year, 6, 1);
}

DateTime? diciembreDate() {
  // return me the first day of the first month of the current year
// return me the first day of the second month of the current year
  DateTime now = DateTime.now();
  return DateTime(now.year, 12, 1);
}

DateTime? noviembreDate() {
  // return me the first day of the first month of the current year
// return me the first day of the second month of the current year
  DateTime now = DateTime.now();
  return DateTime(now.year, 11, 1);
}

DateTime? setiembreDate() {
  // return me the first day of the first month of the current year
// return me the first day of the second month of the current year
  DateTime now = DateTime.now();
  return DateTime(now.year, 9, 1);
}

DateTime? eneroDate() {
  // return me the first day of the first month of the current year
  DateTime now = DateTime.now();
  return DateTime(now.year, 1, 1);
}

String formatAmountCopy(double amount) {
  // format amount to have . as seperator instead of commas after converting it to an integer
  String formattedAmount = amount.ceil().toString();
  String result = '';
  int count = 0;

  for (int i = formattedAmount.length - 1; i >= 0; i--) {
    result = formattedAmount[i] + result;
    count++;
    if (count % 3 == 0 && i != 0) {
      result = '.' + result;
    }
  }

  return '$result';
}

DateTime sumarmeses(
  DateTime fecha,
  int meses,
) {
  // sumar a la "fecha" la cantidad de meses de "meses"
  return fecha
      .add(Duration(days: meses * 30)); // Assuming each month has 30 days
}

bool isValidCE(String id) {
  // check if passportID meets this ^[a-zA-Z0-9_]{4,16}$
  RegExp regex = RegExp(r'^([a-zA-Z]{1,5})?[1-9][0-9]{3,7}$');
  return regex.hasMatch(id);
}

bool isValidNIT(String id) {
  // check if passportID meets this ^[a-zA-Z0-9_]{4,16}$
  RegExp regex = RegExp(r'^[1-9]\d{6,9}$');
  return regex.hasMatch(id);
}

bool isSameMonthCopy(
  DateTime date,
  DateTime mainDate,
) {
  // if it is the same month as current month
  return date.month == mainDate.month && date.year == mainDate.year;
}

bool isValidCC(String id) {
  // check if passportID meets this ^[a-zA-Z0-9_]{4,16}$
  RegExp regex = RegExp(r'^[1-9][0-9]{3,9}$');
  return regex.hasMatch(id);
}

String? camuflarcorreo(String correo) {
  //  solo los primeros 3 caracteres del correo y el
  if (correo == null || correo.isEmpty) {
    return null;
  }
  final parts = correo.split('@');
  if (parts.length != 2) {
    return correo;
  }
  final username = parts[0];
  final domain = parts[1];
  final maskedUsername = username
      .substring(0, math.min(3, username.length))
      .padRight(username.length, '*');
  final maskedDomain = domain
      .substring(0, math.min(3, domain.length))
      .padRight(domain.length, '*');
  return '$maskedUsername@$maskedDomain';
}

int? numberIncrementFunction(int? ahorroTotalNumber) {
  // need increment every time, if number == null then set 001 and if number  == not null then increment every time and return the incremented value
  if (ahorroTotalNumber == null) {
    return 001;
  } else {
    return ahorroTotalNumber + 1;
  }
}

double? stringtoDouble(String stringvalue) {
  try {
    return double.parse(stringvalue);
  } catch (e) {
    return null;
  }
}

int randomIdGenerate() {
  // every time generate unique random 6 to  8 digit int random number for user id then return it
  int min = 100000;
  int max = 99999999;
  math.Random random = math.Random();
  int randomNumber = min + random.nextInt(max - min);
  return randomNumber;
}

List<TransactionsStruct> filterTransactions(
  List<TransactionsStruct> transactions,
  String? type,
  String type2,
) {
  // filter transactions where transactionType field is equal to type
  return transactions
      .where((transaction) =>
          transaction.transactionType != type &&
          transaction.transactionType != type2)
      .toList();
}

List<TransactionsStruct> monthTransactions(
  List<TransactionsStruct> transactions,
  DateTime date,
) {
  // check the date field for each item in transactions if it is the same month of the year as date
  List<TransactionsStruct> filteredTransactions = [];
  for (TransactionsStruct transaction in transactions) {
    if (transaction.date?.month == date.month &&
        transaction.date?.year == date.year) {
      filteredTransactions.add(transaction);
    }
  }
  return filteredTransactions;
}

List<int> createListOfIndex(List<TransactionsStruct> items) {
  // create list of indexs of items
  List<int> indexes = [];
  for (int i = 0; i < items.length; i++) {
    indexes.add(i);
  }
  return indexes;
}

List<TransactionsStruct> filterByDate(
  List<TransactionsStruct> transactions,
  String year,
  String month,
) {
  // filter transactions by the date field, where month and year are the same of the month and year of the date field
  return transactions.where((transaction) {
    final transactionDate =
        transaction.date; // Assuming transaction.date is already DateTime?
    if (transactionDate == null) {
      return false; // Skip null dates
    }
    return transactionDate.year == int.parse(year) &&
        transactionDate.month == int.parse(month);
  }).toList();
}

bool isGreaterThan(
  double num1,
  double num2,
) {
  // check if num1 is greater than num2
  return num1 > num2;
}

String? before5th(
  String month,
  String year,
) {
  final now = DateTime.now();
  final currentMonth = now.month;
  final currentYear = now.year;

  // Convert month and year to integers
  final intMonth = int.tryParse(month);
  final intYear = int.tryParse(year);

  // Check for valid month and year input
  if (intMonth == null || intYear == null || intMonth < 1 || intMonth > 12) {
    return 'Mes o año escogido inválido.';
  }

  // Calculate the previous month and year
  final previousMonth = currentMonth == 1 ? 12 : currentMonth - 1;
  final previousYear = currentMonth == 1 ? currentYear - 1 : currentYear;

  // Check if the provided date is the previous month and year
  if (intMonth == previousMonth && intYear == previousYear) {
    // Check if today is on or after the 5th day of the current month
    final fifthDay = DateTime(currentYear, currentMonth, 5);
    if (now.isBefore(fifthDay)) {
      return 'No puede extraer el documento hasta el día 5 del presente mes.';
    }
  } else {
    // If it's not the previous month, ensure it's not the current or a future month
    final selectedDate = DateTime(intYear, intMonth, 1);
    final startOfCurrentMonth = DateTime(currentYear, currentMonth, 1);

    if (!selectedDate.isBefore(startOfCurrentMonth)) {
      return 'El mes elegido no debe ser el mes actual o un mes futuro.';
    }
  }

  return null;
}

String imagePathToString(String image) {
  // convert to string
  return image.toString();
}

String listToString(List<String> stringList) {
  // convert stringList ot a string with every item seperated by a comma
  return stringList.join(', ');
}

DateTime twelveMinsLater() {
  // 12 mintues from current time
  return DateTime.now().add(Duration(minutes: 20));
}

bool isBeforeTime(DateTime? setTime) {
  // is current time before setTime
  if (setTime == null) {
    return false;
  }

  DateTime currentTime = DateTime.now();
  return currentTime.isBefore(setTime);
}

bool isValidPassport(String passportID) {
  // check if passportID meets this ^[a-zA-Z0-9_]{4,16}$
  RegExp regex = RegExp(r'^[a-zA-Z0-9_]{4,16}$');
  return regex.hasMatch(passportID);
}

bool isValidPPT(String pptID) {
  // check if pptID is valid (6-15 alphanumeric characters)
  RegExp regex = RegExp(r'^[a-zA-Z0-9]{6,15}$');
  return regex.hasMatch(pptID);
}

String monthInSpanish(DateTime date) {
// return month in spanish
  final List<String> spanishMonths = [
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

  return spanishMonths[date.month - 1];
}

bool isCurrentMonth(DateTime date) {
  // is date month same as current month
  final now = DateTime.now();
  return date.month == now.month && date.year == now.year;
}

double benefitsTotal(List<AhorrosRecord> ahorrosDocs) {
  // // For every document in ahorrosDocs, substract TotalSavingsValue field from montoTotal field and return the sum of all the substractions
  double total = 0.0;
  for (var doc in ahorrosDocs) {
    total += doc.montoTotal - doc.totalSavingValue;
  }
  return total;
}

List<DateTime> monthsTillDate(DateTime date) {
// return first of the month from date till current month
  List<DateTime> monthsList = [];

  DateTime firstOfMonth = DateTime(date.year, date.month, 1);
  DateTime currentDate = DateTime.now();

  while (firstOfMonth.isBefore(currentDate)) {
    monthsList.add(firstOfMonth);
    firstOfMonth = DateTime(firstOfMonth.year, firstOfMonth.month + 1, 1);
  }

  return monthsList.reversed.toList();
}

bool isSameMonth(DateTime date) {
  // if it is the same month as current month
  return date.month == DateTime.now().month;
}

String toUppercase(String text) {
  // convert text to uppercase
  return text.toUpperCase();
}

int toInteger(double number) {
  // convert number to integer
  return number.toInt();
}

String formatAmount(double amount) {
  // format amount to have . as separator instead of commas after converting it to an integer
  String formattedAmount = amount.truncate().toString();
  String result = '';
  int count = 0;

  for (int i = formattedAmount.length - 1; i >= 0; i--) {
    result = formattedAmount[i] + result;
    count++;
    if (count % 3 == 0 && i != 0) {
      result = '.' + result;
    }
  }

  return '\$ $result';
}

List<String> createMonthsList(DateTime date) {
  // Create a list of months in this format Jan-24, Feb-24...
  // Start from the next month of the given date and stop at the current month.
  List<String> monthsList = [];
  DateTime now = DateTime.now();

  for (int i = 1; i <= 12; i++) {
    DateTime nextMonth = DateTime(date.year, date.month + i);
    if (nextMonth.isAfter(now)) break;

    String month = DateFormat.MMM().format(nextMonth);
    String year = DateFormat('yy').format(nextMonth);
    monthsList.add('$month-$year');
  }

  return monthsList;
}

bool listContainsItem(
  List<String> items,
  String item,
) {
  // does items contain item
  return items.contains(item);
}

List<String> yearsTillDate(DateTime date) {
  // list of years from date till current time
  List<String> years = [];
  int currentYear = DateTime.now().year;
  int startYear = date.year;

  for (int year = startYear; year <= currentYear; year++) {
    years.add(year.toString());
  }

  return years;
}

bool isSamePeriod(
  String year,
  String monthNumber,
  DateTime date,
) {
  // Format the input monthNumber to be two digits
  final formattedMonth = monthNumber.padLeft(2, '0');

  // Format the date as 'yyyy-MM'
  final formatter = DateFormat('yyyy-MM');
  final dateMonth = formatter.format(date);

  // Construct the input year-month in 'yyyy-MM' format
  final inputMonth = '$year-$formattedMonth';

  // Check if the formatted date and input match
  return dateMonth == inputMonth;
}

String makeNineCharacters(String cus) {
  // check is cus is less than 9 characters , if it is then add zeros in front to complete it
  if (cus.length < 9) {
    return cus.padLeft(9, '0');
  } else {
    return cus;
  }
}

DateTime horacero(
  DateTime fecha,
  bool inicio,
) {
  // Si inicio es true, entonces modifica fecha para que su hora sea 00:00. Y si inicio no es true, entonces modifica la fecha para que su hora sea 23:59
  if (inicio) {
    return DateTime(fecha.year, fecha.month, fecha.day, 0, 0, 0);
  } else {
    return DateTime(fecha.year, fecha.month, fecha.day, 23, 59, 59);
  }
}

String ocultaremail(String email) {
  // Oculta el email, ejemplo: lau******ian@gmail.com o sea quiero que solo se muestre como maximo las 3 primeras letras del inicio y las 3 letras del final de su nombre, el dominio se muestra completo, y si el correo es muy corto y se llega a mostrar todo, entonces ajusta para que solo se muestre la primera y la ultima, o como mejor creas conveniente
  if (email.length <= 5) {
    return email[0] + '*' + '*' + '*' + '*' + email[email.length - 1];
  } else {
    String name = email.substring(0, 3);
    String domain = email.substring(email.indexOf('@'));
    return '$name***$domain';
  }
}

bool fechasiguales(
  DateTime fechaone,
  DateTime fechatwo,
) {
  /// Compara solo año, mes y día de ambas fechas
  return fechaone.year == fechatwo.year &&
      fechaone.month == fechatwo.month &&
      fechaone.day == fechatwo.day;
}

List<AhorrosRecord> filterDocuments(List<AhorrosRecord>? ahorrosDocs) {
  // filter ahorrosDocs using lastDeposit field. If it has been more than a month add to list else remove. Also if the lastDeposit field is null or empty then add to list too
  if (ahorrosDocs == null) {
    return [];
  }

  final List<AhorrosRecord> filteredList = [];

  final now = DateTime.now();

  for (final record in ahorrosDocs) {
    if (record.lastDeposit == null) {
      filteredList.add(record);
    } else {
      //final lastDepositDate = record.lastDeposit;
      final difference = now.difference(record.lastDeposit!);
      if (difference.inDays > 30) {
        filteredList.add(record);
      }
    }
  }

  return filteredList;
}

String toISOString(DateTime date) {
  // convert date to ISO string format
  return date.toIso8601String();
}

double ahorroBenefitsTotal(List<AhorrosRecord> ahorrosDocs) {
  // for each document in ahorrosDocs, "transactions" field is a list of objects. Sum all the "taxedBenefit" fields in "transactions"
  double total = 0.0;

  for (var doc in ahorrosDocs) {
    for (var transaction in doc.transactions) {
      total += transaction.taxedBenefit;
    }
  }

  return total;
}

bool isOnOrBefore(
  DateTime dateMain,
  DateTime date2,
) {
  // is date2 before dateMain, compare just month and year
  if (date2.year < dateMain.year) {
    return true;
  } else if (dateMain.year == date2.year && dateMain.month >= date2.month) {
    return true;
  } else {
    return false;
  }
}

String capitalizeFirstLetter(String text) {
  // capitalize first letter of text
  if (text.isEmpty) {
    return text;
  }
  return text[0].toUpperCase() + text.substring(1);
}

String convertToBase64String(FFUploadedFile uploadedPDF) {
  if (uploadedPDF.bytes == null) {
    return ''; // Return an empty string or throw an exception
  }

  // Convert uploadedPDF to base64 string
  return base64Encode(uploadedPDF.bytes!);
}

bool past5Mins(DateTime lastAction) {
  // Nombre histórico FlutterFlow; el umbral real es 8 min (kSessionInactivityMinutes).
  return DateTime.now().difference(lastAction).inMinutes >= 8;
}

int contarCaracteres(String text) {
  // funcion para contar el número de caracteres
  return text.length; // Return the length of the input string
}

String restarfechas(
  DateTime fechainicio,
  DateTime fechaactual,
) {
  // Calcula la diferencia como Duration
  final diferencia = fechaactual.difference(fechainicio);

  // Extrae horas, minutos y segundos
  final horas = diferencia.inHours;
  final minutos = diferencia.inMinutes.remainder(60);
  final segundos = diferencia.inSeconds.remainder(60);

  // Formatea con ceros a la izquierda
  final tiempoTranscurrido = '${horas.toString().padLeft(2, '0')}:'
      '${minutos.toString().padLeft(2, '0')}:'
      '${segundos.toString().padLeft(2, '0')}';

  // Para depuración puedes descomentar:
  // print('Tiempo transcurrido: $tiempoTranscurrido');

  return tiempoTranscurrido;
}

DateTime sumarmesess(
  DateTime fechainicial,
  int meses,
) {
  if (meses == 0)
    return DateTime(fechainicial.year, fechainicial.month, fechainicial.day);

  // Calcular meses totales de forma eficiente
  int mesesTotales = (fechainicial.year * 12) + fechainicial.month - 1 + meses;

  // Obtener año y mes destino
  int ano = mesesTotales ~/ 12;
  int mes = (mesesTotales % 12) + 1;
  int dia = fechainicial.day;

  // Obtener último día del mes destino
  int ultimoDia = DateTime(ano, mes + 1, 0).day;

  // Ajustar día si no existe en el mes destino
  if (dia > ultimoDia) {
    dia = ultimoDia;
  }

  // Retornar fecha a las 00:00:00
  return DateTime(ano, mes, dia);
}

DateTime sumarrestardias(
  DateTime dateinicial,
  int dias,
  bool sumar,
) {
  return sumar
      ? dateinicial.add(Duration(days: dias))
      : dateinicial.subtract(Duration(days: dias));
}

double sumarbeneficioscdat(
  List<CdatsRecord> cdats,
  DateTime fechaactual,
) {
  double totalBeneficios = 0.0;

  for (CdatsRecord cdat in cdats) {
    // Obtener los valores del registro
    DateTime? fechaApertura = cdat.fechaApertura;
    double? ganancias = cdat.ganancias;
    int? tiempo = cdat.tiempo;

    // Verificar que todos los valores requeridos no sean nulos
    if (fechaApertura == null || ganancias == null || tiempo == null) {
      continue; // Saltar este registro si algún valor es nulo
    }

    // Determinar divisiones según el tiempo
    int divisiones =
        tiempo == 6 ? 2 : 4; // 6 meses = 2 divisiones, 12 meses = 4 divisiones
    double beneficioPorDivision = ganancias / divisiones;

    // Calcular cuántos beneficios se han liberado hasta la fecha actual
    int beneficiosLiberados = 0;

    for (int i = 0; i < divisiones; i++) {
      // Calcular la fecha de liberación (cada 3 meses)
      DateTime fechaLiberacion = DateTime(
        fechaApertura.year,
        fechaApertura.month + (3 * (i + 1)),
        fechaApertura.day,
      );

      // Si la fecha actual es mayor o igual a la fecha de liberación, se libera el beneficio
      if (fechaactual.isAfter(fechaLiberacion) ||
          fechaactual.isAtSameMomentAs(fechaLiberacion)) {
        beneficiosLiberados++;
      } else {
        break; // No seguir verificando fechas futuras
      }
    }

    // Sumar al total los beneficios liberados
    totalBeneficios += beneficiosLiberados * beneficioPorDivision;
  }

  return totalBeneficios;
}

double sumarbeneficioscdatCopys(
  DateTime fechaApertura,
  double ganancias,
  int tiempo,
  DateTime fechaactual,
) {
  int divisiones = tiempo == 6 ? 2 : 4;
  double beneficioPorDivision = ganancias / divisiones;
  int beneficiosLiberados = 0;

  for (int i = 0; i < divisiones; i++) {
    DateTime fechaLiberacion = DateTime(
      fechaApertura.year,
      fechaApertura.month + (3 * (i + 1)),
      fechaApertura.day,
    );

    if (fechaactual.isAfter(fechaLiberacion) ||
        fechaactual.isAtSameMomentAs(fechaLiberacion)) {
      beneficiosLiberados++;
    } else {
      break;
    }
  }

  return beneficiosLiberados * beneficioPorDivision;
}

bool mismomes(
  DateTime? dateinicial,
  DateTime? datefinal,
) {
  // Verificar si algún valor es nulo
  if (dateinicial == null || datefinal == null) {
    return false;
  }

  // true si "dateinicial" tiene el mismo mes y el mismo año que "datefinal"
  return dateinicial.year == datefinal.year &&
      dateinicial.month == datefinal.month;
}

List<String> getFuentes() {
  // Quiero una función en Flutter que devuelva una lista de dos números: el primero debe ser el tamaño de fuente predeterminado del sistema del dispositivo (defaultFontSize) y el segundo el factor de escala de texto configurado por el usuario (textScaleFactor).
  double defaultFontSize = 14.0; // Tamaño de fuente predeterminado
  double textScaleFactor = WidgetsBinding.instance?.window.textScaleFactor ??
      1.0; // Factor de escala de texto
  return [
    defaultFontSize.toString(),
    textScaleFactor.toString()
  ]; // Devolver la lista como cadena
}

bool cuentaMontos(
  List<double> montos,
  double minimo,
) {
  // Si algun monto del parámetro "montos" es mayor o igual a el monto del parámetro mínimo entonces retorna true, si no, retorna false
  // Si algún monto del parámetro "montos" es mayor o igual al monto del parámetro mínimo entonces retorna true, si no, retorna false
  for (double monto in montos) {
    if (monto >= minimo) {
      return true;
    }
  }
  return false;
}

int countSameMonth(
  List<ConfirmacionretirosRecord> list,
  DateTime month,
) {
  return list
      .where((e) =>
          e.fecharetiro != null &&
          e.fecharetiro!.year == month.year &&
          e.fecharetiro!.month == month.month)
      .length;
}

bool? hasLineaRestringida(List<AhorrosRecord> ahorros) {
  final tieneNomina = ahorros.any(
    (e) => e.savingsType == 'Linea de Ahorro de nómina',
  );
  final tieneProposito = ahorros.any(
    (e) => e.savingsType == 'Linea de Ahorro con Propósito',
  );

  return tieneNomina && tieneProposito;
}

bool? hasAhorrosPendientes(List<AhorrosRecord> ahorros) {
  return ahorros.isNotEmpty;
}

bool? isTotalLoaded(
  List<TotalDepositoAhorroStruct> totales,
  String ahorroId,
) {
  return totales.any((e) => e.ahorroid == ahorroId);
}

bool? esCdatNuevo(DateTime? fechacreacion) {
  if (fechacreacion == null) {
    print('DEBUG: fechacreacion es NULL');
    return false;
  }

  final ahora = DateTime.now().toUtc();
  final fechaUtc = fechacreacion.toUtc();
  final diferencia = ahora.difference(fechaUtc);

  print('DEBUG: fechacreacion = $fechacreacion');
  print('DEBUG: ahora UTC = $ahora');
  print('DEBUG: diferencia horas = ${diferencia.inHours}');

  return diferencia.inHours < 24;
}
