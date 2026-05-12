import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoriasconveniosRecord extends FirestoreRecord {
  CategoriasconveniosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "imagenprincipal" field.
  String? _imagenprincipal;
  String get imagenprincipal => _imagenprincipal ?? '';
  bool hasImagenprincipal() => _imagenprincipal != null;

  void _initializeFields() {
    _nombre = snapshotData['nombre'] as String?;
    _imagenprincipal = snapshotData['imagenprincipal'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('categoriasconvenios');

  static Stream<CategoriasconveniosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoriasconveniosRecord.fromSnapshot(s));

  static Future<CategoriasconveniosRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CategoriasconveniosRecord.fromSnapshot(s));

  static CategoriasconveniosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoriasconveniosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoriasconveniosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoriasconveniosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoriasconveniosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoriasconveniosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoriasconveniosRecordData({
  String? nombre,
  String? imagenprincipal,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre': nombre,
      'imagenprincipal': imagenprincipal,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoriasconveniosRecordDocumentEquality
    implements Equality<CategoriasconveniosRecord> {
  const CategoriasconveniosRecordDocumentEquality();

  @override
  bool equals(CategoriasconveniosRecord? e1, CategoriasconveniosRecord? e2) {
    return e1?.nombre == e2?.nombre &&
        e1?.imagenprincipal == e2?.imagenprincipal;
  }

  @override
  int hash(CategoriasconveniosRecord? e) =>
      const ListEquality().hash([e?.nombre, e?.imagenprincipal]);

  @override
  bool isValidKey(Object? o) => o is CategoriasconveniosRecord;
}
