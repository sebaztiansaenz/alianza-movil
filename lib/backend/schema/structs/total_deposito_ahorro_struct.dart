// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TotalDepositoAhorroStruct extends FFFirebaseStruct {
  TotalDepositoAhorroStruct({
    double? total,
    String? ahorroid,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _total = total,
        _ahorroid = ahorroid,
        super(firestoreUtilData);

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  set total(double? val) => _total = val;

  void incrementTotal(double amount) => total = total + amount;

  bool hasTotal() => _total != null;

  // "ahorroid" field.
  String? _ahorroid;
  String get ahorroid => _ahorroid ?? '0';
  set ahorroid(String? val) => _ahorroid = val;

  bool hasAhorroid() => _ahorroid != null;

  static TotalDepositoAhorroStruct fromMap(Map<String, dynamic> data) =>
      TotalDepositoAhorroStruct(
        total: castToType<double>(data['total']),
        ahorroid: data['ahorroid'] as String?,
      );

  static TotalDepositoAhorroStruct? maybeFromMap(dynamic data) => data is Map
      ? TotalDepositoAhorroStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'total': _total,
        'ahorroid': _ahorroid,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'total': serializeParam(
          _total,
          ParamType.double,
        ),
        'ahorroid': serializeParam(
          _ahorroid,
          ParamType.String,
        ),
      }.withoutNulls;

  static TotalDepositoAhorroStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TotalDepositoAhorroStruct(
        total: deserializeParam(
          data['total'],
          ParamType.double,
          false,
        ),
        ahorroid: deserializeParam(
          data['ahorroid'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TotalDepositoAhorroStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TotalDepositoAhorroStruct &&
        total == other.total &&
        ahorroid == other.ahorroid;
  }

  @override
  int get hashCode => const ListEquality().hash([total, ahorroid]);
}

TotalDepositoAhorroStruct createTotalDepositoAhorroStruct({
  double? total,
  String? ahorroid,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TotalDepositoAhorroStruct(
      total: total,
      ahorroid: ahorroid,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TotalDepositoAhorroStruct? updateTotalDepositoAhorroStruct(
  TotalDepositoAhorroStruct? totalDepositoAhorro, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    totalDepositoAhorro
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTotalDepositoAhorroStructData(
  Map<String, dynamic> firestoreData,
  TotalDepositoAhorroStruct? totalDepositoAhorro,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (totalDepositoAhorro == null) {
    return;
  }
  if (totalDepositoAhorro.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && totalDepositoAhorro.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final totalDepositoAhorroData =
      getTotalDepositoAhorroFirestoreData(totalDepositoAhorro, forFieldValue);
  final nestedData =
      totalDepositoAhorroData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      totalDepositoAhorro.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTotalDepositoAhorroFirestoreData(
  TotalDepositoAhorroStruct? totalDepositoAhorro, [
  bool forFieldValue = false,
]) {
  if (totalDepositoAhorro == null) {
    return {};
  }
  final firestoreData = mapToFirestore(totalDepositoAhorro.toMap());

  // Add any Firestore field values
  mapToFirestore(totalDepositoAhorro.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTotalDepositoAhorroListFirestoreData(
  List<TotalDepositoAhorroStruct>? totalDepositoAhorros,
) =>
    totalDepositoAhorros
        ?.map((e) => getTotalDepositoAhorroFirestoreData(e, true))
        .toList() ??
    [];
