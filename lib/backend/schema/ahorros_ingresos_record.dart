import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AhorrosIngresosRecord extends FirestoreRecord {
  AhorrosIngresosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Monto" field.
  double? _monto;
  double get monto => _monto ?? 0.0;
  bool hasMonto() => _monto != null;

  // "Fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "cuentaAhorro" field.
  DocumentReference? _cuentaAhorro;
  DocumentReference? get cuentaAhorro => _cuentaAhorro;
  bool hasCuentaAhorro() => _cuentaAhorro != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "comprobante" field.
  String? _comprobante;
  String get comprobante => _comprobante ?? '';
  bool hasComprobante() => _comprobante != null;

  // "oculto" field.
  bool? _oculto;
  bool get oculto => _oculto ?? false;
  bool hasOculto() => _oculto != null;

  void _initializeFields() {
    _monto = castToType<double>(snapshotData['Monto']);
    _fecha = snapshotData['Fecha'] as DateTime?;
    _cuentaAhorro = snapshotData['cuentaAhorro'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _comprobante = snapshotData['comprobante'] as String?;
    _oculto = snapshotData['oculto'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ahorrosIngresos');

  static Stream<AhorrosIngresosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AhorrosIngresosRecord.fromSnapshot(s));

  static Future<AhorrosIngresosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AhorrosIngresosRecord.fromSnapshot(s));

  static AhorrosIngresosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AhorrosIngresosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AhorrosIngresosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AhorrosIngresosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AhorrosIngresosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AhorrosIngresosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAhorrosIngresosRecordData({
  double? monto,
  DateTime? fecha,
  DocumentReference? cuentaAhorro,
  String? status,
  String? comprobante,
  bool? oculto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Monto': monto,
      'Fecha': fecha,
      'cuentaAhorro': cuentaAhorro,
      'status': status,
      'comprobante': comprobante,
      'oculto': oculto,
    }.withoutNulls,
  );

  return firestoreData;
}

class AhorrosIngresosRecordDocumentEquality
    implements Equality<AhorrosIngresosRecord> {
  const AhorrosIngresosRecordDocumentEquality();

  @override
  bool equals(AhorrosIngresosRecord? e1, AhorrosIngresosRecord? e2) {
    return e1?.monto == e2?.monto &&
        e1?.fecha == e2?.fecha &&
        e1?.cuentaAhorro == e2?.cuentaAhorro &&
        e1?.status == e2?.status &&
        e1?.comprobante == e2?.comprobante &&
        e1?.oculto == e2?.oculto;
  }

  @override
  int hash(AhorrosIngresosRecord? e) => const ListEquality().hash([
        e?.monto,
        e?.fecha,
        e?.cuentaAhorro,
        e?.status,
        e?.comprobante,
        e?.oculto
      ]);

  @override
  bool isValidKey(Object? o) => o is AhorrosIngresosRecord;
}
