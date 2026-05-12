import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EmpresaRepresentativeRecord extends FirestoreRecord {
  EmpresaRepresentativeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "empresaRef" field.
  DocumentReference? _empresaRef;
  DocumentReference? get empresaRef => _empresaRef;
  bool hasEmpresaRef() => _empresaRef != null;

  // "empresaNIT" field.
  String? _empresaNIT;
  String get empresaNIT => _empresaNIT ?? '';
  bool hasEmpresaNIT() => _empresaNIT != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "typoDeDocumento" field.
  String? _typoDeDocumento;
  String get typoDeDocumento => _typoDeDocumento ?? '';
  bool hasTypoDeDocumento() => _typoDeDocumento != null;

  // "numeroDeDocumento" field.
  String? _numeroDeDocumento;
  String get numeroDeDocumento => _numeroDeDocumento ?? '';
  bool hasNumeroDeDocumento() => _numeroDeDocumento != null;

  // "fechaDeDocumento" field.
  DateTime? _fechaDeDocumento;
  DateTime? get fechaDeDocumento => _fechaDeDocumento;
  bool hasFechaDeDocumento() => _fechaDeDocumento != null;

  void _initializeFields() {
    _empresaRef = snapshotData['empresaRef'] as DocumentReference?;
    _empresaNIT = snapshotData['empresaNIT'] as String?;
    _name = snapshotData['name'] as String?;
    _email = snapshotData['email'] as String?;
    _typoDeDocumento = snapshotData['typoDeDocumento'] as String?;
    _numeroDeDocumento = snapshotData['numeroDeDocumento'] as String?;
    _fechaDeDocumento = snapshotData['fechaDeDocumento'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('empresaRepresentative');

  static Stream<EmpresaRepresentativeRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => EmpresaRepresentativeRecord.fromSnapshot(s));

  static Future<EmpresaRepresentativeRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => EmpresaRepresentativeRecord.fromSnapshot(s));

  static EmpresaRepresentativeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EmpresaRepresentativeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EmpresaRepresentativeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EmpresaRepresentativeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EmpresaRepresentativeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EmpresaRepresentativeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEmpresaRepresentativeRecordData({
  DocumentReference? empresaRef,
  String? empresaNIT,
  String? name,
  String? email,
  String? typoDeDocumento,
  String? numeroDeDocumento,
  DateTime? fechaDeDocumento,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'empresaRef': empresaRef,
      'empresaNIT': empresaNIT,
      'name': name,
      'email': email,
      'typoDeDocumento': typoDeDocumento,
      'numeroDeDocumento': numeroDeDocumento,
      'fechaDeDocumento': fechaDeDocumento,
    }.withoutNulls,
  );

  return firestoreData;
}

class EmpresaRepresentativeRecordDocumentEquality
    implements Equality<EmpresaRepresentativeRecord> {
  const EmpresaRepresentativeRecordDocumentEquality();

  @override
  bool equals(
      EmpresaRepresentativeRecord? e1, EmpresaRepresentativeRecord? e2) {
    return e1?.empresaRef == e2?.empresaRef &&
        e1?.empresaNIT == e2?.empresaNIT &&
        e1?.name == e2?.name &&
        e1?.email == e2?.email &&
        e1?.typoDeDocumento == e2?.typoDeDocumento &&
        e1?.numeroDeDocumento == e2?.numeroDeDocumento &&
        e1?.fechaDeDocumento == e2?.fechaDeDocumento;
  }

  @override
  int hash(EmpresaRepresentativeRecord? e) => const ListEquality().hash([
        e?.empresaRef,
        e?.empresaNIT,
        e?.name,
        e?.email,
        e?.typoDeDocumento,
        e?.numeroDeDocumento,
        e?.fechaDeDocumento
      ]);

  @override
  bool isValidKey(Object? o) => o is EmpresaRepresentativeRecord;
}
