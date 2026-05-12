import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'version_copy_model.dart';
export 'version_copy_model.dart';

class VersionCopyWidget extends StatefulWidget {
  const VersionCopyWidget({
    super.key,
    required this.inversion,
    required this.ahorro,
    required this.cdatahorro,
    required this.tiempo,
    required this.ea,
    required this.lista,
  });

  final double? inversion;
  final DocumentReference? ahorro;
  final List<RetiroscdatStruct>? cdatahorro;
  final String? tiempo;
  final double? ea;
  final int? lista;

  static String routeName = 'versionCopy';
  static String routePath = '/versionCopy';

  @override
  State<VersionCopyWidget> createState() => _VersionCopyWidgetState();
}

class _VersionCopyWidgetState extends State<VersionCopyWidget> {
  late VersionCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VersionCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          await Future.delayed(
            Duration(
              milliseconds: 10000,
            ),
          );
        }),
        Future(() async {
          _model.ahorro = await AhorrosRecord.getDocumentOnce(widget!.ahorro!);

          await TransactionsRecord.collection
              .doc()
              .set(createTransactionsRecordData(
                amount: widget!.inversion,
                currency: 'COP',
                status: 'APPROVED',
                firebaseDate: getCurrentTimestamp,
                transactionType: 'Withdrawal',
                withdrawalInfo: createWithdrawalInfoStruct(
                  bankName: 'Alianza Capital',
                  accountType: _model.ahorro?.savingsType,
                  accountNumber: valueOrDefault<String>(
                    '${valueOrDefault(currentUserDocument?.nit, '')}-0${valueOrDefault<String>(
                      widget!.lista?.toString(),
                      '0',
                    )}',
                    '0',
                  ),
                  clearUnsetFields: false,
                  create: true,
                ),
                ahorrosId: _model.ahorro?.reference.id,
                userRef: currentUserReference,
                userName: currentUserDisplayName,
                amountFromTotal: widget!.inversion,
                lastUpdated: getCurrentTimestamp,
                amountFromSavings: 0.0,
                ahorrosRef: _model.ahorro?.reference,
                empresaId: currentUserDocument?.empresaref?.id,
                subPayment: true,
                authorization:
                    random_data.randomInteger(7000000, 7999999).toString(),
                userIdNumber: valueOrDefault(currentUserDocument?.id, ''),
                userEmail: currentUserEmail,
                userPhone: currentPhoneNumber,
                savingtipe: _model.ahorro?.savingsType,
                isAhorroCdat: true,
              ));

          await _model.ahorro!.reference.update({
            ...mapToFirestore(
              {
                'montoTotal': FieldValue.increment(-(widget!.inversion!)),
              },
            ),
          });
          _model.codigosCa = await queryCodigosRecordOnce(
            singleRecord: true,
          ).then((s) => s.firstOrNull);

          var cdatsRecordReference = CdatsRecord.collection.doc();
          await cdatsRecordReference.set({
            ...createCdatsRecordData(
              idusuario: currentUserReference,
              idadmin: currentUserReference,
              inversion: valueOrDefault<double>(
                widget!.inversion,
                0.0,
              ),
              ea: valueOrDefault<double>(
                widget!.ea,
                0.0,
              ),
              tiempo: valueOrDefault<int>(
                widget!.tiempo == '6' ? 6 : 12,
                6,
              ),
              rendimiento: valueOrDefault<double>(
                widget!.tiempo == '6 meses'
                    ? valueOrDefault<double>(
                        (((widget!.inversion!) / 100) *
                            (((widget!.ea!) / 12) * 6)),
                        0.0,
                      )
                    : valueOrDefault<double>(
                        (((widget!.inversion!) / 100) *
                            (((widget!.ea!) / 12) * 12)),
                        0.0,
                      ),
                0.0,
              ),
              retefuenteMonto: valueOrDefault<double>(
                widget!.tiempo == '6 meses'
                    ? valueOrDefault<double>(
                        (((widget!.inversion!) / 100) *
                                (((widget!.ea!) / 12) * 6)) *
                            0.04,
                        0.0,
                      )
                    : valueOrDefault<double>(
                        (((widget!.inversion!) / 100) *
                                (((widget!.ea!) / 12) * 12)) *
                            0.04,
                        0.0,
                      ),
                0.0,
              ),
              retefuenteporcentaje: 0.04,
              ganancias: valueOrDefault<double>(
                widget!.tiempo == '6 meses'
                    ? valueOrDefault<double>(
                        valueOrDefault<double>(
                              (((widget!.inversion!) / 100) *
                                  (((widget!.ea!) / 12) * 6)),
                              0.0,
                            ) -
                            valueOrDefault<double>(
                              (((widget!.inversion!) / 100) *
                                      (((widget!.ea!) / 12) * 6)) *
                                  0.07,
                              0.0,
                            ),
                        0.0,
                      )
                    : valueOrDefault<double>(
                        valueOrDefault<double>(
                              (((widget!.inversion!) / 100) *
                                  (((widget!.ea!) / 12) * 12)),
                              0.0,
                            ) -
                            valueOrDefault<double>(
                              (((widget!.inversion!) / 100) *
                                      (((widget!.ea!) / 12) * 12)) *
                                  0.07,
                              0.0,
                            ),
                        0.0,
                      ),
                0.0,
              ),
              fechaApertura: getCurrentTimestamp,
              fechaFinalizacion: functions.sumarmesess(
                  getCurrentTimestamp, widget!.tiempo == '6 meses' ? 6 : 12),
              estado: 'Pendiente de firma',
              tipooperacion: 'Apertura CDAT',
              origenrecursos: valueOrDefault<String>(
                '${_model.ahorro?.savingsType} ${valueOrDefault(currentUserDocument?.nit, '')}-${valueOrDefault<String>(
                  widget!.lista?.toString(),
                  '-',
                )}',
                '-',
              ),
              observaciones: valueOrDefault<String>(
                'Proviene de cuenta de ahorro',
                '-',
              ),
              firmado: false,
              nombreusuario: valueOrDefault<String>(
                currentUserDisplayName,
                '-',
              ),
              documentousuario: valueOrDefault<String>(
                valueOrDefault(currentUserDocument?.nit, ''),
                '-',
              ),
              userEmail: valueOrDefault<String>(
                currentUserEmail,
                '-',
              ),
              idCdat: valueOrDefault<int>(
                _model.codigosCa?.codigocdat,
                0,
              ),
              isAhorroCdat: true,
            ),
            ...mapToFirestore(
              {
                'fechacreacion': FieldValue.serverTimestamp(),
              },
            ),
          });
          _model.readcdat2 = CdatsRecord.getDocumentFromData({
            ...createCdatsRecordData(
              idusuario: currentUserReference,
              idadmin: currentUserReference,
              inversion: valueOrDefault<double>(
                widget!.inversion,
                0.0,
              ),
              ea: valueOrDefault<double>(
                widget!.ea,
                0.0,
              ),
              tiempo: valueOrDefault<int>(
                widget!.tiempo == '6' ? 6 : 12,
                6,
              ),
              rendimiento: valueOrDefault<double>(
                widget!.tiempo == '6 meses'
                    ? valueOrDefault<double>(
                        (((widget!.inversion!) / 100) *
                            (((widget!.ea!) / 12) * 6)),
                        0.0,
                      )
                    : valueOrDefault<double>(
                        (((widget!.inversion!) / 100) *
                            (((widget!.ea!) / 12) * 12)),
                        0.0,
                      ),
                0.0,
              ),
              retefuenteMonto: valueOrDefault<double>(
                widget!.tiempo == '6 meses'
                    ? valueOrDefault<double>(
                        (((widget!.inversion!) / 100) *
                                (((widget!.ea!) / 12) * 6)) *
                            0.04,
                        0.0,
                      )
                    : valueOrDefault<double>(
                        (((widget!.inversion!) / 100) *
                                (((widget!.ea!) / 12) * 12)) *
                            0.04,
                        0.0,
                      ),
                0.0,
              ),
              retefuenteporcentaje: 0.04,
              ganancias: valueOrDefault<double>(
                widget!.tiempo == '6 meses'
                    ? valueOrDefault<double>(
                        valueOrDefault<double>(
                              (((widget!.inversion!) / 100) *
                                  (((widget!.ea!) / 12) * 6)),
                              0.0,
                            ) -
                            valueOrDefault<double>(
                              (((widget!.inversion!) / 100) *
                                      (((widget!.ea!) / 12) * 6)) *
                                  0.07,
                              0.0,
                            ),
                        0.0,
                      )
                    : valueOrDefault<double>(
                        valueOrDefault<double>(
                              (((widget!.inversion!) / 100) *
                                  (((widget!.ea!) / 12) * 12)),
                              0.0,
                            ) -
                            valueOrDefault<double>(
                              (((widget!.inversion!) / 100) *
                                      (((widget!.ea!) / 12) * 12)) *
                                  0.07,
                              0.0,
                            ),
                        0.0,
                      ),
                0.0,
              ),
              fechaApertura: getCurrentTimestamp,
              fechaFinalizacion: functions.sumarmesess(
                  getCurrentTimestamp, widget!.tiempo == '6 meses' ? 6 : 12),
              estado: 'Pendiente de firma',
              tipooperacion: 'Apertura CDAT',
              origenrecursos: valueOrDefault<String>(
                '${_model.ahorro?.savingsType} ${valueOrDefault(currentUserDocument?.nit, '')}-${valueOrDefault<String>(
                  widget!.lista?.toString(),
                  '-',
                )}',
                '-',
              ),
              observaciones: valueOrDefault<String>(
                'Proviene de cuenta de ahorro',
                '-',
              ),
              firmado: false,
              nombreusuario: valueOrDefault<String>(
                currentUserDisplayName,
                '-',
              ),
              documentousuario: valueOrDefault<String>(
                valueOrDefault(currentUserDocument?.nit, ''),
                '-',
              ),
              userEmail: valueOrDefault<String>(
                currentUserEmail,
                '-',
              ),
              idCdat: valueOrDefault<int>(
                _model.codigosCa?.codigocdat,
                0,
              ),
              isAhorroCdat: true,
            ),
            ...mapToFirestore(
              {
                'fechacreacion': DateTime.now(),
              },
            ),
          }, cdatsRecordReference);
          for (int loop1Index = 0;
              loop1Index < widget!.cdatahorro!.length;
              loop1Index++) {
            final currentLoop1Item = widget!.cdatahorro![loop1Index];

            await RetirosCdatRecord.createDoc(_model.readcdat2!.reference)
                .set(createRetirosCdatRecordData(
              monto: valueOrDefault<double>(
                currentLoop1Item.monto,
                0.0,
              ),
              fecharetiro: currentLoop1Item.fecharetiro,
              estado: 'Sin cobrar',
            ));
          }

          await ConfirmacionretirosRecord.createDoc(_model.readcdat2!.reference)
              .set(createConfirmacionretirosRecordData(
            usuariosid: currentUserReference,
            estados: 'completado',
            id: _model.codigosCa?.codigoretiroscdat,
            fecharetiro: getCurrentTimestamp,
            observaciones: 'Transacción completada',
            monto: widget!.inversion,
            tipodeoperacion: 'entrante',
            nombreusuario: FFAppState().UserName,
            fechaSolicitud: getCurrentTimestamp,
            nitusuario: valueOrDefault(currentUserDocument?.nit, ''),
            emailusuario: currentUserEmail,
            celusuario: valueOrDefault(currentUserDocument?.telefono1, ''),
            numbredebanco: 'Alianza Capital',
            isahorrocdat: true,
            tipodecuenta: _model.ahorro?.savingsType,
            cuentanumero:
                '${valueOrDefault(currentUserDocument?.nit, '')}-0${valueOrDefault<String>(
              widget!.lista?.toString(),
              '0',
            )}',
          ));

          await _model.codigosCa!.reference.update({
            ...mapToFirestore(
              {
                'codigocdat': FieldValue.increment(1),
                'codigoretiroscdat': FieldValue.increment(1),
              },
            ),
          });
        }),
        Future(() async {
          FFAppState().lastAction = getCurrentTimestamp;
          safeSetState(() {});
          _model.instantTimer = InstantTimer.periodic(
            duration: Duration(milliseconds: 10000),
            callback: (timer) async {
              if (functions.past5Mins(FFAppState().lastAction!)) {
                GoRouter.of(context).prepareAuthEvent();
                await authManager.signOut();
                GoRouter.of(context).clearRedirectLocation();

                context.goNamedAuth(
                    CierredeSesionWidget.routeName, context.mounted);

                _model.instantTimer?.cancel();
              }
            },
            startImmediately: false,
          );
        }),
      ]);

      context.pushNamedAuth(
        VersionCopy3Widget.routeName,
        context.mounted,
        extra: <String, dynamic>{
          '__transition_info__': TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.rightToLeft,
          ),
        },
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: PopScope(
        canPop: false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 90.0, 20.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.network(
                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/m342uf08ic1z/f89737e8119ca648f47866295738c65ef63977c5.gif',
                        width: 250.0,
                        height: 250.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 80.0, 0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: Image.network(
                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/aqiwrj0xuzvq/bc2de1869bb4671bfab08569b26f4772bebe7011.gif',
                          width: 44.0,
                          height: 44.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: AutoSizeText(
                      'Estamos creando tu nueva \ninversión de',
                      textAlign: TextAlign.center,
                      minFontSize: 16.0,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Satoshi',
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: Text(
                      valueOrDefault<String>(
                        functions.formatAmount(widget!.inversion!),
                        '\$ 0',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Satoshi',
                            fontSize: 32.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
