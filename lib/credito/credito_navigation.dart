import 'package:flutter/material.dart';

import '/flutter_flow/session_inactivity.dart';

/// [MaterialPageRoute] para pantallas de crédito abiertas con `Navigator.push`.
/// Reinicia el contador de inactividad al entrar (evita que siga el de la pestaña principal).
MaterialPageRoute<T> creditoMaterialPageRoute<T extends Object?>(
  Widget page, {
  String? name,
}) {
  final routeName = name ?? page.runtimeType.toString();
  return MaterialPageRoute<T>(
    settings: RouteSettings(name: routeName),
    builder: (_) => SessionActivityPage(child: page),
  );
}
