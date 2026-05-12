import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BankAccountsRecord extends FirestoreRecord {
  BankAccountsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "bankName" field.
  String? _bankName;
  String get bankName => _bankName ?? '';
  bool hasBankName() => _bankName != null;

  // "accountType" field.
  String? _accountType;
  String get accountType => _accountType ?? '';
  bool hasAccountType() => _accountType != null;

  // "accountNumber" field.
  String? _accountNumber;
  String get accountNumber => _accountNumber ?? '';
  bool hasAccountNumber() => _accountNumber != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  void _initializeFields() {
    _bankName = snapshotData['bankName'] as String?;
    _accountType = snapshotData['accountType'] as String?;
    _accountNumber = snapshotData['accountNumber'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bankAccounts');

  static Stream<BankAccountsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BankAccountsRecord.fromSnapshot(s));

  static Future<BankAccountsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BankAccountsRecord.fromSnapshot(s));

  static BankAccountsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BankAccountsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BankAccountsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BankAccountsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BankAccountsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BankAccountsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBankAccountsRecordData({
  String? bankName,
  String? accountType,
  String? accountNumber,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'bankName': bankName,
      'accountType': accountType,
      'accountNumber': accountNumber,
      'userRef': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class BankAccountsRecordDocumentEquality
    implements Equality<BankAccountsRecord> {
  const BankAccountsRecordDocumentEquality();

  @override
  bool equals(BankAccountsRecord? e1, BankAccountsRecord? e2) {
    return e1?.bankName == e2?.bankName &&
        e1?.accountType == e2?.accountType &&
        e1?.accountNumber == e2?.accountNumber &&
        e1?.userRef == e2?.userRef;
  }

  @override
  int hash(BankAccountsRecord? e) => const ListEquality()
      .hash([e?.bankName, e?.accountType, e?.accountNumber, e?.userRef]);

  @override
  bool isValidKey(Object? o) => o is BankAccountsRecord;
}
