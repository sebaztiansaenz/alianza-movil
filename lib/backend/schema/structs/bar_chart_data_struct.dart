// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BarChartDataStruct extends FFFirebaseStruct {
  BarChartDataStruct({
    String? month,
    double? value1,
    double? value2,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _month = month,
        _value1 = value1,
        _value2 = value2,
        super(firestoreUtilData);

  // "month" field.
  String? _month;
  String get month => _month ?? '';
  set month(String? val) => _month = val;

  bool hasMonth() => _month != null;

  // "value1" field.
  double? _value1;
  double get value1 => _value1 ?? 0.0;
  set value1(double? val) => _value1 = val;

  void incrementValue1(double amount) => value1 = value1 + amount;

  bool hasValue1() => _value1 != null;

  // "value2" field.
  double? _value2;
  double get value2 => _value2 ?? 0.0;
  set value2(double? val) => _value2 = val;

  void incrementValue2(double amount) => value2 = value2 + amount;

  bool hasValue2() => _value2 != null;

  static BarChartDataStruct fromMap(Map<String, dynamic> data) =>
      BarChartDataStruct(
        month: data['month'] as String?,
        value1: castToType<double>(data['value1']),
        value2: castToType<double>(data['value2']),
      );

  static BarChartDataStruct? maybeFromMap(dynamic data) => data is Map
      ? BarChartDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'month': _month,
        'value1': _value1,
        'value2': _value2,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'month': serializeParam(
          _month,
          ParamType.String,
        ),
        'value1': serializeParam(
          _value1,
          ParamType.double,
        ),
        'value2': serializeParam(
          _value2,
          ParamType.double,
        ),
      }.withoutNulls;

  static BarChartDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      BarChartDataStruct(
        month: deserializeParam(
          data['month'],
          ParamType.String,
          false,
        ),
        value1: deserializeParam(
          data['value1'],
          ParamType.double,
          false,
        ),
        value2: deserializeParam(
          data['value2'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'BarChartDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BarChartDataStruct &&
        month == other.month &&
        value1 == other.value1 &&
        value2 == other.value2;
  }

  @override
  int get hashCode => const ListEquality().hash([month, value1, value2]);
}

BarChartDataStruct createBarChartDataStruct({
  String? month,
  double? value1,
  double? value2,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BarChartDataStruct(
      month: month,
      value1: value1,
      value2: value2,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BarChartDataStruct? updateBarChartDataStruct(
  BarChartDataStruct? barChartData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    barChartData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBarChartDataStructData(
  Map<String, dynamic> firestoreData,
  BarChartDataStruct? barChartData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (barChartData == null) {
    return;
  }
  if (barChartData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && barChartData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final barChartDataData =
      getBarChartDataFirestoreData(barChartData, forFieldValue);
  final nestedData =
      barChartDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = barChartData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBarChartDataFirestoreData(
  BarChartDataStruct? barChartData, [
  bool forFieldValue = false,
]) {
  if (barChartData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(barChartData.toMap());

  // Add any Firestore field values
  mapToFirestore(barChartData.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBarChartDataListFirestoreData(
  List<BarChartDataStruct>? barChartDatas,
) =>
    barChartDatas?.map((e) => getBarChartDataFirestoreData(e, true)).toList() ??
    [];
