import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BanksRecord extends FirestoreRecord {
  BanksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "bankName" field.
  String? _bankName;
  String get bankName => _bankName ?? '';
  bool hasBankName() => _bankName != null;

  // "bankLogo" field.
  String? _bankLogo;
  String get bankLogo => _bankLogo ?? '';
  bool hasBankLogo() => _bankLogo != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

  void _initializeFields() {
    _bankName = snapshotData['bankName'] as String?;
    _bankLogo = snapshotData['bankLogo'] as String?;
    _order = castToType<int>(snapshotData['order']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('banks');

  static Stream<BanksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BanksRecord.fromSnapshot(s));

  static Future<BanksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BanksRecord.fromSnapshot(s));

  static BanksRecord fromSnapshot(DocumentSnapshot snapshot) => BanksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BanksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BanksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BanksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BanksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBanksRecordData({
  String? bankName,
  String? bankLogo,
  int? order,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'bankName': bankName,
      'bankLogo': bankLogo,
      'order': order,
    }.withoutNulls,
  );

  return firestoreData;
}

class BanksRecordDocumentEquality implements Equality<BanksRecord> {
  const BanksRecordDocumentEquality();

  @override
  bool equals(BanksRecord? e1, BanksRecord? e2) {
    return e1?.bankName == e2?.bankName &&
        e1?.bankLogo == e2?.bankLogo &&
        e1?.order == e2?.order;
  }

  @override
  int hash(BanksRecord? e) =>
      const ListEquality().hash([e?.bankName, e?.bankLogo, e?.order]);

  @override
  bool isValidKey(Object? o) => o is BanksRecord;
}
