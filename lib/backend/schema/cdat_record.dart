import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CdatRecord extends FirestoreRecord {
  CdatRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "monto" field.
  double? _monto;
  double get monto => _monto ?? 0.0;
  bool hasMonto() => _monto != null;

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "plazoMeses" field.
  int? _plazoMeses;
  int get plazoMeses => _plazoMeses ?? 0;
  bool hasPlazoMeses() => _plazoMeses != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "comprobante" field.
  String? _comprobante;
  String get comprobante => _comprobante ?? '';
  bool hasComprobante() => _comprobante != null;

  // "cuentaCDAT" field.
  DocumentReference? _cuentaCDAT;
  DocumentReference? get cuentaCDAT => _cuentaCDAT;
  bool hasCuentaCDAT() => _cuentaCDAT != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "oculto" field.
  bool? _oculto;
  bool get oculto => _oculto ?? false;
  bool hasOculto() => _oculto != null;

  void _initializeFields() {
    _monto = castToType<double>(snapshotData['monto']);
    _fecha = snapshotData['fecha'] as DateTime?;
    _plazoMeses = castToType<int>(snapshotData['plazoMeses']);
    _user = snapshotData['user'] as DocumentReference?;
    _comprobante = snapshotData['comprobante'] as String?;
    _cuentaCDAT = snapshotData['cuentaCDAT'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _oculto = snapshotData['oculto'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cdat');

  static Stream<CdatRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CdatRecord.fromSnapshot(s));

  static Future<CdatRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CdatRecord.fromSnapshot(s));

  static CdatRecord fromSnapshot(DocumentSnapshot snapshot) => CdatRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CdatRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CdatRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CdatRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CdatRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCdatRecordData({
  double? monto,
  DateTime? fecha,
  int? plazoMeses,
  DocumentReference? user,
  String? comprobante,
  DocumentReference? cuentaCDAT,
  String? status,
  bool? oculto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'monto': monto,
      'fecha': fecha,
      'plazoMeses': plazoMeses,
      'user': user,
      'comprobante': comprobante,
      'cuentaCDAT': cuentaCDAT,
      'status': status,
      'oculto': oculto,
    }.withoutNulls,
  );

  return firestoreData;
}

class CdatRecordDocumentEquality implements Equality<CdatRecord> {
  const CdatRecordDocumentEquality();

  @override
  bool equals(CdatRecord? e1, CdatRecord? e2) {
    return e1?.monto == e2?.monto &&
        e1?.fecha == e2?.fecha &&
        e1?.plazoMeses == e2?.plazoMeses &&
        e1?.user == e2?.user &&
        e1?.comprobante == e2?.comprobante &&
        e1?.cuentaCDAT == e2?.cuentaCDAT &&
        e1?.status == e2?.status &&
        e1?.oculto == e2?.oculto;
  }

  @override
  int hash(CdatRecord? e) => const ListEquality().hash([
        e?.monto,
        e?.fecha,
        e?.plazoMeses,
        e?.user,
        e?.comprobante,
        e?.cuentaCDAT,
        e?.status,
        e?.oculto
      ]);

  @override
  bool isValidKey(Object? o) => o is CdatRecord;
}
