import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CreditoRecord extends FirestoreRecord {
  CreditoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "montoTotal" field.
  double? _montoTotal;
  double get montoTotal => _montoTotal ?? 0.0;
  bool hasMontoTotal() => _montoTotal != null;

  // "cantidadCuotas" field.
  int? _cantidadCuotas;
  int get cantidadCuotas => _cantidadCuotas ?? 0;
  bool hasCantidadCuotas() => _cantidadCuotas != null;

  // "estadoLista" field.
  List<String>? _estadoLista;
  List<String> get estadoLista => _estadoLista ?? const [];
  bool hasEstadoLista() => _estadoLista != null;

  // "fechaLista" field.
  List<DateTime>? _fechaLista;
  List<DateTime> get fechaLista => _fechaLista ?? const [];
  bool hasFechaLista() => _fechaLista != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "isFinalizado" field.
  bool? _isFinalizado;
  bool get isFinalizado => _isFinalizado ?? false;
  bool hasIsFinalizado() => _isFinalizado != null;

  // "montoLista" field.
  List<double>? _montoLista;
  List<double> get montoLista => _montoLista ?? const [];
  bool hasMontoLista() => _montoLista != null;

  // "tipoCreditoName" field.
  String? _tipoCreditoName;
  String get tipoCreditoName => _tipoCreditoName ?? '';
  bool hasTipoCreditoName() => _tipoCreditoName != null;

  // "EA" field.
  double? _ea;
  double get ea => _ea ?? 0.0;
  bool hasEa() => _ea != null;

  // "fechacreacion" field.
  DateTime? _fechacreacion;
  DateTime? get fechacreacion => _fechacreacion;
  bool hasFechacreacion() => _fechacreacion != null;

  // "codigo" field.
  int? _codigo;
  int get codigo => _codigo ?? 0;
  bool hasCodigo() => _codigo != null;

  // "accountno" field.
  String? _accountno;
  String get accountno => _accountno ?? '';
  bool hasAccountno() => _accountno != null;

  void _initializeFields() {
    _montoTotal = castToType<double>(snapshotData['montoTotal']);
    _cantidadCuotas = castToType<int>(snapshotData['cantidadCuotas']);
    _estadoLista = getDataList(snapshotData['estadoLista']);
    _fechaLista = getDataList(snapshotData['fechaLista']);
    _user = snapshotData['user'] as DocumentReference?;
    _isFinalizado = snapshotData['isFinalizado'] as bool?;
    _montoLista = getDataList(snapshotData['montoLista']);
    _tipoCreditoName = snapshotData['tipoCreditoName'] as String?;
    _ea = castToType<double>(snapshotData['EA']);
    _fechacreacion = snapshotData['fechacreacion'] as DateTime?;
    _codigo = castToType<int>(snapshotData['codigo']);
    _accountno = snapshotData['accountno'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('credito');

  static Stream<CreditoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CreditoRecord.fromSnapshot(s));

  static Future<CreditoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CreditoRecord.fromSnapshot(s));

  static CreditoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CreditoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CreditoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CreditoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CreditoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CreditoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCreditoRecordData({
  double? montoTotal,
  int? cantidadCuotas,
  DocumentReference? user,
  bool? isFinalizado,
  String? tipoCreditoName,
  double? ea,
  DateTime? fechacreacion,
  int? codigo,
  String? accountno,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'montoTotal': montoTotal,
      'cantidadCuotas': cantidadCuotas,
      'user': user,
      'isFinalizado': isFinalizado,
      'tipoCreditoName': tipoCreditoName,
      'EA': ea,
      'fechacreacion': fechacreacion,
      'codigo': codigo,
      'accountno': accountno,
    }.withoutNulls,
  );

  return firestoreData;
}

class CreditoRecordDocumentEquality implements Equality<CreditoRecord> {
  const CreditoRecordDocumentEquality();

  @override
  bool equals(CreditoRecord? e1, CreditoRecord? e2) {
    const listEquality = ListEquality();
    return e1?.montoTotal == e2?.montoTotal &&
        e1?.cantidadCuotas == e2?.cantidadCuotas &&
        listEquality.equals(e1?.estadoLista, e2?.estadoLista) &&
        listEquality.equals(e1?.fechaLista, e2?.fechaLista) &&
        e1?.user == e2?.user &&
        e1?.isFinalizado == e2?.isFinalizado &&
        listEquality.equals(e1?.montoLista, e2?.montoLista) &&
        e1?.tipoCreditoName == e2?.tipoCreditoName &&
        e1?.ea == e2?.ea &&
        e1?.fechacreacion == e2?.fechacreacion &&
        e1?.codigo == e2?.codigo &&
        e1?.accountno == e2?.accountno;
  }

  @override
  int hash(CreditoRecord? e) => const ListEquality().hash([
        e?.montoTotal,
        e?.cantidadCuotas,
        e?.estadoLista,
        e?.fechaLista,
        e?.user,
        e?.isFinalizado,
        e?.montoLista,
        e?.tipoCreditoName,
        e?.ea,
        e?.fechacreacion,
        e?.codigo,
        e?.accountno
      ]);

  @override
  bool isValidKey(Object? o) => o is CreditoRecord;
}
