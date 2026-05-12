import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SolicitanteRecord extends FirestoreRecord {
  SolicitanteRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "displayName" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "Nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "Apellido" field.
  String? _apellido;
  String get apellido => _apellido ?? '';
  bool hasApellido() => _apellido != null;

  // "Fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "Empresa" field.
  String? _empresa;
  String get empresa => _empresa ?? '';
  bool hasEmpresa() => _empresa != null;

  // "usuarioRef" field.
  DocumentReference? _usuarioRef;
  DocumentReference? get usuarioRef => _usuarioRef;
  bool hasUsuarioRef() => _usuarioRef != null;

  void _initializeFields() {
    _displayName = snapshotData['displayName'] as String?;
    _nombre = snapshotData['Nombre'] as String?;
    _apellido = snapshotData['Apellido'] as String?;
    _fecha = snapshotData['Fecha'] as DateTime?;
    _empresa = snapshotData['Empresa'] as String?;
    _usuarioRef = snapshotData['usuarioRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('solicitante');

  static Stream<SolicitanteRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SolicitanteRecord.fromSnapshot(s));

  static Future<SolicitanteRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SolicitanteRecord.fromSnapshot(s));

  static SolicitanteRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SolicitanteRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SolicitanteRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SolicitanteRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SolicitanteRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SolicitanteRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSolicitanteRecordData({
  String? displayName,
  String? nombre,
  String? apellido,
  DateTime? fecha,
  String? empresa,
  DocumentReference? usuarioRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'displayName': displayName,
      'Nombre': nombre,
      'Apellido': apellido,
      'Fecha': fecha,
      'Empresa': empresa,
      'usuarioRef': usuarioRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class SolicitanteRecordDocumentEquality implements Equality<SolicitanteRecord> {
  const SolicitanteRecordDocumentEquality();

  @override
  bool equals(SolicitanteRecord? e1, SolicitanteRecord? e2) {
    return e1?.displayName == e2?.displayName &&
        e1?.nombre == e2?.nombre &&
        e1?.apellido == e2?.apellido &&
        e1?.fecha == e2?.fecha &&
        e1?.empresa == e2?.empresa &&
        e1?.usuarioRef == e2?.usuarioRef;
  }

  @override
  int hash(SolicitanteRecord? e) => const ListEquality().hash([
        e?.displayName,
        e?.nombre,
        e?.apellido,
        e?.fecha,
        e?.empresa,
        e?.usuarioRef
      ]);

  @override
  bool isValidKey(Object? o) => o is SolicitanteRecord;
}
