import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EmpresaRecord extends FirestoreRecord {
  EmpresaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "razonsocial" field.
  String? _razonsocial;
  String get razonsocial => _razonsocial ?? '';
  bool hasRazonsocial() => _razonsocial != null;

  // "nit" field.
  String? _nit;
  String get nit => _nit ?? '';
  bool hasNit() => _nit != null;

  // "correo" field.
  String? _correo;
  String get correo => _correo ?? '';
  bool hasCorreo() => _correo != null;

  // "telefono1" field.
  String? _telefono1;
  String get telefono1 => _telefono1 ?? '';
  bool hasTelefono1() => _telefono1 != null;

  // "telefono2" field.
  String? _telefono2;
  String get telefono2 => _telefono2 ?? '';
  bool hasTelefono2() => _telefono2 != null;

  // "actividad" field.
  String? _actividad;
  String get actividad => _actividad ?? '';
  bool hasActividad() => _actividad != null;

  // "numeroEmpleados" field.
  int? _numeroEmpleados;
  int get numeroEmpleados => _numeroEmpleados ?? 0;
  bool hasNumeroEmpleados() => _numeroEmpleados != null;

  // "pais" field.
  String? _pais;
  String get pais => _pais ?? '';
  bool hasPais() => _pais != null;

  // "departamento" field.
  String? _departamento;
  String get departamento => _departamento ?? '';
  bool hasDepartamento() => _departamento != null;

  // "ciudad" field.
  String? _ciudad;
  String get ciudad => _ciudad ?? '';
  bool hasCiudad() => _ciudad != null;

  // "direccion" field.
  String? _direccion;
  String get direccion => _direccion ?? '';
  bool hasDireccion() => _direccion != null;

  // "web" field.
  String? _web;
  String get web => _web ?? '';
  bool hasWeb() => _web != null;

  // "empleados" field.
  List<DocumentReference>? _empleados;
  List<DocumentReference> get empleados => _empleados ?? const [];
  bool hasEmpleados() => _empleados != null;

  // "signedDocument" field.
  String? _signedDocument;
  String get signedDocument => _signedDocument ?? '';
  bool hasSignedDocument() => _signedDocument != null;

  void _initializeFields() {
    _razonsocial = snapshotData['razonsocial'] as String?;
    _nit = snapshotData['nit'] as String?;
    _correo = snapshotData['correo'] as String?;
    _telefono1 = snapshotData['telefono1'] as String?;
    _telefono2 = snapshotData['telefono2'] as String?;
    _actividad = snapshotData['actividad'] as String?;
    _numeroEmpleados = castToType<int>(snapshotData['numeroEmpleados']);
    _pais = snapshotData['pais'] as String?;
    _departamento = snapshotData['departamento'] as String?;
    _ciudad = snapshotData['ciudad'] as String?;
    _direccion = snapshotData['direccion'] as String?;
    _web = snapshotData['web'] as String?;
    _empleados = getDataList(snapshotData['empleados']);
    _signedDocument = snapshotData['signedDocument'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('empresa');

  static Stream<EmpresaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EmpresaRecord.fromSnapshot(s));

  static Future<EmpresaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EmpresaRecord.fromSnapshot(s));

  static EmpresaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EmpresaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EmpresaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EmpresaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EmpresaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EmpresaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEmpresaRecordData({
  String? razonsocial,
  String? nit,
  String? correo,
  String? telefono1,
  String? telefono2,
  String? actividad,
  int? numeroEmpleados,
  String? pais,
  String? departamento,
  String? ciudad,
  String? direccion,
  String? web,
  String? signedDocument,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'razonsocial': razonsocial,
      'nit': nit,
      'correo': correo,
      'telefono1': telefono1,
      'telefono2': telefono2,
      'actividad': actividad,
      'numeroEmpleados': numeroEmpleados,
      'pais': pais,
      'departamento': departamento,
      'ciudad': ciudad,
      'direccion': direccion,
      'web': web,
      'signedDocument': signedDocument,
    }.withoutNulls,
  );

  return firestoreData;
}

class EmpresaRecordDocumentEquality implements Equality<EmpresaRecord> {
  const EmpresaRecordDocumentEquality();

  @override
  bool equals(EmpresaRecord? e1, EmpresaRecord? e2) {
    const listEquality = ListEquality();
    return e1?.razonsocial == e2?.razonsocial &&
        e1?.nit == e2?.nit &&
        e1?.correo == e2?.correo &&
        e1?.telefono1 == e2?.telefono1 &&
        e1?.telefono2 == e2?.telefono2 &&
        e1?.actividad == e2?.actividad &&
        e1?.numeroEmpleados == e2?.numeroEmpleados &&
        e1?.pais == e2?.pais &&
        e1?.departamento == e2?.departamento &&
        e1?.ciudad == e2?.ciudad &&
        e1?.direccion == e2?.direccion &&
        e1?.web == e2?.web &&
        listEquality.equals(e1?.empleados, e2?.empleados) &&
        e1?.signedDocument == e2?.signedDocument;
  }

  @override
  int hash(EmpresaRecord? e) => const ListEquality().hash([
        e?.razonsocial,
        e?.nit,
        e?.correo,
        e?.telefono1,
        e?.telefono2,
        e?.actividad,
        e?.numeroEmpleados,
        e?.pais,
        e?.departamento,
        e?.ciudad,
        e?.direccion,
        e?.web,
        e?.empleados,
        e?.signedDocument
      ]);

  @override
  bool isValidKey(Object? o) => o is EmpresaRecord;
}
