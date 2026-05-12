import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DepositRecord extends FirestoreRecord {
  DepositRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "depositdate" field.
  String? _depositdate;
  String get depositdate => _depositdate ?? '';
  bool hasDepositdate() => _depositdate != null;

  // "deposited_money" field.
  double? _depositedMoney;
  double get depositedMoney => _depositedMoney ?? 0.0;
  bool hasDepositedMoney() => _depositedMoney != null;

  // "bank" field.
  String? _bank;
  String get bank => _bank ?? '';
  bool hasBank() => _bank != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _depositdate = snapshotData['depositdate'] as String?;
    _depositedMoney = castToType<double>(snapshotData['deposited_money']);
    _bank = snapshotData['bank'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('deposit')
          : FirebaseFirestore.instance.collectionGroup('deposit');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('deposit').doc(id);

  static Stream<DepositRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DepositRecord.fromSnapshot(s));

  static Future<DepositRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DepositRecord.fromSnapshot(s));

  static DepositRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DepositRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DepositRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DepositRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DepositRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DepositRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDepositRecordData({
  String? depositdate,
  double? depositedMoney,
  String? bank,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'depositdate': depositdate,
      'deposited_money': depositedMoney,
      'bank': bank,
    }.withoutNulls,
  );

  return firestoreData;
}

class DepositRecordDocumentEquality implements Equality<DepositRecord> {
  const DepositRecordDocumentEquality();

  @override
  bool equals(DepositRecord? e1, DepositRecord? e2) {
    return e1?.depositdate == e2?.depositdate &&
        e1?.depositedMoney == e2?.depositedMoney &&
        e1?.bank == e2?.bank;
  }

  @override
  int hash(DepositRecord? e) =>
      const ListEquality().hash([e?.depositdate, e?.depositedMoney, e?.bank]);

  @override
  bool isValidKey(Object? o) => o is DepositRecord;
}
