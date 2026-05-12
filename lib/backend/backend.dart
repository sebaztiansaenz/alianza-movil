import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth/firebase_auth/auth_util.dart';

import '../flutter_flow/flutter_flow_util.dart';
import 'schema/util/firestore_util.dart';

import 'schema/user_record.dart';
import 'schema/credito_record.dart';
import 'schema/solicitante_record.dart';
import 'schema/cdat_record.dart';
import 'schema/cuota_creditos_record.dart';
import 'schema/ahorros_record.dart';
import 'schema/ahorros_ingresos_record.dart';
import 'schema/cuenta_c_d_a_t_record.dart';
import 'schema/empresa_record.dart';
import 'schema/comentarios_record.dart';
import 'schema/tipo_cuenta_ahorro_record.dart';
import 'schema/tipo_cuenta_credito_record.dart';
import 'schema/categoriasconvenios_record.dart';
import 'schema/listaconvenios_record.dart';
import 'schema/carruselconvenios_record.dart';
import 'schema/services_record.dart';
import 'schema/withdrawal_record.dart';
import 'schema/deposit_record.dart';
import 'schema/transactions_record.dart';
import 'schema/bank_accounts_record.dart';
import 'schema/version_record.dart';
import 'schema/banks_record.dart';
import 'schema/empresa_representative_record.dart';
import 'schema/cdats_record.dart';
import 'schema/retiros_cdat_record.dart';
import 'schema/confirmacionretiros_record.dart';
import 'schema/codigos_record.dart';
import 'schema/novedades_ahorros_record.dart';
import 'schema/solicitudes_nuevas_empresas_record.dart';
import 'schema/credito_solicitado_empresa_record.dart';
import 'schema/habilitar_credito_record.dart';

export 'dart:async' show StreamSubscription;
export 'package:cloud_firestore/cloud_firestore.dart' hide Order;
export 'package:firebase_core/firebase_core.dart';
export 'schema/index.dart';
export 'schema/util/firestore_util.dart';
export 'schema/util/schema_util.dart';

export 'schema/user_record.dart';
export 'schema/credito_record.dart';
export 'schema/solicitante_record.dart';
export 'schema/cdat_record.dart';
export 'schema/cuota_creditos_record.dart';
export 'schema/ahorros_record.dart';
export 'schema/ahorros_ingresos_record.dart';
export 'schema/cuenta_c_d_a_t_record.dart';
export 'schema/empresa_record.dart';
export 'schema/comentarios_record.dart';
export 'schema/tipo_cuenta_ahorro_record.dart';
export 'schema/tipo_cuenta_credito_record.dart';
export 'schema/categoriasconvenios_record.dart';
export 'schema/listaconvenios_record.dart';
export 'schema/carruselconvenios_record.dart';
export 'schema/services_record.dart';
export 'schema/withdrawal_record.dart';
export 'schema/deposit_record.dart';
export 'schema/transactions_record.dart';
export 'schema/bank_accounts_record.dart';
export 'schema/version_record.dart';
export 'schema/banks_record.dart';
export 'schema/empresa_representative_record.dart';
export 'schema/cdats_record.dart';
export 'schema/retiros_cdat_record.dart';
export 'schema/confirmacionretiros_record.dart';
export 'schema/codigos_record.dart';
export 'schema/novedades_ahorros_record.dart';
export 'schema/solicitudes_nuevas_empresas_record.dart';
export 'schema/credito_solicitado_empresa_record.dart';
export 'schema/habilitar_credito_record.dart';

/// Functions to query UserRecords (as a Stream and as a Future).
Future<int> queryUserRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      UserRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<UserRecord>> queryUserRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      UserRecord.collection,
      UserRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<UserRecord>> queryUserRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      UserRecord.collection,
      UserRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query CreditoRecords (as a Stream and as a Future).
Future<int> queryCreditoRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CreditoRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CreditoRecord>> queryCreditoRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CreditoRecord.collection,
      CreditoRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CreditoRecord>> queryCreditoRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CreditoRecord.collection,
      CreditoRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query SolicitanteRecords (as a Stream and as a Future).
Future<int> querySolicitanteRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      SolicitanteRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<SolicitanteRecord>> querySolicitanteRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      SolicitanteRecord.collection,
      SolicitanteRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<SolicitanteRecord>> querySolicitanteRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      SolicitanteRecord.collection,
      SolicitanteRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query CdatRecords (as a Stream and as a Future).
Future<int> queryCdatRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CdatRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CdatRecord>> queryCdatRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CdatRecord.collection,
      CdatRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CdatRecord>> queryCdatRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CdatRecord.collection,
      CdatRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query CuotaCreditosRecords (as a Stream and as a Future).
Future<int> queryCuotaCreditosRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CuotaCreditosRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CuotaCreditosRecord>> queryCuotaCreditosRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CuotaCreditosRecord.collection,
      CuotaCreditosRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CuotaCreditosRecord>> queryCuotaCreditosRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CuotaCreditosRecord.collection,
      CuotaCreditosRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query AhorrosRecords (as a Stream and as a Future).
Future<int> queryAhorrosRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      AhorrosRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<AhorrosRecord>> queryAhorrosRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      AhorrosRecord.collection,
      AhorrosRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<AhorrosRecord>> queryAhorrosRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      AhorrosRecord.collection,
      AhorrosRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query AhorrosIngresosRecords (as a Stream and as a Future).
Future<int> queryAhorrosIngresosRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      AhorrosIngresosRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<AhorrosIngresosRecord>> queryAhorrosIngresosRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      AhorrosIngresosRecord.collection,
      AhorrosIngresosRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<AhorrosIngresosRecord>> queryAhorrosIngresosRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      AhorrosIngresosRecord.collection,
      AhorrosIngresosRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query CuentaCDATRecords (as a Stream and as a Future).
Future<int> queryCuentaCDATRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CuentaCDATRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CuentaCDATRecord>> queryCuentaCDATRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CuentaCDATRecord.collection,
      CuentaCDATRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CuentaCDATRecord>> queryCuentaCDATRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CuentaCDATRecord.collection,
      CuentaCDATRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query EmpresaRecords (as a Stream and as a Future).
Future<int> queryEmpresaRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      EmpresaRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<EmpresaRecord>> queryEmpresaRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      EmpresaRecord.collection,
      EmpresaRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<EmpresaRecord>> queryEmpresaRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      EmpresaRecord.collection,
      EmpresaRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query ComentariosRecords (as a Stream and as a Future).
Future<int> queryComentariosRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ComentariosRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ComentariosRecord>> queryComentariosRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ComentariosRecord.collection,
      ComentariosRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ComentariosRecord>> queryComentariosRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ComentariosRecord.collection,
      ComentariosRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query TipoCuentaAhorroRecords (as a Stream and as a Future).
Future<int> queryTipoCuentaAhorroRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      TipoCuentaAhorroRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<TipoCuentaAhorroRecord>> queryTipoCuentaAhorroRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      TipoCuentaAhorroRecord.collection,
      TipoCuentaAhorroRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<TipoCuentaAhorroRecord>> queryTipoCuentaAhorroRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      TipoCuentaAhorroRecord.collection,
      TipoCuentaAhorroRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query TipoCuentaCreditoRecords (as a Stream and as a Future).
Future<int> queryTipoCuentaCreditoRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      TipoCuentaCreditoRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<TipoCuentaCreditoRecord>> queryTipoCuentaCreditoRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      TipoCuentaCreditoRecord.collection,
      TipoCuentaCreditoRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<TipoCuentaCreditoRecord>> queryTipoCuentaCreditoRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      TipoCuentaCreditoRecord.collection,
      TipoCuentaCreditoRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query CategoriasconveniosRecords (as a Stream and as a Future).
Future<int> queryCategoriasconveniosRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CategoriasconveniosRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CategoriasconveniosRecord>> queryCategoriasconveniosRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CategoriasconveniosRecord.collection,
      CategoriasconveniosRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CategoriasconveniosRecord>> queryCategoriasconveniosRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CategoriasconveniosRecord.collection,
      CategoriasconveniosRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query ListaconveniosRecords (as a Stream and as a Future).
Future<int> queryListaconveniosRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ListaconveniosRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ListaconveniosRecord>> queryListaconveniosRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ListaconveniosRecord.collection(parent),
      ListaconveniosRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ListaconveniosRecord>> queryListaconveniosRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ListaconveniosRecord.collection(parent),
      ListaconveniosRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query CarruselconveniosRecords (as a Stream and as a Future).
Future<int> queryCarruselconveniosRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CarruselconveniosRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CarruselconveniosRecord>> queryCarruselconveniosRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CarruselconveniosRecord.collection,
      CarruselconveniosRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CarruselconveniosRecord>> queryCarruselconveniosRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CarruselconveniosRecord.collection,
      CarruselconveniosRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query ServicesRecords (as a Stream and as a Future).
Future<int> queryServicesRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ServicesRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ServicesRecord>> queryServicesRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ServicesRecord.collection,
      ServicesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ServicesRecord>> queryServicesRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ServicesRecord.collection,
      ServicesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query WithdrawalRecords (as a Stream and as a Future).
Future<int> queryWithdrawalRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      WithdrawalRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<WithdrawalRecord>> queryWithdrawalRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      WithdrawalRecord.collection(parent),
      WithdrawalRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<WithdrawalRecord>> queryWithdrawalRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      WithdrawalRecord.collection(parent),
      WithdrawalRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query DepositRecords (as a Stream and as a Future).
Future<int> queryDepositRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      DepositRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<DepositRecord>> queryDepositRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      DepositRecord.collection(parent),
      DepositRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<DepositRecord>> queryDepositRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      DepositRecord.collection(parent),
      DepositRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query TransactionsRecords (as a Stream and as a Future).
Future<int> queryTransactionsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      TransactionsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<TransactionsRecord>> queryTransactionsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      TransactionsRecord.collection,
      TransactionsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<TransactionsRecord>> queryTransactionsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      TransactionsRecord.collection,
      TransactionsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query BankAccountsRecords (as a Stream and as a Future).
Future<int> queryBankAccountsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      BankAccountsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<BankAccountsRecord>> queryBankAccountsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      BankAccountsRecord.collection,
      BankAccountsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<BankAccountsRecord>> queryBankAccountsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      BankAccountsRecord.collection,
      BankAccountsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query VersionRecords (as a Stream and as a Future).
Future<int> queryVersionRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      VersionRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<VersionRecord>> queryVersionRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      VersionRecord.collection,
      VersionRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<VersionRecord>> queryVersionRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      VersionRecord.collection,
      VersionRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query BanksRecords (as a Stream and as a Future).
Future<int> queryBanksRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      BanksRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<BanksRecord>> queryBanksRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      BanksRecord.collection,
      BanksRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<BanksRecord>> queryBanksRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      BanksRecord.collection,
      BanksRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query EmpresaRepresentativeRecords (as a Stream and as a Future).
Future<int> queryEmpresaRepresentativeRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      EmpresaRepresentativeRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<EmpresaRepresentativeRecord>> queryEmpresaRepresentativeRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      EmpresaRepresentativeRecord.collection,
      EmpresaRepresentativeRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<EmpresaRepresentativeRecord>> queryEmpresaRepresentativeRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      EmpresaRepresentativeRecord.collection,
      EmpresaRepresentativeRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query CdatsRecords (as a Stream and as a Future).
Future<int> queryCdatsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CdatsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CdatsRecord>> queryCdatsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CdatsRecord.collection,
      CdatsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CdatsRecord>> queryCdatsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CdatsRecord.collection,
      CdatsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query RetirosCdatRecords (as a Stream and as a Future).
Future<int> queryRetirosCdatRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      RetirosCdatRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<RetirosCdatRecord>> queryRetirosCdatRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      RetirosCdatRecord.collection(parent),
      RetirosCdatRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<RetirosCdatRecord>> queryRetirosCdatRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      RetirosCdatRecord.collection(parent),
      RetirosCdatRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query ConfirmacionretirosRecords (as a Stream and as a Future).
Future<int> queryConfirmacionretirosRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ConfirmacionretirosRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ConfirmacionretirosRecord>> queryConfirmacionretirosRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ConfirmacionretirosRecord.collection(parent),
      ConfirmacionretirosRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ConfirmacionretirosRecord>> queryConfirmacionretirosRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ConfirmacionretirosRecord.collection(parent),
      ConfirmacionretirosRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query CodigosRecords (as a Stream and as a Future).
Future<int> queryCodigosRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CodigosRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CodigosRecord>> queryCodigosRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CodigosRecord.collection,
      CodigosRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CodigosRecord>> queryCodigosRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CodigosRecord.collection,
      CodigosRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query NovedadesAhorrosRecords (as a Stream and as a Future).
Future<int> queryNovedadesAhorrosRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      NovedadesAhorrosRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<NovedadesAhorrosRecord>> queryNovedadesAhorrosRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      NovedadesAhorrosRecord.collection,
      NovedadesAhorrosRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<NovedadesAhorrosRecord>> queryNovedadesAhorrosRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      NovedadesAhorrosRecord.collection,
      NovedadesAhorrosRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query SolicitudesNuevasEmpresasRecords (as a Stream and as a Future).
Future<int> querySolicitudesNuevasEmpresasRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      SolicitudesNuevasEmpresasRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<SolicitudesNuevasEmpresasRecord>>
    querySolicitudesNuevasEmpresasRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollection(
          SolicitudesNuevasEmpresasRecord.collection,
          SolicitudesNuevasEmpresasRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );

Future<List<SolicitudesNuevasEmpresasRecord>>
    querySolicitudesNuevasEmpresasRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollectionOnce(
          SolicitudesNuevasEmpresasRecord.collection,
          SolicitudesNuevasEmpresasRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );

/// Functions to query CreditoSolicitadoEmpresaRecords (as a Stream and as a Future).
Future<int> queryCreditoSolicitadoEmpresaRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CreditoSolicitadoEmpresaRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CreditoSolicitadoEmpresaRecord>>
    queryCreditoSolicitadoEmpresaRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollection(
          CreditoSolicitadoEmpresaRecord.collection,
          CreditoSolicitadoEmpresaRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );

Future<List<CreditoSolicitadoEmpresaRecord>>
    queryCreditoSolicitadoEmpresaRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollectionOnce(
          CreditoSolicitadoEmpresaRecord.collection,
          CreditoSolicitadoEmpresaRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );

/// Functions to query HabilitarCreditoRecords (as a Stream and as a Future).
Future<int> queryHabilitarCreditoRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      HabilitarCreditoRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<HabilitarCreditoRecord>> queryHabilitarCreditoRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      HabilitarCreditoRecord.collection,
      HabilitarCreditoRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<HabilitarCreditoRecord>> queryHabilitarCreditoRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      HabilitarCreditoRecord.collection,
      HabilitarCreditoRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<int> queryCollectionCount(
  Query collection, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0) {
    query = query.limit(limit);
  }

  return query.count().get().catchError((err) {
    print('Error querying $collection: $err');
  }).then((value) => value.count!);
}

Stream<List<T>> queryCollection<T>(
  Query collection,
  RecordBuilder<T> recordBuilder, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.snapshots().handleError((err) {
    print('Error querying $collection: $err');
  }).map((s) => s.docs
      .map(
        (d) => safeGet(
          () => recordBuilder(d),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .map((d) => d!)
      .toList());
}

Future<List<T>> queryCollectionOnce<T>(
  Query collection,
  RecordBuilder<T> recordBuilder, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.get().then((s) => s.docs
      .map(
        (d) => safeGet(
          () => recordBuilder(d),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .map((d) => d!)
      .toList());
}

Filter filterIn(String field, List? list) => (list?.isEmpty ?? true)
    ? Filter(field, whereIn: null)
    : Filter(field, whereIn: list);

Filter filterArrayContainsAny(String field, List? list) =>
    (list?.isEmpty ?? true)
        ? Filter(field, arrayContainsAny: null)
        : Filter(field, arrayContainsAny: list);

extension QueryExtension on Query {
  Query whereIn(String field, List? list) => (list?.isEmpty ?? true)
      ? where(field, whereIn: null)
      : where(field, whereIn: list);

  Query whereNotIn(String field, List? list) => (list?.isEmpty ?? true)
      ? where(field, whereNotIn: null)
      : where(field, whereNotIn: list);

  Query whereArrayContainsAny(String field, List? list) =>
      (list?.isEmpty ?? true)
          ? where(field, arrayContainsAny: null)
          : where(field, arrayContainsAny: list);
}

class FFFirestorePage<T> {
  final List<T> data;
  final Stream<List<T>>? dataStream;
  final QueryDocumentSnapshot? nextPageMarker;

  FFFirestorePage(this.data, this.dataStream, this.nextPageMarker);
}

Future<FFFirestorePage<T>> queryCollectionPage<T>(
  Query collection,
  RecordBuilder<T> recordBuilder, {
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
}) async {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection).limit(pageSize);
  if (nextPageMarker != null) {
    query = query.startAfterDocument(nextPageMarker);
  }
  Stream<QuerySnapshot>? docSnapshotStream;
  QuerySnapshot docSnapshot;
  if (isStream) {
    docSnapshotStream = query.snapshots();
    docSnapshot = await docSnapshotStream.first;
  } else {
    docSnapshot = await query.get();
  }
  final getDocs = (QuerySnapshot s) => s.docs
      .map(
        (d) => safeGet(
          () => recordBuilder(d),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .map((d) => d!)
      .toList();
  final data = getDocs(docSnapshot);
  final dataStream = docSnapshotStream?.map(getDocs);
  final nextPageToken = docSnapshot.docs.isEmpty ? null : docSnapshot.docs.last;
  return FFFirestorePage(data, dataStream, nextPageToken);
}

// Creates a Firestore document representing the logged in user if it doesn't yet exist
Future maybeCreateUser(User user) async {
  final userRecord = UserRecord.collection.doc(user.uid);
  final userExists = await userRecord.get().then((u) => u.exists);
  if (userExists) {
    currentUserDocument = await UserRecord.getDocumentOnce(userRecord);
    return;
  }

  final userData = createUserRecordData(
    email: user.email ??
        FirebaseAuth.instance.currentUser?.email ??
        user.providerData.firstOrNull?.email,
    displayName:
        user.displayName ?? FirebaseAuth.instance.currentUser?.displayName,
    photoUrl: user.photoURL,
    uid: user.uid,
    phoneNumber: user.phoneNumber,
    createdTime: getCurrentTimestamp,
  );

  await userRecord.set(userData);
  currentUserDocument = UserRecord.getDocumentFromData(userData, userRecord);
}

Future updateUserDocument({String? email}) async {
  await currentUserDocument?.reference
      .update(createUserRecordData(email: email));
}
