import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RetirosCdatRecord extends FirestoreRecord {
  RetirosCdatRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Monto" field.
  double? _monto;
  double get monto => _monto ?? 0.0;
  bool hasMonto() => _monto != null;

  // "Fecharetiro" field.
  DateTime? _fecharetiro;
  DateTime? get fecharetiro => _fecharetiro;
  bool hasFecharetiro() => _fecharetiro != null;

  // "Estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  bool hasEstado() => _estado != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _monto = castToType<double>(snapshotData['Monto']);
    _fecharetiro = snapshotData['Fecharetiro'] as DateTime?;
    _estado = snapshotData['Estado'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('RetirosCdat')
          : FirebaseFirestore.instance.collectionGroup('RetirosCdat');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('RetirosCdat').doc(id);

  static Stream<RetirosCdatRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RetirosCdatRecord.fromSnapshot(s));

  static Future<RetirosCdatRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RetirosCdatRecord.fromSnapshot(s));

  static RetirosCdatRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RetirosCdatRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RetirosCdatRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RetirosCdatRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RetirosCdatRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RetirosCdatRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRetirosCdatRecordData({
  double? monto,
  DateTime? fecharetiro,
  String? estado,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Monto': monto,
      'Fecharetiro': fecharetiro,
      'Estado': estado,
    }.withoutNulls,
  );

  return firestoreData;
}

class RetirosCdatRecordDocumentEquality implements Equality<RetirosCdatRecord> {
  const RetirosCdatRecordDocumentEquality();

  @override
  bool equals(RetirosCdatRecord? e1, RetirosCdatRecord? e2) {
    return e1?.monto == e2?.monto &&
        e1?.fecharetiro == e2?.fecharetiro &&
        e1?.estado == e2?.estado;
  }

  @override
  int hash(RetirosCdatRecord? e) =>
      const ListEquality().hash([e?.monto, e?.fecharetiro, e?.estado]);

  @override
  bool isValidKey(Object? o) => o is RetirosCdatRecord;
}
