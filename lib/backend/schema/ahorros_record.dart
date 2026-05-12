import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AhorrosRecord extends FirestoreRecord {
  AhorrosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "montoTotal" field.
  double? _montoTotal;
  double get montoTotal => _montoTotal ?? 0.0;
  bool hasMontoTotal() => _montoTotal != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "EA" field.
  double? _ea;
  double get ea => _ea ?? 0.0;
  bool hasEa() => _ea != null;

  // "tipoCuentaName" field.
  String? _tipoCuentaName;
  String get tipoCuentaName => _tipoCuentaName ?? '';
  bool hasTipoCuentaName() => _tipoCuentaName != null;

  // "fechacreacion" field.
  DateTime? _fechacreacion;
  DateTime? get fechacreacion => _fechacreacion;
  bool hasFechacreacion() => _fechacreacion != null;

  // "codigo" field.
  int? _codigo;
  int get codigo => _codigo ?? 0;
  bool hasCodigo() => _codigo != null;

  // "TotalSavingValue" field.
  double? _totalSavingValue;
  double get totalSavingValue => _totalSavingValue ?? 0.0;
  bool hasTotalSavingValue() => _totalSavingValue != null;

  // "SavingsType" field.
  String? _savingsType;
  String get savingsType => _savingsType ?? '';
  bool hasSavingsType() => _savingsType != null;

  // "CompanyNIT" field.
  String? _companyNIT;
  String get companyNIT => _companyNIT ?? '';
  bool hasCompanyNIT() => _companyNIT != null;

  // "CompayName" field.
  String? _compayName;
  String get compayName => _compayName ?? '';
  bool hasCompayName() => _compayName != null;

  // "TypeOfContact" field.
  String? _typeOfContact;
  String get typeOfContact => _typeOfContact ?? '';
  bool hasTypeOfContact() => _typeOfContact != null;

  // "AhorroSeriesNumber" field.
  int? _ahorroSeriesNumber;
  int get ahorroSeriesNumber => _ahorroSeriesNumber ?? 0;
  bool hasAhorroSeriesNumber() => _ahorroSeriesNumber != null;

  // "AhorrosDocPdf1" field.
  String? _ahorrosDocPdf1;
  String get ahorrosDocPdf1 => _ahorrosDocPdf1 ?? '';
  bool hasAhorrosDocPdf1() => _ahorrosDocPdf1 != null;

  // "AhorrosDocPdf2" field.
  String? _ahorrosDocPdf2;
  String get ahorrosDocPdf2 => _ahorrosDocPdf2 ?? '';
  bool hasAhorrosDocPdf2() => _ahorrosDocPdf2 != null;

  // "UserEmail" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  bool hasUserEmail() => _userEmail != null;

  // "UserID" field.
  String? _userID;
  String get userID => _userID ?? '';
  bool hasUserID() => _userID != null;

  // "UserTelephoneNumber" field.
  String? _userTelephoneNumber;
  String get userTelephoneNumber => _userTelephoneNumber ?? '';
  bool hasUserTelephoneNumber() => _userTelephoneNumber != null;

  // "UserName" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "UserDirccion" field.
  String? _userDirccion;
  String get userDirccion => _userDirccion ?? '';
  bool hasUserDirccion() => _userDirccion != null;

  // "UserCludad" field.
  String? _userCludad;
  String get userCludad => _userCludad ?? '';
  bool hasUserCludad() => _userCludad != null;

  // "UserDepartmento" field.
  String? _userDepartmento;
  String get userDepartmento => _userDepartmento ?? '';
  bool hasUserDepartmento() => _userDepartmento != null;

  // "UserPais" field.
  String? _userPais;
  String get userPais => _userPais ?? '';
  bool hasUserPais() => _userPais != null;

  // "pdf" field.
  String? _pdf;
  String get pdf => _pdf ?? '';
  bool hasPdf() => _pdf != null;

  // "service_" field.
  DocumentReference? _service;
  DocumentReference? get service => _service;
  bool hasService() => _service != null;

  // "Total_Savings_PreApproval" field.
  double? _totalSavingsPreApproval;
  double get totalSavingsPreApproval => _totalSavingsPreApproval ?? 0.0;
  bool hasTotalSavingsPreApproval() => _totalSavingsPreApproval != null;

  // "company" field.
  DocumentReference? _company;
  DocumentReference? get company => _company;
  bool hasCompany() => _company != null;

  // "mainPDF" field.
  String? _mainPDF;
  String get mainPDF => _mainPDF ?? '';
  bool hasMainPDF() => _mainPDF != null;

  // "transactions" field.
  List<TransactionsStruct>? _transactions;
  List<TransactionsStruct> get transactions => _transactions ?? const [];
  bool hasTransactions() => _transactions != null;

  // "taxes" field.
  double? _taxes;
  double get taxes => _taxes ?? 0.0;
  bool hasTaxes() => _taxes != null;

  // "lastDeposit" field.
  DateTime? _lastDeposit;
  DateTime? get lastDeposit => _lastDeposit;
  bool hasLastDeposit() => _lastDeposit != null;

  // "lastWithdrawal" field.
  DateTime? _lastWithdrawal;
  DateTime? get lastWithdrawal => _lastWithdrawal;
  bool hasLastWithdrawal() => _lastWithdrawal != null;

  // "userNIT" field.
  String? _userNIT;
  String get userNIT => _userNIT ?? '';
  bool hasUserNIT() => _userNIT != null;

  // "totalDeposits" field.
  double? _totalDeposits;
  double get totalDeposits => _totalDeposits ?? 0.0;
  bool hasTotalDeposits() => _totalDeposits != null;

  // "Antiguedad" field.
  String? _antiguedad;
  String get antiguedad => _antiguedad ?? '';
  bool hasAntiguedad() => _antiguedad != null;

  // "Salario" field.
  String? _salario;
  String get salario => _salario ?? '';
  bool hasSalario() => _salario != null;

  // "Ubicaciontrabajo" field.
  String? _ubicaciontrabajo;
  String get ubicaciontrabajo => _ubicaciontrabajo ?? '';
  bool hasUbicaciontrabajo() => _ubicaciontrabajo != null;

  // "excepcionPagoMes" field.
  DateTime? _excepcionPagoMes;
  DateTime? get excepcionPagoMes => _excepcionPagoMes;
  bool hasExcepcionPagoMes() => _excepcionPagoMes != null;

  // "numeroOrden" field.
  int? _numeroOrden;
  int get numeroOrden => _numeroOrden ?? 0;
  bool hasNumeroOrden() => _numeroOrden != null;

  void _initializeFields() {
    _montoTotal = castToType<double>(snapshotData['montoTotal']);
    _user = snapshotData['user'] as DocumentReference?;
    _ea = castToType<double>(snapshotData['EA']);
    _tipoCuentaName = snapshotData['tipoCuentaName'] as String?;
    _fechacreacion = snapshotData['fechacreacion'] as DateTime?;
    _codigo = castToType<int>(snapshotData['codigo']);
    _totalSavingValue = castToType<double>(snapshotData['TotalSavingValue']);
    _savingsType = snapshotData['SavingsType'] as String?;
    _companyNIT = snapshotData['CompanyNIT'] as String?;
    _compayName = snapshotData['CompayName'] as String?;
    _typeOfContact = snapshotData['TypeOfContact'] as String?;
    _ahorroSeriesNumber = castToType<int>(snapshotData['AhorroSeriesNumber']);
    _ahorrosDocPdf1 = snapshotData['AhorrosDocPdf1'] as String?;
    _ahorrosDocPdf2 = snapshotData['AhorrosDocPdf2'] as String?;
    _userEmail = snapshotData['UserEmail'] as String?;
    _userID = snapshotData['UserID'] as String?;
    _userTelephoneNumber = snapshotData['UserTelephoneNumber'] as String?;
    _userName = snapshotData['UserName'] as String?;
    _userDirccion = snapshotData['UserDirccion'] as String?;
    _userCludad = snapshotData['UserCludad'] as String?;
    _userDepartmento = snapshotData['UserDepartmento'] as String?;
    _userPais = snapshotData['UserPais'] as String?;
    _pdf = snapshotData['pdf'] as String?;
    _service = snapshotData['service_'] as DocumentReference?;
    _totalSavingsPreApproval =
        castToType<double>(snapshotData['Total_Savings_PreApproval']);
    _company = snapshotData['company'] as DocumentReference?;
    _mainPDF = snapshotData['mainPDF'] as String?;
    _transactions = getStructList(
      snapshotData['transactions'],
      TransactionsStruct.fromMap,
    );
    _taxes = castToType<double>(snapshotData['taxes']);
    _lastDeposit = snapshotData['lastDeposit'] as DateTime?;
    _lastWithdrawal = snapshotData['lastWithdrawal'] as DateTime?;
    _userNIT = snapshotData['userNIT'] as String?;
    _totalDeposits = castToType<double>(snapshotData['totalDeposits']);
    _antiguedad = snapshotData['Antiguedad'] as String?;
    _salario = snapshotData['Salario'] as String?;
    _ubicaciontrabajo = snapshotData['Ubicaciontrabajo'] as String?;
    _excepcionPagoMes = snapshotData['excepcionPagoMes'] as DateTime?;
    _numeroOrden = castToType<int>(snapshotData['numeroOrden']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ahorros');

  static Stream<AhorrosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AhorrosRecord.fromSnapshot(s));

  static Future<AhorrosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AhorrosRecord.fromSnapshot(s));

  static AhorrosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AhorrosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AhorrosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AhorrosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AhorrosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AhorrosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAhorrosRecordData({
  double? montoTotal,
  DocumentReference? user,
  double? ea,
  String? tipoCuentaName,
  DateTime? fechacreacion,
  int? codigo,
  double? totalSavingValue,
  String? savingsType,
  String? companyNIT,
  String? compayName,
  String? typeOfContact,
  int? ahorroSeriesNumber,
  String? ahorrosDocPdf1,
  String? ahorrosDocPdf2,
  String? userEmail,
  String? userID,
  String? userTelephoneNumber,
  String? userName,
  String? userDirccion,
  String? userCludad,
  String? userDepartmento,
  String? userPais,
  String? pdf,
  DocumentReference? service,
  double? totalSavingsPreApproval,
  DocumentReference? company,
  String? mainPDF,
  double? taxes,
  DateTime? lastDeposit,
  DateTime? lastWithdrawal,
  String? userNIT,
  double? totalDeposits,
  String? antiguedad,
  String? salario,
  String? ubicaciontrabajo,
  DateTime? excepcionPagoMes,
  int? numeroOrden,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'montoTotal': montoTotal,
      'user': user,
      'EA': ea,
      'tipoCuentaName': tipoCuentaName,
      'fechacreacion': fechacreacion,
      'codigo': codigo,
      'TotalSavingValue': totalSavingValue,
      'SavingsType': savingsType,
      'CompanyNIT': companyNIT,
      'CompayName': compayName,
      'TypeOfContact': typeOfContact,
      'AhorroSeriesNumber': ahorroSeriesNumber,
      'AhorrosDocPdf1': ahorrosDocPdf1,
      'AhorrosDocPdf2': ahorrosDocPdf2,
      'UserEmail': userEmail,
      'UserID': userID,
      'UserTelephoneNumber': userTelephoneNumber,
      'UserName': userName,
      'UserDirccion': userDirccion,
      'UserCludad': userCludad,
      'UserDepartmento': userDepartmento,
      'UserPais': userPais,
      'pdf': pdf,
      'service_': service,
      'Total_Savings_PreApproval': totalSavingsPreApproval,
      'company': company,
      'mainPDF': mainPDF,
      'taxes': taxes,
      'lastDeposit': lastDeposit,
      'lastWithdrawal': lastWithdrawal,
      'userNIT': userNIT,
      'totalDeposits': totalDeposits,
      'Antiguedad': antiguedad,
      'Salario': salario,
      'Ubicaciontrabajo': ubicaciontrabajo,
      'excepcionPagoMes': excepcionPagoMes,
      'numeroOrden': numeroOrden,
    }.withoutNulls,
  );

  return firestoreData;
}

class AhorrosRecordDocumentEquality implements Equality<AhorrosRecord> {
  const AhorrosRecordDocumentEquality();

  @override
  bool equals(AhorrosRecord? e1, AhorrosRecord? e2) {
    const listEquality = ListEquality();
    return e1?.montoTotal == e2?.montoTotal &&
        e1?.user == e2?.user &&
        e1?.ea == e2?.ea &&
        e1?.tipoCuentaName == e2?.tipoCuentaName &&
        e1?.fechacreacion == e2?.fechacreacion &&
        e1?.codigo == e2?.codigo &&
        e1?.totalSavingValue == e2?.totalSavingValue &&
        e1?.savingsType == e2?.savingsType &&
        e1?.companyNIT == e2?.companyNIT &&
        e1?.compayName == e2?.compayName &&
        e1?.typeOfContact == e2?.typeOfContact &&
        e1?.ahorroSeriesNumber == e2?.ahorroSeriesNumber &&
        e1?.ahorrosDocPdf1 == e2?.ahorrosDocPdf1 &&
        e1?.ahorrosDocPdf2 == e2?.ahorrosDocPdf2 &&
        e1?.userEmail == e2?.userEmail &&
        e1?.userID == e2?.userID &&
        e1?.userTelephoneNumber == e2?.userTelephoneNumber &&
        e1?.userName == e2?.userName &&
        e1?.userDirccion == e2?.userDirccion &&
        e1?.userCludad == e2?.userCludad &&
        e1?.userDepartmento == e2?.userDepartmento &&
        e1?.userPais == e2?.userPais &&
        e1?.pdf == e2?.pdf &&
        e1?.service == e2?.service &&
        e1?.totalSavingsPreApproval == e2?.totalSavingsPreApproval &&
        e1?.company == e2?.company &&
        e1?.mainPDF == e2?.mainPDF &&
        listEquality.equals(e1?.transactions, e2?.transactions) &&
        e1?.taxes == e2?.taxes &&
        e1?.lastDeposit == e2?.lastDeposit &&
        e1?.lastWithdrawal == e2?.lastWithdrawal &&
        e1?.userNIT == e2?.userNIT &&
        e1?.totalDeposits == e2?.totalDeposits &&
        e1?.antiguedad == e2?.antiguedad &&
        e1?.salario == e2?.salario &&
        e1?.ubicaciontrabajo == e2?.ubicaciontrabajo &&
        e1?.excepcionPagoMes == e2?.excepcionPagoMes &&
        e1?.numeroOrden == e2?.numeroOrden;
  }

  @override
  int hash(AhorrosRecord? e) => const ListEquality().hash([
        e?.montoTotal,
        e?.user,
        e?.ea,
        e?.tipoCuentaName,
        e?.fechacreacion,
        e?.codigo,
        e?.totalSavingValue,
        e?.savingsType,
        e?.companyNIT,
        e?.compayName,
        e?.typeOfContact,
        e?.ahorroSeriesNumber,
        e?.ahorrosDocPdf1,
        e?.ahorrosDocPdf2,
        e?.userEmail,
        e?.userID,
        e?.userTelephoneNumber,
        e?.userName,
        e?.userDirccion,
        e?.userCludad,
        e?.userDepartmento,
        e?.userPais,
        e?.pdf,
        e?.service,
        e?.totalSavingsPreApproval,
        e?.company,
        e?.mainPDF,
        e?.transactions,
        e?.taxes,
        e?.lastDeposit,
        e?.lastWithdrawal,
        e?.userNIT,
        e?.totalDeposits,
        e?.antiguedad,
        e?.salario,
        e?.ubicaciontrabajo,
        e?.excepcionPagoMes,
        e?.numeroOrden
      ]);

  @override
  bool isValidKey(Object? o) => o is AhorrosRecord;
}
