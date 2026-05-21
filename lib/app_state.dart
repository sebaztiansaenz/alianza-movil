import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _companyRef = prefs.getString('ff_companyRef')?.ref ?? _companyRef;
    });
    _safeInit(() {
      _shouldVerify = prefs.getBool('ff_shouldVerify') ?? _shouldVerify;
    });
    _safeInit(() {
      _lastPayment = prefs.containsKey('ff_lastPayment')
          ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_lastPayment')!)
          : _lastPayment;
    });
    _safeInit(() {
      _currentEmpresaPage =
          prefs.getString('ff_currentEmpresaPage') ?? _currentEmpresaPage;
    });
    _safeInit(() {
      _fechainicial = prefs.containsKey('ff_fechainicial')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_fechainicial')!)
          : _fechainicial;
    });
    _safeInit(() {
      _fechafinal = prefs.containsKey('ff_fechafinal')
          ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_fechafinal')!)
          : _fechafinal;
    });
    _safeInit(() {
      _appstateCDAT = prefs.getString('ff_appstateCDAT') ?? _appstateCDAT;
    });
    _safeInit(() {
      _version = prefs.getString('ff_version') ?? _version;
    });
    _safeInit(() {
      _usercount = prefs.getDouble('ff_usercount') ?? _usercount;
    });
    _safeInit(() {
      _usercount2 = prefs.getDouble('ff_usercount2') ?? _usercount2;
    });
    _safeInit(() {
      _barChart = prefs
              .getStringList('ff_barChart')
              ?.map((x) {
                try {
                  return BarChartDataStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _barChart;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  DateTime? _January = DateTime.fromMillisecondsSinceEpoch(1704078000000);
  DateTime? get January => _January;
  set January(DateTime? value) {
    _January = value;
  }

  DateTime? _February = DateTime.fromMillisecondsSinceEpoch(1706756400000);
  DateTime? get February => _February;
  set February(DateTime? value) {
    _February = value;
  }

  DateTime? _April = DateTime.fromMillisecondsSinceEpoch(1711940400000);
  DateTime? get April => _April;
  set April(DateTime? value) {
    _April = value;
  }

  DateTime? _June = DateTime.fromMillisecondsSinceEpoch(1717210800000);
  DateTime? get June => _June;
  set June(DateTime? value) {
    _June = value;
  }

  DateTime? _July = DateTime.fromMillisecondsSinceEpoch(1719802800000);
  DateTime? get July => _July;
  set July(DateTime? value) {
    _July = value;
  }

  DateTime? _August = DateTime.fromMillisecondsSinceEpoch(1722481200000);
  DateTime? get August => _August;
  set August(DateTime? value) {
    _August = value;
  }

  DateTime? _September = DateTime.fromMillisecondsSinceEpoch(1725159600000);
  DateTime? get September => _September;
  set September(DateTime? value) {
    _September = value;
  }

  DateTime? _October = DateTime.fromMillisecondsSinceEpoch(1727751600000);
  DateTime? get October => _October;
  set October(DateTime? value) {
    _October = value;
  }

  DateTime? _November = DateTime.fromMillisecondsSinceEpoch(1730430000000);
  DateTime? get November => _November;
  set November(DateTime? value) {
    _November = value;
  }

  DateTime? _December = DateTime.fromMillisecondsSinceEpoch(1733022000000);
  DateTime? get December => _December;
  set December(DateTime? value) {
    _December = value;
  }

  DateTime? _May = DateTime.fromMillisecondsSinceEpoch(1714532400000);
  DateTime? get May => _May;
  set May(DateTime? value) {
    _May = value;
  }

  DateTime? _March = DateTime.fromMillisecondsSinceEpoch(1709262000000);
  DateTime? get March => _March;
  set March(DateTime? value) {
    _March = value;
  }

  int _menu = 0;
  int get menu => _menu;
  set menu(int value) {
    _menu = value;
  }

  dynamic _gsheets;
  dynamic get gsheets => _gsheets;
  set gsheets(dynamic value) {
    _gsheets = value;
  }

  bool _button1click = false;
  bool get button1click => _button1click;
  set button1click(bool value) {
    _button1click = value;
  }

  int _buttonNumber = 0;
  int get buttonNumber => _buttonNumber;
  set buttonNumber(int value) {
    _buttonNumber = value;
  }

  bool _button2click = false;
  bool get button2click => _button2click;
  set button2click(bool value) {
    _button2click = value;
  }

  bool _button3Click = false;
  bool get button3Click => _button3Click;
  set button3Click(bool value) {
    _button3Click = value;
  }

  bool _button4click = false;
  bool get button4click => _button4click;
  set button4click(bool value) {
    _button4click = value;
  }

  int _button2 = 0;
  int get button2 => _button2;
  set button2(int value) {
    _button2 = value;
  }

  int _button3 = 0;
  int get button3 => _button3;
  set button3(int value) {
    _button3 = value;
  }

  int _button4 = 0;
  int get button4 => _button4;
  set button4(int value) {
    _button4 = value;
  }

  String _OTPKey = '';
  String get OTPKey => _OTPKey;
  set OTPKey(String value) {
    _OTPKey = value;
  }

  bool _Dbutton1 = false;
  bool get Dbutton1 => _Dbutton1;
  set Dbutton1(bool value) {
    _Dbutton1 = value;
  }

  int _DButtonNumber1 = 0;
  int get DButtonNumber1 => _DButtonNumber1;
  set DButtonNumber1(int value) {
    _DButtonNumber1 = value;
  }

  bool _isSavingAccountHave = false;
  bool get isSavingAccountHave => _isSavingAccountHave;
  set isSavingAccountHave(bool value) {
    _isSavingAccountHave = value;
  }

  String _accountType = '';
  String get accountType => _accountType;
  set accountType(String value) {
    _accountType = value;
  }

  String _NIT = '';
  String get NIT => _NIT;
  set NIT(String value) {
    _NIT = value;
  }

  String _PDFView1 = '';
  String get PDFView1 => _PDFView1;
  set PDFView1(String value) {
    _PDFView1 = value;
  }

  String _SavingOTPKey = '';
  String get SavingOTPKey => _SavingOTPKey;
  set SavingOTPKey(String value) {
    _SavingOTPKey = value;
  }

  String _UserName = '';
  String get UserName => _UserName;
  set UserName(String value) {
    _UserName = value;
  }

  String _UID = '';
  String get UID => _UID;
  set UID(String value) {
    _UID = value;
  }

  String _CC = '';
  String get CC => _CC;
  set CC(String value) {
    _CC = value;
  }

  String _Savingtype = '';
  String get Savingtype => _Savingtype;
  set Savingtype(String value) {
    _Savingtype = value;
  }

  String _typeofcontact = '';
  String get typeofcontact => _typeofcontact;
  set typeofcontact(String value) {
    _typeofcontact = value;
  }

  String _totaldeposit = '';
  String get totaldeposit => _totaldeposit;
  set totaldeposit(String value) {
    _totaldeposit = value;
  }

  String _companyname = '';
  String get companyname => _companyname;
  set companyname(String value) {
    _companyname = value;
  }

  String _userType = '';
  String get userType => _userType;
  set userType(String value) {
    _userType = value;
  }

  int _DButtonNumber5 = 0;
  int get DButtonNumber5 => _DButtonNumber5;
  set DButtonNumber5(int value) {
    _DButtonNumber5 = value;
  }

  bool _DButton5 = false;
  bool get DButton5 => _DButton5;
  set DButton5(bool value) {
    _DButton5 = value;
  }

  String _UserEmail = '';
  String get UserEmail => _UserEmail;
  set UserEmail(String value) {
    _UserEmail = value;
  }

  String _basarNumber = '';
  String get basarNumber => _basarNumber;
  set basarNumber(String value) {
    _basarNumber = value;
  }

  String _desherNam = '';
  String get desherNam => _desherNam;
  set desherNam(String value) {
    _desherNam = value;
  }

  String _jonmoDin = '';
  String get jonmoDin => _jonmoDin;
  set jonmoDin(String value) {
    _jonmoDin = value;
  }

  String _koithakedocDece = '';
  String get koithakedocDece => _koithakedocDece;
  set koithakedocDece(String value) {
    _koithakedocDece = value;
  }

  String _amrNumber = '';
  String get amrNumber => _amrNumber;
  set amrNumber(String value) {
    _amrNumber = value;
  }

  String _kiRokomDoc = '';
  String get kiRokomDoc => _kiRokomDoc;
  set kiRokomDoc(String value) {
    _kiRokomDoc = value;
  }

  String _PDFView2 = '';
  String get PDFView2 => _PDFView2;
  set PDFView2(String value) {
    _PDFView2 = value;
  }

  double _TotalsavingsAmount = 0.0;
  double get TotalsavingsAmount => _TotalsavingsAmount;
  set TotalsavingsAmount(double value) {
    _TotalsavingsAmount = value;
  }

  int _NITSucessfulnumber = 0;
  int get NITSucessfulnumber => _NITSucessfulnumber;
  set NITSucessfulnumber(int value) {
    _NITSucessfulnumber = value;
  }

  String _NITFoundCompanyName = '';
  String get NITFoundCompanyName => _NITFoundCompanyName;
  set NITFoundCompanyName(String value) {
    _NITFoundCompanyName = value;
  }

  bool _UserSearchValueFound = false;
  bool get UserSearchValueFound => _UserSearchValueFound;
  set UserSearchValueFound(bool value) {
    _UserSearchValueFound = value;
  }

  String _UserDirccion = '';
  String get UserDirccion => _UserDirccion;
  set UserDirccion(String value) {
    _UserDirccion = value;
  }

  String _UserCludad = '';
  String get UserCludad => _UserCludad;
  set UserCludad(String value) {
    _UserCludad = value;
  }

  String _UserDepartmento = '';
  String get UserDepartmento => _UserDepartmento;
  set UserDepartmento(String value) {
    _UserDepartmento = value;
  }

  String _UserPais = '';
  String get UserPais => _UserPais;
  set UserPais(String value) {
    _UserPais = value;
  }

  bool _servicebutton1Clicked = false;
  bool get servicebutton1Clicked => _servicebutton1Clicked;
  set servicebutton1Clicked(bool value) {
    _servicebutton1Clicked = value;
  }

  bool _servicebutton2Clicked = false;
  bool get servicebutton2Clicked => _servicebutton2Clicked;
  set servicebutton2Clicked(bool value) {
    _servicebutton2Clicked = value;
  }

  bool _servicebutton3Clicked = false;
  bool get servicebutton3Clicked => _servicebutton3Clicked;
  set servicebutton3Clicked(bool value) {
    _servicebutton3Clicked = value;
  }

  String _servicebuttonMode = '';
  String get servicebuttonMode => _servicebuttonMode;
  set servicebuttonMode(String value) {
    _servicebuttonMode = value;
  }

  String _CRMproductType = 'Ahorros';
  String get CRMproductType => _CRMproductType;
  set CRMproductType(String value) {
    _CRMproductType = value;
  }

  String _CRMproductType1 = 'Credito';
  String get CRMproductType1 => _CRMproductType1;
  set CRMproductType1(String value) {
    _CRMproductType1 = value;
  }

  String _CRMproductType2 = 'CDAT';
  String get CRMproductType2 => _CRMproductType2;
  set CRMproductType2(String value) {
    _CRMproductType2 = value;
  }

  bool _Dbutton4 = false;
  bool get Dbutton4 => _Dbutton4;
  set Dbutton4(bool value) {
    _Dbutton4 = value;
  }

  int _DButtonNumber4 = 0;
  int get DButtonNumber4 => _DButtonNumber4;
  set DButtonNumber4(int value) {
    _DButtonNumber4 = value;
  }

  DocumentReference? _chosenservicio;
  DocumentReference? get chosenservicio => _chosenservicio;
  set chosenservicio(DocumentReference? value) {
    _chosenservicio = value;
  }

  bool _serviceeditbutton1clicked = false;
  bool get serviceeditbutton1clicked => _serviceeditbutton1clicked;
  set serviceeditbutton1clicked(bool value) {
    _serviceeditbutton1clicked = value;
  }

  bool _serviceeditbutton2clicked = false;
  bool get serviceeditbutton2clicked => _serviceeditbutton2clicked;
  set serviceeditbutton2clicked(bool value) {
    _serviceeditbutton2clicked = value;
  }

  bool _serviceeditbutton3clicked = false;
  bool get serviceeditbutton3clicked => _serviceeditbutton3clicked;
  set serviceeditbutton3clicked(bool value) {
    _serviceeditbutton3clicked = value;
  }

  DocumentReference? _savingstypeobject;
  DocumentReference? get savingstypeobject => _savingstypeobject;
  set savingstypeobject(DocumentReference? value) {
    _savingstypeobject = value;
  }

  String _ahorroType = '';
  String get ahorroType => _ahorroType;
  set ahorroType(String value) {
    _ahorroType = value;
  }

  String _companyNIT = '';
  String get companyNIT => _companyNIT;
  set companyNIT(String value) {
    _companyNIT = value;
  }

  DocumentReference? _companyRef;
  DocumentReference? get companyRef => _companyRef;
  set companyRef(DocumentReference? value) {
    _companyRef = value;
    value != null
        ? prefs.setString('ff_companyRef', value.path)
        : prefs.remove('ff_companyRef');
  }

  DocumentReference? _statementTypeRef;
  DocumentReference? get statementTypeRef => _statementTypeRef;
  set statementTypeRef(DocumentReference? value) {
    _statementTypeRef = value;
  }

  String _editServiceName = '';
  String get editServiceName => _editServiceName;
  set editServiceName(String value) {
    _editServiceName = value;
  }

  double _editServiceEA = 0.0;
  double get editServiceEA => _editServiceEA;
  set editServiceEA(double value) {
    _editServiceEA = value;
  }

  List<AhorrosAccountsStruct> _userAccounts = [];
  List<AhorrosAccountsStruct> get userAccounts => _userAccounts;
  set userAccounts(List<AhorrosAccountsStruct> value) {
    _userAccounts = value;
  }

  void addToUserAccounts(AhorrosAccountsStruct value) {
    userAccounts.add(value);
  }

  void removeFromUserAccounts(AhorrosAccountsStruct value) {
    userAccounts.remove(value);
  }

  void removeAtIndexFromUserAccounts(int index) {
    userAccounts.removeAt(index);
  }

  void updateUserAccountsAtIndex(
    int index,
    AhorrosAccountsStruct Function(AhorrosAccountsStruct) updateFn,
  ) {
    userAccounts[index] = updateFn(_userAccounts[index]);
  }

  void insertAtIndexInUserAccounts(int index, AhorrosAccountsStruct value) {
    userAccounts.insert(index, value);
  }

  UserInformationStruct _userInformation = UserInformationStruct();
  UserInformationStruct get userInformation => _userInformation;
  set userInformation(UserInformationStruct value) {
    _userInformation = value;
  }

  void updateUserInformationStruct(Function(UserInformationStruct) updateFn) {
    updateFn(_userInformation);
  }

  bool _shouldVerify = false;
  bool get shouldVerify => _shouldVerify;
  set shouldVerify(bool value) {
    _shouldVerify = value;
    prefs.setBool('ff_shouldVerify', value);
  }

  DateTime? _lastPayment = DateTime.fromMillisecondsSinceEpoch(1730371800000);
  DateTime? get lastPayment => _lastPayment;
  set lastPayment(DateTime? value) {
    _lastPayment = value;
    value != null
        ? prefs.setInt('ff_lastPayment', value.millisecondsSinceEpoch)
        : prefs.remove('ff_lastPayment');
  }

  String _paymentReference = '';
  String get paymentReference => _paymentReference;
  set paymentReference(String value) {
    _paymentReference = value;
  }

  String _typeOfProduct = '';
  String get typeOfProduct => _typeOfProduct;
  set typeOfProduct(String value) {
    _typeOfProduct = value;
  }

  String _bankName = '';
  String get bankName => _bankName;
  set bankName(String value) {
    _bankName = value;
  }

  String _bankAccountType = '';
  String get bankAccountType => _bankAccountType;
  set bankAccountType(String value) {
    _bankAccountType = value;
  }

  String _zapsignToken = '';
  String get zapsignToken => _zapsignToken;
  set zapsignToken(String value) {
    _zapsignToken = value;
  }

  /// `documentos` | `pagare` | `autorizacion` | vacío — flujo firma crédito ZapSign.
  String _creditoZapsignFase = '';
  String get creditoZapsignFase => _creditoZapsignFase;
  set creditoZapsignFase(String value) {
    _creditoZapsignFase = value;
  }

  bool _creditoOpenProcesoDisbursement = false;
  bool get creditoOpenProcesoDisbursement => _creditoOpenProcesoDisbursement;
  set creditoOpenProcesoDisbursement(bool value) {
    _creditoOpenProcesoDisbursement = value;
  }

  double _amount = 0.0;
  double get amount => _amount;
  set amount(double value) {
    _amount = value;
  }

  DocumentReference? _selectedBank;
  DocumentReference? get selectedBank => _selectedBank;
  set selectedBank(DocumentReference? value) {
    _selectedBank = value;
  }

  String _occupation = '';
  String get occupation => _occupation;
  set occupation(String value) {
    _occupation = value;
  }

  String _withdrawalStatus = '';
  String get withdrawalStatus => _withdrawalStatus;
  set withdrawalStatus(String value) {
    _withdrawalStatus = value;
  }

  String _withdrawalStatus2 = '';
  String get withdrawalStatus2 => _withdrawalStatus2;
  set withdrawalStatus2(String value) {
    _withdrawalStatus2 = value;
  }

  String _dynamicSelectedPAGOS = '';
  String get dynamicSelectedPAGOS => _dynamicSelectedPAGOS;
  set dynamicSelectedPAGOS(String value) {
    _dynamicSelectedPAGOS = value;
  }

  String _currentEmpresaPage = 'USUARIO';
  String get currentEmpresaPage => _currentEmpresaPage;
  set currentEmpresaPage(String value) {
    _currentEmpresaPage = value;
    prefs.setString('ff_currentEmpresaPage', value);
  }

  String _dynamicSelectedINFORMES = '';
  String get dynamicSelectedINFORMES => _dynamicSelectedINFORMES;
  set dynamicSelectedINFORMES(String value) {
    _dynamicSelectedINFORMES = value;
  }

  bool _documentNotEqual = false;
  bool get documentNotEqual => _documentNotEqual;
  set documentNotEqual(bool value) {
    _documentNotEqual = value;
  }

  DateTime? _lastAction;
  DateTime? get lastAction => _lastAction;
  set lastAction(DateTime? value) {
    _lastAction = value;
  }

  dynamic _testUsers = jsonDecode(
      '{\"testUsers\":[\"jaime+10@zerocode.la\",\"jaime+09@zerocode.la\",\"jaime+08@zerocode.la\",\"jaime+07@zerocode.la\",\"jaime+06@zerocode.la\",\"jaime+05@zerocode.la\",\"jaime+04@zerocode.la\",\"jaime+03@zerocode.la\",\"Jaime+02@zerocode.la\",\"jaime+01@zerocode.la\",\"jaimesolisg+26@gmail.com\",\"jaimesolisg+25@gmail.com\",\"jaimesolisg+23@gmail.com\",\"jaimesolisg+22@gmail.com\",\"jaimesolisg+21@gmail.com\",\"jaimesolisg+98@gmail.com\",\"jaimesolisg+99@gmail.com\",\"jaimesolisg+20@gmail.com\",\"jaimesolisg+19@gmail.com\",\"jaimesolisg+16@gmail.com\",\"jaimesolisg+15@gmail.com\",\"jaimesolisg+13@gmail.com\",\"jaimesolisg+11@gmail.com\",\"jaimesolisg+10@gmail.com\",\"jaimesolisg+08@gmail.com\",\"jaimesolisg+07@gmail.com\",\"jaimesolisg+06@gmail.com\",\"jaimesolisg+09@gmail.com\",\"jaimesolisg+05@gmail.com\",\"jaimesolisg+04@gmail.com\",\"jaimesolisg+03@gmail.com\",\"jaimesolisg+02@gmail.com\",\"jaimesolisg+01@gmail.com\",\"jaimesolisg@gmail.com\",\"jaime.solis@nextrocket.io\",\"testuser02.09@gmail.com\",\"elokakene@gmail.com\",\"jdiazarmas@gmail.com\",\"abhishek@trynocode.com\",\"kingkashyap151@gmail.com\",\"avinash@trynocode.com\",\"avinashkashyap242@gmail.com\",\"abc@g.com\",\"andres.diaz@zerocode.la\",\"abi.aleeza@gmail.com\",\"testadmin@gmail.com\",\"nassif.rc@gmail.com\"]}');
  dynamic get testUsers => _testUsers;
  set testUsers(dynamic value) {
    _testUsers = value;
  }

  String _Antiguedad = '';
  String get Antiguedad => _Antiguedad;
  set Antiguedad(String value) {
    _Antiguedad = value;
  }

  String _Salario = '';
  String get Salario => _Salario;
  set Salario(String value) {
    _Salario = value;
  }

  String _TipoContrato = '';
  String get TipoContrato => _TipoContrato;
  set TipoContrato(String value) {
    _TipoContrato = value;
  }

  String _UbicacionTrabajo = '';
  String get UbicacionTrabajo => _UbicacionTrabajo;
  set UbicacionTrabajo(String value) {
    _UbicacionTrabajo = value;
  }

  String _EmpresaTabPage = '';
  String get EmpresaTabPage => _EmpresaTabPage;
  set EmpresaTabPage(String value) {
    _EmpresaTabPage = value;
  }

  String _EmpresaSection = '';
  String get EmpresaSection => _EmpresaSection;
  set EmpresaSection(String value) {
    _EmpresaSection = value;
  }

  DateTime? _fechainicial = DateTime.fromMillisecondsSinceEpoch(1496354160000);
  DateTime? get fechainicial => _fechainicial;
  set fechainicial(DateTime? value) {
    _fechainicial = value;
    value != null
        ? prefs.setInt('ff_fechainicial', value.millisecondsSinceEpoch)
        : prefs.remove('ff_fechainicial');
  }

  DateTime? _fechafinal = DateTime.fromMillisecondsSinceEpoch(6957168960000);
  DateTime? get fechafinal => _fechafinal;
  set fechafinal(DateTime? value) {
    _fechafinal = value;
    value != null
        ? prefs.setInt('ff_fechafinal', value.millisecondsSinceEpoch)
        : prefs.remove('ff_fechafinal');
  }

  String _appstateCDAT = '';
  String get appstateCDAT => _appstateCDAT;
  set appstateCDAT(String value) {
    _appstateCDAT = value;
    prefs.setString('ff_appstateCDAT', value);
  }

  bool _buscadoractivos = false;
  bool get buscadoractivos => _buscadoractivos;
  set buscadoractivos(bool value) {
    _buscadoractivos = value;
  }

  String _MenuEmpresasSeleccion = 'General';
  String get MenuEmpresasSeleccion => _MenuEmpresasSeleccion;
  set MenuEmpresasSeleccion(String value) {
    _MenuEmpresasSeleccion = value;
  }

  String _submenuempresas = '';
  String get submenuempresas => _submenuempresas;
  set submenuempresas(String value) {
    _submenuempresas = value;
  }

  String _version = '1.0.0';
  String get version => _version;
  set version(String value) {
    _version = value;
    prefs.setString('ff_version', value);
  }

  double _usercount = 0.0;
  double get usercount => _usercount;
  set usercount(double value) {
    _usercount = value;
    prefs.setDouble('ff_usercount', value);
  }

  double _usercount2 = 0.0;
  double get usercount2 => _usercount2;
  set usercount2(double value) {
    _usercount2 = value;
    prefs.setDouble('ff_usercount2', value);
  }

  List<BarChartDataStruct> _barChart = [
    BarChartDataStruct.fromSerializableMap(jsonDecode(
        '{\"month\":\"Enero\",\"value1\":\"20\",\"value2\":\"15\"}')),
    BarChartDataStruct.fromSerializableMap(jsonDecode(
        '{\"month\":\"Febrero\",\"value1\":\"23\",\"value2\":\"10\"}')),
    BarChartDataStruct.fromSerializableMap(jsonDecode(
        '{\"month\":\"Marzo\",\"value1\":\"12\",\"value2\":\"11\"}')),
    BarChartDataStruct.fromSerializableMap(jsonDecode(
        '{\"month\":\"Abril\",\"value1\":\"15\",\"value2\":\"16\"}')),
    BarChartDataStruct.fromSerializableMap(jsonDecode(
        '{\"month\":\"Hello World\",\"value1\":\"8\",\"value2\":\"0\"}'))
  ];
  List<BarChartDataStruct> get barChart => _barChart;
  set barChart(List<BarChartDataStruct> value) {
    _barChart = value;
    prefs.setStringList(
        'ff_barChart', value.map((x) => x.serialize()).toList());
  }

  void addToBarChart(BarChartDataStruct value) {
    barChart.add(value);
    prefs.setStringList(
        'ff_barChart', _barChart.map((x) => x.serialize()).toList());
  }

  void removeFromBarChart(BarChartDataStruct value) {
    barChart.remove(value);
    prefs.setStringList(
        'ff_barChart', _barChart.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromBarChart(int index) {
    barChart.removeAt(index);
    prefs.setStringList(
        'ff_barChart', _barChart.map((x) => x.serialize()).toList());
  }

  void updateBarChartAtIndex(
    int index,
    BarChartDataStruct Function(BarChartDataStruct) updateFn,
  ) {
    barChart[index] = updateFn(_barChart[index]);
    prefs.setStringList(
        'ff_barChart', _barChart.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInBarChart(int index, BarChartDataStruct value) {
    barChart.insert(index, value);
    prefs.setStringList(
        'ff_barChart', _barChart.map((x) => x.serialize()).toList());
  }

  String _menuactivocore = '';
  String get menuactivocore => _menuactivocore;
  set menuactivocore(String value) {
    _menuactivocore = value;
  }

  String _submenucore = '';
  String get submenucore => _submenucore;
  set submenucore(String value) {
    _submenucore = value;
  }

  DocumentReference? _bancoid;
  DocumentReference? get bancoid => _bancoid;
  set bancoid(DocumentReference? value) {
    _bancoid = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
