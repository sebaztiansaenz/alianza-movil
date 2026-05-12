import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CuentaCDATRecord extends FirestoreRecord {
  CuentaCDATRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "plazoMeses" field.
  int? _plazoMeses;
  int get plazoMeses => _plazoMeses ?? 0;
  bool hasPlazoMeses() => _plazoMeses != null;

  // "tipoCuenta" field.
  String? _tipoCuenta;
  String get tipoCuenta => _tipoCuenta ?? '';
  bool hasTipoCuenta() => _tipoCuenta != null;

  // "EA" field.
  double? _ea;
  double get ea => _ea ?? 0.0;
  bool hasEa() => _ea != null;

  // "montoTotal" field.
  double? _montoTotal;
  double get montoTotal => _montoTotal ?? 0.0;
  bool hasMontoTotal() => _montoTotal != null;

  // "Fecha_retiro" field.
  DateTime? _fechaRetiro;
  DateTime? get fechaRetiro => _fechaRetiro;
  bool hasFechaRetiro() => _fechaRetiro != null;

  // "fechacreacion" field.
  DateTime? _fechacreacion;
  DateTime? get fechacreacion => _fechacreacion;
  bool hasFechacreacion() => _fechacreacion != null;

  // "codigocuenta" field.
  int? _codigocuenta;
  int get codigocuenta => _codigocuenta ?? 0;
  bool hasCodigocuenta() => _codigocuenta != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _plazoMeses = castToType<int>(snapshotData['plazoMeses']);
    _tipoCuenta = snapshotData['tipoCuenta'] as String?;
    _ea = castToType<double>(snapshotData['EA']);
    _montoTotal = castToType<double>(snapshotData['montoTotal']);
    _fechaRetiro = snapshotData['Fecha_retiro'] as DateTime?;
    _fechacreacion = snapshotData['fechacreacion'] as DateTime?;
    _codigocuenta = castToType<int>(snapshotData['codigocuenta']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cuentaCDAT');

  static Stream<CuentaCDATRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CuentaCDATRecord.fromSnapshot(s));

  static Future<CuentaCDATRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CuentaCDATRecord.fromSnapshot(s));

  static CuentaCDATRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CuentaCDATRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CuentaCDATRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CuentaCDATRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CuentaCDATRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CuentaCDATRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCuentaCDATRecordData({
  DocumentReference? userRef,
  int? plazoMeses,
  String? tipoCuenta,
  double? ea,
  double? montoTotal,
  DateTime? fechaRetiro,
  DateTime? fechacreacion,
  int? codigocuenta,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'plazoMeses': plazoMeses,
      'tipoCuenta': tipoCuenta,
      'EA': ea,
      'montoTotal': montoTotal,
      'Fecha_retiro': fechaRetiro,
      'fechacreacion': fechacreacion,
      'codigocuenta': codigocuenta,
    }.withoutNulls,
  );

  return firestoreData;
}

class CuentaCDATRecordDocumentEquality implements Equality<CuentaCDATRecord> {
  const CuentaCDATRecordDocumentEquality();

  @override
  bool equals(CuentaCDATRecord? e1, CuentaCDATRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.plazoMeses == e2?.plazoMeses &&
        e1?.tipoCuenta == e2?.tipoCuenta &&
        e1?.ea == e2?.ea &&
        e1?.montoTotal == e2?.montoTotal &&
        e1?.fechaRetiro == e2?.fechaRetiro &&
        e1?.fechacreacion == e2?.fechacreacion &&
        e1?.codigocuenta == e2?.codigocuenta;
  }

  @override
  int hash(CuentaCDATRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.plazoMeses,
        e?.tipoCuenta,
        e?.ea,
        e?.montoTotal,
        e?.fechaRetiro,
        e?.fechacreacion,
        e?.codigocuenta
      ]);

  @override
  bool isValidKey(Object? o) => o is CuentaCDATRecord;
}
