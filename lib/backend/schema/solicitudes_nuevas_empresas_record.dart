import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SolicitudesNuevasEmpresasRecord extends FirestoreRecord {
  SolicitudesNuevasEmpresasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nombreEmpresa" field.
  String? _nombreEmpresa;
  String get nombreEmpresa => _nombreEmpresa ?? '';
  bool hasNombreEmpresa() => _nombreEmpresa != null;

  // "nitEmpresa" field.
  String? _nitEmpresa;
  String get nitEmpresa => _nitEmpresa ?? '';
  bool hasNitEmpresa() => _nitEmpresa != null;

  // "numerodeTelefono" field.
  int? _numerodeTelefono;
  int get numerodeTelefono => _numerodeTelefono ?? 0;
  bool hasNumerodeTelefono() => _numerodeTelefono != null;

  // "correoCorporativo" field.
  String? _correoCorporativo;
  String get correoCorporativo => _correoCorporativo ?? '';
  bool hasCorreoCorporativo() => _correoCorporativo != null;

  void _initializeFields() {
    _nombreEmpresa = snapshotData['nombreEmpresa'] as String?;
    _nitEmpresa = snapshotData['nitEmpresa'] as String?;
    _numerodeTelefono = castToType<int>(snapshotData['numerodeTelefono']);
    _correoCorporativo = snapshotData['correoCorporativo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('solicitudesNuevasEmpresas');

  static Stream<SolicitudesNuevasEmpresasRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => SolicitudesNuevasEmpresasRecord.fromSnapshot(s));

  static Future<SolicitudesNuevasEmpresasRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SolicitudesNuevasEmpresasRecord.fromSnapshot(s));

  static SolicitudesNuevasEmpresasRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      SolicitudesNuevasEmpresasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SolicitudesNuevasEmpresasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SolicitudesNuevasEmpresasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SolicitudesNuevasEmpresasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SolicitudesNuevasEmpresasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSolicitudesNuevasEmpresasRecordData({
  String? nombreEmpresa,
  String? nitEmpresa,
  int? numerodeTelefono,
  String? correoCorporativo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombreEmpresa': nombreEmpresa,
      'nitEmpresa': nitEmpresa,
      'numerodeTelefono': numerodeTelefono,
      'correoCorporativo': correoCorporativo,
    }.withoutNulls,
  );

  return firestoreData;
}

class SolicitudesNuevasEmpresasRecordDocumentEquality
    implements Equality<SolicitudesNuevasEmpresasRecord> {
  const SolicitudesNuevasEmpresasRecordDocumentEquality();

  @override
  bool equals(SolicitudesNuevasEmpresasRecord? e1,
      SolicitudesNuevasEmpresasRecord? e2) {
    return e1?.nombreEmpresa == e2?.nombreEmpresa &&
        e1?.nitEmpresa == e2?.nitEmpresa &&
        e1?.numerodeTelefono == e2?.numerodeTelefono &&
        e1?.correoCorporativo == e2?.correoCorporativo;
  }

  @override
  int hash(SolicitudesNuevasEmpresasRecord? e) => const ListEquality().hash([
        e?.nombreEmpresa,
        e?.nitEmpresa,
        e?.numerodeTelefono,
        e?.correoCorporativo
      ]);

  @override
  bool isValidKey(Object? o) => o is SolicitudesNuevasEmpresasRecord;
}
