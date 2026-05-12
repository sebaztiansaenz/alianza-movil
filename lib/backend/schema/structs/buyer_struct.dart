// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BuyerStruct extends FFFirebaseStruct {
  BuyerStruct({
    String? document,
    String? documentType,
    String? name,
    String? email,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _document = document,
        _documentType = documentType,
        _name = name,
        _email = email,
        super(firestoreUtilData);

  // "document" field.
  String? _document;
  String get document => _document ?? '';
  set document(String? val) => _document = val;

  bool hasDocument() => _document != null;

  // "documentType" field.
  String? _documentType;
  String get documentType => _documentType ?? '';
  set documentType(String? val) => _documentType = val;

  bool hasDocumentType() => _documentType != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  static BuyerStruct fromMap(Map<String, dynamic> data) => BuyerStruct(
        document: data['document'] as String?,
        documentType: data['documentType'] as String?,
        name: data['name'] as String?,
        email: data['email'] as String?,
      );

  static BuyerStruct? maybeFromMap(dynamic data) =>
      data is Map ? BuyerStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'document': _document,
        'documentType': _documentType,
        'name': _name,
        'email': _email,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'document': serializeParam(
          _document,
          ParamType.String,
        ),
        'documentType': serializeParam(
          _documentType,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
      }.withoutNulls;

  static BuyerStruct fromSerializableMap(Map<String, dynamic> data) =>
      BuyerStruct(
        document: deserializeParam(
          data['document'],
          ParamType.String,
          false,
        ),
        documentType: deserializeParam(
          data['documentType'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BuyerStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BuyerStruct &&
        document == other.document &&
        documentType == other.documentType &&
        name == other.name &&
        email == other.email;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([document, documentType, name, email]);
}

BuyerStruct createBuyerStruct({
  String? document,
  String? documentType,
  String? name,
  String? email,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BuyerStruct(
      document: document,
      documentType: documentType,
      name: name,
      email: email,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BuyerStruct? updateBuyerStruct(
  BuyerStruct? buyer, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    buyer
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBuyerStructData(
  Map<String, dynamic> firestoreData,
  BuyerStruct? buyer,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (buyer == null) {
    return;
  }
  if (buyer.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && buyer.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final buyerData = getBuyerFirestoreData(buyer, forFieldValue);
  final nestedData = buyerData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = buyer.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBuyerFirestoreData(
  BuyerStruct? buyer, [
  bool forFieldValue = false,
]) {
  if (buyer == null) {
    return {};
  }
  final firestoreData = mapToFirestore(buyer.toMap());

  // Add any Firestore field values
  mapToFirestore(buyer.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBuyerListFirestoreData(
  List<BuyerStruct>? buyers,
) =>
    buyers?.map((e) => getBuyerFirestoreData(e, true)).toList() ?? [];
