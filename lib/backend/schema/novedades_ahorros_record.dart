import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NovedadesAhorrosRecord extends FirestoreRecord {
  NovedadesAhorrosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "usuarioRef" field.
  DocumentReference? _usuarioRef;
  DocumentReference? get usuarioRef => _usuarioRef;
  bool hasUsuarioRef() => _usuarioRef != null;

  // "nombreusuario" field.
  String? _nombreusuario;
  String get nombreusuario => _nombreusuario ?? '';
  bool hasNombreusuario() => _nombreusuario != null;

  // "numeroDocumento" field.
  String? _numeroDocumento;
  String get numeroDocumento => _numeroDocumento ?? '';
  bool hasNumeroDocumento() => _numeroDocumento != null;

  // "motivo" field.
  String? _motivo;
  String get motivo => _motivo ?? '';
  bool hasMotivo() => _motivo != null;

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  bool hasEstado() => _estado != null;

  // "valorAhorrado" field.
  double? _valorAhorrado;
  double get valorAhorrado => _valorAhorrado ?? 0.0;
  bool hasValorAhorrado() => _valorAhorrado != null;

  // "ahorroRef" field.
  DocumentReference? _ahorroRef;
  DocumentReference? get ahorroRef => _ahorroRef;
  bool hasAhorroRef() => _ahorroRef != null;

  // "correousuario" field.
  String? _correousuario;
  String get correousuario => _correousuario ?? '';
  bool hasCorreousuario() => _correousuario != null;

  // "empresaid" field.
  DocumentReference? _empresaid;
  DocumentReference? get empresaid => _empresaid;
  bool hasEmpresaid() => _empresaid != null;

  // "idnovedad" field.
  int? _idnovedad;
  int get idnovedad => _idnovedad ?? 0;
  bool hasIdnovedad() => _idnovedad != null;

  void _initializeFields() {
    _usuarioRef = snapshotData['usuarioRef'] as DocumentReference?;
    _nombreusuario = snapshotData['nombreusuario'] as String?;
    _numeroDocumento = snapshotData['numeroDocumento'] as String?;
    _motivo = snapshotData['motivo'] as String?;
    _fecha = snapshotData['fecha'] as DateTime?;
    _estado = snapshotData['estado'] as String?;
    _valorAhorrado = castToType<double>(snapshotData['valorAhorrado']);
    _ahorroRef = snapshotData['ahorroRef'] as DocumentReference?;
    _correousuario = snapshotData['correousuario'] as String?;
    _empresaid = snapshotData['empresaid'] as DocumentReference?;
    _idnovedad = castToType<int>(snapshotData['idnovedad']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('NovedadesAhorros');

  static Stream<NovedadesAhorrosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NovedadesAhorrosRecord.fromSnapshot(s));

  static Future<NovedadesAhorrosRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => NovedadesAhorrosRecord.fromSnapshot(s));

  static NovedadesAhorrosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NovedadesAhorrosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NovedadesAhorrosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NovedadesAhorrosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NovedadesAhorrosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NovedadesAhorrosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNovedadesAhorrosRecordData({
  DocumentReference? usuarioRef,
  String? nombreusuario,
  String? numeroDocumento,
  String? motivo,
  DateTime? fecha,
  String? estado,
  double? valorAhorrado,
  DocumentReference? ahorroRef,
  String? correousuario,
  DocumentReference? empresaid,
  int? idnovedad,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'usuarioRef': usuarioRef,
      'nombreusuario': nombreusuario,
      'numeroDocumento': numeroDocumento,
      'motivo': motivo,
      'fecha': fecha,
      'estado': estado,
      'valorAhorrado': valorAhorrado,
      'ahorroRef': ahorroRef,
      'correousuario': correousuario,
      'empresaid': empresaid,
      'idnovedad': idnovedad,
    }.withoutNulls,
  );

  return firestoreData;
}

class NovedadesAhorrosRecordDocumentEquality
    implements Equality<NovedadesAhorrosRecord> {
  const NovedadesAhorrosRecordDocumentEquality();

  @override
  bool equals(NovedadesAhorrosRecord? e1, NovedadesAhorrosRecord? e2) {
    return e1?.usuarioRef == e2?.usuarioRef &&
        e1?.nombreusuario == e2?.nombreusuario &&
        e1?.numeroDocumento == e2?.numeroDocumento &&
        e1?.motivo == e2?.motivo &&
        e1?.fecha == e2?.fecha &&
        e1?.estado == e2?.estado &&
        e1?.valorAhorrado == e2?.valorAhorrado &&
        e1?.ahorroRef == e2?.ahorroRef &&
        e1?.correousuario == e2?.correousuario &&
        e1?.empresaid == e2?.empresaid &&
        e1?.idnovedad == e2?.idnovedad;
  }

  @override
  int hash(NovedadesAhorrosRecord? e) => const ListEquality().hash([
        e?.usuarioRef,
        e?.nombreusuario,
        e?.numeroDocumento,
        e?.motivo,
        e?.fecha,
        e?.estado,
        e?.valorAhorrado,
        e?.ahorroRef,
        e?.correousuario,
        e?.empresaid,
        e?.idnovedad
      ]);

  @override
  bool isValidKey(Object? o) => o is NovedadesAhorrosRecord;
}
