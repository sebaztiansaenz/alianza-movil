import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TipoCuentaCreditoRecord extends FirestoreRecord {
  TipoCuentaCreditoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "ea" field.
  double? _ea;
  double get ea => _ea ?? 0.0;
  bool hasEa() => _ea != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _ea = castToType<double>(snapshotData['ea']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tipoCuentaCredito');

  static Stream<TipoCuentaCreditoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TipoCuentaCreditoRecord.fromSnapshot(s));

  static Future<TipoCuentaCreditoRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => TipoCuentaCreditoRecord.fromSnapshot(s));

  static TipoCuentaCreditoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TipoCuentaCreditoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TipoCuentaCreditoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TipoCuentaCreditoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TipoCuentaCreditoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TipoCuentaCreditoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTipoCuentaCreditoRecordData({
  String? name,
  double? ea,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'ea': ea,
    }.withoutNulls,
  );

  return firestoreData;
}

class TipoCuentaCreditoRecordDocumentEquality
    implements Equality<TipoCuentaCreditoRecord> {
  const TipoCuentaCreditoRecordDocumentEquality();

  @override
  bool equals(TipoCuentaCreditoRecord? e1, TipoCuentaCreditoRecord? e2) {
    return e1?.name == e2?.name && e1?.ea == e2?.ea;
  }

  @override
  int hash(TipoCuentaCreditoRecord? e) =>
      const ListEquality().hash([e?.name, e?.ea]);

  @override
  bool isValidKey(Object? o) => o is TipoCuentaCreditoRecord;
}
