import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ComentariosRecord extends FirestoreRecord {
  ComentariosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "tipo" field.
  String? _tipo;
  String get tipo => _tipo ?? '';
  bool hasTipo() => _tipo != null;

  // "comentario" field.
  String? _comentario;
  String get comentario => _comentario ?? '';
  bool hasComentario() => _comentario != null;

  // "creatorName" field.
  String? _creatorName;
  String get creatorName => _creatorName ?? '';
  bool hasCreatorName() => _creatorName != null;

  // "usuarioRef" field.
  DocumentReference? _usuarioRef;
  DocumentReference? get usuarioRef => _usuarioRef;
  bool hasUsuarioRef() => _usuarioRef != null;

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  void _initializeFields() {
    _tipo = snapshotData['tipo'] as String?;
    _comentario = snapshotData['comentario'] as String?;
    _creatorName = snapshotData['creatorName'] as String?;
    _usuarioRef = snapshotData['usuarioRef'] as DocumentReference?;
    _fecha = snapshotData['fecha'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('comentarios');

  static Stream<ComentariosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ComentariosRecord.fromSnapshot(s));

  static Future<ComentariosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ComentariosRecord.fromSnapshot(s));

  static ComentariosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ComentariosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ComentariosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ComentariosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ComentariosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ComentariosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createComentariosRecordData({
  String? tipo,
  String? comentario,
  String? creatorName,
  DocumentReference? usuarioRef,
  DateTime? fecha,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tipo': tipo,
      'comentario': comentario,
      'creatorName': creatorName,
      'usuarioRef': usuarioRef,
      'fecha': fecha,
    }.withoutNulls,
  );

  return firestoreData;
}

class ComentariosRecordDocumentEquality implements Equality<ComentariosRecord> {
  const ComentariosRecordDocumentEquality();

  @override
  bool equals(ComentariosRecord? e1, ComentariosRecord? e2) {
    return e1?.tipo == e2?.tipo &&
        e1?.comentario == e2?.comentario &&
        e1?.creatorName == e2?.creatorName &&
        e1?.usuarioRef == e2?.usuarioRef &&
        e1?.fecha == e2?.fecha;
  }

  @override
  int hash(ComentariosRecord? e) => const ListEquality()
      .hash([e?.tipo, e?.comentario, e?.creatorName, e?.usuarioRef, e?.fecha]);

  @override
  bool isValidKey(Object? o) => o is ComentariosRecord;
}
