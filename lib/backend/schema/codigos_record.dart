import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CodigosRecord extends FirestoreRecord {
  CodigosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "codigoretiroscdat" field.
  int? _codigoretiroscdat;
  int get codigoretiroscdat => _codigoretiroscdat ?? 0;
  bool hasCodigoretiroscdat() => _codigoretiroscdat != null;

  // "codigocdat" field.
  int? _codigocdat;
  int get codigocdat => _codigocdat ?? 0;
  bool hasCodigocdat() => _codigocdat != null;

  void _initializeFields() {
    _codigoretiroscdat = castToType<int>(snapshotData['codigoretiroscdat']);
    _codigocdat = castToType<int>(snapshotData['codigocdat']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('codigos');

  static Stream<CodigosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CodigosRecord.fromSnapshot(s));

  static Future<CodigosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CodigosRecord.fromSnapshot(s));

  static CodigosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CodigosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CodigosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CodigosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CodigosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CodigosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCodigosRecordData({
  int? codigoretiroscdat,
  int? codigocdat,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'codigoretiroscdat': codigoretiroscdat,
      'codigocdat': codigocdat,
    }.withoutNulls,
  );

  return firestoreData;
}

class CodigosRecordDocumentEquality implements Equality<CodigosRecord> {
  const CodigosRecordDocumentEquality();

  @override
  bool equals(CodigosRecord? e1, CodigosRecord? e2) {
    return e1?.codigoretiroscdat == e2?.codigoretiroscdat &&
        e1?.codigocdat == e2?.codigocdat;
  }

  @override
  int hash(CodigosRecord? e) =>
      const ListEquality().hash([e?.codigoretiroscdat, e?.codigocdat]);

  @override
  bool isValidKey(Object? o) => o is CodigosRecord;
}
