import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ahorros_withdrawal_modal_cdat_copy_model.dart';
export 'ahorros_withdrawal_modal_cdat_copy_model.dart';

class AhorrosWithdrawalModalCdatCopyWidget extends StatefulWidget {
  const AhorrosWithdrawalModalCdatCopyWidget({
    super.key,
    required this.cdatss,
    required this.bank,
  });

  final CdatsRecord? cdatss;
  final DocumentReference? bank;

  @override
  State<AhorrosWithdrawalModalCdatCopyWidget> createState() =>
      _AhorrosWithdrawalModalCdatCopyWidgetState();
}

class _AhorrosWithdrawalModalCdatCopyWidgetState
    extends State<AhorrosWithdrawalModalCdatCopyWidget> {
  late AhorrosWithdrawalModalCdatCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AhorrosWithdrawalModalCdatCopyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        height: 328.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: Container(
                  width: 32.0,
                  height: 4.0,
                  decoration: BoxDecoration(
                    color: Color(0x80FFFFFF),
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(22.0, 24.0, 22.0, 0.0),
                child: AutoSizeText(
                  'Solicitar código de autorización al correo electrónico',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  minFontSize: 14.0,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Satoshi',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 68.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        valueOrDefault<String>(
                          functions.formatAmount(valueOrDefault<double>(
                            widget!.cdatss?.saldoDisponible,
                            0.0,
                          )),
                          '\$0',
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        minFontSize: 18.0,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Satoshi',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      AutoSizeText(
                        'Monto a retirar',
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        minFontSize: 10.0,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Satoshi',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 36.0, 0.0, 40.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    Navigator.pop(context);
                    _model.otp = random_data.randomInteger(100000, 999999);
                    safeSetState(() {});
                    await SendGridEmailOTPCDATCall.call(
                      imageURL:
                          'https://firebasestorage.googleapis.com/v0/b/alianza-b7y88v.appspot.com/o/2c6f7b6002e921d88fea7625edb1d76ab1d5946ee2876f9d7329e8a89c35ace1287a70f4e8629e0a806e52e9d0317f070c357651a2011501d29eb29bb84dfcce5f1a003ef66086b450b1d88bb2928e790b73d36d700d0919a8f5f2c0edf9b87ad482a6b8.webp?alt=media&token=9d10cd74-7c9c-4967-a5f1-0aed5564796f',
                      name: currentUserDisplayName,
                      date: dateTimeFormat(
                        "d/M/y",
                        getCurrentTimestamp,
                        locale: FFLocalizations.of(context).languageCode,
                      ),
                      otpCode: _model.otp?.toString(),
                      email: currentUserEmail,
                      cdat: 'CDAT',
                    );

                    context.pushNamed(
                      AhorroWithdrawalOTPCopyWidget.routeName,
                      queryParameters: {
                        'cdat': serializeParam(
                          widget!.cdatss,
                          ParamType.Document,
                        ),
                        'otp': serializeParam(
                          _model.otp,
                          ParamType.int,
                        ),
                        'bank': serializeParam(
                          widget!.bank,
                          ParamType.DocumentReference,
                        ),
                        'retiro': serializeParam(
                          widget!.cdatss,
                          ParamType.Document,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        'cdat': widget!.cdatss,
                        'retiro': widget!.cdatss,
                        '__transition_info__': TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.rightToLeft,
                        ),
                      },
                    );
                  },
                  text: 'Enviar código',
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 48.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).customColor4,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Satoshi',
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
