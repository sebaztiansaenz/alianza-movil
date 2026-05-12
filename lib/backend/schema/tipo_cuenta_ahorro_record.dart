import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TipoCuentaAhorroRecord extends FirestoreRecord {
  TipoCuentaAhorroRecord._(
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
      FirebaseFirestore.instance.collection('tipoCuentaAhorro');

  static Stream<TipoCuentaAhorroRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TipoCuentaAhorroRecord.fromSnapshot(s));

  static Future<TipoCuentaAhorroRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => TipoCuentaAhorroRecord.fromSnapshot(s));

  static TipoCuentaAhorroRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TipoCuentaAhorroRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TipoCuentaAhorroRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TipoCuentaAhorroRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TipoCuentaAhorroRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TipoCuentaAhorroRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTipoCuentaAhorroRecordData({
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

class TipoCuentaAhorroRecordDocumentEquality
    implements Equality<TipoCuentaAhorroRecord> {
  const TipoCuentaAhorroRecordDocumentEquality();

  @override
  bool equals(TipoCuentaAhorroRecord? e1, TipoCuentaAhorroRecord? e2) {
    return e1?.name == e2?.name && e1?.ea == e2?.ea;
  }

  @override
  int hash(TipoCuentaAhorroRecord? e) =>
      const ListEquality().hash([e?.name, e?.ea]);

  @override
  bool isValidKey(Object? o) => o is TipoCuentaAhorroRecord;
}
