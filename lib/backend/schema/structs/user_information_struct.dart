// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserInformationStruct extends FFFirebaseStruct {
  UserInformationStruct({
    String? tipoDocument,
    String? documentNumber,
    DateTime? fechaExpedicion,
    String? ciudadExpedicion,
    String? fullName,
    String? sexo,
    DateTime? fechaNacimiento,
    String? ciudadNacimiento,
    String? direccinResidencia,
    String? barrio,
    String? ciudadResidencia,
    String? email,
    String? whatsappNumber,
    String? userType,
    DocumentReference? empresaRef,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _tipoDocument = tipoDocument,
        _documentNumber = documentNumber,
        _fechaExpedicion = fechaExpedicion,
        _ciudadExpedicion = ciudadExpedicion,
        _fullName = fullName,
        _sexo = sexo,
        _fechaNacimiento = fechaNacimiento,
        _ciudadNacimiento = ciudadNacimiento,
        _direccinResidencia = direccinResidencia,
        _barrio = barrio,
        _ciudadResidencia = ciudadResidencia,
        _email = email,
        _whatsappNumber = whatsappNumber,
        _userType = userType,
        _empresaRef = empresaRef,
        super(firestoreUtilData);

  // "tipoDocument" field.
  String? _tipoDocument;
  String get tipoDocument => _tipoDocument ?? '';
  set tipoDocument(String? val) => _tipoDocument = val;

  bool hasTipoDocument() => _tipoDocument != null;

  // "documentNumber" field.
  String? _documentNumber;
  String get documentNumber => _documentNumber ?? '';
  set documentNumber(String? val) => _documentNumber = val;

  bool hasDocumentNumber() => _documentNumber != null;

  // "FechaExpedicion" field.
  DateTime? _fechaExpedicion;
  DateTime? get fechaExpedicion => _fechaExpedicion;
  set fechaExpedicion(DateTime? val) => _fechaExpedicion = val;

  bool hasFechaExpedicion() => _fechaExpedicion != null;

  // "CiudadExpedicion" field.
  String? _ciudadExpedicion;
  String get ciudadExpedicion => _ciudadExpedicion ?? '';
  set ciudadExpedicion(String? val) => _ciudadExpedicion = val;

  bool hasCiudadExpedicion() => _ciudadExpedicion != null;

  // "fullName" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  set fullName(String? val) => _fullName = val;

  bool hasFullName() => _fullName != null;

  // "sexo" field.
  String? _sexo;
  String get sexo => _sexo ?? '';
  set sexo(String? val) => _sexo = val;

  bool hasSexo() => _sexo != null;

  // "fechaNacimiento" field.
  DateTime? _fechaNacimiento;
  DateTime? get fechaNacimiento => _fechaNacimiento;
  set fechaNacimiento(DateTime? val) => _fechaNacimiento = val;

  bool hasFechaNacimiento() => _fechaNacimiento != null;

  // "ciudadNacimiento" field.
  String? _ciudadNacimiento;
  String get ciudadNacimiento => _ciudadNacimiento ?? '';
  set ciudadNacimiento(String? val) => _ciudadNacimiento = val;

  bool hasCiudadNacimiento() => _ciudadNacimiento != null;

  // "direccinResidencia" field.
  String? _direccinResidencia;
  String get direccinResidencia => _direccinResidencia ?? '';
  set direccinResidencia(String? val) => _direccinResidencia = val;

  bool hasDireccinResidencia() => _direccinResidencia != null;

  // "barrio" field.
  String? _barrio;
  String get barrio => _barrio ?? '';
  set barrio(String? val) => _barrio = val;

  bool hasBarrio() => _barrio != null;

  // "ciudadResidencia" field.
  String? _ciudadResidencia;
  String get ciudadResidencia => _ciudadResidencia ?? '';
  set ciudadResidencia(String? val) => _ciudadResidencia = val;

  bool hasCiudadResidencia() => _ciudadResidencia != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "whatsappNumber" field.
  String? _whatsappNumber;
  String get whatsappNumber => _whatsappNumber ?? '';
  set whatsappNumber(String? val) => _whatsappNumber = val;

  bool hasWhatsappNumber() => _whatsappNumber != null;

  // "userType" field.
  String? _userType;
  String get userType => _userType ?? '';
  set userType(String? val) => _userType = val;

  bool hasUserType() => _userType != null;

  // "empresaRef" field.
  DocumentReference? _empresaRef;
  DocumentReference? get empresaRef => _empresaRef;
  set empresaRef(DocumentReference? val) => _empresaRef = val;

  bool hasEmpresaRef() => _empresaRef != null;

  static UserInformationStruct fromMap(Map<String, dynamic> data) =>
      UserInformationStruct(
        tipoDocument: data['tipoDocument'] as String?,
        documentNumber: data['documentNumber'] as String?,
        fechaExpedicion: data['FechaExpedicion'] as DateTime?,
        ciudadExpedicion: data['CiudadExpedicion'] as String?,
        fullName: data['fullName'] as String?,
        sexo: data['sexo'] as String?,
        fechaNacimiento: data['fechaNacimiento'] as DateTime?,
        ciudadNacimiento: data['ciudadNacimiento'] as String?,
        direccinResidencia: data['direccinResidencia'] as String?,
        barrio: data['barrio'] as String?,
        ciudadResidencia: data['ciudadResidencia'] as String?,
        email: data['email'] as String?,
        whatsappNumber: data['whatsappNumber'] as String?,
        userType: data['userType'] as String?,
        empresaRef: data['empresaRef'] as DocumentReference?,
      );

  static UserInformationStruct? maybeFromMap(dynamic data) => data is Map
      ? UserInformationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'tipoDocument': _tipoDocument,
        'documentNumber': _documentNumber,
        'FechaExpedicion': _fechaExpedicion,
        'CiudadExpedicion': _ciudadExpedicion,
        'fullName': _fullName,
        'sexo': _sexo,
        'fechaNacimiento': _fechaNacimiento,
        'ciudadNacimiento': _ciudadNacimiento,
        'direccinResidencia': _direccinResidencia,
        'barrio': _barrio,
        'ciudadResidencia': _ciudadResidencia,
        'email': _email,
        'whatsappNumber': _whatsappNumber,
        'userType': _userType,
        'empresaRef': _empresaRef,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'tipoDocument': serializeParam(
          _tipoDocument,
          ParamType.String,
        ),
        'documentNumber': serializeParam(
          _documentNumber,
          ParamType.String,
        ),
        'FechaExpedicion': serializeParam(
          _fechaExpedicion,
          ParamType.DateTime,
        ),
        'CiudadExpedicion': serializeParam(
          _ciudadExpedicion,
          ParamType.String,
        ),
        'fullName': serializeParam(
          _fullName,
          ParamType.String,
        ),
        'sexo': serializeParam(
          _sexo,
          ParamType.String,
        ),
        'fechaNacimiento': serializeParam(
          _fechaNacimiento,
          ParamType.DateTime,
        ),
        'ciudadNacimiento': serializeParam(
          _ciudadNacimiento,
          ParamType.String,
        ),
        'direccinResidencia': serializeParam(
          _direccinResidencia,
          ParamType.String,
        ),
        'barrio': serializeParam(
          _barrio,
          ParamType.String,
        ),
        'ciudadResidencia': serializeParam(
          _ciudadResidencia,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'whatsappNumber': serializeParam(
          _whatsappNumber,
          ParamType.String,
        ),
        'userType': serializeParam(
          _userType,
          ParamType.String,
        ),
        'empresaRef': serializeParam(
          _empresaRef,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static UserInformationStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserInformationStruct(
        tipoDocument: deserializeParam(
          data['tipoDocument'],
          ParamType.String,
          false,
        ),
        documentNumber: deserializeParam(
          data['documentNumber'],
          ParamType.String,
          false,
        ),
        fechaExpedicion: deserializeParam(
          data['FechaExpedicion'],
          ParamType.DateTime,
          false,
        ),
        ciudadExpedicion: deserializeParam(
          data['CiudadExpedicion'],
          ParamType.String,
          false,
        ),
        fullName: deserializeParam(
          data['fullName'],
          ParamType.String,
          false,
        ),
        sexo: deserializeParam(
          data['sexo'],
          ParamType.String,
          false,
        ),
        fechaNacimiento: deserializeParam(
          data['fechaNacimiento'],
          ParamType.DateTime,
          false,
        ),
        ciudadNacimiento: deserializeParam(
          data['ciudadNacimiento'],
          ParamType.String,
          false,
        ),
        direccinResidencia: deserializeParam(
          data['direccinResidencia'],
          ParamType.String,
          false,
        ),
        barrio: deserializeParam(
          data['barrio'],
          ParamType.String,
          false,
        ),
        ciudadResidencia: deserializeParam(
          data['ciudadResidencia'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        whatsappNumber: deserializeParam(
          data['whatsappNumber'],
          ParamType.String,
          false,
        ),
        userType: deserializeParam(
          data['userType'],
          ParamType.String,
          false,
        ),
        empresaRef: deserializeParam(
          data['empresaRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['empresa'],
        ),
      );

  @override
  String toString() => 'UserInformationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserInformationStruct &&
        tipoDocument == other.tipoDocument &&
        documentNumber == other.documentNumber &&
        fechaExpedicion == other.fechaExpedicion &&
        ciudadExpedicion == other.ciudadExpedicion &&
        fullName == other.fullName &&
        sexo == other.sexo &&
        fechaNacimiento == other.fechaNacimiento &&
        ciudadNacimiento == other.ciudadNacimiento &&
        direccinResidencia == other.direccinResidencia &&
        barrio == other.barrio &&
        ciudadResidencia == other.ciudadResidencia &&
        email == other.email &&
        whatsappNumber == other.whatsappNumber &&
        userType == other.userType &&
        empresaRef == other.empresaRef;
  }

  @override
  int get hashCode => const ListEquality().hash([
        tipoDocument,
        documentNumber,
        fechaExpedicion,
        ciudadExpedicion,
        fullName,
        sexo,
        fechaNacimiento,
        ciudadNacimiento,
        direccinResidencia,
        barrio,
        ciudadResidencia,
        email,
        whatsappNumber,
        userType,
        empresaRef
      ]);
}

UserInformationStruct createUserInformationStruct({
  String? tipoDocument,
  String? documentNumber,
  DateTime? fechaExpedicion,
  String? ciudadExpedicion,
  String? fullName,
  String? sexo,
  DateTime? fechaNacimiento,
  String? ciudadNacimiento,
  String? direccinResidencia,
  String? barrio,
  String? ciudadResidencia,
  String? email,
  String? whatsappNumber,
  String? userType,
  DocumentReference? empresaRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserInformationStruct(
      tipoDocument: tipoDocument,
      documentNumber: documentNumber,
      fechaExpedicion: fechaExpedicion,
      ciudadExpedicion: ciudadExpedicion,
      fullName: fullName,
      sexo: sexo,
      fechaNacimiento: fechaNacimiento,
      ciudadNacimiento: ciudadNacimiento,
      direccinResidencia: direccinResidencia,
      barrio: barrio,
      ciudadResidencia: ciudadResidencia,
      email: email,
      whatsappNumber: whatsappNumber,
      userType: userType,
      empresaRef: empresaRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserInformationStruct? updateUserInformationStruct(
  UserInformationStruct? userInformation, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userInformation
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserInformationStructData(
  Map<String, dynamic> firestoreData,
  UserInformationStruct? userInformation,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userInformation == null) {
    return;
  }
  if (userInformation.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userInformation.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userInformationData =
      getUserInformationFirestoreData(userInformation, forFieldValue);
  final nestedData =
      userInformationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userInformation.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserInformationFirestoreData(
  UserInformationStruct? userInformation, [
  bool forFieldValue = false,
]) {
  if (userInformation == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userInformation.toMap());

  // Add any Firestore field values
  mapToFirestore(userInformation.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserInformationListFirestoreData(
  List<UserInformationStruct>? userInformations,
) =>
    userInformations
        ?.map((e) => getUserInformationFirestoreData(e, true))
        .toList() ??
    [];
