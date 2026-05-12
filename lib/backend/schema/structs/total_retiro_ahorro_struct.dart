// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TotalRetiroAhorroStruct extends FFFirebaseStruct {
  TotalRetiroAhorroStruct({
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
  String get ahorroid => _ahorroid ?? '';
  set ahorroid(String? val) => _ahorroid = val;

  bool hasAhorroid() => _ahorroid != null;

  static TotalRetiroAhorroStruct fromMap(Map<String, dynamic> data) =>
      TotalRetiroAhorroStruct(
        total: castToType<double>(data['total']),
        ahorroid: data['ahorroid'] as String?,
      );

  static TotalRetiroAhorroStruct? maybeFromMap(dynamic data) => data is Map
      ? TotalRetiroAhorroStruct.fromMap(data.cast<String, dynamic>())
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

  static TotalRetiroAhorroStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TotalRetiroAhorroStruct(
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
  String toString() => 'TotalRetiroAhorroStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TotalRetiroAhorroStruct &&
        total == other.total &&
        ahorroid == other.ahorroid;
  }

  @override
  int get hashCode => const ListEquality().hash([total, ahorroid]);
}

TotalRetiroAhorroStruct createTotalRetiroAhorroStruct({
  double? total,
  String? ahorroid,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TotalRetiroAhorroStruct(
      total: total,
      ahorroid: ahorroid,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TotalRetiroAhorroStruct? updateTotalRetiroAhorroStruct(
  TotalRetiroAhorroStruct? totalRetiroAhorro, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    totalRetiroAhorro
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTotalRetiroAhorroStructData(
  Map<String, dynamic> firestoreData,
  TotalRetiroAhorroStruct? totalRetiroAhorro,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (totalRetiroAhorro == null) {
    return;
  }
  if (totalRetiroAhorro.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && totalRetiroAhorro.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final totalRetiroAhorroData =
      getTotalRetiroAhorroFirestoreData(totalRetiroAhorro, forFieldValue);
  final nestedData =
      totalRetiroAhorroData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = totalRetiroAhorro.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTotalRetiroAhorroFirestoreData(
  TotalRetiroAhorroStruct? totalRetiroAhorro, [
  bool forFieldValue = false,
]) {
  if (totalRetiroAhorro == null) {
    return {};
  }
  final firestoreData = mapToFirestore(totalRetiroAhorro.toMap());

  // Add any Firestore field values
  mapToFirestore(totalRetiroAhorro.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTotalRetiroAhorroListFirestoreData(
  List<TotalRetiroAhorroStruct>? totalRetiroAhorros,
) =>
    totalRetiroAhorros
        ?.map((e) => getTotalRetiroAhorroFirestoreData(e, true))
        .toList() ??
    [];
