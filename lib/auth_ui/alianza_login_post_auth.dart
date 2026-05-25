import '/app/newaperturacdat/newaperturacdat_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/auth/firebase_auth/email_auth.dart';
import '/auth/firebase_auth/firebase_user_provider.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '/app/app_registro/login_pagenew/login_pagenew_model.dart';

enum AlianzaSignInResult {
  success,
  invalidEmail,
  notRegistered,
  wrongCredentials,
  temporarilyLocked,
  failed,
}

/// Login sin SnackBar (errores inline en la UI propuesta).
Future<AlianzaSignInResult> alianzaAttemptEmailSignIn(
  BuildContext context,
  LoginPagenewModel model,
) async {
  final email = model.correoTextController!.text.trim();
  final pin = model.pinCodeController!.text;

  if (email.isEmpty || !RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email)) {
    return AlianzaSignInResult.invalidEmail;
  }
  if (pin.length != 6) {
    return AlianzaSignInResult.wrongCredentials;
  }

  if (model.formKey.currentState == null ||
      !model.formKey.currentState!.validate()) {
    return AlianzaSignInResult.failed;
  }

  GoRouter.of(context).prepareAuthEvent();

  try {
    final userCredential = await emailSignInFunc(email, pin);
    if (userCredential?.user != null) {
      await maybeCreateUser(userCredential!.user!);
    }
    if (userCredential == null) {
      return AlianzaSignInResult.wrongCredentials;
    }
    final _ = AlianzaFirebaseUser.fromUserCredential(userCredential);
    if (!loggedIn) {
      return AlianzaSignInResult.wrongCredentials;
    }
    return AlianzaSignInResult.success;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'invalid-email') {
      return AlianzaSignInResult.invalidEmail;
    }
    if (e.code == 'user-not-found') {
      return AlianzaSignInResult.notRegistered;
    }
    return AlianzaSignInResult.wrongCredentials;
  }
}

/// Navegación y estado tras login exitoso (misma lógica que `login_pagenew`).
Future<bool> alianzaCompleteLoginAfterAuth(
  BuildContext context,
  LoginPagenewModel model,
) async {
  if (!loggedIn) {
    return false;
  }

  FFAppState().UserName = currentUserDisplayName;
  FFAppState().UID = currentUserUid;
  FFAppState().CC = valueOrDefault(currentUserDocument?.nit, '');
  FFAppState().UserEmail = currentUserEmail;
  FFAppState().basarNumber =
      valueOrDefault(currentUserDocument?.direccion, '');
  FFAppState().desherNam = valueOrDefault(currentUserDocument?.pais, '');
  FFAppState().jonmoDin =
      currentUserDocument!.fechaNacimiento!.toString();
  FFAppState().kiRokomDoc =
      valueOrDefault(currentUserDocument?.tipoDocumento, '');
  FFAppState().koithakedocDece =
      currentUserDocument!.fechaExpedicion!.toString();
  FFAppState().amrNumber =
      valueOrDefault(currentUserDocument?.telefono1, '');
  FFAppState().UserCludad =
      valueOrDefault(currentUserDocument?.ciudad, '');
  FFAppState().isSavingAccountHave = valueOrDefault<bool>(
    currentUserDocument?.isHaveSavingAccount,
    false,
  );

  model.correoTextController?.clear();

  await Future.delayed(const Duration(milliseconds: 1));

  model.cuenta = await queryAhorrosRecordCount(
    queryBuilder: (ahorrosRecord) => ahorrosRecord
        .where('user', isEqualTo: currentUserReference)
        .where('AhorrosDocPdf1', isNotEqualTo: ''),
  );

  if (valueOrDefault(currentUserDocument?.verificationPDF, '') == '') {
    if (context.mounted) {
      context.pushNamedAuth(
        RegistroVinculacionWidget.routeName,
        context.mounted,
        extra: <String, dynamic>{
          '__transition_info__': const TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.rightToLeft,
            duration: Duration(milliseconds: 300),
          ),
        },
      );
    }
    return true;
  }

  if (model.cuenta! >= 1) {
    model.numerocdats = await queryCdatsRecordCount(
      queryBuilder: (cdatsRecord) => cdatsRecord.where(
        'Idusuario',
        isEqualTo: currentUserReference,
      ),
    );
    if (!context.mounted) {
      return true;
    }
    final openedCdatFlow = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          elevation: 0,
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          alignment: const AlignmentDirectional(0.0, 0.0)
              .resolve(Directionality.of(context)),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(dialogContext).unfocus();
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: const NewaperturacdatWidget(),
          ),
        );
      },
    );

    if (openedCdatFlow != true && context.mounted) {
      context.goNamedAuth(
        AHORROSPage1CopyCopyWidget.routeName,
        context.mounted,
        extra: <String, dynamic>{
          '__transition_info__': const TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.bottomToTop,
            duration: Duration(milliseconds: 300),
          ),
        },
      );
    }
    return true;
  }

  if (context.mounted) {
    context.goNamedAuth(
      Aperturaahorro1Widget.routeName,
      context.mounted,
    );
  }
  return true;
}
