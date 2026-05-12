import 'dart:convert';
import 'dart:typed_data';
import '../cloud_functions/cloud_functions.dart';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SavingEmailOTPVerifyCall {
  static Future<ApiCallResponse> call({
    String? secret = '',
    String? emailOtp = '',
  }) async {
    final ffApiRequestBody = '''
{
  "secret": "${secret}",
  "emailOtp": "${emailOtp}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SavingEmailOTPVerify',
      apiUrl:
          'https://otp-project-eight.vercel.app/api/email/single-email-otp-verify',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PaymentCall {
  static Future<ApiCallResponse> call({
    int? price,
    String? name = '',
  }) async {
    final ffApiRequestBody = '''
{
  "auth": {
    "login": "310153102941dd49621f2e247ca05d14",
    "tranKey": "NNjZ7tWM8o4e8RLg2ksbUS9HvepB9+FwpsvuJpNzy6A=",
    "nonce": "AAECAwQFBgcICQoLDA0ODw==",
    "seed": "2024-08-08T14:56:15.678820"
  },
  "payment": {
    "reference": "1122334446g55",
    "description": "Test",
    "amount": {
      "currency": "USD",
      "total": 100
    }
  },
  "expiration": "2025-12-30T00:00:00-05:00",
  "returnUrl": "https://dnetix.co/p2p/client",
  "ipAddress": "127.0.0.1",
  "userAgent": "PlacetoPay Sandbox"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'payment',
      apiUrl: 'https://checkout-test.placetopay.com/api/session',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PaymentCopyCall {
  static Future<ApiCallResponse> call({
    int? price,
    String? name = '',
  }) async {
    final ffApiRequestBody = '''
{
  "auth": {
    "login": "310153102941dd49621f2e247ca05d14",
    "tranKey": "NNjZ7tWM8o4e8RLg2ksbUS9HvepB9+FwpsvuJpNzy6A=",
    "nonce": "AAECAwQFBgcICQoLDA0ODw==",
    "seed": "2024-08-08T14:56:15.678820"
  },
  "payment": {
    "reference": "1122334446g55",
    "description": "Test",
    "amount": {
      "currency": "USD",
      "total": 100
    }
  },
  "expiration": "2025-12-30T00:00:00-05:00",
  "returnUrl": "https://dnetix.co/p2p/client",
  "ipAddress": "127.0.0.1",
  "userAgent": "PlacetoPay Sandbox"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'payment Copy',
      apiUrl: 'https://checkout.test.goupagos.com.co/api/session',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TestforAvinashaCall {
  static Future<ApiCallResponse> call({
    int? price = 300,
  }) async {
    final ffApiRequestBody = '''
{
  "price": ${price}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'testforAvinasha',
      apiUrl: 'https://checkout-test.placetopay.com',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TestforAvinashbCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'testforAvinashb',
      apiUrl: 'www.google.com',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SendGridEmailOTPahorroCall {
  static Future<ApiCallResponse> call({
    String? imageURL =
        'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/cd170afb129e857c6a0b92fc5181c0353caed1d4e1871ac7b6de8b6e63b3ff9b959461c7ed37fdff6d1c2d6025152244fe18fa4c6ffbad0e10f5b3122b841791f9614a3c9192a696169548c7b0063a110a9dd53a80d0f649b54003d3bc9956e6b14275a7.webp?alt=media&token=a8875c2f-2ae1-42d9-9419-7088dc5bac54',
    String? name = '',
    String? date = '',
    String? otpCode = '',
    String? email = '',
    String? ahorrosType = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'SendGridEmailOTPahorroCall',
        'variables': {
          'imageURL': imageURL,
          'name': name,
          'date': date,
          'otpCode': otpCode,
          'email': email,
          'ahorrosType': ahorrosType,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class SendGridEmailOTPahorroCopyCall {
  static Future<ApiCallResponse> call({
    String? imageURL =
        'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/cd170afb129e857c6a0b92fc5181c0353caed1d4e1871ac7b6de8b6e63b3ff9b959461c7ed37fdff6d1c2d6025152244fe18fa4c6ffbad0e10f5b3122b841791f9614a3c9192a696169548c7b0063a110a9dd53a80d0f649b54003d3bc9956e6b14275a7.webp?alt=media&token=a8875c2f-2ae1-42d9-9419-7088dc5bac54',
    String? name = '',
    String? date = '',
    String? otpCode = '',
    String? email = '',
    String? ahorrosType = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'SendGridEmailOTPahorroCopyCall',
        'variables': {
          'imageURL': imageURL,
          'name': name,
          'date': date,
          'otpCode': otpCode,
          'email': email,
          'ahorrosType': ahorrosType,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class SendGridEmailOTPCopyCopyCall {
  static Future<ApiCallResponse> call({
    String? imageURL =
        'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/cd170afb129e857c6a0b92fc5181c0353caed1d4e1871ac7b6de8b6e63b3ff9b959461c7ed37fdff6d1c2d6025152244fe18fa4c6ffbad0e10f5b3122b841791f9614a3c9192a696169548c7b0063a110a9dd53a80d0f649b54003d3bc9956e6b14275a7.webp?alt=media&token=a8875c2f-2ae1-42d9-9419-7088dc5bac54',
    String? name = '',
    String? date = '',
    String? otpCode = '',
    String? email = '',
    String? ahorrosType = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'SendGridEmailOTPCopyCopyCall',
        'variables': {
          'imageURL': imageURL,
          'name': name,
          'date': date,
          'otpCode': otpCode,
          'email': email,
          'ahorrosType': ahorrosType,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class SendGridEmailOTPCDATCall {
  static Future<ApiCallResponse> call({
    String? imageURL =
        'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/2c6f7b6002e921d88fea7625edb1d76ab1d5946ee2876f9d7329e8a89c35ace1287a70f4e8629e0a806e52e9d0317f070c357651a2011501d29eb29bb84dfcce5f1a003ef66086b450b1d88bb2928e790b73d36d700d0919a8f5f2c0edf9b87ad482a6b8.webp?alt=media&token=9d10cd74-7c9c-4967-a5f1-0aed5564796f',
    String? name = 'Eloka Kene',
    String? date = '',
    String? otpCode = '',
    String? email = '',
    String? cdat = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'SendGridEmailOTPCDATCall',
        'variables': {
          'imageURL': imageURL,
          'name': name,
          'date': date,
          'otpCode': otpCode,
          'email': email,
          'cdat': cdat,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class SendGridEmailOTPcambiodeestadoCall {
  static Future<ApiCallResponse> call({
    String? imageURL =
        'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/2c6f7b6002e921d88fea7625edb1d76ab1d5946ee2876f9d7329e8a89c35ace1287a70f4e8629e0a806e52e9d0317f070c357651a2011501d29eb29bb84dfcce5f1a003ef66086b450b1d88bb2928e790b73d36d700d0919a8f5f2c0edf9b87ad482a6b8.webp?alt=media&token=9d10cd74-7c9c-4967-a5f1-0aed5564796f',
    String? email = '',
    String? companyName = '',
    String? employeeName = '',
    String? docType = '',
    String? docNumber = '',
    int? otpCode,
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'SendGridEmailOTPcambiodeestadoCall',
        'variables': {
          'imageURL': imageURL,
          'email': email,
          'companyName': companyName,
          'employeeName': employeeName,
          'docType': docType,
          'docNumber': docNumber,
          'otpCode': otpCode,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class SendGridEmailNovedadSaldoClienteCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? nombreUsuario = '',
    String? tipoMovimiento = '',
    String? valorTransaccion = '',
    String? idTransaccion = '',
    String? detallesTransaccion = '',
    String? fecha = '',
    String? lineaAhorro = '',
    String? numeroCuenta = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'SendGridEmailNovedadSaldoClienteCall',
        'variables': {
          'email': email,
          'nombreUsuario': nombreUsuario,
          'tipoMovimiento': tipoMovimiento,
          'valorTransaccion': valorTransaccion,
          'idTransaccion': idTransaccion,
          'detallesTransaccion': detallesTransaccion,
          'fecha': fecha,
          'lineaAhorro': lineaAhorro,
          'numeroCuenta': numeroCuenta,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class SendGridEmailNovedadSaldoCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? nombreUsuario = '',
    String? tipoOperacion = '',
    String? valorTransaccion = '',
    String? idTransaccion = '',
    String? nombreCompleto = '',
    String? numeroDocumento = '',
    String? tipoDocumento = '',
    String? lineaAhorro = '',
    String? numeroCuenta = '',
    String? detallesTransaccion = '',
    String? otp = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'SendGridEmailNovedadSaldoCall',
        'variables': {
          'email': email,
          'nombreUsuario': nombreUsuario,
          'tipoOperacion': tipoOperacion,
          'valorTransaccion': valorTransaccion,
          'idTransaccion': idTransaccion,
          'nombreCompleto': nombreCompleto,
          'numeroDocumento': numeroDocumento,
          'tipoDocumento': tipoDocumento,
          'lineaAhorro': lineaAhorro,
          'numeroCuenta': numeroCuenta,
          'detallesTransaccion': detallesTransaccion,
          'otp': otp,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class SendGridEmailExcepciondepagoCall {
  static Future<ApiCallResponse> call({
    String? imageURL =
        'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/2c6f7b6002e921d88fea7625edb1d76ab1d5946ee2876f9d7329e8a89c35ace1287a70f4e8629e0a806e52e9d0317f070c357651a2011501d29eb29bb84dfcce5f1a003ef66086b450b1d88bb2928e790b73d36d700d0919a8f5f2c0edf9b87ad482a6b8.webp?alt=media&token=9d10cd74-7c9c-4967-a5f1-0aed5564796f',
    String? collaboratorName = 'Eloka Kene',
    String? email = '',
    String? documentNumber = '',
    String? collaboratorFullName = '',
    String? documentType = '',
    String? companyName = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'SendGridEmailExcepciondepagoCall',
        'variables': {
          'imageURL': imageURL,
          'collaboratorName': collaboratorName,
          'email': email,
          'documentNumber': documentNumber,
          'collaboratorFullName': collaboratorFullName,
          'documentType': documentType,
          'companyName': companyName,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class SendGridEmaildesvinculacinCall {
  static Future<ApiCallResponse> call({
    String? imageURL =
        'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/2c6f7b6002e921d88fea7625edb1d76ab1d5946ee2876f9d7329e8a89c35ace1287a70f4e8629e0a806e52e9d0317f070c357651a2011501d29eb29bb84dfcce5f1a003ef66086b450b1d88bb2928e790b73d36d700d0919a8f5f2c0edf9b87ad482a6b8.webp?alt=media&token=9d10cd74-7c9c-4967-a5f1-0aed5564796f',
    String? collaboratorName = 'Eloka Kene',
    String? email = '',
    String? documentNumber = '',
    String? collaboratorFullName = '',
    String? documentType = '',
    String? companyName = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'SendGridEmaildesvinculacinCall',
        'variables': {
          'imageURL': imageURL,
          'collaboratorName': collaboratorName,
          'email': email,
          'documentNumber': documentNumber,
          'collaboratorFullName': collaboratorFullName,
          'documentType': documentType,
          'companyName': companyName,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class SendGridEmailSolicitudNuevaEmpresaCall {
  static Future<ApiCallResponse> call({
    String? imageURL =
        'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/2c6f7b6002e921d88fea7625edb1d76ab1d5946ee2876f9d7329e8a89c35ace1287a70f4e8629e0a806e52e9d0317f070c357651a2011501d29eb29bb84dfcce5f1a003ef66086b450b1d88bb2928e790b73d36d700d0919a8f5f2c0edf9b87ad482a6b8.webp?alt=media&token=9d10cd74-7c9c-4967-a5f1-0aed5564796f',
    String? email = '',
    String? collaboratorFullName = '',
    String? companyName = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'SendGridEmailSolicitudNuevaEmpresaCall',
        'variables': {
          'imageURL': imageURL,
          'email': email,
          'collaboratorFullName': collaboratorFullName,
          'companyName': companyName,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class SendGridEmailOTPCopyCall {
  static Future<ApiCallResponse> call({
    String? imageURL =
        'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/2c6f7b6002e921d88fea7625edb1d76ab1d5946ee2876f9d7329e8a89c35ace1287a70f4e8629e0a806e52e9d0317f070c357651a2011501d29eb29bb84dfcce5f1a003ef66086b450b1d88bb2928e790b73d36d700d0919a8f5f2c0edf9b87ad482a6b8.webp?alt=media&token=9d10cd74-7c9c-4967-a5f1-0aed5564796f',
    String? name = '',
    String? date = '',
    String? otpCode = '',
    String? email = '',
    String? ahorrosType = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'SendGridEmailOTPCopyCall',
        'variables': {
          'imageURL': imageURL,
          'name': name,
          'date': date,
          'otpCode': otpCode,
          'email': email,
          'ahorrosType': ahorrosType,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class SendGridEmailResetOTPCall {
  static Future<ApiCallResponse> call({
    String? imageURL =
        'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/51bcfe6ac47fc77967710cc5fae081914d22e59d734a4c5598438fae4ac58da18d407d1d5d094ac44b2c998d461147401a34d94b8e296f4d498c04eb5da562b0e828508f7130f629dfbfeff8530eee906dfb766d839d4424bd31e9156712b859f47aee0f.webp?alt=media&token=a79d42c8-4a9d-4f80-b100-9111f37e007e',
    String? name = 'Eloka Kene',
    String? date = '',
    String? otpCode = '',
    String? email = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'SendGridEmailResetOTPCall',
        'variables': {
          'imageURL': imageURL,
          'name': name,
          'date': date,
          'otpCode': otpCode,
          'email': email,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class SendGridEmailOTPEditNominaCall {
  static Future<ApiCallResponse> call({
    String? imageURL =
        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/o32ggeunioeb/Gemini_Generated_Image_lj3ml6lj3ml6lj3m.png',
    String? name = 'Eloka Kene',
    String? date = '',
    String? otpCode = '',
    String? email = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'SendGridEmailOTPEditNominaCall',
        'variables': {
          'imageURL': imageURL,
          'name': name,
          'date': date,
          'otpCode': otpCode,
          'email': email,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class SendGridAccountConfirmationCall {
  static Future<ApiCallResponse> call({
    String? imageURL =
        'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/Sin-ti%CC%81tulo-2.png?alt=media&token=b89a8a6b-59ca-4b5b-978d-913826013683',
    String? name = 'Eloka Kene',
    String? date = '',
    String? otpCode = '',
    String? email = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'SendGridAccountConfirmationCall',
        'variables': {
          'imageURL': imageURL,
          'name': name,
          'date': date,
          'otpCode': otpCode,
          'email': email,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class SendGridEmailOTPAllModelsCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? html = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'SendGridEmailOTPAllModelsCall',
        'variables': {
          'email': email,
          'html': html,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class InitiateSignatureCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? pdfString = '',
    String? externalId = '',
    String? email = '',
    String? phone = '',
    String? redirectURL = 'alianza://alianza.com/intermissionZapsign',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'InitiateSignatureCall',
        'variables': {
          'name': name,
          'pdfString': pdfString,
          'externalId': externalId,
          'email': email,
          'phone': phone,
          'redirectURL': redirectURL,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static String? errorMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.detail''',
      ));
  static String? signURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.signers[:].sign_url''',
      ));
  static String? documentToken(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
  static String? signersToken(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.signers[:].token''',
      ));
}

class InitiateSignatureCopyCopyCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? pdfString = '',
    String? externalId = '',
    String? email = '',
    String? phone = '',
    String? redirectURL = 'alianza://alianza.com/intermissionZapsign',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'InitiateSignatureCopyCopyCall',
        'variables': {
          'name': name,
          'pdfString': pdfString,
          'externalId': externalId,
          'email': email,
          'phone': phone,
          'redirectURL': redirectURL,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static String? errorMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.detail''',
      ));
  static String? signURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.signers[:].sign_url''',
      ));
  static String? documentToken(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
  static String? signersToken(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.signers[:].token''',
      ));
}

class InitiateSignatureCopyCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? pdfString = '',
    String? externalId = '',
    String? email = '',
    String? phone = '',
    String? redirectURL = 'alianza://alianza.com/intermissionZapsign',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'InitiateSignatureCopyCall',
        'variables': {
          'name': name,
          'pdfString': pdfString,
          'externalId': externalId,
          'email': email,
          'phone': phone,
          'redirectURL': redirectURL,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static String? errorMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.detail''',
      ));
  static String? signURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.signers[:].sign_url''',
      ));
  static String? documentToken(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
  static String? signersToken(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.signers[:].token''',
      ));
}

class CDATFirmaZapsignCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? pdfString = '',
    String? externalId = '',
    String? email = '',
    String? phone = '',
    String? redirectURL = 'alianza://alianza.com/intermissionZapsign',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CDATFirmaZapsignCall',
        'variables': {
          'name': name,
          'pdfString': pdfString,
          'externalId': externalId,
          'email': email,
          'phone': phone,
          'redirectURL': redirectURL,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static String? errorMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.detail''',
      ));
  static String? signURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.signers[:].sign_url''',
      ));
  static String? documentToken(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
  static String? signersToken(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.signers[:].token''',
      ));
}

class InitiateSignatureCopyCopyCopyCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? pdfString = '',
    String? externalId = '',
    String? email = '',
    String? phone = '',
    String? redirectURL = 'alianza://alianza.com/intermissionZapsign',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'InitiateSignatureCopyCopyCopyCall',
        'variables': {
          'name': name,
          'pdfString': pdfString,
          'externalId': externalId,
          'email': email,
          'phone': phone,
          'redirectURL': redirectURL,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static String? errorMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.detail''',
      ));
  static String? signURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.signers[:].sign_url''',
      ));
  static String? documentToken(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
  static String? signersToken(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.signers[:].token''',
      ));
}

class GetDocumentDetailsCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetDocumentDetailsCall',
        'variables': {
          'token': token,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static String? errorMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.detail''',
      ));
  static String? signURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.signers[:].sign_url''',
      ));
  static String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  static dynamic signedFile(dynamic response) => getJsonField(
        response,
        r'''$.signed_file''',
      );
  static List? secondDocument(dynamic response) => getJsonField(
        response,
        r'''$.extra_docs[:].signed_file''',
        true,
      ) as List?;
}

class PlaceSignatureInVerificationPDFCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? signerToken = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'PlaceSignatureInVerificationPDFCall',
        'variables': {
          'token': token,
          'signerToken': signerToken,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static String? errorMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.detail''',
      ));
  static String? signURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.signers[:].sign_url''',
      ));
  static String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  static dynamic signedFile(dynamic response) => getJsonField(
        response,
        r'''$.signed_file''',
      );
  static List? secondDocument(dynamic response) => getJsonField(
        response,
        r'''$.extra_docs[:].signed_file''',
        true,
      ) as List?;
}

class PlaceSignatureInNominaPDFCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? signerToken = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'PlaceSignatureInNominaPDFCall',
        'variables': {
          'token': token,
          'signerToken': signerToken,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static String? errorMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.detail''',
      ));
  static String? signURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.signers[:].sign_url''',
      ));
  static String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  static dynamic signedFile(dynamic response) => getJsonField(
        response,
        r'''$.signed_file''',
      );
  static List? secondDocument(dynamic response) => getJsonField(
        response,
        r'''$.extra_docs[:].signed_file''',
        true,
      ) as List?;
}

class PlaceSignatureInCDATCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? signerToken = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'PlaceSignatureInCDATCall',
        'variables': {
          'token': token,
          'signerToken': signerToken,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static String? errorMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.detail''',
      ));
  static String? signURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.signers[:].sign_url''',
      ));
  static String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  static dynamic signedFile(dynamic response) => getJsonField(
        response,
        r'''$.signed_file''',
      );
  static List? secondDocument(dynamic response) => getJsonField(
        response,
        r'''$.extra_docs[:].signed_file''',
        true,
      ) as List?;
}

class PlaceSignatureInNominaPDFNuevaCopyCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? signerToken = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'PlaceSignatureInNominaPDFNuevaCopyCall',
        'variables': {
          'token': token,
          'signerToken': signerToken,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static String? errorMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.detail''',
      ));
  static String? signURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.signers[:].sign_url''',
      ));
  static String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  static dynamic signedFile(dynamic response) => getJsonField(
        response,
        r'''$.signed_file''',
      );
  static List? secondDocument(dynamic response) => getJsonField(
        response,
        r'''$.extra_docs[:].signed_file''',
        true,
      ) as List?;
}

class PlaceSignatureInNominaPDFCopyCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? signerToken = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'PlaceSignatureInNominaPDFCopyCall',
        'variables': {
          'token': token,
          'signerToken': signerToken,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static String? errorMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.detail''',
      ));
  static String? signURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.signers[:].sign_url''',
      ));
  static String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  static dynamic signedFile(dynamic response) => getJsonField(
        response,
        r'''$.signed_file''',
      );
  static List? secondDocument(dynamic response) => getJsonField(
        response,
        r'''$.extra_docs[:].signed_file''',
        true,
      ) as List?;
}

class PlaceSignatureInAhorroPDFsCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? signerToken = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'PlaceSignatureInAhorroPDFsCall',
        'variables': {
          'token': token,
          'signerToken': signerToken,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static String? errorMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.detail''',
      ));
  static String? signURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.signers[:].sign_url''',
      ));
  static String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  static dynamic signedFile(dynamic response) => getJsonField(
        response,
        r'''$.signed_file''',
      );
  static List? secondDocument(dynamic response) => getJsonField(
        response,
        r'''$.extra_docs[:].signed_file''',
        true,
      ) as List?;
}

class ZapsignWebhookTestCall {
  static Future<ApiCallResponse> call() async {
    final ffApiRequestBody = '''
{
  "event_type": "doc_signed",
  "sandbox": false,
  "external_id": "Ve12cHj0fsPfnSE2PfkbFmHsbDq2",
  "open_id": 23,
  "token": "cce11abf-abcd-abcd-a657-25b55f185f16",
  "name": "verification.pdf",
  "folder_path": "/",
  "status": "signed",
  "lang": "pt-br",
  "original_file": "https://zapsign.s3.amazonaws.com/asddasdasdasads08e1-48f5-8972-7b4e476dec9d/c11c4f25-79c7-4eea-8dcf-5434996a4251.pdf",
  "signed_file": "https://sandbox.app.zapsign.com.br/verificar/3ae1b3ef-769b-4fcf-9c38-36fd352218bc",
  "created_through": "web",
  "deleted": false,
  "deleted_at": null,
  "signed_file_only_finished": false,
  "disable_signer_emails": false,
  "brand_logo": "",
  "brand_primary_color": "",
  "created_at": "2021-06-07T19:21:59.609067Z",
  "last_update_at": "2021-06-07T19:22:21.838310Z",
  "signers": [
    {
      "external_id": "",
      "token": "b14f141f-abcd-abcd-8dfa-0bdac0ec806a",
      "status": "signed",
      "name": "Fulano Silva",
      "lock_name": false,
      "email": "ola@zapsign.com.br",
      "lock_email": false,
      "phone_country": "55",
      "phone_number": "1155551111",
      "lock_phone": false,
      "times_viewed": 1,
      "last_view_at": "2021-06-07T19:22:12.875967Z",
      "signed_at": "2021-06-07T19:22:19.956056Z",
      "auth_mode": "assinaturaTela",
      "qualification": "",
      "require_selfie_photo": false,
      "require_document_photo": false,
      "geo_latitude": "-23.559298",
      "geo_longitude": "-46.683343",
      "resend_attempts": {
        "whatsapp": 0,
        "email": 0,
        "sms": 0
      },
      "cpf": "99999999999",
      "cnpj": "99999999999"
    }
  ],
  "answers": [
    {
      "variable": "NOME COMPLETO",
      "value": "Nome Teste"
    },
    {
      "variable": "NÚMERO DO CPF",
      "value": "99999999999"
    },
    {
      "variable": "ENDEREÇO COMPLETO",
      "value": "Endereço teste"
    }
  ],
  "signer_who_signed": {
    "external_id": "",
    "token": "b14f141f-abcd-abcd-8dfa-0bdac0ec806a",
    "status": "signed",
    "name": "Fulano Silva",
    "lock_name": false,
    "email": "ola@zapsign.com.br",
    "lock_email": false,
    "phone_country": "55",
    "phone_number": "1155551111",
    "lock_phone": false,
    "times_viewed": 1,
    "last_view_at": "2021-06-07T19:22:12.875967Z",
    "signed_at": "2021-06-07T19:22:19.956056Z",
    "auth_mode": "assinaturaTela",
    "qualification": "",
    "require_selfie_photo": false,
    "require_document_photo": false,
    "geo_latitude": "-23.559298",
    "geo_longitude": "-46.683343",
    "liveness_photo_url": ""
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Zapsign Webhook test',
      apiUrl:
          'https://europe-central2-alianza-b7y88v.cloudfunctions.net/zapsignWebhook',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ChangePasswordCall {
  static Future<ApiCallResponse> call({
    String? oobCode = '',
    String? newPassword = '',
    String? apiKey = 'AIzaSyAMzpp5ZoPmU7M26I6k_A0zSX7B8-tleOA',
  }) async {
    final ffApiRequestBody = '''
{
  "oobCode": "${oobCode}",
  "newPassword": "${newPassword}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Change Password',
      apiUrl:
          'https://identitytoolkit.googleapis.com/v1/accounts:resetPassword?key=${apiKey}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? errorMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.error.message''',
      ));
}

class TusdatosTestCall {
  static Future<ApiCallResponse> call() async {
    final ffApiRequestBody = '''
{
  "doc": 111,
  "typedoc": "CC",
  "fechaE": "01/12/2014"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Tusdatos Test',
      apiUrl: 'https://docs.tusdatos.co/api/launch',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Basic dGVzdHM6cGFzc3dvcmQ=',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? errorMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.detail''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
