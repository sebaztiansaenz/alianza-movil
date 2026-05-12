// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AhorrosAccountsStruct extends FFFirebaseStruct {
  AhorrosAccountsStruct({
    String? ahorrosID,
    double? amount,
    String? userName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _ahorrosID = ahorrosID,
        _amount = amount,
        _userName = userName,
        super(firestoreUtilData);

  // "ahorrosID" field.
  String? _ahorrosID;
  String get ahorrosID => _ahorrosID ?? '';
  set ahorrosID(String? val) => _ahorrosID = val;

  bool hasAhorrosID() => _ahorrosID != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  set amount(double? val) => _amount = val;

  void incrementAmount(double amount) => amount = amount + amount;

  bool hasAmount() => _amount != null;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;

  bool hasUserName() => _userName != null;

  static AhorrosAccountsStruct fromMap(Map<String, dynamic> data) =>
      AhorrosAccountsStruct(
        ahorrosID: data['ahorrosID'] as String?,
        amount: castToType<double>(data['amount']),
        userName: data['userName'] as String?,
      );

  static AhorrosAccountsStruct? maybeFromMap(dynamic data) => data is Map
      ? AhorrosAccountsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ahorrosID': _ahorrosID,
        'amount': _amount,
        'userName': _userName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ahorrosID': serializeParam(
          _ahorrosID,
          ParamType.String,
        ),
        'amount': serializeParam(
          _amount,
          ParamType.double,
        ),
        'userName': serializeParam(
          _userName,
          ParamType.String,
        ),
      }.withoutNulls;

  static AhorrosAccountsStruct fromSerializableMap(Map<String, dynamic> data) =>
      AhorrosAccountsStruct(
        ahorrosID: deserializeParam(
          data['ahorrosID'],
          ParamType.String,
          false,
        ),
        amount: deserializeParam(
          data['amount'],
          ParamType.double,
          false,
        ),
        userName: deserializeParam(
          data['userName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AhorrosAccountsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AhorrosAccountsStruct &&
        ahorrosID == other.ahorrosID &&
        amount == other.amount &&
        userName == other.userName;
  }

  @override
  int get hashCode => const ListEquality().hash([ahorrosID, amount, userName]);
}

AhorrosAccountsStruct createAhorrosAccountsStruct({
  String? ahorrosID,
  double? amount,
  String? userName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AhorrosAccountsStruct(
      ahorrosID: ahorrosID,
      amount: amount,
      userName: userName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AhorrosAccountsStruct? updateAhorrosAccountsStruct(
  AhorrosAccountsStruct? ahorrosAccounts, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    ahorrosAccounts
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAhorrosAccountsStructData(
  Map<String, dynamic> firestoreData,
  AhorrosAccountsStruct? ahorrosAccounts,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (ahorrosAccounts == null) {
    return;
  }
  if (ahorrosAccounts.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && ahorrosAccounts.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final ahorrosAccountsData =
      getAhorrosAccountsFirestoreData(ahorrosAccounts, forFieldValue);
  final nestedData =
      ahorrosAccountsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = ahorrosAccounts.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAhorrosAccountsFirestoreData(
  AhorrosAccountsStruct? ahorrosAccounts, [
  bool forFieldValue = false,
]) {
  if (ahorrosAccounts == null) {
    return {};
  }
  final firestoreData = mapToFirestore(ahorrosAccounts.toMap());

  // Add any Firestore field values
  mapToFirestore(ahorrosAccounts.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAhorrosAccountsListFirestoreData(
  List<AhorrosAccountsStruct>? ahorrosAccountss,
) =>
    ahorrosAccountss
        ?.map((e) => getAhorrosAccountsFirestoreData(e, true))
        .toList() ??
    [];
