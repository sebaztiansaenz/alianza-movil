import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRecord extends FirestoreRecord {
  UserRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "empresa" field.
  String? _empresa;
  String get empresa => _empresa ?? '';
  bool hasEmpresa() => _empresa != null;

  // "pais" field.
  String? _pais;
  String get pais => _pais ?? '';
  bool hasPais() => _pais != null;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "apellido" field.
  String? _apellido;
  String get apellido => _apellido ?? '';
  bool hasApellido() => _apellido != null;

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

  // "cargo" field.
  String? _cargo;
  String get cargo => _cargo ?? '';
  bool hasCargo() => _cargo != null;

  // "telefono1" field.
  String? _telefono1;
  String get telefono1 => _telefono1 ?? '';
  bool hasTelefono1() => _telefono1 != null;

  // "telefono2" field.
  String? _telefono2;
  String get telefono2 => _telefono2 ?? '';
  bool hasTelefono2() => _telefono2 != null;

  // "moneda" field.
  String? _moneda;
  String get moneda => _moneda ?? '';
  bool hasMoneda() => _moneda != null;

  // "nit" field.
  String? _nit;
  String get nit => _nit ?? '';
  bool hasNit() => _nit != null;

  // "cuentaAhorroDocument" field.
  String? _cuentaAhorroDocument;
  String get cuentaAhorroDocument => _cuentaAhorroDocument ?? '';
  bool hasCuentaAhorroDocument() => _cuentaAhorroDocument != null;

  // "cuentaCreditoDocument" field.
  String? _cuentaCreditoDocument;
  String get cuentaCreditoDocument => _cuentaCreditoDocument ?? '';
  bool hasCuentaCreditoDocument() => _cuentaCreditoDocument != null;

  // "cuentaCDATDocument" field.
  String? _cuentaCDATDocument;
  String get cuentaCDATDocument => _cuentaCDATDocument ?? '';
  bool hasCuentaCDATDocument() => _cuentaCDATDocument != null;

  // "cuentaAhorroRef" field.
  DocumentReference? _cuentaAhorroRef;
  DocumentReference? get cuentaAhorroRef => _cuentaAhorroRef;
  bool hasCuentaAhorroRef() => _cuentaAhorroRef != null;

  // "cuentaCreditoRef" field.
  DocumentReference? _cuentaCreditoRef;
  DocumentReference? get cuentaCreditoRef => _cuentaCreditoRef;
  bool hasCuentaCreditoRef() => _cuentaCreditoRef != null;

  // "cuentaCDAT" field.
  DocumentReference? _cuentaCDAT;
  DocumentReference? get cuentaCDAT => _cuentaCDAT;
  bool hasCuentaCDAT() => _cuentaCDAT != null;

  // "tipoVinculacion" field.
  String? _tipoVinculacion;
  String get tipoVinculacion => _tipoVinculacion ?? '';
  bool hasTipoVinculacion() => _tipoVinculacion != null;

  // "tipoDocumento" field.
  String? _tipoDocumento;
  String get tipoDocumento => _tipoDocumento ?? '';
  bool hasTipoDocumento() => _tipoDocumento != null;

  // "nroDocumento" field.
  String? _nroDocumento;
  String get nroDocumento => _nroDocumento ?? '';
  bool hasNroDocumento() => _nroDocumento != null;

  // "ciudadExpedicion" field.
  String? _ciudadExpedicion;
  String get ciudadExpedicion => _ciudadExpedicion ?? '';
  bool hasCiudadExpedicion() => _ciudadExpedicion != null;

  // "politicamenteExpuesto" field.
  String? _politicamenteExpuesto;
  String get politicamenteExpuesto => _politicamenteExpuesto ?? '';
  bool hasPoliticamenteExpuesto() => _politicamenteExpuesto != null;

  // "tieneFamiliares" field.
  String? _tieneFamiliares;
  String get tieneFamiliares => _tieneFamiliares ?? '';
  bool hasTieneFamiliares() => _tieneFamiliares != null;

  // "fuenteIngreso" field.
  String? _fuenteIngreso;
  String get fuenteIngreso => _fuenteIngreso ?? '';
  bool hasFuenteIngreso() => _fuenteIngreso != null;

  // "autorizoAlianza1" field.
  String? _autorizoAlianza1;
  String get autorizoAlianza1 => _autorizoAlianza1 ?? '';
  bool hasAutorizoAlianza1() => _autorizoAlianza1 != null;

  // "autorizoAlianza2" field.
  String? _autorizoAlianza2;
  String get autorizoAlianza2 => _autorizoAlianza2 ?? '';
  bool hasAutorizoAlianza2() => _autorizoAlianza2 != null;

  // "autorizoAlianza3" field.
  String? _autorizoAlianza3;
  String get autorizoAlianza3 => _autorizoAlianza3 ?? '';
  bool hasAutorizoAlianza3() => _autorizoAlianza3 != null;

  // "fechaExpedicion" field.
  DateTime? _fechaExpedicion;
  DateTime? get fechaExpedicion => _fechaExpedicion;
  bool hasFechaExpedicion() => _fechaExpedicion != null;

  // "cdatfecha" field.
  DateTime? _cdatfecha;
  DateTime? get cdatfecha => _cdatfecha;
  bool hasCdatfecha() => _cdatfecha != null;

  // "ahorrofecha" field.
  DateTime? _ahorrofecha;
  DateTime? get ahorrofecha => _ahorrofecha;
  bool hasAhorrofecha() => _ahorrofecha != null;

  // "creditofecha" field.
  DateTime? _creditofecha;
  DateTime? get creditofecha => _creditofecha;
  bool hasCreditofecha() => _creditofecha != null;

  // "empresaref" field.
  DocumentReference? _empresaref;
  DocumentReference? get empresaref => _empresaref;
  bool hasEmpresaref() => _empresaref != null;

  // "codigoahorro" field.
  int? _codigoahorro;
  int get codigoahorro => _codigoahorro ?? 0;
  bool hasCodigoahorro() => _codigoahorro != null;

  // "codigocredito" field.
  int? _codigocredito;
  int get codigocredito => _codigocredito ?? 0;
  bool hasCodigocredito() => _codigocredito != null;

  // "codigocdat" field.
  int? _codigocdat;
  int get codigocdat => _codigocdat ?? 0;
  bool hasCodigocdat() => _codigocdat != null;

  // "fotofrontal" field.
  String? _fotofrontal;
  String get fotofrontal => _fotofrontal ?? '';
  bool hasFotofrontal() => _fotofrontal != null;

  // "fototrasera" field.
  String? _fototrasera;
  String get fototrasera => _fototrasera ?? '';
  bool hasFototrasera() => _fototrasera != null;

  // "fotoperfil" field.
  String? _fotoperfil;
  String get fotoperfil => _fotoperfil ?? '';
  bool hasFotoperfil() => _fotoperfil != null;

  // "Genero" field.
  String? _genero;
  String get genero => _genero ?? '';
  bool hasGenero() => _genero != null;

  // "confirmacion_verificado" field.
  bool? _confirmacionVerificado;
  bool get confirmacionVerificado => _confirmacionVerificado ?? false;
  bool hasConfirmacionVerificado() => _confirmacionVerificado != null;

  // "ocupacion" field.
  String? _ocupacion;
  String get ocupacion => _ocupacion ?? '';
  bool hasOcupacion() => _ocupacion != null;

  // "fecha_nacimiento" field.
  DateTime? _fechaNacimiento;
  DateTime? get fechaNacimiento => _fechaNacimiento;
  bool hasFechaNacimiento() => _fechaNacimiento != null;

  // "ciudad_nacimiento" field.
  String? _ciudadNacimiento;
  String get ciudadNacimiento => _ciudadNacimiento ?? '';
  bool hasCiudadNacimiento() => _ciudadNacimiento != null;

  // "isHaveSavingAccount" field.
  bool? _isHaveSavingAccount;
  bool get isHaveSavingAccount => _isHaveSavingAccount ?? false;
  bool hasIsHaveSavingAccount() => _isHaveSavingAccount != null;

  // "userType" field.
  String? _userType;
  String get userType => _userType ?? '';
  bool hasUserType() => _userType != null;

  // "accountnumber" field.
  String? _accountnumber;
  String get accountnumber => _accountnumber ?? '';
  bool hasAccountnumber() => _accountnumber != null;

  // "verificationPDF" field.
  String? _verificationPDF;
  String get verificationPDF => _verificationPDF ?? '';
  bool hasVerificationPDF() => _verificationPDF != null;

  // "barrio" field.
  String? _barrio;
  String get barrio => _barrio ?? '';
  bool hasBarrio() => _barrio != null;

  // "flgPPE" field.
  bool? _flgPPE;
  bool get flgPPE => _flgPPE ?? false;
  bool hasFlgPPE() => _flgPPE != null;

  // "flgRelativesPPE" field.
  bool? _flgRelativesPPE;
  bool get flgRelativesPPE => _flgRelativesPPE ?? false;
  bool hasFlgRelativesPPE() => _flgRelativesPPE != null;

  // "fundsSource" field.
  List<String>? _fundsSource;
  List<String> get fundsSource => _fundsSource ?? const [];
  bool hasFundsSource() => _fundsSource != null;

  // "digiteOtrasFuentes" field.
  String? _digiteOtrasFuentes;
  String get digiteOtrasFuentes => _digiteOtrasFuentes ?? '';
  bool hasDigiteOtrasFuentes() => _digiteOtrasFuentes != null;

  // "relativeFullname" field.
  String? _relativeFullname;
  String get relativeFullname => _relativeFullname ?? '';
  bool hasRelativeFullname() => _relativeFullname != null;

  // "relativeId" field.
  String? _relativeId;
  String get relativeId => _relativeId ?? '';
  bool hasRelativeId() => _relativeId != null;

  // "lastLogin" field.
  DateTime? _lastLogin;
  DateTime? get lastLogin => _lastLogin;
  bool hasLastLogin() => _lastLogin != null;

  // "egresos" field.
  String? _egresos;
  String get egresos => _egresos ?? '';
  bool hasEgresos() => _egresos != null;

  // "activos" field.
  String? _activos;
  String get activos => _activos ?? '';
  bool hasActivos() => _activos != null;

  // "patrimonio" field.
  String? _patrimonio;
  String get patrimonio => _patrimonio ?? '';
  bool hasPatrimonio() => _patrimonio != null;

  // "ingresos" field.
  String? _ingresos;
  String get ingresos => _ingresos ?? '';
  bool hasIngresos() => _ingresos != null;

  // "recurrencia" field.
  String? _recurrencia;
  String get recurrencia => _recurrencia ?? '';
  bool hasRecurrencia() => _recurrencia != null;

  // "verificacionusuario" field.
  String? _verificacionusuario;
  String get verificacionusuario => _verificacionusuario ?? '';
  bool hasVerificacionusuario() => _verificacionusuario != null;

  // "tienecdat" field.
  bool? _tienecdat;
  bool get tienecdat => _tienecdat ?? false;
  bool hasTienecdat() => _tienecdat != null;

  // "empresanuevaahorro" field.
  DocumentReference? _empresanuevaahorro;
  DocumentReference? get empresanuevaahorro => _empresanuevaahorro;
  bool hasEmpresanuevaahorro() => _empresanuevaahorro != null;

  // "habilitar" field.
  bool? _habilitar;
  bool get habilitar => _habilitar ?? false;
  bool hasHabilitar() => _habilitar != null;

  // "montoPreAprobado" field.
  int? _montoPreAprobado;
  int get montoPreAprobado => _montoPreAprobado ?? 0;
  bool hasMontoPreAprobado() => _montoPreAprobado != null;

  // "respuestaCredito" field.
  bool? _respuestaCredito;
  bool get respuestaCredito => _respuestaCredito ?? false;
  bool hasRespuestaCredito() => _respuestaCredito != null;

  // "perfilCredito" field.
  bool? _perfilCredito;
  bool get perfilCredito => _perfilCredito ?? false;
  bool hasPerfilCredito() => _perfilCredito != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _id = snapshotData['id'] as String?;
    _empresa = snapshotData['empresa'] as String?;
    _pais = snapshotData['pais'] as String?;
    _nombre = snapshotData['nombre'] as String?;
    _apellido = snapshotData['apellido'] as String?;
    _departamento = snapshotData['departamento'] as String?;
    _ciudad = snapshotData['ciudad'] as String?;
    _direccion = snapshotData['direccion'] as String?;
    _cargo = snapshotData['cargo'] as String?;
    _telefono1 = snapshotData['telefono1'] as String?;
    _telefono2 = snapshotData['telefono2'] as String?;
    _moneda = snapshotData['moneda'] as String?;
    _nit = snapshotData['nit'] as String?;
    _cuentaAhorroDocument = snapshotData['cuentaAhorroDocument'] as String?;
    _cuentaCreditoDocument = snapshotData['cuentaCreditoDocument'] as String?;
    _cuentaCDATDocument = snapshotData['cuentaCDATDocument'] as String?;
    _cuentaAhorroRef = snapshotData['cuentaAhorroRef'] as DocumentReference?;
    _cuentaCreditoRef = snapshotData['cuentaCreditoRef'] as DocumentReference?;
    _cuentaCDAT = snapshotData['cuentaCDAT'] as DocumentReference?;
    _tipoVinculacion = snapshotData['tipoVinculacion'] as String?;
    _tipoDocumento = snapshotData['tipoDocumento'] as String?;
    _nroDocumento = snapshotData['nroDocumento'] as String?;
    _ciudadExpedicion = snapshotData['ciudadExpedicion'] as String?;
    _politicamenteExpuesto = snapshotData['politicamenteExpuesto'] as String?;
    _tieneFamiliares = snapshotData['tieneFamiliares'] as String?;
    _fuenteIngreso = snapshotData['fuenteIngreso'] as String?;
    _autorizoAlianza1 = snapshotData['autorizoAlianza1'] as String?;
    _autorizoAlianza2 = snapshotData['autorizoAlianza2'] as String?;
    _autorizoAlianza3 = snapshotData['autorizoAlianza3'] as String?;
    _fechaExpedicion = snapshotData['fechaExpedicion'] as DateTime?;
    _cdatfecha = snapshotData['cdatfecha'] as DateTime?;
    _ahorrofecha = snapshotData['ahorrofecha'] as DateTime?;
    _creditofecha = snapshotData['creditofecha'] as DateTime?;
    _empresaref = snapshotData['empresaref'] as DocumentReference?;
    _codigoahorro = castToType<int>(snapshotData['codigoahorro']);
    _codigocredito = castToType<int>(snapshotData['codigocredito']);
    _codigocdat = castToType<int>(snapshotData['codigocdat']);
    _fotofrontal = snapshotData['fotofrontal'] as String?;
    _fototrasera = snapshotData['fototrasera'] as String?;
    _fotoperfil = snapshotData['fotoperfil'] as String?;
    _genero = snapshotData['Genero'] as String?;
    _confirmacionVerificado = snapshotData['confirmacion_verificado'] as bool?;
    _ocupacion = snapshotData['ocupacion'] as String?;
    _fechaNacimiento = snapshotData['fecha_nacimiento'] as DateTime?;
    _ciudadNacimiento = snapshotData['ciudad_nacimiento'] as String?;
    _isHaveSavingAccount = snapshotData['isHaveSavingAccount'] as bool?;
    _userType = snapshotData['userType'] as String?;
    _accountnumber = snapshotData['accountnumber'] as String?;
    _verificationPDF = snapshotData['verificationPDF'] as String?;
    _barrio = snapshotData['barrio'] as String?;
    _flgPPE = snapshotData['flgPPE'] as bool?;
    _flgRelativesPPE = snapshotData['flgRelativesPPE'] as bool?;
    _fundsSource = getDataList(snapshotData['fundsSource']);
    _digiteOtrasFuentes = snapshotData['digiteOtrasFuentes'] as String?;
    _relativeFullname = snapshotData['relativeFullname'] as String?;
    _relativeId = snapshotData['relativeId'] as String?;
    _lastLogin = snapshotData['lastLogin'] as DateTime?;
    _egresos = snapshotData['egresos'] as String?;
    _activos = snapshotData['activos'] as String?;
    _patrimonio = snapshotData['patrimonio'] as String?;
    _ingresos = snapshotData['ingresos'] as String?;
    _recurrencia = snapshotData['recurrencia'] as String?;
    _verificacionusuario = snapshotData['verificacionusuario'] as String?;
    _tienecdat = snapshotData['tienecdat'] as bool?;
    _empresanuevaahorro =
        snapshotData['empresanuevaahorro'] as DocumentReference?;
    _habilitar = snapshotData['habilitar'] as bool?;
    _montoPreAprobado = castToType<int>(snapshotData['montoPreAprobado']);
    _respuestaCredito = snapshotData['respuestaCredito'] as bool?;
    _perfilCredito = snapshotData['perfilCredito'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user');

  static Stream<UserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserRecord.fromSnapshot(s));

  static Future<UserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserRecord.fromSnapshot(s));

  static UserRecord fromSnapshot(DocumentSnapshot snapshot) => UserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? id,
  String? empresa,
  String? pais,
  String? nombre,
  String? apellido,
  String? departamento,
  String? ciudad,
  String? direccion,
  String? cargo,
  String? telefono1,
  String? telefono2,
  String? moneda,
  String? nit,
  String? cuentaAhorroDocument,
  String? cuentaCreditoDocument,
  String? cuentaCDATDocument,
  DocumentReference? cuentaAhorroRef,
  DocumentReference? cuentaCreditoRef,
  DocumentReference? cuentaCDAT,
  String? tipoVinculacion,
  String? tipoDocumento,
  String? nroDocumento,
  String? ciudadExpedicion,
  String? politicamenteExpuesto,
  String? tieneFamiliares,
  String? fuenteIngreso,
  String? autorizoAlianza1,
  String? autorizoAlianza2,
  String? autorizoAlianza3,
  DateTime? fechaExpedicion,
  DateTime? cdatfecha,
  DateTime? ahorrofecha,
  DateTime? creditofecha,
  DocumentReference? empresaref,
  int? codigoahorro,
  int? codigocredito,
  int? codigocdat,
  String? fotofrontal,
  String? fototrasera,
  String? fotoperfil,
  String? genero,
  bool? confirmacionVerificado,
  String? ocupacion,
  DateTime? fechaNacimiento,
  String? ciudadNacimiento,
  bool? isHaveSavingAccount,
  String? userType,
  String? accountnumber,
  String? verificationPDF,
  String? barrio,
  bool? flgPPE,
  bool? flgRelativesPPE,
  String? digiteOtrasFuentes,
  String? relativeFullname,
  String? relativeId,
  DateTime? lastLogin,
  String? egresos,
  String? activos,
  String? patrimonio,
  String? ingresos,
  String? recurrencia,
  String? verificacionusuario,
  bool? tienecdat,
  DocumentReference? empresanuevaahorro,
  bool? habilitar,
  int? montoPreAprobado,
  bool? respuestaCredito,
  bool? perfilCredito,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'id': id,
      'empresa': empresa,
      'pais': pais,
      'nombre': nombre,
      'apellido': apellido,
      'departamento': departamento,
      'ciudad': ciudad,
      'direccion': direccion,
      'cargo': cargo,
      'telefono1': telefono1,
      'telefono2': telefono2,
      'moneda': moneda,
      'nit': nit,
      'cuentaAhorroDocument': cuentaAhorroDocument,
      'cuentaCreditoDocument': cuentaCreditoDocument,
      'cuentaCDATDocument': cuentaCDATDocument,
      'cuentaAhorroRef': cuentaAhorroRef,
      'cuentaCreditoRef': cuentaCreditoRef,
      'cuentaCDAT': cuentaCDAT,
      'tipoVinculacion': tipoVinculacion,
      'tipoDocumento': tipoDocumento,
      'nroDocumento': nroDocumento,
      'ciudadExpedicion': ciudadExpedicion,
      'politicamenteExpuesto': politicamenteExpuesto,
      'tieneFamiliares': tieneFamiliares,
      'fuenteIngreso': fuenteIngreso,
      'autorizoAlianza1': autorizoAlianza1,
      'autorizoAlianza2': autorizoAlianza2,
      'autorizoAlianza3': autorizoAlianza3,
      'fechaExpedicion': fechaExpedicion,
      'cdatfecha': cdatfecha,
      'ahorrofecha': ahorrofecha,
      'creditofecha': creditofecha,
      'empresaref': empresaref,
      'codigoahorro': codigoahorro,
      'codigocredito': codigocredito,
      'codigocdat': codigocdat,
      'fotofrontal': fotofrontal,
      'fototrasera': fototrasera,
      'fotoperfil': fotoperfil,
      'Genero': genero,
      'confirmacion_verificado': confirmacionVerificado,
      'ocupacion': ocupacion,
      'fecha_nacimiento': fechaNacimiento,
      'ciudad_nacimiento': ciudadNacimiento,
      'isHaveSavingAccount': isHaveSavingAccount,
      'userType': userType,
      'accountnumber': accountnumber,
      'verificationPDF': verificationPDF,
      'barrio': barrio,
      'flgPPE': flgPPE,
      'flgRelativesPPE': flgRelativesPPE,
      'digiteOtrasFuentes': digiteOtrasFuentes,
      'relativeFullname': relativeFullname,
      'relativeId': relativeId,
      'lastLogin': lastLogin,
      'egresos': egresos,
      'activos': activos,
      'patrimonio': patrimonio,
      'ingresos': ingresos,
      'recurrencia': recurrencia,
      'verificacionusuario': verificacionusuario,
      'tienecdat': tienecdat,
      'empresanuevaahorro': empresanuevaahorro,
      'habilitar': habilitar,
      'montoPreAprobado': montoPreAprobado,
      'respuestaCredito': respuestaCredito,
      'perfilCredito': perfilCredito,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserRecordDocumentEquality implements Equality<UserRecord> {
  const UserRecordDocumentEquality();

  @override
  bool equals(UserRecord? e1, UserRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.id == e2?.id &&
        e1?.empresa == e2?.empresa &&
        e1?.pais == e2?.pais &&
        e1?.nombre == e2?.nombre &&
        e1?.apellido == e2?.apellido &&
        e1?.departamento == e2?.departamento &&
        e1?.ciudad == e2?.ciudad &&
        e1?.direccion == e2?.direccion &&
        e1?.cargo == e2?.cargo &&
        e1?.telefono1 == e2?.telefono1 &&
        e1?.telefono2 == e2?.telefono2 &&
        e1?.moneda == e2?.moneda &&
        e1?.nit == e2?.nit &&
        e1?.cuentaAhorroDocument == e2?.cuentaAhorroDocument &&
        e1?.cuentaCreditoDocument == e2?.cuentaCreditoDocument &&
        e1?.cuentaCDATDocument == e2?.cuentaCDATDocument &&
        e1?.cuentaAhorroRef == e2?.cuentaAhorroRef &&
        e1?.cuentaCreditoRef == e2?.cuentaCreditoRef &&
        e1?.cuentaCDAT == e2?.cuentaCDAT &&
        e1?.tipoVinculacion == e2?.tipoVinculacion &&
        e1?.tipoDocumento == e2?.tipoDocumento &&
        e1?.nroDocumento == e2?.nroDocumento &&
        e1?.ciudadExpedicion == e2?.ciudadExpedicion &&
        e1?.politicamenteExpuesto == e2?.politicamenteExpuesto &&
        e1?.tieneFamiliares == e2?.tieneFamiliares &&
        e1?.fuenteIngreso == e2?.fuenteIngreso &&
        e1?.autorizoAlianza1 == e2?.autorizoAlianza1 &&
        e1?.autorizoAlianza2 == e2?.autorizoAlianza2 &&
        e1?.autorizoAlianza3 == e2?.autorizoAlianza3 &&
        e1?.fechaExpedicion == e2?.fechaExpedicion &&
        e1?.cdatfecha == e2?.cdatfecha &&
        e1?.ahorrofecha == e2?.ahorrofecha &&
        e1?.creditofecha == e2?.creditofecha &&
        e1?.empresaref == e2?.empresaref &&
        e1?.codigoahorro == e2?.codigoahorro &&
        e1?.codigocredito == e2?.codigocredito &&
        e1?.codigocdat == e2?.codigocdat &&
        e1?.fotofrontal == e2?.fotofrontal &&
        e1?.fototrasera == e2?.fototrasera &&
        e1?.fotoperfil == e2?.fotoperfil &&
        e1?.genero == e2?.genero &&
        e1?.confirmacionVerificado == e2?.confirmacionVerificado &&
        e1?.ocupacion == e2?.ocupacion &&
        e1?.fechaNacimiento == e2?.fechaNacimiento &&
        e1?.ciudadNacimiento == e2?.ciudadNacimiento &&
        e1?.isHaveSavingAccount == e2?.isHaveSavingAccount &&
        e1?.userType == e2?.userType &&
        e1?.accountnumber == e2?.accountnumber &&
        e1?.verificationPDF == e2?.verificationPDF &&
        e1?.barrio == e2?.barrio &&
        e1?.flgPPE == e2?.flgPPE &&
        e1?.flgRelativesPPE == e2?.flgRelativesPPE &&
        listEquality.equals(e1?.fundsSource, e2?.fundsSource) &&
        e1?.digiteOtrasFuentes == e2?.digiteOtrasFuentes &&
        e1?.relativeFullname == e2?.relativeFullname &&
        e1?.relativeId == e2?.relativeId &&
        e1?.lastLogin == e2?.lastLogin &&
        e1?.egresos == e2?.egresos &&
        e1?.activos == e2?.activos &&
        e1?.patrimonio == e2?.patrimonio &&
        e1?.ingresos == e2?.ingresos &&
        e1?.recurrencia == e2?.recurrencia &&
        e1?.verificacionusuario == e2?.verificacionusuario &&
        e1?.tienecdat == e2?.tienecdat &&
        e1?.empresanuevaahorro == e2?.empresanuevaahorro &&
        e1?.habilitar == e2?.habilitar &&
        e1?.montoPreAprobado == e2?.montoPreAprobado &&
        e1?.respuestaCredito == e2?.respuestaCredito &&
        e1?.perfilCredito == e2?.perfilCredito;
  }

  @override
  int hash(UserRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.id,
        e?.empresa,
        e?.pais,
        e?.nombre,
        e?.apellido,
        e?.departamento,
        e?.ciudad,
        e?.direccion,
        e?.cargo,
        e?.telefono1,
        e?.telefono2,
        e?.moneda,
        e?.nit,
        e?.cuentaAhorroDocument,
        e?.cuentaCreditoDocument,
        e?.cuentaCDATDocument,
        e?.cuentaAhorroRef,
        e?.cuentaCreditoRef,
        e?.cuentaCDAT,
        e?.tipoVinculacion,
        e?.tipoDocumento,
        e?.nroDocumento,
        e?.ciudadExpedicion,
        e?.politicamenteExpuesto,
        e?.tieneFamiliares,
        e?.fuenteIngreso,
        e?.autorizoAlianza1,
        e?.autorizoAlianza2,
        e?.autorizoAlianza3,
        e?.fechaExpedicion,
        e?.cdatfecha,
        e?.ahorrofecha,
        e?.creditofecha,
        e?.empresaref,
        e?.codigoahorro,
        e?.codigocredito,
        e?.codigocdat,
        e?.fotofrontal,
        e?.fototrasera,
        e?.fotoperfil,
        e?.genero,
        e?.confirmacionVerificado,
        e?.ocupacion,
        e?.fechaNacimiento,
        e?.ciudadNacimiento,
        e?.isHaveSavingAccount,
        e?.userType,
        e?.accountnumber,
        e?.verificationPDF,
        e?.barrio,
        e?.flgPPE,
        e?.flgRelativesPPE,
        e?.fundsSource,
        e?.digiteOtrasFuentes,
        e?.relativeFullname,
        e?.relativeId,
        e?.lastLogin,
        e?.egresos,
        e?.activos,
        e?.patrimonio,
        e?.ingresos,
        e?.recurrencia,
        e?.verificacionusuario,
        e?.tienecdat,
        e?.empresanuevaahorro,
        e?.habilitar,
        e?.montoPreAprobado,
        e?.respuestaCredito,
        e?.perfilCredito
      ]);

  @override
  bool isValidKey(Object? o) => o is UserRecord;
}
