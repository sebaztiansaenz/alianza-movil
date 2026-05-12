// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransactionsStruct extends FFFirebaseStruct {
  TransactionsStruct({
    double? totalBefore,
    double? totalAfter,
    double? fullBenefit,
    double? taxedBenefit,
    double? tax,
    double? monthEA,
    DateTime? date,
    String? transactionType,
    String? paymentMethod,
    String? description,
    String? status,
    double? amount,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _totalBefore = totalBefore,
        _totalAfter = totalAfter,
        _fullBenefit = fullBenefit,
        _taxedBenefit = taxedBenefit,
        _tax = tax,
        _monthEA = monthEA,
        _date = date,
        _transactionType = transactionType,
        _paymentMethod = paymentMethod,
        _description = description,
        _status = status,
        _amount = amount,
        super(firestoreUtilData);

  // "totalBefore" field.
  double? _totalBefore;
  double get totalBefore => _totalBefore ?? 0.0;
  set totalBefore(double? val) => _totalBefore = val;

  void incrementTotalBefore(double amount) =>
      totalBefore = totalBefore + amount;

  bool hasTotalBefore() => _totalBefore != null;

  // "totalAfter" field.
  double? _totalAfter;
  double get totalAfter => _totalAfter ?? 0.0;
  set totalAfter(double? val) => _totalAfter = val;

  void incrementTotalAfter(double amount) => totalAfter = totalAfter + amount;

  bool hasTotalAfter() => _totalAfter != null;

  // "fullBenefit" field.
  double? _fullBenefit;
  double get fullBenefit => _fullBenefit ?? 0.0;
  set fullBenefit(double? val) => _fullBenefit = val;

  void incrementFullBenefit(double amount) =>
      fullBenefit = fullBenefit + amount;

  bool hasFullBenefit() => _fullBenefit != null;

  // "taxedBenefit" field.
  double? _taxedBenefit;
  double get taxedBenefit => _taxedBenefit ?? 0.0;
  set taxedBenefit(double? val) => _taxedBenefit = val;

  void incrementTaxedBenefit(double amount) =>
      taxedBenefit = taxedBenefit + amount;

  bool hasTaxedBenefit() => _taxedBenefit != null;

  // "tax" field.
  double? _tax;
  double get tax => _tax ?? 0.0;
  set tax(double? val) => _tax = val;

  void incrementTax(double amount) => tax = tax + amount;

  bool hasTax() => _tax != null;

  // "monthEA" field.
  double? _monthEA;
  double get monthEA => _monthEA ?? 0.0;
  set monthEA(double? val) => _monthEA = val;

  void incrementMonthEA(double amount) => monthEA = monthEA + amount;

  bool hasMonthEA() => _monthEA != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "transactionType" field.
  String? _transactionType;
  String get transactionType => _transactionType ?? '';
  set transactionType(String? val) => _transactionType = val;

  bool hasTransactionType() => _transactionType != null;

  // "paymentMethod" field.
  String? _paymentMethod;
  String get paymentMethod => _paymentMethod ?? '';
  set paymentMethod(String? val) => _paymentMethod = val;

  bool hasPaymentMethod() => _paymentMethod != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  set amount(double? val) => _amount = val;

  void incrementAmount(double amount) => amount = amount + amount;

  bool hasAmount() => _amount != null;

  static TransactionsStruct fromMap(Map<String, dynamic> data) =>
      TransactionsStruct(
        totalBefore: castToType<double>(data['totalBefore']),
        totalAfter: castToType<double>(data['totalAfter']),
        fullBenefit: castToType<double>(data['fullBenefit']),
        taxedBenefit: castToType<double>(data['taxedBenefit']),
        tax: castToType<double>(data['tax']),
        monthEA: castToType<double>(data['monthEA']),
        date: data['date'] as DateTime?,
        transactionType: data['transactionType'] as String?,
        paymentMethod: data['paymentMethod'] as String?,
        description: data['description'] as String?,
        status: data['status'] as String?,
        amount: castToType<double>(data['amount']),
      );

  static TransactionsStruct? maybeFromMap(dynamic data) => data is Map
      ? TransactionsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'totalBefore': _totalBefore,
        'totalAfter': _totalAfter,
        'fullBenefit': _fullBenefit,
        'taxedBenefit': _taxedBenefit,
        'tax': _tax,
        'monthEA': _monthEA,
        'date': _date,
        'transactionType': _transactionType,
        'paymentMethod': _paymentMethod,
        'description': _description,
        'status': _status,
        'amount': _amount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'totalBefore': serializeParam(
          _totalBefore,
          ParamType.double,
        ),
        'totalAfter': serializeParam(
          _totalAfter,
          ParamType.double,
        ),
        'fullBenefit': serializeParam(
          _fullBenefit,
          ParamType.double,
        ),
        'taxedBenefit': serializeParam(
          _taxedBenefit,
          ParamType.double,
        ),
        'tax': serializeParam(
          _tax,
          ParamType.double,
        ),
        'monthEA': serializeParam(
          _monthEA,
          ParamType.double,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'transactionType': serializeParam(
          _transactionType,
          ParamType.String,
        ),
        'paymentMethod': serializeParam(
          _paymentMethod,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'amount': serializeParam(
          _amount,
          ParamType.double,
        ),
      }.withoutNulls;

  static TransactionsStruct fromSerializableMap(Map<String, dynamic> data) =>
      TransactionsStruct(
        totalBefore: deserializeParam(
          data['totalBefore'],
          ParamType.double,
          false,
        ),
        totalAfter: deserializeParam(
          data['totalAfter'],
          ParamType.double,
          false,
        ),
        fullBenefit: deserializeParam(
          data['fullBenefit'],
          ParamType.double,
          false,
        ),
        taxedBenefit: deserializeParam(
          data['taxedBenefit'],
          ParamType.double,
          false,
        ),
        tax: deserializeParam(
          data['tax'],
          ParamType.double,
          false,
        ),
        monthEA: deserializeParam(
          data['monthEA'],
          ParamType.double,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        transactionType: deserializeParam(
          data['transactionType'],
          ParamType.String,
          false,
        ),
        paymentMethod: deserializeParam(
          data['paymentMethod'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        amount: deserializeParam(
          data['amount'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'TransactionsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TransactionsStruct &&
        totalBefore == other.totalBefore &&
        totalAfter == other.totalAfter &&
        fullBenefit == other.fullBenefit &&
        taxedBenefit == other.taxedBenefit &&
        tax == other.tax &&
        monthEA == other.monthEA &&
        date == other.date &&
        transactionType == other.transactionType &&
        paymentMethod == other.paymentMethod &&
        description == other.description &&
        status == other.status &&
        amount == other.amount;
  }

  @override
  int get hashCode => const ListEquality().hash([
        totalBefore,
        totalAfter,
        fullBenefit,
        taxedBenefit,
        tax,
        monthEA,
        date,
        transactionType,
        paymentMethod,
        description,
        status,
        amount
      ]);
}

TransactionsStruct createTransactionsStruct({
  double? totalBefore,
  double? totalAfter,
  double? fullBenefit,
  double? taxedBenefit,
  double? tax,
  double? monthEA,
  DateTime? date,
  String? transactionType,
  String? paymentMethod,
  String? description,
  String? status,
  double? amount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TransactionsStruct(
      totalBefore: totalBefore,
      totalAfter: totalAfter,
      fullBenefit: fullBenefit,
      taxedBenefit: taxedBenefit,
      tax: tax,
      monthEA: monthEA,
      date: date,
      transactionType: transactionType,
      paymentMethod: paymentMethod,
      description: description,
      status: status,
      amount: amount,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TransactionsStruct? updateTransactionsStruct(
  TransactionsStruct? transactions, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    transactions
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTransactionsStructData(
  Map<String, dynamic> firestoreData,
  TransactionsStruct? transactions,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (transactions == null) {
    return;
  }
  if (transactions.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && transactions.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final transactionsData =
      getTransactionsFirestoreData(transactions, forFieldValue);
  final nestedData =
      transactionsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = transactions.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTransactionsFirestoreData(
  TransactionsStruct? transactions, [
  bool forFieldValue = false,
]) {
  if (transactions == null) {
    return {};
  }
  final firestoreData = mapToFirestore(transactions.toMap());

  // Add any Firestore field values
  mapToFirestore(transactions.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTransactionsListFirestoreData(
  List<TransactionsStruct>? transactionss,
) =>
    transactionss?.map((e) => getTransactionsFirestoreData(e, true)).toList() ??
    [];
