import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConfirmacionretirosRecord extends FirestoreRecord {
  ConfirmacionretirosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "usuariosid" field.
  DocumentReference? _usuariosid;
  DocumentReference? get usuariosid => _usuariosid;
  bool hasUsuariosid() => _usuariosid != null;

  // "estados" field.
  String? _estados;
  String get estados => _estados ?? '';
  bool hasEstados() => _estados != null;

  // "ID" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "numbredebanco" field.
  String? _numbredebanco;
  String get numbredebanco => _numbredebanco ?? '';
  bool hasNumbredebanco() => _numbredebanco != null;

  // "tipodecuenta" field.
  String? _tipodecuenta;
  String get tipodecuenta => _tipodecuenta ?? '';
  bool hasTipodecuenta() => _tipodecuenta != null;

  // "cuentanumero" field.
  String? _cuentanumero;
  String get cuentanumero => _cuentanumero ?? '';
  bool hasCuentanumero() => _cuentanumero != null;

  // "fecharetiro" field.
  DateTime? _fecharetiro;
  DateTime? get fecharetiro => _fecharetiro;
  bool hasFecharetiro() => _fecharetiro != null;

  // "observaciones" field.
  String? _observaciones;
  String get observaciones => _observaciones ?? '';
  bool hasObservaciones() => _observaciones != null;

  // "monto" field.
  double? _monto;
  double get monto => _monto ?? 0.0;
  bool hasMonto() => _monto != null;

  // "tipodeoperacion" field.
  String? _tipodeoperacion;
  String get tipodeoperacion => _tipodeoperacion ?? '';
  bool hasTipodeoperacion() => _tipodeoperacion != null;

  // "nombreusuario" field.
  String? _nombreusuario;
  String get nombreusuario => _nombreusuario ?? '';
  bool hasNombreusuario() => _nombreusuario != null;

  // "nitusuario" field.
  String? _nitusuario;
  String get nitusuario => _nitusuario ?? '';
  bool hasNitusuario() => _nitusuario != null;

  // "fechaSolicitud" field.
  DateTime? _fechaSolicitud;
  DateTime? get fechaSolicitud => _fechaSolicitud;
  bool hasFechaSolicitud() => _fechaSolicitud != null;

  // "idCDAT" field.
  int? _idCDAT;
  int get idCDAT => _idCDAT ?? 0;
  bool hasIdCDAT() => _idCDAT != null;

  // "celusuario" field.
  String? _celusuario;
  String get celusuario => _celusuario ?? '';
  bool hasCelusuario() => _celusuario != null;

  // "emailusuario" field.
  String? _emailusuario;
  String get emailusuario => _emailusuario ?? '';
  bool hasEmailusuario() => _emailusuario != null;

  // "chanelpay" field.
  String? _chanelpay;
  String get chanelpay => _chanelpay ?? '';
  bool hasChanelpay() => _chanelpay != null;

  // "isahorrocdat" field.
  bool? _isahorrocdat;
  bool get isahorrocdat => _isahorrocdat ?? false;
  bool hasIsahorrocdat() => _isahorrocdat != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _usuariosid = snapshotData['usuariosid'] as DocumentReference?;
    _estados = snapshotData['estados'] as String?;
    _id = castToType<int>(snapshotData['ID']);
    _numbredebanco = snapshotData['numbredebanco'] as String?;
    _tipodecuenta = snapshotData['tipodecuenta'] as String?;
    _cuentanumero = snapshotData['cuentanumero'] as String?;
    _fecharetiro = snapshotData['fecharetiro'] as DateTime?;
    _observaciones = snapshotData['observaciones'] as String?;
    _monto = castToType<double>(snapshotData['monto']);
    _tipodeoperacion = snapshotData['tipodeoperacion'] as String?;
    _nombreusuario = snapshotData['nombreusuario'] as String?;
    _nitusuario = snapshotData['nitusuario'] as String?;
    _fechaSolicitud = snapshotData['fechaSolicitud'] as DateTime?;
    _idCDAT = castToType<int>(snapshotData['idCDAT']);
    _celusuario = snapshotData['celusuario'] as String?;
    _emailusuario = snapshotData['emailusuario'] as String?;
    _chanelpay = snapshotData['chanelpay'] as String?;
    _isahorrocdat = snapshotData['isahorrocdat'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('confirmacionretiros')
          : FirebaseFirestore.instance.collectionGroup('confirmacionretiros');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('confirmacionretiros').doc(id);

  static Stream<ConfirmacionretirosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConfirmacionretirosRecord.fromSnapshot(s));

  static Future<ConfirmacionretirosRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ConfirmacionretirosRecord.fromSnapshot(s));

  static ConfirmacionretirosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConfirmacionretirosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConfirmacionretirosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConfirmacionretirosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConfirmacionretirosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConfirmacionretirosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConfirmacionretirosRecordData({
  DocumentReference? usuariosid,
  String? estados,
  int? id,
  String? numbredebanco,
  String? tipodecuenta,
  String? cuentanumero,
  DateTime? fecharetiro,
  String? observaciones,
  double? monto,
  String? tipodeoperacion,
  String? nombreusuario,
  String? nitusuario,
  DateTime? fechaSolicitud,
  int? idCDAT,
  String? celusuario,
  String? emailusuario,
  String? chanelpay,
  bool? isahorrocdat,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'usuariosid': usuariosid,
      'estados': estados,
      'ID': id,
      'numbredebanco': numbredebanco,
      'tipodecuenta': tipodecuenta,
      'cuentanumero': cuentanumero,
      'fecharetiro': fecharetiro,
      'observaciones': observaciones,
      'monto': monto,
      'tipodeoperacion': tipodeoperacion,
      'nombreusuario': nombreusuario,
      'nitusuario': nitusuario,
      'fechaSolicitud': fechaSolicitud,
      'idCDAT': idCDAT,
      'celusuario': celusuario,
      'emailusuario': emailusuario,
      'chanelpay': chanelpay,
      'isahorrocdat': isahorrocdat,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConfirmacionretirosRecordDocumentEquality
    implements Equality<ConfirmacionretirosRecord> {
  const ConfirmacionretirosRecordDocumentEquality();

  @override
  bool equals(ConfirmacionretirosRecord? e1, ConfirmacionretirosRecord? e2) {
    return e1?.usuariosid == e2?.usuariosid &&
        e1?.estados == e2?.estados &&
        e1?.id == e2?.id &&
        e1?.numbredebanco == e2?.numbredebanco &&
        e1?.tipodecuenta == e2?.tipodecuenta &&
        e1?.cuentanumero == e2?.cuentanumero &&
        e1?.fecharetiro == e2?.fecharetiro &&
        e1?.observaciones == e2?.observaciones &&
        e1?.monto == e2?.monto &&
        e1?.tipodeoperacion == e2?.tipodeoperacion &&
        e1?.nombreusuario == e2?.nombreusuario &&
        e1?.nitusuario == e2?.nitusuario &&
        e1?.fechaSolicitud == e2?.fechaSolicitud &&
        e1?.idCDAT == e2?.idCDAT &&
        e1?.celusuario == e2?.celusuario &&
        e1?.emailusuario == e2?.emailusuario &&
        e1?.chanelpay == e2?.chanelpay &&
        e1?.isahorrocdat == e2?.isahorrocdat;
  }

  @override
  int hash(ConfirmacionretirosRecord? e) => const ListEquality().hash([
        e?.usuariosid,
        e?.estados,
        e?.id,
        e?.numbredebanco,
        e?.tipodecuenta,
        e?.cuentanumero,
        e?.fecharetiro,
        e?.observaciones,
        e?.monto,
        e?.tipodeoperacion,
        e?.nombreusuario,
        e?.nitusuario,
        e?.fechaSolicitud,
        e?.idCDAT,
        e?.celusuario,
        e?.emailusuario,
        e?.chanelpay,
        e?.isahorrocdat
      ]);

  @override
  bool isValidKey(Object? o) => o is ConfirmacionretirosRecord;
}
