import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';

import '/auth/base_auth_user_provider.dart';

import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/adaptive_page_shell.dart';
import '/flutter_flow/session_inactivity.dart';
import 'serialization_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => AdaptivePageShell(
            child: appStateNotifier.loggedIn
                ? SplashWidget()
                : OnboardingAppMovilWidget(),
          ),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? SplashWidget()
              : OnboardingAppMovilWidget(),
        ),
        FFRoute(
          name: AyudaWidget.routeName,
          path: AyudaWidget.routePath,
          builder: (context, params) => AyudaWidget(),
        ),
        FFRoute(
          name: CardWidget.routeName,
          path: CardWidget.routePath,
          builder: (context, params) => CardWidget(),
        ),
        FFRoute(
          name: Registro1Widget.routeName,
          path: Registro1Widget.routePath,
          builder: (context, params) => Registro1Widget(),
        ),
        FFRoute(
          name: Registro2Widget.routeName,
          path: Registro2Widget.routePath,
          builder: (context, params) => Registro2Widget(),
        ),
        FFRoute(
          name: Registro3Widget.routeName,
          path: Registro3Widget.routePath,
          builder: (context, params) => Registro3Widget(),
        ),
        FFRoute(
          name: ConveniosWidget.routeName,
          path: ConveniosWidget.routePath,
          builder: (context, params) => ConveniosWidget(),
        ),
        FFRoute(
          name: Registro4Widget.routeName,
          path: Registro4Widget.routePath,
          builder: (context, params) => Registro4Widget(),
        ),
        FFRoute(
          name: LoginPagenewWidget.routeName,
          path: LoginPagenewWidget.routePath,
          builder: (context, params) => LoginPagenewWidget(),
        ),
        FFRoute(
          name: VerificationUnderReviewPageWidget.routeName,
          path: VerificationUnderReviewPageWidget.routePath,
          builder: (context, params) => VerificationUnderReviewPageWidget(),
        ),
        FFRoute(
          name: VerificationCardfrontuploadWidget.routeName,
          path: VerificationCardfrontuploadWidget.routePath,
          builder: (context, params) => VerificationCardfrontuploadWidget(
            reverificacion1: params.getParam(
              'reverificacion1',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: VerificationBackuploadWidget.routeName,
          path: VerificationBackuploadWidget.routePath,
          builder: (context, params) => VerificationBackuploadWidget(
            front: params.getParam(
              'front',
              ParamType.String,
            ),
            reverificacion2: params.getParam(
              'reverificacion2',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: VerificationSelfiPageWidget.routeName,
          path: VerificationSelfiPageWidget.routePath,
          builder: (context, params) => VerificationSelfiPageWidget(
            front: params.getParam(
              'front',
              ParamType.String,
            ),
            back: params.getParam(
              'back',
              ParamType.String,
            ),
            reverificacion3: params.getParam(
              'reverificacion3',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: HomeNewWidget.routeName,
          path: HomeNewWidget.routePath,
          builder: (context, params) => HomeNewWidget(),
        ),
        FFRoute(
          name: AHORROSPage1Widget.routeName,
          path: AHORROSPage1Widget.routePath,
          builder: (context, params) => AHORROSPage1Widget(),
        ),
        FFRoute(
          name: AhorroMainPageWidget.routeName,
          path: AhorroMainPageWidget.routePath,
          asyncParams: {
            'ahoro': getDoc(['ahorros'], AhorrosRecord.fromSnapshot),
          },
          builder: (context, params) => AhorroMainPageWidget(
            ahoro: params.getParam(
              'ahoro',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AhorroCreditopageWidget.routeName,
          path: AhorroCreditopageWidget.routePath,
          asyncParams: {
            'productRef': getDoc(['ahorros'], AhorrosRecord.fromSnapshot),
          },
          builder: (context, params) => AhorroCreditopageWidget(
            productRef: params.getParam(
              'productRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AhorroDOCUMENTOapageWidget.routeName,
          path: AhorroDOCUMENTOapageWidget.routePath,
          builder: (context, params) => AhorroDOCUMENTOapageWidget(),
        ),
        FFRoute(
          name: Perfil02Widget.routeName,
          path: Perfil02Widget.routePath,
          builder: (context, params) => Perfil02Widget(),
        ),
        FFRoute(
          name: Perfil03Widget.routeName,
          path: Perfil03Widget.routePath,
          builder: (context, params) => Perfil03Widget(),
        ),
        FFRoute(
          name: Perfil04Widget.routeName,
          path: Perfil04Widget.routePath,
          builder: (context, params) => Perfil04Widget(),
        ),
        FFRoute(
          name: Perfil05Widget.routeName,
          path: Perfil05Widget.routePath,
          builder: (context, params) => Perfil05Widget(),
        ),
        FFRoute(
          name: Perfil06Widget.routeName,
          path: Perfil06Widget.routePath,
          builder: (context, params) => Perfil06Widget(),
        ),
        FFRoute(
          name: Perfil01Widget.routeName,
          path: Perfil01Widget.routePath,
          builder: (context, params) => Perfil01Widget(),
        ),
        FFRoute(
          name: AhorroExtractoWidget.routeName,
          path: AhorroExtractoWidget.routePath,
          asyncParams: {
            'productDoc': getDoc(['ahorros'], AhorrosRecord.fromSnapshot),
          },
          builder: (context, params) => AhorroExtractoWidget(
            productDoc: params.getParam(
              'productDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AhorroDeNominaPageWidget.routeName,
          path: AhorroDeNominaPageWidget.routePath,
          builder: (context, params) => AhorroDeNominaPageWidget(
            cambioEmpresa: params.getParam(
              'cambioEmpresa',
              ParamType.bool,
            ),
            ahorroActual: params.getParam(
              'ahorroActual',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['ahorros'],
            ),
          ),
        ),
        FFRoute(
          name: AhorroDOCUMENTO2Widget.routeName,
          path: AhorroDOCUMENTO2Widget.routePath,
          builder: (context, params) => AhorroDOCUMENTO2Widget(
            cambioEmpresa5: params.getParam(
              'cambioEmpresa5',
              ParamType.bool,
            ),
            ahorroActual5: params.getParam(
              'ahorroActual5',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['ahorros'],
            ),
          ),
        ),
        FFRoute(
          name: ChangePassword1Widget.routeName,
          path: ChangePassword1Widget.routePath,
          builder: (context, params) => ChangePassword1Widget(),
        ),
        FFRoute(
          name: Registro6Widget.routeName,
          path: Registro6Widget.routePath,
          builder: (context, params) => Registro6Widget(),
        ),
        FFRoute(
          name: VerificationDeclaracionWidget.routeName,
          path: VerificationDeclaracionWidget.routePath,
          builder: (context, params) => VerificationDeclaracionWidget(
            front: params.getParam(
              'front',
              ParamType.String,
            ),
            back: params.getParam(
              'back',
              ParamType.String,
            ),
            selfie: params.getParam(
              'selfie',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: VerificationOriginWidget.routeName,
          path: VerificationOriginWidget.routePath,
          builder: (context, params) => VerificationOriginWidget(
            front: params.getParam(
              'front',
              ParamType.String,
            ),
            back: params.getParam(
              'back',
              ParamType.String,
            ),
            selfie: params.getParam(
              'selfie',
              ParamType.String,
            ),
            flgPPE: params.getParam(
              'flgPPE',
              ParamType.bool,
            ),
            flgRelativesPPE: params.getParam(
              'flgRelativesPPE',
              ParamType.bool,
            ),
            fullName: params.getParam(
              'fullName',
              ParamType.String,
            ),
            relativeId: params.getParam(
              'relativeId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: VerificationPDFPreviewWidget.routeName,
          path: VerificationPDFPreviewWidget.routePath,
          builder: (context, params) => VerificationPDFPreviewWidget(),
        ),
        FFRoute(
          name: SelectCountryWidget.routeName,
          path: SelectCountryWidget.routePath,
          builder: (context, params) => SelectCountryWidget(),
        ),
        FFRoute(
          name: UnderDevelopmentWidget.routeName,
          path: UnderDevelopmentWidget.routePath,
          builder: (context, params) => UnderDevelopmentWidget(),
        ),
        FFRoute(
          name: VerificationSuccessWidget.routeName,
          path: VerificationSuccessWidget.routePath,
          builder: (context, params) => VerificationSuccessWidget(),
        ),
        FFRoute(
          name: VerificationFailedWidget.routeName,
          path: VerificationFailedWidget.routePath,
          builder: (context, params) => VerificationFailedWidget(),
        ),
        FFRoute(
          name: TransactionsDetailsWidget.routeName,
          path: TransactionsDetailsWidget.routePath,
          builder: (context, params) => TransactionsDetailsWidget(),
        ),
        FFRoute(
          name: IntermissionZapsignWidget.routeName,
          path: IntermissionZapsignWidget.routePath,
          builder: (context, params) => IntermissionZapsignWidget(
            oobCode: params.getParam(
              'oobCode',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: CreditoIntermissionZapsignWidget.routeName,
          path: CreditoIntermissionZapsignWidget.routePath,
          builder: (context, params) => const CreditoIntermissionZapsignWidget(),
        ),
        FFRoute(
          name: AhorroDepositarWidget.routeName,
          path: AhorroDepositarWidget.routePath,
          builder: (context, params) => AhorroDepositarWidget(),
        ),
        FFRoute(
          name: AhorroTransactionsWidget.routeName,
          path: AhorroTransactionsWidget.routePath,
          asyncParams: {
            'ahorroDoc': getDoc(['ahorros'], AhorrosRecord.fromSnapshot),
          },
          builder: (context, params) => AhorroTransactionsWidget(
            ahorroDoc: params.getParam(
              'ahorroDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AhorroAddBankWidget.routeName,
          path: AhorroAddBankWidget.routePath,
          builder: (context, params) => AhorroAddBankWidget(),
        ),
        FFRoute(
          name: AhorroWithdrawalOTPWidget.routeName,
          path: AhorroWithdrawalOTPWidget.routePath,
          builder: (context, params) => AhorroWithdrawalOTPWidget(
            ahorro: params.getParam(
              'ahorro',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['ahorros'],
            ),
            otp: params.getParam(
              'otp',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: FinancialInformationWidget.routeName,
          path: FinancialInformationWidget.routePath,
          builder: (context, params) => FinancialInformationWidget(),
        ),
        FFRoute(
          name: Perfil07Widget.routeName,
          path: Perfil07Widget.routePath,
          builder: (context, params) => Perfil07Widget(),
        ),
        FFRoute(
          name: AhorroTransactionsCopyWidget.routeName,
          path: AhorroTransactionsCopyWidget.routePath,
          asyncParams: {
            'ahorroDoc': getDoc(['ahorros'], AhorrosRecord.fromSnapshot),
          },
          builder: (context, params) => AhorroTransactionsCopyWidget(
            ahorroDoc: params.getParam(
              'ahorroDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: LoginPagenewCopyWidget.routeName,
          path: LoginPagenewCopyWidget.routePath,
          builder: (context, params) => LoginPagenewCopyWidget(),
        ),
        FFRoute(
          name: REGISTRO5MainWidget.routeName,
          path: REGISTRO5MainWidget.routePath,
          builder: (context, params) => REGISTRO5MainWidget(),
        ),
        FFRoute(
          name: Perfil07EditWidget.routeName,
          path: Perfil07EditWidget.routePath,
          builder: (context, params) => Perfil07EditWidget(),
        ),
        FFRoute(
          name: VerificationActividadWidget.routeName,
          path: VerificationActividadWidget.routePath,
          builder: (context, params) => VerificationActividadWidget(
            front: params.getParam(
              'front',
              ParamType.String,
            ),
            back: params.getParam(
              'back',
              ParamType.String,
            ),
            selfie: params.getParam(
              'selfie',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: DetallesTransaccionWidget.routeName,
          path: DetallesTransaccionWidget.routePath,
          builder: (context, params) => DetallesTransaccionWidget(
            status: params.getParam(
              'status',
              ParamType.String,
            ),
            idTransaccion: params.getParam(
              'idTransaccion',
              ParamType.String,
            ),
            apellidosynombres: params.getParam(
              'apellidosynombres',
              ParamType.String,
            ),
            monto: params.getParam(
              'monto',
              ParamType.double,
            ),
            banco: params.getParam(
              'banco',
              ParamType.String,
            ),
            fecha: params.getParam(
              'fecha',
              ParamType.DateTime,
            ),
            whitInfo: params.getParam(
              'whitInfo',
              ParamType.DataStruct,
              isList: false,
              structBuilder: WithdrawalInfoStruct.fromSerializableMap,
            ),
            typetransaction: params.getParam(
              'typetransaction',
              ParamType.String,
            ),
            detalles: params.getParam(
              'detalles',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ChangePassword3Widget.routeName,
          path: ChangePassword3Widget.routePath,
          asyncParams: {
            'docuser': getDoc(['user'], UserRecord.fromSnapshot),
          },
          builder: (context, params) => ChangePassword3Widget(
            docuser: params.getParam(
              'docuser',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ChangePassword5Widget.routeName,
          path: ChangePassword5Widget.routePath,
          builder: (context, params) => ChangePassword5Widget(
            codeOTP: params.getParam(
              'codeOTP',
              ParamType.int,
            ),
            email: params.getParam(
              'email',
              ParamType.String,
            ),
            nombre: params.getParam(
              'nombre',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ChangePassword6Widget.routeName,
          path: ChangePassword6Widget.routePath,
          builder: (context, params) => ChangePassword6Widget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: Perfil06CopyViewWidget.routeName,
          path: Perfil06CopyViewWidget.routePath,
          builder: (context, params) => Perfil06CopyViewWidget(
            urlpdf: params.getParam(
              'urlpdf',
              ParamType.String,
            ),
            nombre: params.getParam(
              'nombre',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: AhorroDeNominaPage2Widget.routeName,
          path: AhorroDeNominaPage2Widget.routePath,
          builder: (context, params) => AhorroDeNominaPage2Widget(
            cambioEmpresa4: params.getParam(
              'cambioEmpresa4',
              ParamType.bool,
            ),
            ahorroActual4: params.getParam(
              'ahorroActual4',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['ahorros'],
            ),
          ),
        ),
        FFRoute(
          name: AhorroDeNominaeditWidget.routeName,
          path: AhorroDeNominaeditWidget.routePath,
          builder: (context, params) => AhorroDeNominaeditWidget(
            ahorroref: params.getParam(
              'ahorroref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['ahorros'],
            ),
            monto: params.getParam(
              'monto',
              ParamType.double,
            ),
          ),
        ),
        FFRoute(
          name: AhorroDeNominaeditSucessWidget.routeName,
          path: AhorroDeNominaeditSucessWidget.routePath,
          builder: (context, params) => AhorroDeNominaeditSucessWidget(),
        ),
        FFRoute(
          name: DetallesTransaccionRetiroWidget.routeName,
          path: DetallesTransaccionRetiroWidget.routePath,
          builder: (context, params) => DetallesTransaccionRetiroWidget(
            status: params.getParam(
              'status',
              ParamType.String,
            ),
            idTransaccion: params.getParam(
              'idTransaccion',
              ParamType.String,
            ),
            apellidosynombres: params.getParam(
              'apellidosynombres',
              ParamType.String,
            ),
            monto: params.getParam(
              'monto',
              ParamType.double,
            ),
            fecha: params.getParam(
              'fecha',
              ParamType.DateTime,
            ),
            whitInfo: params.getParam(
              'whitInfo',
              ParamType.DataStruct,
              isList: false,
              structBuilder: WithdrawalInfoStruct.fromSerializableMap,
            ),
            typetransaction: params.getParam(
              'typetransaction',
              ParamType.String,
            ),
            detalles: params.getParam(
              'detalles',
              ParamType.String,
            ),
            fecharetiro: params.getParam(
              'fecharetiro',
              ParamType.DateTime,
            ),
          ),
        ),
        FFRoute(
          name: OnboardingAppMovilWidget.routeName,
          path: OnboardingAppMovilWidget.routePath,
          builder: (context, params) => OnboardingAppMovilWidget(),
        ),
        FFRoute(
          name: RegistroVinculacionWidget.routeName,
          path: RegistroVinculacionWidget.routePath,
          builder: (context, params) => RegistroVinculacionWidget(),
        ),
        FFRoute(
          name: ChangePassword31Widget.routeName,
          path: ChangePassword31Widget.routePath,
          builder: (context, params) => ChangePassword31Widget(),
        ),
        FFRoute(
          name: Perfil06Copy2Widget.routeName,
          path: Perfil06Copy2Widget.routePath,
          builder: (context, params) => Perfil06Copy2Widget(),
        ),
        FFRoute(
          name: ReferirWidget.routeName,
          path: ReferirWidget.routePath,
          builder: (context, params) => ReferirWidget(),
        ),
        FFRoute(
          name: Perfil06CopyAhorrosWidget.routeName,
          path: Perfil06CopyAhorrosWidget.routePath,
          builder: (context, params) => Perfil06CopyAhorrosWidget(
            accountType: params.getParam(
              'accountType',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: SplashWidget.routeName,
          path: SplashWidget.routePath,
          builder: (context, params) => SplashWidget(),
        ),
        FFRoute(
          name: AhorroDeNominaPageBuscarWidget.routeName,
          path: AhorroDeNominaPageBuscarWidget.routePath,
          asyncParams: {
            'empresa': getDoc(['empresa'], EmpresaRecord.fromSnapshot),
          },
          builder: (context, params) => AhorroDeNominaPageBuscarWidget(
            empresa: params.getParam(
              'empresa',
              ParamType.Document,
            ),
            cambioEmpresa2: params.getParam(
              'cambioEmpresa2',
              ParamType.bool,
            ),
            ahorroActual2: params.getParam(
              'ahorroActual2',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['ahorros'],
            ),
          ),
        ),
        FFRoute(
          name: AhorroDeNominaPageBuscarEmpresaWidget.routeName,
          path: AhorroDeNominaPageBuscarEmpresaWidget.routePath,
          asyncParams: {
            'empresa': getDoc(['empresa'], EmpresaRecord.fromSnapshot),
          },
          builder: (context, params) => AhorroDeNominaPageBuscarEmpresaWidget(
            empresa: params.getParam(
              'empresa',
              ParamType.Document,
            ),
            cambioEmpresa3: params.getParam(
              'cambioEmpresa3',
              ParamType.bool,
            ),
            ahorroActual3: params.getParam(
              'ahorroActual3',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['ahorros'],
            ),
          ),
        ),
        FFRoute(
          name: AhorroDeNominaPageInicioWidget.routeName,
          path: AhorroDeNominaPageInicioWidget.routePath,
          builder: (context, params) => AhorroDeNominaPageInicioWidget(),
        ),
        FFRoute(
          name: InversionesWidget.routeName,
          path: InversionesWidget.routePath,
          builder: (context, params) => InversionesWidget(),
        ),
        FFRoute(
          name: MsinversionescdatWidget.routeName,
          path: MsinversionescdatWidget.routePath,
          builder: (context, params) => MsinversionescdatWidget(),
        ),
        FFRoute(
          name: SolicitudcdatWidget.routeName,
          path: SolicitudcdatWidget.routePath,
          asyncParams: {
            'cdats': getDoc(['Cdats'], CdatsRecord.fromSnapshot),
          },
          builder: (context, params) => SolicitudcdatWidget(
            cdats: params.getParam(
              'cdats',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: Pas5firmacdatWidget.routeName,
          path: Pas5firmacdatWidget.routePath,
          builder: (context, params) => Pas5firmacdatWidget(),
        ),
        FFRoute(
          name: Pas4cdatWidget.routeName,
          path: Pas4cdatWidget.routePath,
          asyncParams: {
            'cdats': getDoc(['Cdats'], CdatsRecord.fromSnapshot),
          },
          builder: (context, params) => Pas4cdatWidget(
            cdats: params.getParam(
              'cdats',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AHORROScdat2Widget.routeName,
          path: AHORROScdat2Widget.routePath,
          asyncParams: {
            'cdat': getDoc(['Cdats'], CdatsRecord.fromSnapshot),
            'pendienteretiro': getDoc(['Cdats', 'confirmacionretiros'],
                ConfirmacionretirosRecord.fromSnapshot),
          },
          builder: (context, params) => AHORROScdat2Widget(
            cdat: params.getParam(
              'cdat',
              ParamType.Document,
            ),
            pendienteretiro: params.getParam(
              'pendienteretiro',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: NuevaaperturacdatWidget.routeName,
          path: NuevaaperturacdatWidget.routePath,
          asyncParams: {
            'cdats': getDoc(['Cdats'], CdatsRecord.fromSnapshot),
          },
          builder: (context, params) => NuevaaperturacdatWidget(
            cdats: params.getParam(
              'cdats',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: CdatarchivosWidget.routeName,
          path: CdatarchivosWidget.routePath,
          builder: (context, params) => CdatarchivosWidget(
            accountType: params.getParam(
              'accountType',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: CdatdetalleretiroWidget.routeName,
          path: CdatdetalleretiroWidget.routePath,
          asyncParams: {
            'cdats': getDoc(['Cdats'], CdatsRecord.fromSnapshot),
          },
          builder: (context, params) => CdatdetalleretiroWidget(
            cdats: params.getParam(
              'cdats',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: CdatretiroWidget.routeName,
          path: CdatretiroWidget.routePath,
          asyncParams: {
            'cdatr': getDoc(['Cdats'], CdatsRecord.fromSnapshot),
          },
          builder: (context, params) => CdatretiroWidget(
            cdatr: params.getParam(
              'cdatr',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AhorroWithdrawalOTPcdatWidget.routeName,
          path: AhorroWithdrawalOTPcdatWidget.routePath,
          asyncParams: {
            'cdat': getDoc(['Cdats'], CdatsRecord.fromSnapshot),
            'bank': getDoc(['bankAccounts'], BankAccountsRecord.fromSnapshot),
            'retiro': getDoc(['Cdats'], CdatsRecord.fromSnapshot),
          },
          builder: (context, params) => AhorroWithdrawalOTPcdatWidget(
            cdat: params.getParam(
              'cdat',
              ParamType.Document,
            ),
            otp: params.getParam(
              'otp',
              ParamType.int,
            ),
            bank: params.getParam(
              'bank',
              ParamType.Document,
            ),
            retiro: params.getParam(
              'retiro',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: MovimientoscdatWidget.routeName,
          path: MovimientoscdatWidget.routePath,
          asyncParams: {
            'cdat': getDoc(['Cdats'], CdatsRecord.fromSnapshot),
          },
          builder: (context, params) => MovimientoscdatWidget(
            cdat: params.getParam(
              'cdat',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ComprobantescdatWidget.routeName,
          path: ComprobantescdatWidget.routePath,
          builder: (context, params) => ComprobantescdatWidget(
            cdats: params.getParam(
              'cdats',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Cdats'],
            ),
          ),
        ),
        FFRoute(
          name: DetallesTransaccioncdatWidget.routeName,
          path: DetallesTransaccioncdatWidget.routePath,
          builder: (context, params) => DetallesTransaccioncdatWidget(
            status: params.getParam(
              'status',
              ParamType.String,
            ),
            idTransaccion: params.getParam(
              'idTransaccion',
              ParamType.String,
            ),
            apellidosynombres: params.getParam(
              'apellidosynombres',
              ParamType.String,
            ),
            monto: params.getParam(
              'monto',
              ParamType.double,
            ),
            banco: params.getParam(
              'banco',
              ParamType.String,
            ),
            fecha: params.getParam(
              'fecha',
              ParamType.DateTime,
            ),
            typetransaction: params.getParam(
              'typetransaction',
              ParamType.String,
            ),
            detalles: params.getParam(
              'detalles',
              ParamType.String,
            ),
            cdats: params.getParam(
              'cdats',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Cdats'],
            ),
          ),
        ),
        FFRoute(
          name: DetallesTransaccionRetirocdatWidget.routeName,
          path: DetallesTransaccionRetirocdatWidget.routePath,
          builder: (context, params) => DetallesTransaccionRetirocdatWidget(
            status: params.getParam(
              'status',
              ParamType.String,
            ),
            idTransaccion: params.getParam(
              'idTransaccion',
              ParamType.String,
            ),
            apellidosynombres: params.getParam(
              'apellidosynombres',
              ParamType.String,
            ),
            monto: params.getParam(
              'monto',
              ParamType.double,
            ),
            fecha: params.getParam(
              'fecha',
              ParamType.DateTime,
            ),
            typetransaction: params.getParam(
              'typetransaction',
              ParamType.String,
            ),
            detalles: params.getParam(
              'detalles',
              ParamType.String,
            ),
            fecharetiro: params.getParam(
              'fecharetiro',
              ParamType.DateTime,
            ),
            banco: params.getParam(
              'banco',
              ParamType.String,
            ),
            numerobanco: params.getParam(
              'numerobanco',
              ParamType.String,
            ),
            tipocuentabanco: params.getParam(
              'tipocuentabanco',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: RegistroempresasWidget.routeName,
          path: RegistroempresasWidget.routePath,
          builder: (context, params) => RegistroempresasWidget(),
        ),
        FFRoute(
          name: HomeNew2Widget.routeName,
          path: HomeNew2Widget.routePath,
          builder: (context, params) => HomeNew2Widget(),
        ),
        FFRoute(
          name: CierredeSesionWidget.routeName,
          path: CierredeSesionWidget.routePath,
          builder: (context, params) => CierredeSesionWidget(),
        ),
        FFRoute(
          name: AHORROSPage1CopyWidget.routeName,
          path: AHORROSPage1CopyWidget.routePath,
          builder: (context, params) => AHORROSPage1CopyWidget(),
        ),
        FFRoute(
          name: Home1newWidget.routeName,
          path: Home1newWidget.routePath,
          builder: (context, params) => Home1newWidget(),
        ),
        FFRoute(
          name: HorroCompontent2Widget.routeName,
          path: HorroCompontent2Widget.routePath,
          builder: (context, params) => HorroCompontent2Widget(),
        ),
        FFRoute(
          name: ModalWidget.routeName,
          path: ModalWidget.routePath,
          builder: (context, params) => ModalWidget(
            ahorro: params.getParam(
              'ahorro',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['ahorros'],
            ),
            bank: params.getParam(
              'bank',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['bankAccounts'],
            ),
          ),
        ),
        FFRoute(
          name: VersionWidget.routeName,
          path: VersionWidget.routePath,
          builder: (context, params) => VersionWidget(),
        ),
        FFRoute(
          name: Home2newWidget.routeName,
          path: Home2newWidget.routePath,
          builder: (context, params) => Home2newWidget(),
        ),
        FFRoute(
          name: Home3newWidget.routeName,
          path: Home3newWidget.routePath,
          builder: (context, params) => Home3newWidget(),
        ),
        FFRoute(
          name: AhorroMainPageCopyWidget.routeName,
          path: AhorroMainPageCopyWidget.routePath,
          asyncParams: {
            'ahoro': getDoc(['ahorros'], AhorrosRecord.fromSnapshot),
          },
          builder: (context, params) => AhorroMainPageCopyWidget(
            ahoro: params.getParam(
              'ahoro',
              ParamType.Document,
            ),
            list: params.getParam(
              'list',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: AhorroTransactionsCopy2Widget.routeName,
          path: AhorroTransactionsCopy2Widget.routePath,
          asyncParams: {
            'ahorroDoc': getDoc(['ahorros'], AhorrosRecord.fromSnapshot),
          },
          builder: (context, params) => AhorroTransactionsCopy2Widget(
            ahorroDoc: params.getParam(
              'ahorroDoc',
              ParamType.Document,
            ),
            list: params.getParam(
              'list',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: DetallesTransaccionCopyWidget.routeName,
          path: DetallesTransaccionCopyWidget.routePath,
          builder: (context, params) => DetallesTransaccionCopyWidget(
            status: params.getParam(
              'status',
              ParamType.String,
            ),
            idTransaccion: params.getParam(
              'idTransaccion',
              ParamType.String,
            ),
            apellidosynombres: params.getParam(
              'apellidosynombres',
              ParamType.String,
            ),
            monto: params.getParam(
              'monto',
              ParamType.double,
            ),
            banco: params.getParam(
              'banco',
              ParamType.String,
            ),
            fecha: params.getParam(
              'fecha',
              ParamType.DateTime,
            ),
            whitInfo: params.getParam(
              'whitInfo',
              ParamType.DataStruct,
              isList: false,
              structBuilder: WithdrawalInfoStruct.fromSerializableMap,
            ),
            typetransaction: params.getParam(
              'typetransaction',
              ParamType.String,
            ),
            detalles: params.getParam(
              'detalles',
              ParamType.String,
            ),
            isNovedad: params.getParam(
              'isNovedad',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: DetallesTransaccionRetiroCopyWidget.routeName,
          path: DetallesTransaccionRetiroCopyWidget.routePath,
          builder: (context, params) => DetallesTransaccionRetiroCopyWidget(
            status: params.getParam(
              'status',
              ParamType.String,
            ),
            idTransaccion: params.getParam(
              'idTransaccion',
              ParamType.String,
            ),
            apellidosynombres: params.getParam(
              'apellidosynombres',
              ParamType.String,
            ),
            monto: params.getParam(
              'monto',
              ParamType.double,
            ),
            fecha: params.getParam(
              'fecha',
              ParamType.DateTime,
            ),
            whitInfo: params.getParam(
              'whitInfo',
              ParamType.DataStruct,
              isList: false,
              structBuilder: WithdrawalInfoStruct.fromSerializableMap,
            ),
            typetransaction: params.getParam(
              'typetransaction',
              ParamType.String,
            ),
            detalles: params.getParam(
              'detalles',
              ParamType.String,
            ),
            fecharetiro: params.getParam(
              'fecharetiro',
              ParamType.DateTime,
            ),
            iscadat: params.getParam(
              'iscadat',
              ParamType.bool,
            ),
            list: params.getParam(
              'list',
              ParamType.int,
            ),
            isNovedad: params.getParam(
              'isNovedad',
              ParamType.bool,
            ),
            messaje: params.getParam(
              'messaje',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: Aperturaahorro1Widget.routeName,
          path: Aperturaahorro1Widget.routePath,
          builder: (context, params) => Aperturaahorro1Widget(),
        ),
        FFRoute(
          name: Aperturaahorro2Widget.routeName,
          path: Aperturaahorro2Widget.routePath,
          builder: (context, params) => Aperturaahorro2Widget(),
        ),
        FFRoute(
          name: MensajeExitoWidget.routeName,
          path: MensajeExitoWidget.routePath,
          builder: (context, params) => MensajeExitoWidget(),
        ),
        FFRoute(
          name: Depositoahorro2Widget.routeName,
          path: Depositoahorro2Widget.routePath,
          asyncParams: {
            'ahorro': getDoc(['ahorros'], AhorrosRecord.fromSnapshot),
          },
          builder: (context, params) => Depositoahorro2Widget(
            ahorro: params.getParam(
              'ahorro',
              ParamType.Document,
            ),
            list: params.getParam(
              'list',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: Retiro2Widget.routeName,
          path: Retiro2Widget.routePath,
          builder: (context, params) => Retiro2Widget(
            productRef: params.getParam(
              'productRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['ahorros'],
            ),
            numero: params.getParam(
              'numero',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: Retiro2newWidget.routeName,
          path: Retiro2newWidget.routePath,
          builder: (context, params) => Retiro2newWidget(),
        ),
        FFRoute(
          name: EliminacuentadebancoWidget.routeName,
          path: EliminacuentadebancoWidget.routePath,
          builder: (context, params) => EliminacuentadebancoWidget(
            bank: params.getParam(
              'bank',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['bankAccounts'],
            ),
          ),
        ),
        FFRoute(
          name: RetirosbankWidget.routeName,
          path: RetirosbankWidget.routePath,
          builder: (context, params) => RetirosbankWidget(),
        ),
        FFRoute(
          name: Retiro4Widget.routeName,
          path: Retiro4Widget.routePath,
          builder: (context, params) => Retiro4Widget(
            productRef: params.getParam(
              'productRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['ahorros'],
            ),
            banco: params.getParam(
              'banco',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['bankAccounts'],
            ),
            lista: params.getParam(
              'lista',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: ModalCopyWidget.routeName,
          path: ModalCopyWidget.routePath,
          builder: (context, params) => ModalCopyWidget(),
        ),
        FFRoute(
          name: Retiro2newCopyWidget.routeName,
          path: Retiro2newCopyWidget.routePath,
          asyncParams: {
            'ahorro': getDoc(['ahorros'], AhorrosRecord.fromSnapshot),
          },
          builder: (context, params) => Retiro2newCopyWidget(
            ahorro: params.getParam(
              'ahorro',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: Retiro2newCopyCopyWidget.routeName,
          path: Retiro2newCopyCopyWidget.routePath,
          builder: (context, params) => Retiro2newCopyCopyWidget(),
        ),
        FFRoute(
          name: MensajedeconfirmacionWidget.routeName,
          path: MensajedeconfirmacionWidget.routePath,
          builder: (context, params) => MensajedeconfirmacionWidget(),
        ),
        FFRoute(
          name: ModalCopyCopyWidget.routeName,
          path: ModalCopyCopyWidget.routePath,
          builder: (context, params) => ModalCopyCopyWidget(
            ahorro: params.getParam(
              'ahorro',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['ahorros'],
            ),
            bank: params.getParam(
              'bank',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['bankAccounts'],
            ),
          ),
        ),
        FFRoute(
          name: ModalCopyCopy2Widget.routeName,
          path: ModalCopyCopy2Widget.routePath,
          builder: (context, params) => ModalCopyCopy2Widget(),
        ),
        FFRoute(
          name: HomeInversionesWidget.routeName,
          path: HomeInversionesWidget.routePath,
          builder: (context, params) => HomeInversionesWidget(),
        ),
        FFRoute(
          name: MisinversionesWidget.routeName,
          path: MisinversionesWidget.routePath,
          asyncParams: {
            'cdat': getDoc(['Cdats'], CdatsRecord.fromSnapshot),
            'pendienteretiro': getDoc(['Cdats', 'confirmacionretiros'],
                ConfirmacionretirosRecord.fromSnapshot),
          },
          builder: (context, params) => MisinversionesWidget(
            cdat: params.getParam(
              'cdat',
              ParamType.Document,
            ),
            pendienteretiro: params.getParam(
              'pendienteretiro',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: SimuladorCdatStandaloneWidget.routeName,
          path: SimuladorCdatStandaloneWidget.routePath,
          builder: (context, params) => SimuladorCdatStandaloneWidget(),
        ),
        FFRoute(
          name: VERMAScdatWidget.routeName,
          path: VERMAScdatWidget.routePath,
          asyncParams: {
            'cdat': getDoc(['Cdats'], CdatsRecord.fromSnapshot),
            'retirocdats': getDoc(['Cdats', 'confirmacionretiros'],
                ConfirmacionretirosRecord.fromSnapshot),
          },
          builder: (context, params) => VERMAScdatWidget(
            cdat: params.getParam(
              'cdat',
              ParamType.Document,
            ),
            retirocdats: params.getParam(
              'retirocdats',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AHORROScdat2CopyCopyWidget.routeName,
          path: AHORROScdat2CopyCopyWidget.routePath,
          asyncParams: {
            'cdat': getDoc(['Cdats'], CdatsRecord.fromSnapshot),
            'pendienteretiro': getDoc(['Cdats', 'confirmacionretiros'],
                ConfirmacionretirosRecord.fromSnapshot),
          },
          builder: (context, params) => AHORROScdat2CopyCopyWidget(
            cdat: params.getParam(
              'cdat',
              ParamType.Document,
            ),
            pendienteretiro: params.getParam(
              'pendienteretiro',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: REGISTRO4CopyWidget.routeName,
          path: REGISTRO4CopyWidget.routePath,
          builder: (context, params) => REGISTRO4CopyWidget(
            code: params.getParam(
              'code',
              ParamType.String,
            ),
            email: params.getParam(
              'email',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: CdatretiroCopyWidget.routeName,
          path: CdatretiroCopyWidget.routePath,
          asyncParams: {
            'cdatr': getDoc(['Cdats'], CdatsRecord.fromSnapshot),
          },
          builder: (context, params) => CdatretiroCopyWidget(
            cdatr: params.getParam(
              'cdatr',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: RETIRO2CopyWidget.routeName,
          path: RETIRO2CopyWidget.routePath,
          asyncParams: {
            'cdat': getDoc(['Cdats'], CdatsRecord.fromSnapshot),
          },
          builder: (context, params) => RETIRO2CopyWidget(
            cdat: params.getParam(
              'cdat',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: RetirosbankCopyWidget.routeName,
          path: RetirosbankCopyWidget.routePath,
          builder: (context, params) => RetirosbankCopyWidget(),
        ),
        FFRoute(
          name: Retiro4CopyWidget.routeName,
          path: Retiro4CopyWidget.routePath,
          asyncParams: {
            'productRef': getDoc(['Cdats'], CdatsRecord.fromSnapshot),
          },
          builder: (context, params) => Retiro4CopyWidget(
            productRef: params.getParam(
              'productRef',
              ParamType.Document,
            ),
            banco: params.getParam(
              'banco',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['bankAccounts'],
            ),
          ),
        ),
        FFRoute(
          name: AhorroWithdrawalOTPCopyWidget.routeName,
          path: AhorroWithdrawalOTPCopyWidget.routePath,
          asyncParams: {
            'cdat': getDoc(['Cdats'], CdatsRecord.fromSnapshot),
            'retiro': getDoc(['Cdats'], CdatsRecord.fromSnapshot),
          },
          builder: (context, params) => AhorroWithdrawalOTPCopyWidget(
            cdat: params.getParam(
              'cdat',
              ParamType.Document,
            ),
            otp: params.getParam(
              'otp',
              ParamType.int,
            ),
            bank: params.getParam(
              'bank',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['bankAccounts'],
            ),
            retiro: params.getParam(
              'retiro',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ModalCopyCopy3Widget.routeName,
          path: ModalCopyCopy3Widget.routePath,
          builder: (context, params) => ModalCopyCopy3Widget(),
        ),
        FFRoute(
          name: ModalCopyCopyCopyWidget.routeName,
          path: ModalCopyCopyCopyWidget.routePath,
          asyncParams: {
            'cdat': getDoc(['Cdats'], CdatsRecord.fromSnapshot),
          },
          builder: (context, params) => ModalCopyCopyCopyWidget(
            cdat: params.getParam(
              'cdat',
              ParamType.Document,
            ),
            bank: params.getParam(
              'bank',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['bankAccounts'],
            ),
          ),
        ),
        FFRoute(
          name: ModalCopy2Widget.routeName,
          path: ModalCopy2Widget.routePath,
          asyncParams: {
            'cdat': getDoc(['Cdats'], CdatsRecord.fromSnapshot),
          },
          builder: (context, params) => ModalCopy2Widget(
            cdat: params.getParam(
              'cdat',
              ParamType.Document,
            ),
            bank: params.getParam(
              'bank',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['bankAccounts'],
            ),
          ),
        ),
        FFRoute(
          name: RETIRO2Copy2Widget.routeName,
          path: RETIRO2Copy2Widget.routePath,
          builder: (context, params) => RETIRO2Copy2Widget(),
        ),
        FFRoute(
          name: AHORROScdat2CopyCopyCopyWidget.routeName,
          path: AHORROScdat2CopyCopyCopyWidget.routePath,
          builder: (context, params) => AHORROScdat2CopyCopyCopyWidget(
            cdatahorro: params.getParam<RetiroscdatStruct>(
              'cdatahorro',
              ParamType.DataStruct,
              isList: true,
              structBuilder: RetiroscdatStruct.fromSerializableMap,
            ),
            inversion: params.getParam(
              'inversion',
              ParamType.double,
            ),
            tiempo: params.getParam(
              'tiempo',
              ParamType.String,
            ),
            ea: params.getParam(
              'ea',
              ParamType.double,
            ),
            ahorro: params.getParam(
              'ahorro',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['ahorros'],
            ),
            lista: params.getParam(
              'lista',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: AHORROScdat2CopyCopyCopyCopyWidget.routeName,
          path: AHORROScdat2CopyCopyCopyCopyWidget.routePath,
          builder: (context, params) => AHORROScdat2CopyCopyCopyCopyWidget(
            inversion: params.getParam(
              'inversion',
              ParamType.double,
            ),
            tiempo: params.getParam(
              'tiempo',
              ParamType.String,
            ),
            ea: params.getParam(
              'ea',
              ParamType.double,
            ),
            cdatahorro: params.getParam<RetiroscdatStruct>(
              'cdatahorro',
              ParamType.DataStruct,
              isList: true,
              structBuilder: RetiroscdatStruct.fromSerializableMap,
            ),
            ahorro: params.getParam(
              'ahorro',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['ahorros'],
            ),
            lista: params.getParam(
              'lista',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: VersionCopyWidget.routeName,
          path: VersionCopyWidget.routePath,
          builder: (context, params) => VersionCopyWidget(
            inversion: params.getParam(
              'inversion',
              ParamType.double,
            ),
            ahorro: params.getParam(
              'ahorro',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['ahorros'],
            ),
            cdatahorro: params.getParam<RetiroscdatStruct>(
              'cdatahorro',
              ParamType.DataStruct,
              isList: true,
              structBuilder: RetiroscdatStruct.fromSerializableMap,
            ),
            tiempo: params.getParam(
              'tiempo',
              ParamType.String,
            ),
            ea: params.getParam(
              'ea',
              ParamType.double,
            ),
            lista: params.getParam(
              'lista',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: VersionCopy2Widget.routeName,
          path: VersionCopy2Widget.routePath,
          builder: (context, params) => VersionCopy2Widget(
            inversion: params.getParam(
              'inversion',
              ParamType.double,
            ),
            tiempo: params.getParam(
              'tiempo',
              ParamType.String,
            ),
            ea: params.getParam(
              'ea',
              ParamType.double,
            ),
            cdatahorro: params.getParam<RetiroscdatStruct>(
              'cdatahorro',
              ParamType.DataStruct,
              isList: true,
              structBuilder: RetiroscdatStruct.fromSerializableMap,
            ),
            ahorro: params.getParam(
              'ahorro',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['ahorros'],
            ),
            lista: params.getParam(
              'lista',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: VersionCopy3Widget.routeName,
          path: VersionCopy3Widget.routePath,
          builder: (context, params) => VersionCopy3Widget(),
        ),
        FFRoute(
          name: InvertirahorrosWidget.routeName,
          path: InvertirahorrosWidget.routePath,
          asyncParams: {
            'cdat': getDoc(['Cdats'], CdatsRecord.fromSnapshot),
          },
          builder: (context, params) => InvertirahorrosWidget(
            cdat: params.getParam(
              'cdat',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: DetallesTransaccionRetiroCopyCopyWidget.routeName,
          path: DetallesTransaccionRetiroCopyCopyWidget.routePath,
          builder: (context, params) => DetallesTransaccionRetiroCopyCopyWidget(
            status: params.getParam(
              'status',
              ParamType.String,
            ),
            idTransaccion: params.getParam(
              'idTransaccion',
              ParamType.String,
            ),
            apellidosynombres: params.getParam(
              'apellidosynombres',
              ParamType.String,
            ),
            monto: params.getParam(
              'monto',
              ParamType.double,
            ),
            fecha: params.getParam(
              'fecha',
              ParamType.DateTime,
            ),
            typetransaction: params.getParam(
              'typetransaction',
              ParamType.String,
            ),
            detalles: params.getParam(
              'detalles',
              ParamType.String,
            ),
            fecharetiro: params.getParam(
              'fecharetiro',
              ParamType.DateTime,
            ),
            banco: params.getParam(
              'banco',
              ParamType.String,
            ),
            numerobanco: params.getParam(
              'numerobanco',
              ParamType.String,
            ),
            tipocuentabanco: params.getParam(
              'tipocuentabanco',
              ParamType.String,
            ),
            ahorroCdat: params.getParam(
              'ahorroCdat',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: DetallesTransaccionCopyCopyWidget.routeName,
          path: DetallesTransaccionCopyCopyWidget.routePath,
          builder: (context, params) => DetallesTransaccionCopyCopyWidget(
            status: params.getParam(
              'status',
              ParamType.String,
            ),
            idTransaccion: params.getParam(
              'idTransaccion',
              ParamType.String,
            ),
            apellidosynombres: params.getParam(
              'apellidosynombres',
              ParamType.String,
            ),
            monto: params.getParam(
              'monto',
              ParamType.double,
            ),
            banco: params.getParam(
              'banco',
              ParamType.String,
            ),
            fecha: params.getParam(
              'fecha',
              ParamType.DateTime,
            ),
            typetransaction: params.getParam(
              'typetransaction',
              ParamType.String,
            ),
            detalles: params.getParam(
              'detalles',
              ParamType.String,
            ),
            cdats: params.getParam(
              'cdats',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Cdats'],
            ),
            iscdat: params.getParam(
              'iscdat',
              ParamType.bool,
            ),
            tipocuenta: params.getParam(
              'tipocuenta',
              ParamType.String,
            ),
            numerocuenta: params.getParam(
              'numerocuenta',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: InvertirahorrosCopyWidget.routeName,
          path: InvertirahorrosCopyWidget.routePath,
          asyncParams: {
            'cdat': getDoc(['Cdats'], CdatsRecord.fromSnapshot),
          },
          builder: (context, params) => InvertirahorrosCopyWidget(
            cdat: params.getParam(
              'cdat',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ModalCopyCopy4Widget.routeName,
          path: ModalCopyCopy4Widget.routePath,
          builder: (context, params) => ModalCopyCopy4Widget(),
        ),
        FFRoute(
          name: CreditoshomeWidget.routeName,
          path: CreditoshomeWidget.routePath,
          builder: (context, params) => CreditoshomeWidget(),
        ),
        FFRoute(
          name: PruebaSaenzWidget.routeName,
          path: PruebaSaenzWidget.routePath,
          builder: (context, params) => PruebaSaenzWidget(),
        ),
        FFRoute(
          name: AHORROSPage1CopyCopyWidget.routeName,
          path: AHORROSPage1CopyCopyWidget.routePath,
          builder: (context, params) => AHORROSPage1CopyCopyWidget(),
        ),
        FFRoute(
          name: InvertirahorrosCopyCopyWidget.routeName,
          path: InvertirahorrosCopyCopyWidget.routePath,
          builder: (context, params) => InvertirahorrosCopyCopyWidget(),
        ),
        FFRoute(
          name: BienvenidacreditoWidget.routeName,
          path: BienvenidacreditoWidget.routePath,
          builder: (context, params) => BienvenidacreditoWidget(),
        ),
        FFRoute(
          name: TipodepersonacreditoWidget.routeName,
          path: TipodepersonacreditoWidget.routePath,
          builder: (context, params) => TipodepersonacreditoWidget(),
        ),
        FFRoute(
          name: Solicitarcrdito1Widget.routeName,
          path: Solicitarcrdito1Widget.routePath,
          builder: (context, params) => Solicitarcrdito1Widget(),
        ),
        FFRoute(
          name: Solicitarcrdito2Widget.routeName,
          path: Solicitarcrdito2Widget.routePath,
          builder: (context, params) => Solicitarcrdito2Widget(
            estadoCivil: params.getParam(
              'estadoCivil',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: Solicitarcrdito3Widget.routeName,
          path: Solicitarcrdito3Widget.routePath,
          builder: (context, params) => Solicitarcrdito3Widget(
            personasDependientes: params.getParam(
              'personasDependientes',
              ParamType.String,
            ),
            adultosAcargo: params.getParam(
              'adultosAcargo',
              ParamType.String,
            ),
            estadoCivil: params.getParam(
              'estadoCivil',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: Solicitarcrdito4Widget.routeName,
          path: Solicitarcrdito4Widget.routePath,
          builder: (context, params) => Solicitarcrdito4Widget(
            estadoCivil: params.getParam(
              'estadoCivil',
              ParamType.String,
            ),
            personasDependientes: params.getParam(
              'personasDependientes',
              ParamType.String,
            ),
            adultosAcargo: params.getParam(
              'adultosAcargo',
              ParamType.String,
            ),
            residencia: params.getParam(
              'residencia',
              ParamType.String,
            ),
            tiempoResidiendo: params.getParam(
              'tiempoResidiendo',
              ParamType.String,
            ),
            tipoVivienda: params.getParam(
              'tipoVivienda',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: Solicitarcrdito5Widget.routeName,
          path: Solicitarcrdito5Widget.routePath,
          builder: (context, params) => Solicitarcrdito5Widget(
            estadoCivil: params.getParam(
              'estadoCivil',
              ParamType.String,
            ),
            personasDependientes: params.getParam(
              'personasDependientes',
              ParamType.String,
            ),
            adultosAcargo: params.getParam(
              'adultosAcargo',
              ParamType.String,
            ),
            residencia: params.getParam(
              'residencia',
              ParamType.String,
            ),
            tiempoResidiendo: params.getParam(
              'tiempoResidiendo',
              ParamType.String,
            ),
            tipoVivienda: params.getParam(
              'tipoVivienda',
              ParamType.String,
            ),
            empleadorNombre: params.getParam(
              'empleadorNombre',
              ParamType.String,
            ),
            tiempoEmpleo: params.getParam(
              'tiempoEmpleo',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: Solicitarcrdito6Widget.routeName,
          path: Solicitarcrdito6Widget.routePath,
          builder: (context, params) => Solicitarcrdito6Widget(
            estadoCivil: params.getParam(
              'estadoCivil',
              ParamType.String,
            ),
            personasDependientes: params.getParam(
              'personasDependientes',
              ParamType.String,
            ),
            adultosAcargo: params.getParam(
              'adultosAcargo',
              ParamType.String,
            ),
            residencia: params.getParam(
              'residencia',
              ParamType.String,
            ),
            tiempoResidiendo: params.getParam(
              'tiempoResidiendo',
              ParamType.String,
            ),
            tipoVivienda: params.getParam(
              'tipoVivienda',
              ParamType.String,
            ),
            empleadorNombre: params.getParam(
              'empleadorNombre',
              ParamType.String,
            ),
            tiempoEmpleo: params.getParam(
              'tiempoEmpleo',
              ParamType.String,
            ),
            ingresoMensual: params.getParam(
              'ingresoMensual',
              ParamType.int,
            ),
            tipodeContrato: params.getParam(
              'tipodeContrato',
              ParamType.String,
            ),
            interrupcionesLab: params.getParam(
              'interrupcionesLab',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: Solicitarcrdito7Widget.routeName,
          path: Solicitarcrdito7Widget.routePath,
          builder: (context, params) => Solicitarcrdito7Widget(
            estadoCivil: params.getParam(
              'estadoCivil',
              ParamType.String,
            ),
            personasDependientes: params.getParam(
              'personasDependientes',
              ParamType.String,
            ),
            adultosAcargo: params.getParam(
              'adultosAcargo',
              ParamType.String,
            ),
            residencia: params.getParam(
              'residencia',
              ParamType.String,
            ),
            tiempoResidiendo: params.getParam(
              'tiempoResidiendo',
              ParamType.String,
            ),
            tipoVivienda: params.getParam(
              'tipoVivienda',
              ParamType.String,
            ),
            empresaNombre: params.getParam(
              'empresaNombre',
              ParamType.String,
            ),
            tiempoEmpleo: params.getParam(
              'tiempoEmpleo',
              ParamType.String,
            ),
            ingresoPromed: params.getParam(
              'ingresoPromed',
              ParamType.int,
            ),
            tipodeContrato: params.getParam(
              'tipodeContrato',
              ParamType.String,
            ),
            interrupcionesLab: params.getParam(
              'interrupcionesLab',
              ParamType.String,
            ),
            creditosActivos: params.getParam(
              'creditosActivos',
              ParamType.String,
            ),
            cuantoscreditos: params.getParam(
              'cuantoscreditos',
              ParamType.String,
            ),
            gastos: params.getParam(
              'gastos',
              ParamType.int,
            ),
            fuentesingreso: params.getParam(
              'fuentesingreso',
              ParamType.String,
            ),
            promIngresos: params.getParam(
              'promIngresos',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: Solicitarcrdito8Widget.routeName,
          path: Solicitarcrdito8Widget.routePath,
          builder: (context, params) => Solicitarcrdito8Widget(
            estadoCivil: params.getParam(
              'estadoCivil',
              ParamType.String,
            ),
            personasDependientes: params.getParam(
              'personasDependientes',
              ParamType.String,
            ),
            adultosAcargo: params.getParam(
              'adultosAcargo',
              ParamType.String,
            ),
            residencia: params.getParam(
              'residencia',
              ParamType.String,
            ),
            tiempoResidiendo: params.getParam(
              'tiempoResidiendo',
              ParamType.String,
            ),
            tipoVivienda: params.getParam(
              'tipoVivienda',
              ParamType.String,
            ),
            empresaNombre: params.getParam(
              'empresaNombre',
              ParamType.String,
            ),
            tiempoEmpleo: params.getParam(
              'tiempoEmpleo',
              ParamType.String,
            ),
            ingresoPromed: params.getParam(
              'ingresoPromed',
              ParamType.int,
            ),
            tipodeContrato: params.getParam(
              'tipodeContrato',
              ParamType.String,
            ),
            interrupcionesLab: params.getParam(
              'interrupcionesLab',
              ParamType.String,
            ),
            creditosActivos: params.getParam(
              'creditosActivos',
              ParamType.String,
            ),
            cuantoscreditos: params.getParam(
              'cuantoscreditos',
              ParamType.String,
            ),
            gastos: params.getParam(
              'gastos',
              ParamType.int,
            ),
            fuentesingreso: params.getParam(
              'fuentesingreso',
              ParamType.String,
            ),
            promIngresos: params.getParam(
              'promIngresos',
              ParamType.int,
            ),
            pagoOtrasDeudas: params.getParam(
              'pagoOtrasDeudas',
              ParamType.int,
            ),
            gastosFijos: params.getParam(
              'gastosFijos',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: Solicitarcrdito9Widget.routeName,
          path: Solicitarcrdito9Widget.routePath,
          builder: (context, params) => Solicitarcrdito9Widget(
            estadoCivil: params.getParam(
              'estadoCivil',
              ParamType.String,
            ),
            personasDependientes: params.getParam(
              'personasDependientes',
              ParamType.String,
            ),
            adultosAcargo: params.getParam(
              'adultosAcargo',
              ParamType.String,
            ),
            residencia: params.getParam(
              'residencia',
              ParamType.String,
            ),
            tiempoResidiendo: params.getParam(
              'tiempoResidiendo',
              ParamType.String,
            ),
            tipoVivienda: params.getParam(
              'tipoVivienda',
              ParamType.String,
            ),
            empresaNombre: params.getParam(
              'empresaNombre',
              ParamType.String,
            ),
            tiempoEmpleo: params.getParam(
              'tiempoEmpleo',
              ParamType.String,
            ),
            ingresoPromed: params.getParam(
              'ingresoPromed',
              ParamType.int,
            ),
            tipodeContrato: params.getParam(
              'tipodeContrato',
              ParamType.String,
            ),
            interrupcionesLab: params.getParam(
              'interrupcionesLab',
              ParamType.String,
            ),
            creditosActivos: params.getParam(
              'creditosActivos',
              ParamType.String,
            ),
            cuantoscreditos: params.getParam(
              'cuantoscreditos',
              ParamType.String,
            ),
            gastos: params.getParam(
              'gastos',
              ParamType.int,
            ),
            fuentesingreso: params.getParam(
              'fuentesingreso',
              ParamType.String,
            ),
            promIngresos: params.getParam(
              'promIngresos',
              ParamType.int,
            ),
            pagoOtrasDeudas: params.getParam(
              'pagoOtrasDeudas',
              ParamType.int,
            ),
            gastosFijos: params.getParam(
              'gastosFijos',
              ParamType.int,
            ),
            retrasoPagos: params.getParam(
              'retrasoPagos',
              ParamType.String,
            ),
            tarjetasActivas: params.getParam(
              'tarjetasActivas',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: Solicitarcrdito10Widget.routeName,
          path: Solicitarcrdito10Widget.routePath,
          builder: (context, params) => Solicitarcrdito10Widget(
            estadoCivil: params.getParam(
              'estadoCivil',
              ParamType.String,
            ),
            personasDependientes: params.getParam(
              'personasDependientes',
              ParamType.String,
            ),
            adultosAcargo: params.getParam(
              'adultosAcargo',
              ParamType.String,
            ),
            residencia: params.getParam(
              'residencia',
              ParamType.String,
            ),
            tiempoResidiendo: params.getParam(
              'tiempoResidiendo',
              ParamType.String,
            ),
            tipoVivienda: params.getParam(
              'tipoVivienda',
              ParamType.String,
            ),
            empresaNombre: params.getParam(
              'empresaNombre',
              ParamType.String,
            ),
            tiempoEmpleo: params.getParam(
              'tiempoEmpleo',
              ParamType.String,
            ),
            ingresoPromed: params.getParam(
              'ingresoPromed',
              ParamType.int,
            ),
            tipodeContrato: params.getParam(
              'tipodeContrato',
              ParamType.String,
            ),
            interrupcionesLab: params.getParam(
              'interrupcionesLab',
              ParamType.String,
            ),
            creditosActivos: params.getParam(
              'creditosActivos',
              ParamType.String,
            ),
            cuantoscreditos: params.getParam(
              'cuantoscreditos',
              ParamType.String,
            ),
            gastos: params.getParam(
              'gastos',
              ParamType.int,
            ),
            fuentesingreso: params.getParam(
              'fuentesingreso',
              ParamType.String,
            ),
            promIngresos: params.getParam(
              'promIngresos',
              ParamType.int,
            ),
            pagoOtrasDeudas: params.getParam(
              'pagoOtrasDeudas',
              ParamType.int,
            ),
            gastosFijos: params.getParam(
              'gastosFijos',
              ParamType.int,
            ),
            retrasoPagos: params.getParam(
              'retrasoPagos',
              ParamType.String,
            ),
            tarjetasActivas: params.getParam(
              'tarjetasActivas',
              ParamType.String,
            ),
            centralRiesgo: params.getParam(
              'centralRiesgo',
              ParamType.String,
            ),
            inversionActiva: params.getParam(
              'inversionActiva',
              ParamType.String,
            ),
            creditoGota: params.getParam(
              'creditoGota',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: MensajedeconfirmacinWidget.routeName,
          path: MensajedeconfirmacinWidget.routePath,
          builder: (context, params) => MensajedeconfirmacinWidget(),
        ),
        FFRoute(
          name: SOLICITARCRDITO6CopyWidget.routeName,
          path: SOLICITARCRDITO6CopyWidget.routePath,
          builder: (context, params) => SOLICITARCRDITO6CopyWidget(
            estadoCivil: params.getParam(
              'estadoCivil',
              ParamType.String,
            ),
            personasDependientes: params.getParam(
              'personasDependientes',
              ParamType.String,
            ),
            adultosAcargo: params.getParam(
              'adultosAcargo',
              ParamType.String,
            ),
            residencia: params.getParam(
              'residencia',
              ParamType.String,
            ),
            tiempoResidiendo: params.getParam(
              'tiempoResidiendo',
              ParamType.String,
            ),
            tipoVivienda: params.getParam(
              'tipoVivienda',
              ParamType.String,
            ),
            empresaNombre: params.getParam(
              'empresaNombre',
              ParamType.String,
            ),
            tiempoEmpleo: params.getParam(
              'tiempoEmpleo',
              ParamType.String,
            ),
            ingresoPromed: params.getParam(
              'ingresoPromed',
              ParamType.int,
            ),
            tipodeContrato: params.getParam(
              'tipodeContrato',
              ParamType.String,
            ),
            interrupcionesLab: params.getParam(
              'interrupcionesLab',
              ParamType.String,
            ),
            creditosActivos: params.getParam(
              'creditosActivos',
              ParamType.String,
            ),
            cuantoscreditos: params.getParam(
              'cuantoscreditos',
              ParamType.String,
            ),
            gastos: params.getParam(
              'gastos',
              ParamType.int,
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver, sessionActivityNavigatorObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/onboardingAppMovil';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final builtPage = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final page = AdaptivePageShell(
            routeName: name,
            child: builtPage,
          );
          final child = appStateNotifier.loading
              ? Container(
                  color: Color(0xFF0B35B8),
                  child: Center(
                    child: Image.asset(
                      'assets/images/Frame_1261153445.png',
                      width: 150.0,
                      height: 150.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  name: state.name,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(
                  key: state.pageKey, name: state.name, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.fade,
        duration: Duration(milliseconds: 0),
      );
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
