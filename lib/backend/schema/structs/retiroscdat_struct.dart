// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RetiroscdatStruct extends FFFirebaseStruct {
  RetiroscdatStruct({
    double? monto,
    DateTime? fecharetiro,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _monto = monto,
        _fecharetiro = fecharetiro,
        super(firestoreUtilData);

  // "monto" field.
  double? _monto;
  double get monto => _monto ?? 0.0;
  set monto(double? val) => _monto = val;

  void incrementMonto(double amount) => monto = monto + amount;

  bool hasMonto() => _monto != null;

  // "fecharetiro" field.
  DateTime? _fecharetiro;
  DateTime? get fecharetiro => _fecharetiro;
  set fecharetiro(DateTime? val) => _fecharetiro = val;

  bool hasFecharetiro() => _fecharetiro != null;

  static RetiroscdatStruct fromMap(Map<String, dynamic> data) =>
      RetiroscdatStruct(
        monto: castToType<double>(data['monto']),
        fecharetiro: data['fecharetiro'] as DateTime?,
      );

  static RetiroscdatStruct? maybeFromMap(dynamic data) => data is Map
      ? RetiroscdatStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'monto': _monto,
        'fecharetiro': _fecharetiro,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'monto': serializeParam(
          _monto,
          ParamType.double,
        ),
        'fecharetiro': serializeParam(
          _fecharetiro,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static RetiroscdatStruct fromSerializableMap(Map<String, dynamic> data) =>
      RetiroscdatStruct(
        monto: deserializeParam(
          data['monto'],
          ParamType.double,
          false,
        ),
        fecharetiro: deserializeParam(
          data['fecharetiro'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'RetiroscdatStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RetiroscdatStruct &&
        monto == other.monto &&
        fecharetiro == other.fecharetiro;
  }

  @override
  int get hashCode => const ListEquality().hash([monto, fecharetiro]);
}

RetiroscdatStruct createRetiroscdatStruct({
  double? monto,
  DateTime? fecharetiro,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RetiroscdatStruct(
      monto: monto,
      fecharetiro: fecharetiro,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RetiroscdatStruct? updateRetiroscdatStruct(
  RetiroscdatStruct? retiroscdat, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    retiroscdat
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRetiroscdatStructData(
  Map<String, dynamic> firestoreData,
  RetiroscdatStruct? retiroscdat,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (retiroscdat == null) {
    return;
  }
  if (retiroscdat.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && retiroscdat.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final retiroscdatData =
      getRetiroscdatFirestoreData(retiroscdat, forFieldValue);
  final nestedData =
      retiroscdatData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = retiroscdat.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRetiroscdatFirestoreData(
  RetiroscdatStruct? retiroscdat, [
  bool forFieldValue = false,
]) {
  if (retiroscdat == null) {
    return {};
  }
  final firestoreData = mapToFirestore(retiroscdat.toMap());

  // Add any Firestore field values
  mapToFirestore(retiroscdat.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRetiroscdatListFirestoreData(
  List<RetiroscdatStruct>? retiroscdats,
) =>
    retiroscdats?.map((e) => getRetiroscdatFirestoreData(e, true)).toList() ??
    [];
