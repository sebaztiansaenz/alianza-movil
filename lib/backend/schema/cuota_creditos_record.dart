import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CuotaCreditosRecord extends FirestoreRecord {
  CuotaCreditosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "creditoRef" field.
  DocumentReference? _creditoRef;
  DocumentReference? get creditoRef => _creditoRef;
  bool hasCreditoRef() => _creditoRef != null;

  // "Estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  bool hasEstado() => _estado != null;

  // "Monto" field.
  double? _monto;
  double get monto => _monto ?? 0.0;
  bool hasMonto() => _monto != null;

  // "fechaPago" field.
  DateTime? _fechaPago;
  DateTime? get fechaPago => _fechaPago;
  bool hasFechaPago() => _fechaPago != null;

  // "comprobante" field.
  String? _comprobante;
  String get comprobante => _comprobante ?? '';
  bool hasComprobante() => _comprobante != null;

  // "oculto" field.
  bool? _oculto;
  bool get oculto => _oculto ?? false;
  bool hasOculto() => _oculto != null;

  // "cuotayinteres" field.
  double? _cuotayinteres;
  double get cuotayinteres => _cuotayinteres ?? 0.0;
  bool hasCuotayinteres() => _cuotayinteres != null;

  void _initializeFields() {
    _creditoRef = snapshotData['creditoRef'] as DocumentReference?;
    _estado = snapshotData['Estado'] as String?;
    _monto = castToType<double>(snapshotData['Monto']);
    _fechaPago = snapshotData['fechaPago'] as DateTime?;
    _comprobante = snapshotData['comprobante'] as String?;
    _oculto = snapshotData['oculto'] as bool?;
    _cuotayinteres = castToType<double>(snapshotData['cuotayinteres']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cuotaCreditos');

  static Stream<CuotaCreditosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CuotaCreditosRecord.fromSnapshot(s));

  static Future<CuotaCreditosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CuotaCreditosRecord.fromSnapshot(s));

  static CuotaCreditosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CuotaCreditosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CuotaCreditosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CuotaCreditosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CuotaCreditosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CuotaCreditosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCuotaCreditosRecordData({
  DocumentReference? creditoRef,
  String? estado,
  double? monto,
  DateTime? fechaPago,
  String? comprobante,
  bool? oculto,
  double? cuotayinteres,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'creditoRef': creditoRef,
      'Estado': estado,
      'Monto': monto,
      'fechaPago': fechaPago,
      'comprobante': comprobante,
      'oculto': oculto,
      'cuotayinteres': cuotayinteres,
    }.withoutNulls,
  );

  return firestoreData;
}

class CuotaCreditosRecordDocumentEquality
    implements Equality<CuotaCreditosRecord> {
  const CuotaCreditosRecordDocumentEquality();

  @override
  bool equals(CuotaCreditosRecord? e1, CuotaCreditosRecord? e2) {
    return e1?.creditoRef == e2?.creditoRef &&
        e1?.estado == e2?.estado &&
        e1?.monto == e2?.monto &&
        e1?.fechaPago == e2?.fechaPago &&
        e1?.comprobante == e2?.comprobante &&
        e1?.oculto == e2?.oculto &&
        e1?.cuotayinteres == e2?.cuotayinteres;
  }

  @override
  int hash(CuotaCreditosRecord? e) => const ListEquality().hash([
        e?.creditoRef,
        e?.estado,
        e?.monto,
        e?.fechaPago,
        e?.comprobante,
        e?.oculto,
        e?.cuotayinteres
      ]);

  @override
  bool isValidKey(Object? o) => o is CuotaCreditosRecord;
}
