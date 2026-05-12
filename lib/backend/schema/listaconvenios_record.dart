import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ListaconveniosRecord extends FirestoreRecord {
  ListaconveniosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nombre_empresa" field.
  String? _nombreEmpresa;
  String get nombreEmpresa => _nombreEmpresa ?? '';
  bool hasNombreEmpresa() => _nombreEmpresa != null;

  // "Ciudad" field.
  String? _ciudad;
  String get ciudad => _ciudad ?? '';
  bool hasCiudad() => _ciudad != null;

  // "Logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  // "Sitioweb" field.
  String? _sitioweb;
  String get sitioweb => _sitioweb ?? '';
  bool hasSitioweb() => _sitioweb != null;

  // "Imagenes" field.
  List<String>? _imagenes;
  List<String> get imagenes => _imagenes ?? const [];
  bool hasImagenes() => _imagenes != null;

  // "Descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "Beneficio" field.
  String? _beneficio;
  String get beneficio => _beneficio ?? '';
  bool hasBeneficio() => _beneficio != null;

  // "Logodetalles" field.
  String? _logodetalles;
  String get logodetalles => _logodetalles ?? '';
  bool hasLogodetalles() => _logodetalles != null;

  // "nombre_ig" field.
  String? _nombreIg;
  String get nombreIg => _nombreIg ?? '';
  bool hasNombreIg() => _nombreIg != null;

  // "numerowhatsapp" field.
  String? _numerowhatsapp;
  String get numerowhatsapp => _numerowhatsapp ?? '';
  bool hasNumerowhatsapp() => _numerowhatsapp != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nombreEmpresa = snapshotData['nombre_empresa'] as String?;
    _ciudad = snapshotData['Ciudad'] as String?;
    _logo = snapshotData['Logo'] as String?;
    _sitioweb = snapshotData['Sitioweb'] as String?;
    _imagenes = getDataList(snapshotData['Imagenes']);
    _descripcion = snapshotData['Descripcion'] as String?;
    _beneficio = snapshotData['Beneficio'] as String?;
    _logodetalles = snapshotData['Logodetalles'] as String?;
    _nombreIg = snapshotData['nombre_ig'] as String?;
    _numerowhatsapp = snapshotData['numerowhatsapp'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('listaconvenios')
          : FirebaseFirestore.instance.collectionGroup('listaconvenios');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('listaconvenios').doc(id);

  static Stream<ListaconveniosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ListaconveniosRecord.fromSnapshot(s));

  static Future<ListaconveniosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ListaconveniosRecord.fromSnapshot(s));

  static ListaconveniosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ListaconveniosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ListaconveniosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ListaconveniosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ListaconveniosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ListaconveniosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createListaconveniosRecordData({
  String? nombreEmpresa,
  String? ciudad,
  String? logo,
  String? sitioweb,
  String? descripcion,
  String? beneficio,
  String? logodetalles,
  String? nombreIg,
  String? numerowhatsapp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre_empresa': nombreEmpresa,
      'Ciudad': ciudad,
      'Logo': logo,
      'Sitioweb': sitioweb,
      'Descripcion': descripcion,
      'Beneficio': beneficio,
      'Logodetalles': logodetalles,
      'nombre_ig': nombreIg,
      'numerowhatsapp': numerowhatsapp,
    }.withoutNulls,
  );

  return firestoreData;
}

class ListaconveniosRecordDocumentEquality
    implements Equality<ListaconveniosRecord> {
  const ListaconveniosRecordDocumentEquality();

  @override
  bool equals(ListaconveniosRecord? e1, ListaconveniosRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nombreEmpresa == e2?.nombreEmpresa &&
        e1?.ciudad == e2?.ciudad &&
        e1?.logo == e2?.logo &&
        e1?.sitioweb == e2?.sitioweb &&
        listEquality.equals(e1?.imagenes, e2?.imagenes) &&
        e1?.descripcion == e2?.descripcion &&
        e1?.beneficio == e2?.beneficio &&
        e1?.logodetalles == e2?.logodetalles &&
        e1?.nombreIg == e2?.nombreIg &&
        e1?.numerowhatsapp == e2?.numerowhatsapp;
  }

  @override
  int hash(ListaconveniosRecord? e) => const ListEquality().hash([
        e?.nombreEmpresa,
        e?.ciudad,
        e?.logo,
        e?.sitioweb,
        e?.imagenes,
        e?.descripcion,
        e?.beneficio,
        e?.logodetalles,
        e?.nombreIg,
        e?.numerowhatsapp
      ]);

  @override
  bool isValidKey(Object? o) => o is ListaconveniosRecord;
}
