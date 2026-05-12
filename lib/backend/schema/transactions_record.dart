import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransactionsRecord extends FirestoreRecord {
  TransactionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "processUrl" field.
  String? _processUrl;
  String get processUrl => _processUrl ?? '';
  bool hasProcessUrl() => _processUrl != null;

  // "referenceId" field.
  String? _referenceId;
  String get referenceId => _referenceId ?? '';
  bool hasReferenceId() => _referenceId != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "currency" field.
  String? _currency;
  String get currency => _currency ?? '';
  bool hasCurrency() => _currency != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  // "requestId" field.
  int? _requestId;
  int get requestId => _requestId ?? 0;
  bool hasRequestId() => _requestId != null;

  // "userAccounts" field.
  List<AhorrosAccountsStruct>? _userAccounts;
  List<AhorrosAccountsStruct> get userAccounts => _userAccounts ?? const [];
  bool hasUserAccounts() => _userAccounts != null;

  // "buyerId" field.
  String? _buyerId;
  String get buyerId => _buyerId ?? '';
  bool hasBuyerId() => _buyerId != null;

  // "transactionType" field.
  String? _transactionType;
  String get transactionType => _transactionType ?? '';
  bool hasTransactionType() => _transactionType != null;

  // "withdrawalInfo" field.
  WithdrawalInfoStruct? _withdrawalInfo;
  WithdrawalInfoStruct get withdrawalInfo =>
      _withdrawalInfo ?? WithdrawalInfoStruct();
  bool hasWithdrawalInfo() => _withdrawalInfo != null;

  // "ahorrosId" field.
  String? _ahorrosId;
  String get ahorrosId => _ahorrosId ?? '';
  bool hasAhorrosId() => _ahorrosId != null;

  // "firebaseDate" field.
  DateTime? _firebaseDate;
  DateTime? get firebaseDate => _firebaseDate;
  bool hasFirebaseDate() => _firebaseDate != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "lastUpdated" field.
  DateTime? _lastUpdated;
  DateTime? get lastUpdated => _lastUpdated;
  bool hasLastUpdated() => _lastUpdated != null;

  // "amountFromTotal" field.
  double? _amountFromTotal;
  double get amountFromTotal => _amountFromTotal ?? 0.0;
  bool hasAmountFromTotal() => _amountFromTotal != null;

  // "amountFromSavings" field.
  double? _amountFromSavings;
  double get amountFromSavings => _amountFromSavings ?? 0.0;
  bool hasAmountFromSavings() => _amountFromSavings != null;

  // "ahorrosRef" field.
  DocumentReference? _ahorrosRef;
  DocumentReference? get ahorrosRef => _ahorrosRef;
  bool hasAhorrosRef() => _ahorrosRef != null;

  // "bank" field.
  String? _bank;
  String get bank => _bank ?? '';
  bool hasBank() => _bank != null;

  // "authorization" field.
  String? _authorization;
  String get authorization => _authorization ?? '';
  bool hasAuthorization() => _authorization != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "dateFromPSE" field.
  DateTime? _dateFromPSE;
  DateTime? get dateFromPSE => _dateFromPSE;
  bool hasDateFromPSE() => _dateFromPSE != null;

  // "empresaAdminSetDate" field.
  DateTime? _empresaAdminSetDate;
  DateTime? get empresaAdminSetDate => _empresaAdminSetDate;
  bool hasEmpresaAdminSetDate() => _empresaAdminSetDate != null;

  // "empresaId" field.
  String? _empresaId;
  String get empresaId => _empresaId ?? '';
  bool hasEmpresaId() => _empresaId != null;

  // "subPayment" field.
  bool? _subPayment;
  bool get subPayment => _subPayment ?? false;
  bool hasSubPayment() => _subPayment != null;

  // "userIdNumber" field.
  String? _userIdNumber;
  String get userIdNumber => _userIdNumber ?? '';
  bool hasUserIdNumber() => _userIdNumber != null;

  // "confirmationDate" field.
  DateTime? _confirmationDate;
  DateTime? get confirmationDate => _confirmationDate;
  bool hasConfirmationDate() => _confirmationDate != null;

  // "observation" field.
  String? _observation;
  String get observation => _observation ?? '';
  bool hasObservation() => _observation != null;

  // "chanelPay" field.
  String? _chanelPay;
  String get chanelPay => _chanelPay ?? '';
  bool hasChanelPay() => _chanelPay != null;

  // "userEmail" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  bool hasUserEmail() => _userEmail != null;

  // "userPhone" field.
  String? _userPhone;
  String get userPhone => _userPhone ?? '';
  bool hasUserPhone() => _userPhone != null;

  // "savingtipe" field.
  String? _savingtipe;
  String get savingtipe => _savingtipe ?? '';
  bool hasSavingtipe() => _savingtipe != null;

  // "isAhorroCdat" field.
  bool? _isAhorroCdat;
  bool get isAhorroCdat => _isAhorroCdat ?? false;
  bool hasIsAhorroCdat() => _isAhorroCdat != null;

  // "isNovedadSaldo" field.
  bool? _isNovedadSaldo;
  bool get isNovedadSaldo => _isNovedadSaldo ?? false;
  bool hasIsNovedadSaldo() => _isNovedadSaldo != null;

  void _initializeFields() {
    _processUrl = snapshotData['processUrl'] as String?;
    _referenceId = snapshotData['referenceId'] as String?;
    _amount = castToType<double>(snapshotData['amount']);
    _currency = snapshotData['currency'] as String?;
    _description = snapshotData['description'] as String?;
    _status = snapshotData['status'] as String?;
    _date = snapshotData['date'] as String?;
    _requestId = castToType<int>(snapshotData['requestId']);
    _userAccounts = getStructList(
      snapshotData['userAccounts'],
      AhorrosAccountsStruct.fromMap,
    );
    _buyerId = snapshotData['buyerId'] as String?;
    _transactionType = snapshotData['transactionType'] as String?;
    _withdrawalInfo = snapshotData['withdrawalInfo'] is WithdrawalInfoStruct
        ? snapshotData['withdrawalInfo']
        : WithdrawalInfoStruct.maybeFromMap(snapshotData['withdrawalInfo']);
    _ahorrosId = snapshotData['ahorrosId'] as String?;
    _firebaseDate = snapshotData['firebaseDate'] as DateTime?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _userName = snapshotData['userName'] as String?;
    _lastUpdated = snapshotData['lastUpdated'] as DateTime?;
    _amountFromTotal = castToType<double>(snapshotData['amountFromTotal']);
    _amountFromSavings = castToType<double>(snapshotData['amountFromSavings']);
    _ahorrosRef = snapshotData['ahorrosRef'] as DocumentReference?;
    _bank = snapshotData['bank'] as String?;
    _authorization = snapshotData['authorization'] as String?;
    _message = snapshotData['message'] as String?;
    _dateFromPSE = snapshotData['dateFromPSE'] as DateTime?;
    _empresaAdminSetDate = snapshotData['empresaAdminSetDate'] as DateTime?;
    _empresaId = snapshotData['empresaId'] as String?;
    _subPayment = snapshotData['subPayment'] as bool?;
    _userIdNumber = snapshotData['userIdNumber'] as String?;
    _confirmationDate = snapshotData['confirmationDate'] as DateTime?;
    _observation = snapshotData['observation'] as String?;
    _chanelPay = snapshotData['chanelPay'] as String?;
    _userEmail = snapshotData['userEmail'] as String?;
    _userPhone = snapshotData['userPhone'] as String?;
    _savingtipe = snapshotData['savingtipe'] as String?;
    _isAhorroCdat = snapshotData['isAhorroCdat'] as bool?;
    _isNovedadSaldo = snapshotData['isNovedadSaldo'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transactions');

  static Stream<TransactionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransactionsRecord.fromSnapshot(s));

  static Future<TransactionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TransactionsRecord.fromSnapshot(s));

  static TransactionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransactionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransactionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransactionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransactionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransactionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransactionsRecordData({
  String? processUrl,
  String? referenceId,
  double? amount,
  String? currency,
  String? description,
  String? status,
  String? date,
  int? requestId,
  String? buyerId,
  String? transactionType,
  WithdrawalInfoStruct? withdrawalInfo,
  String? ahorrosId,
  DateTime? firebaseDate,
  DocumentReference? userRef,
  String? userName,
  DateTime? lastUpdated,
  double? amountFromTotal,
  double? amountFromSavings,
  DocumentReference? ahorrosRef,
  String? bank,
  String? authorization,
  String? message,
  DateTime? dateFromPSE,
  DateTime? empresaAdminSetDate,
  String? empresaId,
  bool? subPayment,
  String? userIdNumber,
  DateTime? confirmationDate,
  String? observation,
  String? chanelPay,
  String? userEmail,
  String? userPhone,
  String? savingtipe,
  bool? isAhorroCdat,
  bool? isNovedadSaldo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'processUrl': processUrl,
      'referenceId': referenceId,
      'amount': amount,
      'currency': currency,
      'description': description,
      'status': status,
      'date': date,
      'requestId': requestId,
      'buyerId': buyerId,
      'transactionType': transactionType,
      'withdrawalInfo': WithdrawalInfoStruct().toMap(),
      'ahorrosId': ahorrosId,
      'firebaseDate': firebaseDate,
      'userRef': userRef,
      'userName': userName,
      'lastUpdated': lastUpdated,
      'amountFromTotal': amountFromTotal,
      'amountFromSavings': amountFromSavings,
      'ahorrosRef': ahorrosRef,
      'bank': bank,
      'authorization': authorization,
      'message': message,
      'dateFromPSE': dateFromPSE,
      'empresaAdminSetDate': empresaAdminSetDate,
      'empresaId': empresaId,
      'subPayment': subPayment,
      'userIdNumber': userIdNumber,
      'confirmationDate': confirmationDate,
      'observation': observation,
      'chanelPay': chanelPay,
      'userEmail': userEmail,
      'userPhone': userPhone,
      'savingtipe': savingtipe,
      'isAhorroCdat': isAhorroCdat,
      'isNovedadSaldo': isNovedadSaldo,
    }.withoutNulls,
  );

  // Handle nested data for "withdrawalInfo" field.
  addWithdrawalInfoStructData(firestoreData, withdrawalInfo, 'withdrawalInfo');

  return firestoreData;
}

class TransactionsRecordDocumentEquality
    implements Equality<TransactionsRecord> {
  const TransactionsRecordDocumentEquality();

  @override
  bool equals(TransactionsRecord? e1, TransactionsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.processUrl == e2?.processUrl &&
        e1?.referenceId == e2?.referenceId &&
        e1?.amount == e2?.amount &&
        e1?.currency == e2?.currency &&
        e1?.description == e2?.description &&
        e1?.status == e2?.status &&
        e1?.date == e2?.date &&
        e1?.requestId == e2?.requestId &&
        listEquality.equals(e1?.userAccounts, e2?.userAccounts) &&
        e1?.buyerId == e2?.buyerId &&
        e1?.transactionType == e2?.transactionType &&
        e1?.withdrawalInfo == e2?.withdrawalInfo &&
        e1?.ahorrosId == e2?.ahorrosId &&
        e1?.firebaseDate == e2?.firebaseDate &&
        e1?.userRef == e2?.userRef &&
        e1?.userName == e2?.userName &&
        e1?.lastUpdated == e2?.lastUpdated &&
        e1?.amountFromTotal == e2?.amountFromTotal &&
        e1?.amountFromSavings == e2?.amountFromSavings &&
        e1?.ahorrosRef == e2?.ahorrosRef &&
        e1?.bank == e2?.bank &&
        e1?.authorization == e2?.authorization &&
        e1?.message == e2?.message &&
        e1?.dateFromPSE == e2?.dateFromPSE &&
        e1?.empresaAdminSetDate == e2?.empresaAdminSetDate &&
        e1?.empresaId == e2?.empresaId &&
        e1?.subPayment == e2?.subPayment &&
        e1?.userIdNumber == e2?.userIdNumber &&
        e1?.confirmationDate == e2?.confirmationDate &&
        e1?.observation == e2?.observation &&
        e1?.chanelPay == e2?.chanelPay &&
        e1?.userEmail == e2?.userEmail &&
        e1?.userPhone == e2?.userPhone &&
        e1?.savingtipe == e2?.savingtipe &&
        e1?.isAhorroCdat == e2?.isAhorroCdat &&
        e1?.isNovedadSaldo == e2?.isNovedadSaldo;
  }

  @override
  int hash(TransactionsRecord? e) => const ListEquality().hash([
        e?.processUrl,
        e?.referenceId,
        e?.amount,
        e?.currency,
        e?.description,
        e?.status,
        e?.date,
        e?.requestId,
        e?.userAccounts,
        e?.buyerId,
        e?.transactionType,
        e?.withdrawalInfo,
        e?.ahorrosId,
        e?.firebaseDate,
        e?.userRef,
        e?.userName,
        e?.lastUpdated,
        e?.amountFromTotal,
        e?.amountFromSavings,
        e?.ahorrosRef,
        e?.bank,
        e?.authorization,
        e?.message,
        e?.dateFromPSE,
        e?.empresaAdminSetDate,
        e?.empresaId,
        e?.subPayment,
        e?.userIdNumber,
        e?.confirmationDate,
        e?.observation,
        e?.chanelPay,
        e?.userEmail,
        e?.userPhone,
        e?.savingtipe,
        e?.isAhorroCdat,
        e?.isNovedadSaldo
      ]);

  @override
  bool isValidKey(Object? o) => o is TransactionsRecord;
}
