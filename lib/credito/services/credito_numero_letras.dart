/// Convierte montos enteros (COP) a texto en español para documentos legales.
String creditoMontoEnLetras(int monto) {
  if (monto <= 0) return 'CERO PESOS';
  final letras = _enteroEnLetras(monto);
  return '$letras PESOS M/CTE';
}

String _enteroEnLetras(int n) {
  if (n == 0) return 'CERO';
  if (n < 0) return 'MENOS ${_enteroEnLetras(-n)}';

  const unidades = [
    '',
    'UN',
    'DOS',
    'TRES',
    'CUATRO',
    'CINCO',
    'SEIS',
    'SIETE',
    'OCHO',
    'NUEVE',
  ];
  const especiales = [
    'DIEZ',
    'ONCE',
    'DOCE',
    'TRECE',
    'CATORCE',
    'QUINCE',
    'DIECISEIS',
    'DIECISIETE',
    'DIECIOCHO',
    'DIECINUEVE',
  ];
  const decenas = [
    '',
    '',
    'VEINTE',
    'TREINTA',
    'CUARENTA',
    'CINCUENTA',
    'SESENTA',
    'SETENTA',
    'OCHENTA',
    'NOVENTA',
  ];

  /// Solo 0–99 (unidades + decenas).
  String bajoCien(int x) {
    if (x == 0) return '';
    if (x < 10) return unidades[x];
    if (x < 20) return especiales[x - 10];
    if (x < 30) {
      return x == 20 ? 'VEINTE' : 'VEINTI${unidades[x - 20]}';
    }
    final d = x ~/ 10;
    final u = x % 10;
    if (d < 0 || d >= decenas.length) return '$x';
    return u == 0 ? decenas[d] : '${decenas[d]} Y ${unidades[u]}';
  }

  /// 1–999.
  String bajoMil(int x) {
    if (x == 0) return '';
    if (x < 100) return bajoCien(x);
    return _grupoCentenas(x, bajoCien);
  }

  /// 1–999_999.
  String bajoMillon(int x) {
    if (x == 0) return '';
    if (x < 1000) return bajoMil(x);
    final miles = x ~/ 1000;
    final resto = x % 1000;
    final milesText =
        miles == 1 ? 'MIL' : '${bajoMil(miles)} MIL';
    if (resto == 0) return milesText;
    return '$milesText ${bajoMil(resto)}'.trim();
  }

  if (n < 1000) return _grupoCentenas(n, bajoCien);
  if (n < 1000000) return bajoMillon(n);

  final millones = n ~/ 1000000;
  final resto = n % 1000000;
  final head = millones == 1
      ? 'UN MILLON'
      : '${_enteroEnLetras(millones)} MILLONES';
  if (resto == 0) return head;
  return '$head ${bajoMillon(resto)}'.trim();
}

String _grupoCentenas(int x, String Function(int) bajo) {
  if (x == 0) return '';
  if (x == 100) return 'CIEN';
  if (x < 100) return bajo(x);
  final c = x ~/ 100;
  final r = x % 100;
  final cent =
      c == 1 && r > 0 ? 'CIENTO' : c == 1 ? 'CIEN' : _centena(c);
  if (r == 0) return cent;
  return '$cent ${bajo(r)}'.trim();
}

String _centena(int c) {
  const n = [
    '',
    'CIEN',
    'DOSCIENTOS',
    'TRESCIENTOS',
    'CUATROCIENTOS',
    'QUINIENTOS',
    'SEISCIENTOS',
    'SETECIENTOS',
    'OCHOCIENTOS',
    'NOVECIENTOS',
  ];
  if (c < 0 || c >= n.length) return '';
  return n[c];
}
