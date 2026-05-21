/// Valores de [UserRecord.estadoOfertaCredito] en Firestore (`user`).
abstract final class CreditoOfertaEstado {
  static const String preaprobado = 'preaprobado';
  static const String pendienteFirma = 'pendiente_firma';
  static const String rechazado = 'rechazado';
  static const String enDesembolso = 'en_desembolso';

  /// Resultado al cerrar [CreditoOfertaProcesoPage].
  static const String popPendienteFirma = 'pendiente_firma';
  static const String popEnDesembolso = 'en_desembolso';
}
