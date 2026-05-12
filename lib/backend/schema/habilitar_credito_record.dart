import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HabilitarCreditoRecord extends FirestoreRecord {
  HabilitarCreditoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "habilitar" field.
  bool? _habilitar;
  bool get habilitar => _habilitar ?? false;
  bool hasHabilitar() => _habilitar != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "nombre" field.
  DocumentReference? _nombre;
  DocumentReference? get nombre => _nombre;
  bool hasNombre() => _nombre != null;

  // "documento" field.
  DocumentReference? _documento;
  DocumentReference? get documento => _documento;
  bool hasDocumento() => _documento != null;

  // "fechaSolicitud" field.
  DateTime? _fechaSolicitud;
  DateTime? get fechaSolicitud => _fechaSolicitud;
  bool hasFechaSolicitud() => _fechaSolicitud != null;

  // "empresa" field.
  DocumentReference? _empresa;
  DocumentReference? get empresa => _empresa;
  bool hasEmpresa() => _empresa != null;

  // "antiguedadEmpresa" field.
  DateTime? _antiguedadEmpresa;
  DateTime? get antiguedadEmpresa => _antiguedadEmpresa;
  bool hasAntiguedadEmpresa() => _antiguedadEmpresa != null;

  // "fechaRegistroApp" field.
  DateTime? _fechaRegistroApp;
  DateTime? get fechaRegistroApp => _fechaRegistroApp;
  bool hasFechaRegistroApp() => _fechaRegistroApp != null;

  // "estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  bool hasEstado() => _estado != null;

  // "tipodecredito" field.
  String? _tipodecredito;
  String get tipodecredito => _tipodecredito ?? '';
  bool hasTipodecredito() => _tipodecredito != null;

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  // "nombreapp" field.
  String? _nombreapp;
  String get nombreapp => _nombreapp ?? '';
  bool hasNombreapp() => _nombreapp != null;

  // "estadoCivil" field.
  String? _estadoCivil;
  String get estadoCivil => _estadoCivil ?? '';
  bool hasEstadoCivil() => _estadoCivil != null;

  // "personasDependientes" field.
  String? _personasDependientes;
  String get personasDependientes => _personasDependientes ?? '';
  bool hasPersonasDependientes() => _personasDependientes != null;

  // "adultosAcargo" field.
  String? _adultosAcargo;
  String get adultosAcargo => _adultosAcargo ?? '';
  bool hasAdultosAcargo() => _adultosAcargo != null;

  // "residencia" field.
  String? _residencia;
  String get residencia => _residencia ?? '';
  bool hasResidencia() => _residencia != null;

  // "tiempoResidiendo" field.
  String? _tiempoResidiendo;
  String get tiempoResidiendo => _tiempoResidiendo ?? '';
  bool hasTiempoResidiendo() => _tiempoResidiendo != null;

  // "tipoVivienda" field.
  String? _tipoVivienda;
  String get tipoVivienda => _tipoVivienda ?? '';
  bool hasTipoVivienda() => _tipoVivienda != null;

  // "empresaNombre" field.
  String? _empresaNombre;
  String get empresaNombre => _empresaNombre ?? '';
  bool hasEmpresaNombre() => _empresaNombre != null;

  // "tiempoEmpleo" field.
  String? _tiempoEmpleo;
  String get tiempoEmpleo => _tiempoEmpleo ?? '';
  bool hasTiempoEmpleo() => _tiempoEmpleo != null;

  // "ingresoPromed" field.
  int? _ingresoPromed;
  int get ingresoPromed => _ingresoPromed ?? 0;
  bool hasIngresoPromed() => _ingresoPromed != null;

  // "tipodeContrato" field.
  String? _tipodeContrato;
  String get tipodeContrato => _tipodeContrato ?? '';
  bool hasTipodeContrato() => _tipodeContrato != null;

  // "interrupcionesLab" field.
  String? _interrupcionesLab;
  String get interrupcionesLab => _interrupcionesLab ?? '';
  bool hasInterrupcionesLab() => _interrupcionesLab != null;

  // "creditosActivos" field.
  String? _creditosActivos;
  String get creditosActivos => _creditosActivos ?? '';
  bool hasCreditosActivos() => _creditosActivos != null;

  // "cuantoscreditos" field.
  String? _cuantoscreditos;
  String get cuantoscreditos => _cuantoscreditos ?? '';
  bool hasCuantoscreditos() => _cuantoscreditos != null;

  // "gastos" field.
  int? _gastos;
  int get gastos => _gastos ?? 0;
  bool hasGastos() => _gastos != null;

  // "fuentesingreso" field.
  String? _fuentesingreso;
  String get fuentesingreso => _fuentesingreso ?? '';
  bool hasFuentesingreso() => _fuentesingreso != null;

  // "promIngresos" field.
  int? _promIngresos;
  int get promIngresos => _promIngresos ?? 0;
  bool hasPromIngresos() => _promIngresos != null;

  // "pagoOtrasDeudas" field.
  int? _pagoOtrasDeudas;
  int get pagoOtrasDeudas => _pagoOtrasDeudas ?? 0;
  bool hasPagoOtrasDeudas() => _pagoOtrasDeudas != null;

  // "gastosFijos" field.
  int? _gastosFijos;
  int get gastosFijos => _gastosFijos ?? 0;
  bool hasGastosFijos() => _gastosFijos != null;

  // "retrasoPagos" field.
  String? _retrasoPagos;
  String get retrasoPagos => _retrasoPagos ?? '';
  bool hasRetrasoPagos() => _retrasoPagos != null;

  // "tarjetasActivas" field.
  String? _tarjetasActivas;
  String get tarjetasActivas => _tarjetasActivas ?? '';
  bool hasTarjetasActivas() => _tarjetasActivas != null;

  // "centralRiesgo" field.
  String? _centralRiesgo;
  String get centralRiesgo => _centralRiesgo ?? '';
  bool hasCentralRiesgo() => _centralRiesgo != null;

  // "inversionActiva" field.
  String? _inversionActiva;
  String get inversionActiva => _inversionActiva ?? '';
  bool hasInversionActiva() => _inversionActiva != null;

  // "creditoGota" field.
  String? _creditoGota;
  String get creditoGota => _creditoGota ?? '';
  bool hasCreditoGota() => _creditoGota != null;

  // "montoSolicitud" field.
  int? _montoSolicitud;
  int get montoSolicitud => _montoSolicitud ?? 0;
  bool hasMontoSolicitud() => _montoSolicitud != null;

  // "mesesApagar" field.
  int? _mesesApagar;
  int get mesesApagar => _mesesApagar ?? 0;
  bool hasMesesApagar() => _mesesApagar != null;

  void _initializeFields() {
    _habilitar = snapshotData['habilitar'] as bool?;
    _user = snapshotData['user'] as DocumentReference?;
    _id = castToType<int>(snapshotData['id']);
    _nombre = snapshotData['nombre'] as DocumentReference?;
    _documento = snapshotData['documento'] as DocumentReference?;
    _fechaSolicitud = snapshotData['fechaSolicitud'] as DateTime?;
    _empresa = snapshotData['empresa'] as DocumentReference?;
    _antiguedadEmpresa = snapshotData['antiguedadEmpresa'] as DateTime?;
    _fechaRegistroApp = snapshotData['fechaRegistroApp'] as DateTime?;
    _estado = snapshotData['estado'] as String?;
    _tipodecredito = snapshotData['tipodecredito'] as String?;
    _uid = snapshotData['uid'] as DocumentReference?;
    _nombreapp = snapshotData['nombreapp'] as String?;
    _estadoCivil = snapshotData['estadoCivil'] as String?;
    _personasDependientes = snapshotData['personasDependientes'] as String?;
    _adultosAcargo = snapshotData['adultosAcargo'] as String?;
    _residencia = snapshotData['residencia'] as String?;
    _tiempoResidiendo = snapshotData['tiempoResidiendo'] as String?;
    _tipoVivienda = snapshotData['tipoVivienda'] as String?;
    _empresaNombre = snapshotData['empresaNombre'] as String?;
    _tiempoEmpleo = snapshotData['tiempoEmpleo'] as String?;
    _ingresoPromed = castToType<int>(snapshotData['ingresoPromed']);
    _tipodeContrato = snapshotData['tipodeContrato'] as String?;
    _interrupcionesLab = snapshotData['interrupcionesLab'] as String?;
    _creditosActivos = snapshotData['creditosActivos'] as String?;
    _cuantoscreditos = snapshotData['cuantoscreditos'] as String?;
    _gastos = castToType<int>(snapshotData['gastos']);
    _fuentesingreso = snapshotData['fuentesingreso'] as String?;
    _promIngresos = castToType<int>(snapshotData['promIngresos']);
    _pagoOtrasDeudas = castToType<int>(snapshotData['pagoOtrasDeudas']);
    _gastosFijos = castToType<int>(snapshotData['gastosFijos']);
    _retrasoPagos = snapshotData['retrasoPagos'] as String?;
    _tarjetasActivas = snapshotData['tarjetasActivas'] as String?;
    _centralRiesgo = snapshotData['centralRiesgo'] as String?;
    _inversionActiva = snapshotData['inversionActiva'] as String?;
    _creditoGota = snapshotData['creditoGota'] as String?;
    _montoSolicitud = castToType<int>(snapshotData['montoSolicitud']);
    _mesesApagar = castToType<int>(snapshotData['mesesApagar']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('HabilitarCredito');

  static Stream<HabilitarCreditoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HabilitarCreditoRecord.fromSnapshot(s));

  static Future<HabilitarCreditoRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => HabilitarCreditoRecord.fromSnapshot(s));

  static HabilitarCreditoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HabilitarCreditoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HabilitarCreditoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HabilitarCreditoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HabilitarCreditoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HabilitarCreditoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHabilitarCreditoRecordData({
  bool? habilitar,
  DocumentReference? user,
  int? id,
  DocumentReference? nombre,
  DocumentReference? documento,
  DateTime? fechaSolicitud,
  DocumentReference? empresa,
  DateTime? antiguedadEmpresa,
  DateTime? fechaRegistroApp,
  String? estado,
  String? tipodecredito,
  DocumentReference? uid,
  String? nombreapp,
  String? estadoCivil,
  String? personasDependientes,
  String? adultosAcargo,
  String? residencia,
  String? tiempoResidiendo,
  String? tipoVivienda,
  String? empresaNombre,
  String? tiempoEmpleo,
  int? ingresoPromed,
  String? tipodeContrato,
  String? interrupcionesLab,
  String? creditosActivos,
  String? cuantoscreditos,
  int? gastos,
  String? fuentesingreso,
  int? promIngresos,
  int? pagoOtrasDeudas,
  int? gastosFijos,
  String? retrasoPagos,
  String? tarjetasActivas,
  String? centralRiesgo,
  String? inversionActiva,
  String? creditoGota,
  int? montoSolicitud,
  int? mesesApagar,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'habilitar': habilitar,
      'user': user,
      'id': id,
      'nombre': nombre,
      'documento': documento,
      'fechaSolicitud': fechaSolicitud,
      'empresa': empresa,
      'antiguedadEmpresa': antiguedadEmpresa,
      'fechaRegistroApp': fechaRegistroApp,
      'estado': estado,
      'tipodecredito': tipodecredito,
      'uid': uid,
      'nombreapp': nombreapp,
      'estadoCivil': estadoCivil,
      'personasDependientes': personasDependientes,
      'adultosAcargo': adultosAcargo,
      'residencia': residencia,
      'tiempoResidiendo': tiempoResidiendo,
      'tipoVivienda': tipoVivienda,
      'empresaNombre': empresaNombre,
      'tiempoEmpleo': tiempoEmpleo,
      'ingresoPromed': ingresoPromed,
      'tipodeContrato': tipodeContrato,
      'interrupcionesLab': interrupcionesLab,
      'creditosActivos': creditosActivos,
      'cuantoscreditos': cuantoscreditos,
      'gastos': gastos,
      'fuentesingreso': fuentesingreso,
      'promIngresos': promIngresos,
      'pagoOtrasDeudas': pagoOtrasDeudas,
      'gastosFijos': gastosFijos,
      'retrasoPagos': retrasoPagos,
      'tarjetasActivas': tarjetasActivas,
      'centralRiesgo': centralRiesgo,
      'inversionActiva': inversionActiva,
      'creditoGota': creditoGota,
      'montoSolicitud': montoSolicitud,
      'mesesApagar': mesesApagar,
    }.withoutNulls,
  );

  return firestoreData;
}

class HabilitarCreditoRecordDocumentEquality
    implements Equality<HabilitarCreditoRecord> {
  const HabilitarCreditoRecordDocumentEquality();

  @override
  bool equals(HabilitarCreditoRecord? e1, HabilitarCreditoRecord? e2) {
    return e1?.habilitar == e2?.habilitar &&
        e1?.user == e2?.user &&
        e1?.id == e2?.id &&
        e1?.nombre == e2?.nombre &&
        e1?.documento == e2?.documento &&
        e1?.fechaSolicitud == e2?.fechaSolicitud &&
        e1?.empresa == e2?.empresa &&
        e1?.antiguedadEmpresa == e2?.antiguedadEmpresa &&
        e1?.fechaRegistroApp == e2?.fechaRegistroApp &&
        e1?.estado == e2?.estado &&
        e1?.tipodecredito == e2?.tipodecredito &&
        e1?.uid == e2?.uid &&
        e1?.nombreapp == e2?.nombreapp &&
        e1?.estadoCivil == e2?.estadoCivil &&
        e1?.personasDependientes == e2?.personasDependientes &&
        e1?.adultosAcargo == e2?.adultosAcargo &&
        e1?.residencia == e2?.residencia &&
        e1?.tiempoResidiendo == e2?.tiempoResidiendo &&
        e1?.tipoVivienda == e2?.tipoVivienda &&
        e1?.empresaNombre == e2?.empresaNombre &&
        e1?.tiempoEmpleo == e2?.tiempoEmpleo &&
        e1?.ingresoPromed == e2?.ingresoPromed &&
        e1?.tipodeContrato == e2?.tipodeContrato &&
        e1?.interrupcionesLab == e2?.interrupcionesLab &&
        e1?.creditosActivos == e2?.creditosActivos &&
        e1?.cuantoscreditos == e2?.cuantoscreditos &&
        e1?.gastos == e2?.gastos &&
        e1?.fuentesingreso == e2?.fuentesingreso &&
        e1?.promIngresos == e2?.promIngresos &&
        e1?.pagoOtrasDeudas == e2?.pagoOtrasDeudas &&
        e1?.gastosFijos == e2?.gastosFijos &&
        e1?.retrasoPagos == e2?.retrasoPagos &&
        e1?.tarjetasActivas == e2?.tarjetasActivas &&
        e1?.centralRiesgo == e2?.centralRiesgo &&
        e1?.inversionActiva == e2?.inversionActiva &&
        e1?.creditoGota == e2?.creditoGota &&
        e1?.montoSolicitud == e2?.montoSolicitud &&
        e1?.mesesApagar == e2?.mesesApagar;
  }

  @override
  int hash(HabilitarCreditoRecord? e) => const ListEquality().hash([
        e?.habilitar,
        e?.user,
        e?.id,
        e?.nombre,
        e?.documento,
        e?.fechaSolicitud,
        e?.empresa,
        e?.antiguedadEmpresa,
        e?.fechaRegistroApp,
        e?.estado,
        e?.tipodecredito,
        e?.uid,
        e?.nombreapp,
        e?.estadoCivil,
        e?.personasDependientes,
        e?.adultosAcargo,
        e?.residencia,
        e?.tiempoResidiendo,
        e?.tipoVivienda,
        e?.empresaNombre,
        e?.tiempoEmpleo,
        e?.ingresoPromed,
        e?.tipodeContrato,
        e?.interrupcionesLab,
        e?.creditosActivos,
        e?.cuantoscreditos,
        e?.gastos,
        e?.fuentesingreso,
        e?.promIngresos,
        e?.pagoOtrasDeudas,
        e?.gastosFijos,
        e?.retrasoPagos,
        e?.tarjetasActivas,
        e?.centralRiesgo,
        e?.inversionActiva,
        e?.creditoGota,
        e?.montoSolicitud,
        e?.mesesApagar
      ]);

  @override
  bool isValidKey(Object? o) => o is HabilitarCreditoRecord;
}
