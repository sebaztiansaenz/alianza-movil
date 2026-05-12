import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarruselconveniosRecord extends FirestoreRecord {
  CarruselconveniosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "foto" field.
  String? _foto;
  String get foto => _foto ?? '';
  bool hasFoto() => _foto != null;

  void _initializeFields() {
    _nombre = snapshotData['nombre'] as String?;
    _foto = snapshotData['foto'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('carruselconvenios');

  static Stream<CarruselconveniosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CarruselconveniosRecord.fromSnapshot(s));

  static Future<CarruselconveniosRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CarruselconveniosRecord.fromSnapshot(s));

  static CarruselconveniosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CarruselconveniosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CarruselconveniosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CarruselconveniosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CarruselconveniosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CarruselconveniosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCarruselconveniosRecordData({
  String? nombre,
  String? foto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre': nombre,
      'foto': foto,
    }.withoutNulls,
  );

  return firestoreData;
}

class CarruselconveniosRecordDocumentEquality
    implements Equality<CarruselconveniosRecord> {
  const CarruselconveniosRecordDocumentEquality();

  @override
  bool equals(CarruselconveniosRecord? e1, CarruselconveniosRecord? e2) {
    return e1?.nombre == e2?.nombre && e1?.foto == e2?.foto;
  }

  @override
  int hash(CarruselconveniosRecord? e) =>
      const ListEquality().hash([e?.nombre, e?.foto]);

  @override
  bool isValidKey(Object? o) => o is CarruselconveniosRecord;
}
