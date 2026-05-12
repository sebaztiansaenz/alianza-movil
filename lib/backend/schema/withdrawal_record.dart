import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WithdrawalRecord extends FirestoreRecord {
  WithdrawalRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "customername" field.
  String? _customername;
  String get customername => _customername ?? '';
  bool hasCustomername() => _customername != null;

  // "accounttype" field.
  String? _accounttype;
  String get accounttype => _accounttype ?? '';
  bool hasAccounttype() => _accounttype != null;

  // "accountnumber" field.
  String? _accountnumber;
  String get accountnumber => _accountnumber ?? '';
  bool hasAccountnumber() => _accountnumber != null;

  // "amounttowithdraw" field.
  double? _amounttowithdraw;
  double get amounttowithdraw => _amounttowithdraw ?? 0.0;
  bool hasAmounttowithdraw() => _amounttowithdraw != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "bankName" field.
  String? _bankName;
  String get bankName => _bankName ?? '';
  bool hasBankName() => _bankName != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _country = snapshotData['country'] as String?;
    _customername = snapshotData['customername'] as String?;
    _accounttype = snapshotData['accounttype'] as String?;
    _accountnumber = snapshotData['accountnumber'] as String?;
    _amounttowithdraw = castToType<double>(snapshotData['amounttowithdraw']);
    _date = snapshotData['date'] as DateTime?;
    _bankName = snapshotData['bankName'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('withdrawal')
          : FirebaseFirestore.instance.collectionGroup('withdrawal');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('withdrawal').doc(id);

  static Stream<WithdrawalRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WithdrawalRecord.fromSnapshot(s));

  static Future<WithdrawalRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WithdrawalRecord.fromSnapshot(s));

  static WithdrawalRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WithdrawalRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WithdrawalRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WithdrawalRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WithdrawalRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WithdrawalRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWithdrawalRecordData({
  String? country,
  String? customername,
  String? accounttype,
  String? accountnumber,
  double? amounttowithdraw,
  DateTime? date,
  String? bankName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'country': country,
      'customername': customername,
      'accounttype': accounttype,
      'accountnumber': accountnumber,
      'amounttowithdraw': amounttowithdraw,
      'date': date,
      'bankName': bankName,
    }.withoutNulls,
  );

  return firestoreData;
}

class WithdrawalRecordDocumentEquality implements Equality<WithdrawalRecord> {
  const WithdrawalRecordDocumentEquality();

  @override
  bool equals(WithdrawalRecord? e1, WithdrawalRecord? e2) {
    return e1?.country == e2?.country &&
        e1?.customername == e2?.customername &&
        e1?.accounttype == e2?.accounttype &&
        e1?.accountnumber == e2?.accountnumber &&
        e1?.amounttowithdraw == e2?.amounttowithdraw &&
        e1?.date == e2?.date &&
        e1?.bankName == e2?.bankName;
  }

  @override
  int hash(WithdrawalRecord? e) => const ListEquality().hash([
        e?.country,
        e?.customername,
        e?.accounttype,
        e?.accountnumber,
        e?.amounttowithdraw,
        e?.date,
        e?.bankName
      ]);

  @override
  bool isValidKey(Object? o) => o is WithdrawalRecord;
}
