// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServicesTipoStruct extends FFFirebaseStruct {
  ServicesTipoStruct({
    String? serviceMainType,
    String? typesOfProductName,
    double? ea,
    double? mv,
    DocumentReference? user,
    int? productNumber,
    DocumentReference? idServicio,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _serviceMainType = serviceMainType,
        _typesOfProductName = typesOfProductName,
        _ea = ea,
        _mv = mv,
        _user = user,
        _productNumber = productNumber,
        _idServicio = idServicio,
        super(firestoreUtilData);

  // "ServiceMainType" field.
  String? _serviceMainType;
  String get serviceMainType => _serviceMainType ?? '';
  set serviceMainType(String? val) => _serviceMainType = val;

  bool hasServiceMainType() => _serviceMainType != null;

  // "TypesOfProductName" field.
  String? _typesOfProductName;
  String get typesOfProductName => _typesOfProductName ?? '';
  set typesOfProductName(String? val) => _typesOfProductName = val;

  bool hasTypesOfProductName() => _typesOfProductName != null;

  // "EA" field.
  double? _ea;
  double get ea => _ea ?? 0.0;
  set ea(double? val) => _ea = val;

  void incrementEa(double amount) => ea = ea + amount;

  bool hasEa() => _ea != null;

  // "MV" field.
  double? _mv;
  double get mv => _mv ?? 0.0;
  set mv(double? val) => _mv = val;

  void incrementMv(double amount) => mv = mv + amount;

  bool hasMv() => _mv != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  set user(DocumentReference? val) => _user = val;

  bool hasUser() => _user != null;

  // "ProductNumber" field.
  int? _productNumber;
  int get productNumber => _productNumber ?? 0;
  set productNumber(int? val) => _productNumber = val;

  void incrementProductNumber(int amount) =>
      productNumber = productNumber + amount;

  bool hasProductNumber() => _productNumber != null;

  // "idServicio" field.
  DocumentReference? _idServicio;
  DocumentReference? get idServicio => _idServicio;
  set idServicio(DocumentReference? val) => _idServicio = val;

  bool hasIdServicio() => _idServicio != null;

  static ServicesTipoStruct fromMap(Map<String, dynamic> data) =>
      ServicesTipoStruct(
        serviceMainType: data['ServiceMainType'] as String?,
        typesOfProductName: data['TypesOfProductName'] as String?,
        ea: castToType<double>(data['EA']),
        mv: castToType<double>(data['MV']),
        user: data['user'] as DocumentReference?,
        productNumber: castToType<int>(data['ProductNumber']),
        idServicio: data['idServicio'] as DocumentReference?,
      );

  static ServicesTipoStruct? maybeFromMap(dynamic data) => data is Map
      ? ServicesTipoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ServiceMainType': _serviceMainType,
        'TypesOfProductName': _typesOfProductName,
        'EA': _ea,
        'MV': _mv,
        'user': _user,
        'ProductNumber': _productNumber,
        'idServicio': _idServicio,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ServiceMainType': serializeParam(
          _serviceMainType,
          ParamType.String,
        ),
        'TypesOfProductName': serializeParam(
          _typesOfProductName,
          ParamType.String,
        ),
        'EA': serializeParam(
          _ea,
          ParamType.double,
        ),
        'MV': serializeParam(
          _mv,
          ParamType.double,
        ),
        'user': serializeParam(
          _user,
          ParamType.DocumentReference,
        ),
        'ProductNumber': serializeParam(
          _productNumber,
          ParamType.int,
        ),
        'idServicio': serializeParam(
          _idServicio,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static ServicesTipoStruct fromSerializableMap(Map<String, dynamic> data) =>
      ServicesTipoStruct(
        serviceMainType: deserializeParam(
          data['ServiceMainType'],
          ParamType.String,
          false,
        ),
        typesOfProductName: deserializeParam(
          data['TypesOfProductName'],
          ParamType.String,
          false,
        ),
        ea: deserializeParam(
          data['EA'],
          ParamType.double,
          false,
        ),
        mv: deserializeParam(
          data['MV'],
          ParamType.double,
          false,
        ),
        user: deserializeParam(
          data['user'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['user'],
        ),
        productNumber: deserializeParam(
          data['ProductNumber'],
          ParamType.int,
          false,
        ),
        idServicio: deserializeParam(
          data['idServicio'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Services'],
        ),
      );

  @override
  String toString() => 'ServicesTipoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ServicesTipoStruct &&
        serviceMainType == other.serviceMainType &&
        typesOfProductName == other.typesOfProductName &&
        ea == other.ea &&
        mv == other.mv &&
        user == other.user &&
        productNumber == other.productNumber &&
        idServicio == other.idServicio;
  }

  @override
  int get hashCode => const ListEquality().hash([
        serviceMainType,
        typesOfProductName,
        ea,
        mv,
        user,
        productNumber,
        idServicio
      ]);
}

ServicesTipoStruct createServicesTipoStruct({
  String? serviceMainType,
  String? typesOfProductName,
  double? ea,
  double? mv,
  DocumentReference? user,
  int? productNumber,
  DocumentReference? idServicio,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ServicesTipoStruct(
      serviceMainType: serviceMainType,
      typesOfProductName: typesOfProductName,
      ea: ea,
      mv: mv,
      user: user,
      productNumber: productNumber,
      idServicio: idServicio,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ServicesTipoStruct? updateServicesTipoStruct(
  ServicesTipoStruct? servicesTipo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    servicesTipo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addServicesTipoStructData(
  Map<String, dynamic> firestoreData,
  ServicesTipoStruct? servicesTipo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (servicesTipo == null) {
    return;
  }
  if (servicesTipo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && servicesTipo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final servicesTipoData =
      getServicesTipoFirestoreData(servicesTipo, forFieldValue);
  final nestedData =
      servicesTipoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = servicesTipo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getServicesTipoFirestoreData(
  ServicesTipoStruct? servicesTipo, [
  bool forFieldValue = false,
]) {
  if (servicesTipo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(servicesTipo.toMap());

  // Add any Firestore field values
  mapToFirestore(servicesTipo.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getServicesTipoListFirestoreData(
  List<ServicesTipoStruct>? servicesTipos,
) =>
    servicesTipos?.map((e) => getServicesTipoFirestoreData(e, true)).toList() ??
    [];
