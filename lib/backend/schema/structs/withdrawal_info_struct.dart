// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WithdrawalInfoStruct extends FFFirebaseStruct {
  WithdrawalInfoStruct({
    String? bankName,
    String? accountType,
    String? accountNumber,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _bankName = bankName,
        _accountType = accountType,
        _accountNumber = accountNumber,
        super(firestoreUtilData);

  // "bankName" field.
  String? _bankName;
  String get bankName => _bankName ?? '';
  set bankName(String? val) => _bankName = val;

  bool hasBankName() => _bankName != null;

  // "accountType" field.
  String? _accountType;
  String get accountType => _accountType ?? '';
  set accountType(String? val) => _accountType = val;

  bool hasAccountType() => _accountType != null;

  // "accountNumber" field.
  String? _accountNumber;
  String get accountNumber => _accountNumber ?? '';
  set accountNumber(String? val) => _accountNumber = val;

  bool hasAccountNumber() => _accountNumber != null;

  static WithdrawalInfoStruct fromMap(Map<String, dynamic> data) =>
      WithdrawalInfoStruct(
        bankName: data['bankName'] as String?,
        accountType: data['accountType'] as String?,
        accountNumber: data['accountNumber'] as String?,
      );

  static WithdrawalInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? WithdrawalInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'bankName': _bankName,
        'accountType': _accountType,
        'accountNumber': _accountNumber,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'bankName': serializeParam(
          _bankName,
          ParamType.String,
        ),
        'accountType': serializeParam(
          _accountType,
          ParamType.String,
        ),
        'accountNumber': serializeParam(
          _accountNumber,
          ParamType.String,
        ),
      }.withoutNulls;

  static WithdrawalInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      WithdrawalInfoStruct(
        bankName: deserializeParam(
          data['bankName'],
          ParamType.String,
          false,
        ),
        accountType: deserializeParam(
          data['accountType'],
          ParamType.String,
          false,
        ),
        accountNumber: deserializeParam(
          data['accountNumber'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'WithdrawalInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WithdrawalInfoStruct &&
        bankName == other.bankName &&
        accountType == other.accountType &&
        accountNumber == other.accountNumber;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([bankName, accountType, accountNumber]);
}

WithdrawalInfoStruct createWithdrawalInfoStruct({
  String? bankName,
  String? accountType,
  String? accountNumber,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    WithdrawalInfoStruct(
      bankName: bankName,
      accountType: accountType,
      accountNumber: accountNumber,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

WithdrawalInfoStruct? updateWithdrawalInfoStruct(
  WithdrawalInfoStruct? withdrawalInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    withdrawalInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addWithdrawalInfoStructData(
  Map<String, dynamic> firestoreData,
  WithdrawalInfoStruct? withdrawalInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (withdrawalInfo == null) {
    return;
  }
  if (withdrawalInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && withdrawalInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final withdrawalInfoData =
      getWithdrawalInfoFirestoreData(withdrawalInfo, forFieldValue);
  final nestedData =
      withdrawalInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = withdrawalInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getWithdrawalInfoFirestoreData(
  WithdrawalInfoStruct? withdrawalInfo, [
  bool forFieldValue = false,
]) {
  if (withdrawalInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(withdrawalInfo.toMap());

  // Add any Firestore field values
  mapToFirestore(withdrawalInfo.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWithdrawalInfoListFirestoreData(
  List<WithdrawalInfoStruct>? withdrawalInfos,
) =>
    withdrawalInfos
        ?.map((e) => getWithdrawalInfoFirestoreData(e, true))
        .toList() ??
    [];
