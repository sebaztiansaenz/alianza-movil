import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CdatsRecord extends FirestoreRecord {
  CdatsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Idusuario" field.
  DocumentReference? _idusuario;
  DocumentReference? get idusuario => _idusuario;
  bool hasIdusuario() => _idusuario != null;

  // "Idadmin" field.
  DocumentReference? _idadmin;
  DocumentReference? get idadmin => _idadmin;
  bool hasIdadmin() => _idadmin != null;

  // "Inversion" field.
  double? _inversion;
  double get inversion => _inversion ?? 0.0;
  bool hasInversion() => _inversion != null;

  // "EA" field.
  double? _ea;
  double get ea => _ea ?? 0.0;
  bool hasEa() => _ea != null;

  // "Tiempo" field.
  int? _tiempo;
  int get tiempo => _tiempo ?? 0;
  bool hasTiempo() => _tiempo != null;

  // "Rendimiento" field.
  double? _rendimiento;
  double get rendimiento => _rendimiento ?? 0.0;
  bool hasRendimiento() => _rendimiento != null;

  // "RetefuenteMonto" field.
  double? _retefuenteMonto;
  double get retefuenteMonto => _retefuenteMonto ?? 0.0;
  bool hasRetefuenteMonto() => _retefuenteMonto != null;

  // "Retefuenteporcentaje" field.
  double? _retefuenteporcentaje;
  double get retefuenteporcentaje => _retefuenteporcentaje ?? 0.0;
  bool hasRetefuenteporcentaje() => _retefuenteporcentaje != null;

  // "Ganancias" field.
  double? _ganancias;
  double get ganancias => _ganancias ?? 0.0;
  bool hasGanancias() => _ganancias != null;

  // "FechaApertura" field.
  DateTime? _fechaApertura;
  DateTime? get fechaApertura => _fechaApertura;
  bool hasFechaApertura() => _fechaApertura != null;

  // "FechaFinalizacion" field.
  DateTime? _fechaFinalizacion;
  DateTime? get fechaFinalizacion => _fechaFinalizacion;
  bool hasFechaFinalizacion() => _fechaFinalizacion != null;

  // "Estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  bool hasEstado() => _estado != null;

  // "Archivos" field.
  List<String>? _archivos;
  List<String> get archivos => _archivos ?? const [];
  bool hasArchivos() => _archivos != null;

  // "Tipooperacion" field.
  String? _tipooperacion;
  String get tipooperacion => _tipooperacion ?? '';
  bool hasTipooperacion() => _tipooperacion != null;

  // "origenrecursos" field.
  String? _origenrecursos;
  String get origenrecursos => _origenrecursos ?? '';
  bool hasOrigenrecursos() => _origenrecursos != null;

  // "observaciones" field.
  String? _observaciones;
  String get observaciones => _observaciones ?? '';
  bool hasObservaciones() => _observaciones != null;

  // "comprobantes" field.
  List<String>? _comprobantes;
  List<String> get comprobantes => _comprobantes ?? const [];
  bool hasComprobantes() => _comprobantes != null;

  // "firma" field.
  String? _firma;
  String get firma => _firma ?? '';
  bool hasFirma() => _firma != null;

  // "firmado" field.
  bool? _firmado;
  bool get firmado => _firmado ?? false;
  bool hasFirmado() => _firmado != null;

  // "fechacreacion" field.
  DateTime? _fechacreacion;
  DateTime? get fechacreacion => _fechacreacion;
  bool hasFechacreacion() => _fechacreacion != null;

  // "nombreusuario" field.
  String? _nombreusuario;
  String get nombreusuario => _nombreusuario ?? '';
  bool hasNombreusuario() => _nombreusuario != null;

  // "documentousuario" field.
  String? _documentousuario;
  String get documentousuario => _documentousuario ?? '';
  bool hasDocumentousuario() => _documentousuario != null;

  // "UserEmail" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  bool hasUserEmail() => _userEmail != null;

  // "saldoDisponible" field.
  double? _saldoDisponible;
  double get saldoDisponible => _saldoDisponible ?? 0.0;
  bool hasSaldoDisponible() => _saldoDisponible != null;

  // "idCdat" field.
  int? _idCdat;
  int get idCdat => _idCdat ?? 0;
  bool hasIdCdat() => _idCdat != null;

  // "motivoEliminado" field.
  String? _motivoEliminado;
  String get motivoEliminado => _motivoEliminado ?? '';
  bool hasMotivoEliminado() => _motivoEliminado != null;

  // "isAhorroCdat" field.
  bool? _isAhorroCdat;
  bool get isAhorroCdat => _isAhorroCdat ?? false;
  bool hasIsAhorroCdat() => _isAhorroCdat != null;

  void _initializeFields() {
    _idusuario = snapshotData['Idusuario'] as DocumentReference?;
    _idadmin = snapshotData['Idadmin'] as DocumentReference?;
    _inversion = castToType<double>(snapshotData['Inversion']);
    _ea = castToType<double>(snapshotData['EA']);
    _tiempo = castToType<int>(snapshotData['Tiempo']);
    _rendimiento = castToType<double>(snapshotData['Rendimiento']);
    _retefuenteMonto = castToType<double>(snapshotData['RetefuenteMonto']);
    _retefuenteporcentaje =
        castToType<double>(snapshotData['Retefuenteporcentaje']);
    _ganancias = castToType<double>(snapshotData['Ganancias']);
    _fechaApertura = snapshotData['FechaApertura'] as DateTime?;
    _fechaFinalizacion = snapshotData['FechaFinalizacion'] as DateTime?;
    _estado = snapshotData['Estado'] as String?;
    _archivos = getDataList(snapshotData['Archivos']);
    _tipooperacion = snapshotData['Tipooperacion'] as String?;
    _origenrecursos = snapshotData['origenrecursos'] as String?;
    _observaciones = snapshotData['observaciones'] as String?;
    _comprobantes = getDataList(snapshotData['comprobantes']);
    _firma = snapshotData['firma'] as String?;
    _firmado = snapshotData['firmado'] as bool?;
    _fechacreacion = snapshotData['fechacreacion'] as DateTime?;
    _nombreusuario = snapshotData['nombreusuario'] as String?;
    _documentousuario = snapshotData['documentousuario'] as String?;
    _userEmail = snapshotData['UserEmail'] as String?;
    _saldoDisponible = castToType<double>(snapshotData['saldoDisponible']);
    _idCdat = castToType<int>(snapshotData['idCdat']);
    _motivoEliminado = snapshotData['motivoEliminado'] as String?;
    _isAhorroCdat = snapshotData['isAhorroCdat'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Cdats');

  static Stream<CdatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CdatsRecord.fromSnapshot(s));

  static Future<CdatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CdatsRecord.fromSnapshot(s));

  static CdatsRecord fromSnapshot(DocumentSnapshot snapshot) => CdatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CdatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CdatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CdatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CdatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCdatsRecordData({
  DocumentReference? idusuario,
  DocumentReference? idadmin,
  double? inversion,
  double? ea,
  int? tiempo,
  double? rendimiento,
  double? retefuenteMonto,
  double? retefuenteporcentaje,
  double? ganancias,
  DateTime? fechaApertura,
  DateTime? fechaFinalizacion,
  String? estado,
  String? tipooperacion,
  String? origenrecursos,
  String? observaciones,
  String? firma,
  bool? firmado,
  DateTime? fechacreacion,
  String? nombreusuario,
  String? documentousuario,
  String? userEmail,
  double? saldoDisponible,
  int? idCdat,
  String? motivoEliminado,
  bool? isAhorroCdat,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Idusuario': idusuario,
      'Idadmin': idadmin,
      'Inversion': inversion,
      'EA': ea,
      'Tiempo': tiempo,
      'Rendimiento': rendimiento,
      'RetefuenteMonto': retefuenteMonto,
      'Retefuenteporcentaje': retefuenteporcentaje,
      'Ganancias': ganancias,
      'FechaApertura': fechaApertura,
      'FechaFinalizacion': fechaFinalizacion,
      'Estado': estado,
      'Tipooperacion': tipooperacion,
      'origenrecursos': origenrecursos,
      'observaciones': observaciones,
      'firma': firma,
      'firmado': firmado,
      'fechacreacion': fechacreacion,
      'nombreusuario': nombreusuario,
      'documentousuario': documentousuario,
      'UserEmail': userEmail,
      'saldoDisponible': saldoDisponible,
      'idCdat': idCdat,
      'motivoEliminado': motivoEliminado,
      'isAhorroCdat': isAhorroCdat,
    }.withoutNulls,
  );

  return firestoreData;
}

class CdatsRecordDocumentEquality implements Equality<CdatsRecord> {
  const CdatsRecordDocumentEquality();

  @override
  bool equals(CdatsRecord? e1, CdatsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.idusuario == e2?.idusuario &&
        e1?.idadmin == e2?.idadmin &&
        e1?.inversion == e2?.inversion &&
        e1?.ea == e2?.ea &&
        e1?.tiempo == e2?.tiempo &&
        e1?.rendimiento == e2?.rendimiento &&
        e1?.retefuenteMonto == e2?.retefuenteMonto &&
        e1?.retefuenteporcentaje == e2?.retefuenteporcentaje &&
        e1?.ganancias == e2?.ganancias &&
        e1?.fechaApertura == e2?.fechaApertura &&
        e1?.fechaFinalizacion == e2?.fechaFinalizacion &&
        e1?.estado == e2?.estado &&
        listEquality.equals(e1?.archivos, e2?.archivos) &&
        e1?.tipooperacion == e2?.tipooperacion &&
        e1?.origenrecursos == e2?.origenrecursos &&
        e1?.observaciones == e2?.observaciones &&
        listEquality.equals(e1?.comprobantes, e2?.comprobantes) &&
        e1?.firma == e2?.firma &&
        e1?.firmado == e2?.firmado &&
        e1?.fechacreacion == e2?.fechacreacion &&
        e1?.nombreusuario == e2?.nombreusuario &&
        e1?.documentousuario == e2?.documentousuario &&
        e1?.userEmail == e2?.userEmail &&
        e1?.saldoDisponible == e2?.saldoDisponible &&
        e1?.idCdat == e2?.idCdat &&
        e1?.motivoEliminado == e2?.motivoEliminado &&
        e1?.isAhorroCdat == e2?.isAhorroCdat;
  }

  @override
  int hash(CdatsRecord? e) => const ListEquality().hash([
        e?.idusuario,
        e?.idadmin,
        e?.inversion,
        e?.ea,
        e?.tiempo,
        e?.rendimiento,
        e?.retefuenteMonto,
        e?.retefuenteporcentaje,
        e?.ganancias,
        e?.fechaApertura,
        e?.fechaFinalizacion,
        e?.estado,
        e?.archivos,
        e?.tipooperacion,
        e?.origenrecursos,
        e?.observaciones,
        e?.comprobantes,
        e?.firma,
        e?.firmado,
        e?.fechacreacion,
        e?.nombreusuario,
        e?.documentousuario,
        e?.userEmail,
        e?.saldoDisponible,
        e?.idCdat,
        e?.motivoEliminado,
        e?.isAhorroCdat
      ]);

  @override
  bool isValidKey(Object? o) => o is CdatsRecord;
}
