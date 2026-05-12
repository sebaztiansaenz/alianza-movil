// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AhorrotipoStruct extends FFFirebaseStruct {
  AhorrotipoStruct({
    double? montoTotal,
    DocumentReference? user,
    double? ea,
    String? tipoCuentaName,
    DateTime? fechacreacion,
    int? codigo,
    double? totalSavingValue,
    String? savingsType,
    String? companyNIT,
    String? companyName,
    String? typeOfContact,
    int? ahorroSeriesNumber,
    String? ahorrosDocPdf1,
    String? ahorrosDocPdf2,
    String? userEmail,
    String? userID,
    String? userTelephoneNumber,
    String? userName,
    String? userDirccion,
    String? userCiudad,
    String? userDepartmento,
    String? userPais,
    String? pdf,
    String? service,
    double? totalSavingsPreappoval,
    DocumentReference? company,
    String? mainPDF,
    List<TransactionsStruct>? transactions,
    double? taxes,
    DateTime? lastDeposit,
    DateTime? lastWithdrawal,
    String? userNit,
    double? totalDeposits,
    String? antiguedad,
    String? salario,
    String? ubicaciontrabajo,
    DateTime? excepcionPagoMes,
    int? numeroOrden,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _montoTotal = montoTotal,
        _user = user,
        _ea = ea,
        _tipoCuentaName = tipoCuentaName,
        _fechacreacion = fechacreacion,
        _codigo = codigo,
        _totalSavingValue = totalSavingValue,
        _savingsType = savingsType,
        _companyNIT = companyNIT,
        _companyName = companyName,
        _typeOfContact = typeOfContact,
        _ahorroSeriesNumber = ahorroSeriesNumber,
        _ahorrosDocPdf1 = ahorrosDocPdf1,
        _ahorrosDocPdf2 = ahorrosDocPdf2,
        _userEmail = userEmail,
        _userID = userID,
        _userTelephoneNumber = userTelephoneNumber,
        _userName = userName,
        _userDirccion = userDirccion,
        _userCiudad = userCiudad,
        _userDepartmento = userDepartmento,
        _userPais = userPais,
        _pdf = pdf,
        _service = service,
        _totalSavingsPreappoval = totalSavingsPreappoval,
        _company = company,
        _mainPDF = mainPDF,
        _transactions = transactions,
        _taxes = taxes,
        _lastDeposit = lastDeposit,
        _lastWithdrawal = lastWithdrawal,
        _userNit = userNit,
        _totalDeposits = totalDeposits,
        _antiguedad = antiguedad,
        _salario = salario,
        _ubicaciontrabajo = ubicaciontrabajo,
        _excepcionPagoMes = excepcionPagoMes,
        _numeroOrden = numeroOrden,
        super(firestoreUtilData);

  // "montoTotal" field.
  double? _montoTotal;
  double get montoTotal => _montoTotal ?? 0.0;
  set montoTotal(double? val) => _montoTotal = val;

  void incrementMontoTotal(double amount) => montoTotal = montoTotal + amount;

  bool hasMontoTotal() => _montoTotal != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  set user(DocumentReference? val) => _user = val;

  bool hasUser() => _user != null;

  // "EA" field.
  double? _ea;
  double get ea => _ea ?? 0.0;
  set ea(double? val) => _ea = val;

  void incrementEa(double amount) => ea = ea + amount;

  bool hasEa() => _ea != null;

  // "tipoCuentaName" field.
  String? _tipoCuentaName;
  String get tipoCuentaName => _tipoCuentaName ?? '';
  set tipoCuentaName(String? val) => _tipoCuentaName = val;

  bool hasTipoCuentaName() => _tipoCuentaName != null;

  // "fechacreacion" field.
  DateTime? _fechacreacion;
  DateTime? get fechacreacion => _fechacreacion;
  set fechacreacion(DateTime? val) => _fechacreacion = val;

  bool hasFechacreacion() => _fechacreacion != null;

  // "codigo" field.
  int? _codigo;
  int get codigo => _codigo ?? 0;
  set codigo(int? val) => _codigo = val;

  void incrementCodigo(int amount) => codigo = codigo + amount;

  bool hasCodigo() => _codigo != null;

  // "TotalSavingValue" field.
  double? _totalSavingValue;
  double get totalSavingValue => _totalSavingValue ?? 0.0;
  set totalSavingValue(double? val) => _totalSavingValue = val;

  void incrementTotalSavingValue(double amount) =>
      totalSavingValue = totalSavingValue + amount;

  bool hasTotalSavingValue() => _totalSavingValue != null;

  // "SavingsType" field.
  String? _savingsType;
  String get savingsType => _savingsType ?? '';
  set savingsType(String? val) => _savingsType = val;

  bool hasSavingsType() => _savingsType != null;

  // "CompanyNIT" field.
  String? _companyNIT;
  String get companyNIT => _companyNIT ?? '';
  set companyNIT(String? val) => _companyNIT = val;

  bool hasCompanyNIT() => _companyNIT != null;

  // "CompanyName" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  set companyName(String? val) => _companyName = val;

  bool hasCompanyName() => _companyName != null;

  // "TypeOfContact" field.
  String? _typeOfContact;
  String get typeOfContact => _typeOfContact ?? '';
  set typeOfContact(String? val) => _typeOfContact = val;

  bool hasTypeOfContact() => _typeOfContact != null;

  // "AhorroSeriesNumber" field.
  int? _ahorroSeriesNumber;
  int get ahorroSeriesNumber => _ahorroSeriesNumber ?? 0;
  set ahorroSeriesNumber(int? val) => _ahorroSeriesNumber = val;

  void incrementAhorroSeriesNumber(int amount) =>
      ahorroSeriesNumber = ahorroSeriesNumber + amount;

  bool hasAhorroSeriesNumber() => _ahorroSeriesNumber != null;

  // "AhorrosDocPdf1" field.
  String? _ahorrosDocPdf1;
  String get ahorrosDocPdf1 => _ahorrosDocPdf1 ?? '';
  set ahorrosDocPdf1(String? val) => _ahorrosDocPdf1 = val;

  bool hasAhorrosDocPdf1() => _ahorrosDocPdf1 != null;

  // "AhorrosDocPdf2" field.
  String? _ahorrosDocPdf2;
  String get ahorrosDocPdf2 => _ahorrosDocPdf2 ?? '';
  set ahorrosDocPdf2(String? val) => _ahorrosDocPdf2 = val;

  bool hasAhorrosDocPdf2() => _ahorrosDocPdf2 != null;

  // "UserEmail" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  set userEmail(String? val) => _userEmail = val;

  bool hasUserEmail() => _userEmail != null;

  // "UserID" field.
  String? _userID;
  String get userID => _userID ?? '';
  set userID(String? val) => _userID = val;

  bool hasUserID() => _userID != null;

  // "UserTelephoneNumber" field.
  String? _userTelephoneNumber;
  String get userTelephoneNumber => _userTelephoneNumber ?? '';
  set userTelephoneNumber(String? val) => _userTelephoneNumber = val;

  bool hasUserTelephoneNumber() => _userTelephoneNumber != null;

  // "UserName" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;

  bool hasUserName() => _userName != null;

  // "UserDirccion" field.
  String? _userDirccion;
  String get userDirccion => _userDirccion ?? '';
  set userDirccion(String? val) => _userDirccion = val;

  bool hasUserDirccion() => _userDirccion != null;

  // "UserCiudad" field.
  String? _userCiudad;
  String get userCiudad => _userCiudad ?? '';
  set userCiudad(String? val) => _userCiudad = val;

  bool hasUserCiudad() => _userCiudad != null;

  // "UserDepartmento" field.
  String? _userDepartmento;
  String get userDepartmento => _userDepartmento ?? '';
  set userDepartmento(String? val) => _userDepartmento = val;

  bool hasUserDepartmento() => _userDepartmento != null;

  // "UserPais" field.
  String? _userPais;
  String get userPais => _userPais ?? '';
  set userPais(String? val) => _userPais = val;

  bool hasUserPais() => _userPais != null;

  // "pdf" field.
  String? _pdf;
  String get pdf => _pdf ?? '';
  set pdf(String? val) => _pdf = val;

  bool hasPdf() => _pdf != null;

  // "service" field.
  String? _service;
  String get service => _service ?? '';
  set service(String? val) => _service = val;

  bool hasService() => _service != null;

  // "TotalSavingsPreappoval" field.
  double? _totalSavingsPreappoval;
  double get totalSavingsPreappoval => _totalSavingsPreappoval ?? 0.0;
  set totalSavingsPreappoval(double? val) => _totalSavingsPreappoval = val;

  void incrementTotalSavingsPreappoval(double amount) =>
      totalSavingsPreappoval = totalSavingsPreappoval + amount;

  bool hasTotalSavingsPreappoval() => _totalSavingsPreappoval != null;

  // "company" field.
  DocumentReference? _company;
  DocumentReference? get company => _company;
  set company(DocumentReference? val) => _company = val;

  bool hasCompany() => _company != null;

  // "mainPDF" field.
  String? _mainPDF;
  String get mainPDF => _mainPDF ?? '';
  set mainPDF(String? val) => _mainPDF = val;

  bool hasMainPDF() => _mainPDF != null;

  // "transactions" field.
  List<TransactionsStruct>? _transactions;
  List<TransactionsStruct> get transactions => _transactions ?? const [];
  set transactions(List<TransactionsStruct>? val) => _transactions = val;

  void updateTransactions(Function(List<TransactionsStruct>) updateFn) {
    updateFn(_transactions ??= []);
  }

  bool hasTransactions() => _transactions != null;

  // "taxes" field.
  double? _taxes;
  double get taxes => _taxes ?? 0.0;
  set taxes(double? val) => _taxes = val;

  void incrementTaxes(double amount) => taxes = taxes + amount;

  bool hasTaxes() => _taxes != null;

  // "lastDeposit" field.
  DateTime? _lastDeposit;
  DateTime? get lastDeposit => _lastDeposit;
  set lastDeposit(DateTime? val) => _lastDeposit = val;

  bool hasLastDeposit() => _lastDeposit != null;

  // "lastWithdrawal" field.
  DateTime? _lastWithdrawal;
  DateTime? get lastWithdrawal => _lastWithdrawal;
  set lastWithdrawal(DateTime? val) => _lastWithdrawal = val;

  bool hasLastWithdrawal() => _lastWithdrawal != null;

  // "userNit" field.
  String? _userNit;
  String get userNit => _userNit ?? '';
  set userNit(String? val) => _userNit = val;

  bool hasUserNit() => _userNit != null;

  // "totalDeposits" field.
  double? _totalDeposits;
  double get totalDeposits => _totalDeposits ?? 0.0;
  set totalDeposits(double? val) => _totalDeposits = val;

  void incrementTotalDeposits(double amount) =>
      totalDeposits = totalDeposits + amount;

  bool hasTotalDeposits() => _totalDeposits != null;

  // "Antiguedad" field.
  String? _antiguedad;
  String get antiguedad => _antiguedad ?? '';
  set antiguedad(String? val) => _antiguedad = val;

  bool hasAntiguedad() => _antiguedad != null;

  // "Salario" field.
  String? _salario;
  String get salario => _salario ?? '';
  set salario(String? val) => _salario = val;

  bool hasSalario() => _salario != null;

  // "Ubicaciontrabajo" field.
  String? _ubicaciontrabajo;
  String get ubicaciontrabajo => _ubicaciontrabajo ?? '';
  set ubicaciontrabajo(String? val) => _ubicaciontrabajo = val;

  bool hasUbicaciontrabajo() => _ubicaciontrabajo != null;

  // "excepcionPagoMes" field.
  DateTime? _excepcionPagoMes;
  DateTime? get excepcionPagoMes => _excepcionPagoMes;
  set excepcionPagoMes(DateTime? val) => _excepcionPagoMes = val;

  bool hasExcepcionPagoMes() => _excepcionPagoMes != null;

  // "numeroOrden" field.
  int? _numeroOrden;
  int get numeroOrden => _numeroOrden ?? 0;
  set numeroOrden(int? val) => _numeroOrden = val;

  void incrementNumeroOrden(int amount) => numeroOrden = numeroOrden + amount;

  bool hasNumeroOrden() => _numeroOrden != null;

  static AhorrotipoStruct fromMap(Map<String, dynamic> data) =>
      AhorrotipoStruct(
        montoTotal: castToType<double>(data['montoTotal']),
        user: data['user'] as DocumentReference?,
        ea: castToType<double>(data['EA']),
        tipoCuentaName: data['tipoCuentaName'] as String?,
        fechacreacion: data['fechacreacion'] as DateTime?,
        codigo: castToType<int>(data['codigo']),
        totalSavingValue: castToType<double>(data['TotalSavingValue']),
        savingsType: data['SavingsType'] as String?,
        companyNIT: data['CompanyNIT'] as String?,
        companyName: data['CompanyName'] as String?,
        typeOfContact: data['TypeOfContact'] as String?,
        ahorroSeriesNumber: castToType<int>(data['AhorroSeriesNumber']),
        ahorrosDocPdf1: data['AhorrosDocPdf1'] as String?,
        ahorrosDocPdf2: data['AhorrosDocPdf2'] as String?,
        userEmail: data['UserEmail'] as String?,
        userID: data['UserID'] as String?,
        userTelephoneNumber: data['UserTelephoneNumber'] as String?,
        userName: data['UserName'] as String?,
        userDirccion: data['UserDirccion'] as String?,
        userCiudad: data['UserCiudad'] as String?,
        userDepartmento: data['UserDepartmento'] as String?,
        userPais: data['UserPais'] as String?,
        pdf: data['pdf'] as String?,
        service: data['service'] as String?,
        totalSavingsPreappoval:
            castToType<double>(data['TotalSavingsPreappoval']),
        company: data['company'] as DocumentReference?,
        mainPDF: data['mainPDF'] as String?,
        transactions: getStructList(
          data['transactions'],
          TransactionsStruct.fromMap,
        ),
        taxes: castToType<double>(data['taxes']),
        lastDeposit: data['lastDeposit'] as DateTime?,
        lastWithdrawal: data['lastWithdrawal'] as DateTime?,
        userNit: data['userNit'] as String?,
        totalDeposits: castToType<double>(data['totalDeposits']),
        antiguedad: data['Antiguedad'] as String?,
        salario: data['Salario'] as String?,
        ubicaciontrabajo: data['Ubicaciontrabajo'] as String?,
        excepcionPagoMes: data['excepcionPagoMes'] as DateTime?,
        numeroOrden: castToType<int>(data['numeroOrden']),
      );

  static AhorrotipoStruct? maybeFromMap(dynamic data) => data is Map
      ? AhorrotipoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'montoTotal': _montoTotal,
        'user': _user,
        'EA': _ea,
        'tipoCuentaName': _tipoCuentaName,
        'fechacreacion': _fechacreacion,
        'codigo': _codigo,
        'TotalSavingValue': _totalSavingValue,
        'SavingsType': _savingsType,
        'CompanyNIT': _companyNIT,
        'CompanyName': _companyName,
        'TypeOfContact': _typeOfContact,
        'AhorroSeriesNumber': _ahorroSeriesNumber,
        'AhorrosDocPdf1': _ahorrosDocPdf1,
        'AhorrosDocPdf2': _ahorrosDocPdf2,
        'UserEmail': _userEmail,
        'UserID': _userID,
        'UserTelephoneNumber': _userTelephoneNumber,
        'UserName': _userName,
        'UserDirccion': _userDirccion,
        'UserCiudad': _userCiudad,
        'UserDepartmento': _userDepartmento,
        'UserPais': _userPais,
        'pdf': _pdf,
        'service': _service,
        'TotalSavingsPreappoval': _totalSavingsPreappoval,
        'company': _company,
        'mainPDF': _mainPDF,
        'transactions': _transactions?.map((e) => e.toMap()).toList(),
        'taxes': _taxes,
        'lastDeposit': _lastDeposit,
        'lastWithdrawal': _lastWithdrawal,
        'userNit': _userNit,
        'totalDeposits': _totalDeposits,
        'Antiguedad': _antiguedad,
        'Salario': _salario,
        'Ubicaciontrabajo': _ubicaciontrabajo,
        'excepcionPagoMes': _excepcionPagoMes,
        'numeroOrden': _numeroOrden,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'montoTotal': serializeParam(
          _montoTotal,
          ParamType.double,
        ),
        'user': serializeParam(
          _user,
          ParamType.DocumentReference,
        ),
        'EA': serializeParam(
          _ea,
          ParamType.double,
        ),
        'tipoCuentaName': serializeParam(
          _tipoCuentaName,
          ParamType.String,
        ),
        'fechacreacion': serializeParam(
          _fechacreacion,
          ParamType.DateTime,
        ),
        'codigo': serializeParam(
          _codigo,
          ParamType.int,
        ),
        'TotalSavingValue': serializeParam(
          _totalSavingValue,
          ParamType.double,
        ),
        'SavingsType': serializeParam(
          _savingsType,
          ParamType.String,
        ),
        'CompanyNIT': serializeParam(
          _companyNIT,
          ParamType.String,
        ),
        'CompanyName': serializeParam(
          _companyName,
          ParamType.String,
        ),
        'TypeOfContact': serializeParam(
          _typeOfContact,
          ParamType.String,
        ),
        'AhorroSeriesNumber': serializeParam(
          _ahorroSeriesNumber,
          ParamType.int,
        ),
        'AhorrosDocPdf1': serializeParam(
          _ahorrosDocPdf1,
          ParamType.String,
        ),
        'AhorrosDocPdf2': serializeParam(
          _ahorrosDocPdf2,
          ParamType.String,
        ),
        'UserEmail': serializeParam(
          _userEmail,
          ParamType.String,
        ),
        'UserID': serializeParam(
          _userID,
          ParamType.String,
        ),
        'UserTelephoneNumber': serializeParam(
          _userTelephoneNumber,
          ParamType.String,
        ),
        'UserName': serializeParam(
          _userName,
          ParamType.String,
        ),
        'UserDirccion': serializeParam(
          _userDirccion,
          ParamType.String,
        ),
        'UserCiudad': serializeParam(
          _userCiudad,
          ParamType.String,
        ),
        'UserDepartmento': serializeParam(
          _userDepartmento,
          ParamType.String,
        ),
        'UserPais': serializeParam(
          _userPais,
          ParamType.String,
        ),
        'pdf': serializeParam(
          _pdf,
          ParamType.String,
        ),
        'service': serializeParam(
          _service,
          ParamType.String,
        ),
        'TotalSavingsPreappoval': serializeParam(
          _totalSavingsPreappoval,
          ParamType.double,
        ),
        'company': serializeParam(
          _company,
          ParamType.DocumentReference,
        ),
        'mainPDF': serializeParam(
          _mainPDF,
          ParamType.String,
        ),
        'transactions': serializeParam(
          _transactions,
          ParamType.DataStruct,
          isList: true,
        ),
        'taxes': serializeParam(
          _taxes,
          ParamType.double,
        ),
        'lastDeposit': serializeParam(
          _lastDeposit,
          ParamType.DateTime,
        ),
        'lastWithdrawal': serializeParam(
          _lastWithdrawal,
          ParamType.DateTime,
        ),
        'userNit': serializeParam(
          _userNit,
          ParamType.String,
        ),
        'totalDeposits': serializeParam(
          _totalDeposits,
          ParamType.double,
        ),
        'Antiguedad': serializeParam(
          _antiguedad,
          ParamType.String,
        ),
        'Salario': serializeParam(
          _salario,
          ParamType.String,
        ),
        'Ubicaciontrabajo': serializeParam(
          _ubicaciontrabajo,
          ParamType.String,
        ),
        'excepcionPagoMes': serializeParam(
          _excepcionPagoMes,
          ParamType.DateTime,
        ),
        'numeroOrden': serializeParam(
          _numeroOrden,
          ParamType.int,
        ),
      }.withoutNulls;

  static AhorrotipoStruct fromSerializableMap(Map<String, dynamic> data) =>
      AhorrotipoStruct(
        montoTotal: deserializeParam(
          data['montoTotal'],
          ParamType.double,
          false,
        ),
        user: deserializeParam(
          data['user'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['user'],
        ),
        ea: deserializeParam(
          data['EA'],
          ParamType.double,
          false,
        ),
        tipoCuentaName: deserializeParam(
          data['tipoCuentaName'],
          ParamType.String,
          false,
        ),
        fechacreacion: deserializeParam(
          data['fechacreacion'],
          ParamType.DateTime,
          false,
        ),
        codigo: deserializeParam(
          data['codigo'],
          ParamType.int,
          false,
        ),
        totalSavingValue: deserializeParam(
          data['TotalSavingValue'],
          ParamType.double,
          false,
        ),
        savingsType: deserializeParam(
          data['SavingsType'],
          ParamType.String,
          false,
        ),
        companyNIT: deserializeParam(
          data['CompanyNIT'],
          ParamType.String,
          false,
        ),
        companyName: deserializeParam(
          data['CompanyName'],
          ParamType.String,
          false,
        ),
        typeOfContact: deserializeParam(
          data['TypeOfContact'],
          ParamType.String,
          false,
        ),
        ahorroSeriesNumber: deserializeParam(
          data['AhorroSeriesNumber'],
          ParamType.int,
          false,
        ),
        ahorrosDocPdf1: deserializeParam(
          data['AhorrosDocPdf1'],
          ParamType.String,
          false,
        ),
        ahorrosDocPdf2: deserializeParam(
          data['AhorrosDocPdf2'],
          ParamType.String,
          false,
        ),
        userEmail: deserializeParam(
          data['UserEmail'],
          ParamType.String,
          false,
        ),
        userID: deserializeParam(
          data['UserID'],
          ParamType.String,
          false,
        ),
        userTelephoneNumber: deserializeParam(
          data['UserTelephoneNumber'],
          ParamType.String,
          false,
        ),
        userName: deserializeParam(
          data['UserName'],
          ParamType.String,
          false,
        ),
        userDirccion: deserializeParam(
          data['UserDirccion'],
          ParamType.String,
          false,
        ),
        userCiudad: deserializeParam(
          data['UserCiudad'],
          ParamType.String,
          false,
        ),
        userDepartmento: deserializeParam(
          data['UserDepartmento'],
          ParamType.String,
          false,
        ),
        userPais: deserializeParam(
          data['UserPais'],
          ParamType.String,
          false,
        ),
        pdf: deserializeParam(
          data['pdf'],
          ParamType.String,
          false,
        ),
        service: deserializeParam(
          data['service'],
          ParamType.String,
          false,
        ),
        totalSavingsPreappoval: deserializeParam(
          data['TotalSavingsPreappoval'],
          ParamType.double,
          false,
        ),
        company: deserializeParam(
          data['company'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['empresa'],
        ),
        mainPDF: deserializeParam(
          data['mainPDF'],
          ParamType.String,
          false,
        ),
        transactions: deserializeStructParam<TransactionsStruct>(
          data['transactions'],
          ParamType.DataStruct,
          true,
          structBuilder: TransactionsStruct.fromSerializableMap,
        ),
        taxes: deserializeParam(
          data['taxes'],
          ParamType.double,
          false,
        ),
        lastDeposit: deserializeParam(
          data['lastDeposit'],
          ParamType.DateTime,
          false,
        ),
        lastWithdrawal: deserializeParam(
          data['lastWithdrawal'],
          ParamType.DateTime,
          false,
        ),
        userNit: deserializeParam(
          data['userNit'],
          ParamType.String,
          false,
        ),
        totalDeposits: deserializeParam(
          data['totalDeposits'],
          ParamType.double,
          false,
        ),
        antiguedad: deserializeParam(
          data['Antiguedad'],
          ParamType.String,
          false,
        ),
        salario: deserializeParam(
          data['Salario'],
          ParamType.String,
          false,
        ),
        ubicaciontrabajo: deserializeParam(
          data['Ubicaciontrabajo'],
          ParamType.String,
          false,
        ),
        excepcionPagoMes: deserializeParam(
          data['excepcionPagoMes'],
          ParamType.DateTime,
          false,
        ),
        numeroOrden: deserializeParam(
          data['numeroOrden'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'AhorrotipoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AhorrotipoStruct &&
        montoTotal == other.montoTotal &&
        user == other.user &&
        ea == other.ea &&
        tipoCuentaName == other.tipoCuentaName &&
        fechacreacion == other.fechacreacion &&
        codigo == other.codigo &&
        totalSavingValue == other.totalSavingValue &&
        savingsType == other.savingsType &&
        companyNIT == other.companyNIT &&
        companyName == other.companyName &&
        typeOfContact == other.typeOfContact &&
        ahorroSeriesNumber == other.ahorroSeriesNumber &&
        ahorrosDocPdf1 == other.ahorrosDocPdf1 &&
        ahorrosDocPdf2 == other.ahorrosDocPdf2 &&
        userEmail == other.userEmail &&
        userID == other.userID &&
        userTelephoneNumber == other.userTelephoneNumber &&
        userName == other.userName &&
        userDirccion == other.userDirccion &&
        userCiudad == other.userCiudad &&
        userDepartmento == other.userDepartmento &&
        userPais == other.userPais &&
        pdf == other.pdf &&
        service == other.service &&
        totalSavingsPreappoval == other.totalSavingsPreappoval &&
        company == other.company &&
        mainPDF == other.mainPDF &&
        listEquality.equals(transactions, other.transactions) &&
        taxes == other.taxes &&
        lastDeposit == other.lastDeposit &&
        lastWithdrawal == other.lastWithdrawal &&
        userNit == other.userNit &&
        totalDeposits == other.totalDeposits &&
        antiguedad == other.antiguedad &&
        salario == other.salario &&
        ubicaciontrabajo == other.ubicaciontrabajo &&
        excepcionPagoMes == other.excepcionPagoMes &&
        numeroOrden == other.numeroOrden;
  }

  @override
  int get hashCode => const ListEquality().hash([
        montoTotal,
        user,
        ea,
        tipoCuentaName,
        fechacreacion,
        codigo,
        totalSavingValue,
        savingsType,
        companyNIT,
        companyName,
        typeOfContact,
        ahorroSeriesNumber,
        ahorrosDocPdf1,
        ahorrosDocPdf2,
        userEmail,
        userID,
        userTelephoneNumber,
        userName,
        userDirccion,
        userCiudad,
        userDepartmento,
        userPais,
        pdf,
        service,
        totalSavingsPreappoval,
        company,
        mainPDF,
        transactions,
        taxes,
        lastDeposit,
        lastWithdrawal,
        userNit,
        totalDeposits,
        antiguedad,
        salario,
        ubicaciontrabajo,
        excepcionPagoMes,
        numeroOrden
      ]);
}

AhorrotipoStruct createAhorrotipoStruct({
  double? montoTotal,
  DocumentReference? user,
  double? ea,
  String? tipoCuentaName,
  DateTime? fechacreacion,
  int? codigo,
  double? totalSavingValue,
  String? savingsType,
  String? companyNIT,
  String? companyName,
  String? typeOfContact,
  int? ahorroSeriesNumber,
  String? ahorrosDocPdf1,
  String? ahorrosDocPdf2,
  String? userEmail,
  String? userID,
  String? userTelephoneNumber,
  String? userName,
  String? userDirccion,
  String? userCiudad,
  String? userDepartmento,
  String? userPais,
  String? pdf,
  String? service,
  double? totalSavingsPreappoval,
  DocumentReference? company,
  String? mainPDF,
  double? taxes,
  DateTime? lastDeposit,
  DateTime? lastWithdrawal,
  String? userNit,
  double? totalDeposits,
  String? antiguedad,
  String? salario,
  String? ubicaciontrabajo,
  DateTime? excepcionPagoMes,
  int? numeroOrden,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AhorrotipoStruct(
      montoTotal: montoTotal,
      user: user,
      ea: ea,
      tipoCuentaName: tipoCuentaName,
      fechacreacion: fechacreacion,
      codigo: codigo,
      totalSavingValue: totalSavingValue,
      savingsType: savingsType,
      companyNIT: companyNIT,
      companyName: companyName,
      typeOfContact: typeOfContact,
      ahorroSeriesNumber: ahorroSeriesNumber,
      ahorrosDocPdf1: ahorrosDocPdf1,
      ahorrosDocPdf2: ahorrosDocPdf2,
      userEmail: userEmail,
      userID: userID,
      userTelephoneNumber: userTelephoneNumber,
      userName: userName,
      userDirccion: userDirccion,
      userCiudad: userCiudad,
      userDepartmento: userDepartmento,
      userPais: userPais,
      pdf: pdf,
      service: service,
      totalSavingsPreappoval: totalSavingsPreappoval,
      company: company,
      mainPDF: mainPDF,
      taxes: taxes,
      lastDeposit: lastDeposit,
      lastWithdrawal: lastWithdrawal,
      userNit: userNit,
      totalDeposits: totalDeposits,
      antiguedad: antiguedad,
      salario: salario,
      ubicaciontrabajo: ubicaciontrabajo,
      excepcionPagoMes: excepcionPagoMes,
      numeroOrden: numeroOrden,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AhorrotipoStruct? updateAhorrotipoStruct(
  AhorrotipoStruct? ahorrotipo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    ahorrotipo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAhorrotipoStructData(
  Map<String, dynamic> firestoreData,
  AhorrotipoStruct? ahorrotipo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (ahorrotipo == null) {
    return;
  }
  if (ahorrotipo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && ahorrotipo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final ahorrotipoData = getAhorrotipoFirestoreData(ahorrotipo, forFieldValue);
  final nestedData = ahorrotipoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = ahorrotipo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAhorrotipoFirestoreData(
  AhorrotipoStruct? ahorrotipo, [
  bool forFieldValue = false,
]) {
  if (ahorrotipo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(ahorrotipo.toMap());

  // Add any Firestore field values
  mapToFirestore(ahorrotipo.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAhorrotipoListFirestoreData(
  List<AhorrotipoStruct>? ahorrotipos,
) =>
    ahorrotipos?.map((e) => getAhorrotipoFirestoreData(e, true)).toList() ?? [];
