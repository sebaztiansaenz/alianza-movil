import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/sucess_predeterminado/sucess_predeterminado_widget.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'card_model.dart';
export 'card_model.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({super.key});

  static String routeName = 'card';
  static String routePath = '/card';

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  late CardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 56.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.safePop();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ),
                        Text(
                          'Tarjetas',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Satoshi',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 18.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ].divide(SizedBox(width: 8.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                  child: Container(
                    width: 350.0,
                    height: 206.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: Image.asset(
                          'assets/images/Group_(14).png',
                        ).image,
                      ),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(-1.0, 1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 0.0, 16.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => Text(
                            valueOrDefault<String>(
                              currentUserDisplayName,
                              'Nombre de usuario',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Satoshi',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).customColor5,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(14.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 12.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sin Cuota de Manejo',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Text(
                                    'Sin costos ocultos',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ].divide(SizedBox(height: 4.0)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 12.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tarjeta Visa',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Text(
                                    'Paga fácil y rápido y seguro en cualquier lugar',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ].divide(SizedBox(height: 4.0)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 12.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Retira en cajeros automáticos',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Text(
                                    'Cajeros automáticos red VISA ',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ].divide(SizedBox(height: 4.0)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 12.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Disponible solo en Colombia',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Text(
                                    'Solo aplica para personas con documento colombiano',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Satoshi',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ].divide(SizedBox(height: 4.0)),
                              ),
                            ),
                          ].divide(SizedBox(height: 8.0)),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Builder(
                    builder: (context) => Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 36.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          var _shouldSetState = false;
                          _model.solicitanteRef =
                              await querySolicitanteRecordOnce(
                            queryBuilder: (solicitanteRecord) =>
                                solicitanteRecord.where(
                              'usuarioRef',
                              isEqualTo: currentUserReference,
                            ),
                            singleRecord: true,
                          ).then((s) => s.firstOrNull);
                          _shouldSetState = true;
                          if (_model.solicitanteRef != null) {
                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: GestureDetector(
                                    onTap: () {
                                      FocusScope.of(dialogContext).unfocus();
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                    child: SucessPredeterminadoWidget(
                                      text:
                                          'Ya has realizado esta solicitud anteriormente',
                                    ),
                                  ),
                                );
                              },
                            );

                            if (_shouldSetState) safeSetState(() {});
                            return;
                          } else {
                            await SolicitanteRecord.collection
                                .doc()
                                .set(createSolicitanteRecordData(
                                  displayName: currentUserDisplayName,
                                  nombre: valueOrDefault(
                                      currentUserDocument?.nombre, ''),
                                  apellido: valueOrDefault(
                                      currentUserDocument?.apellido, ''),
                                  fecha: getCurrentTimestamp,
                                  empresa: valueOrDefault(
                                      currentUserDocument?.empresa, ''),
                                  usuarioRef: currentUserReference,
                                ));
                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: GestureDetector(
                                    onTap: () {
                                      FocusScope.of(dialogContext).unfocus();
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                    child: SucessPredeterminadoWidget(
                                      text: '¡Solicitud enviada!',
                                    ),
                                  ),
                                );
                              },
                            );

                            if (_shouldSetState) safeSetState(() {});
                            return;
                          }

                          if (_shouldSetState) safeSetState(() {});
                        },
                        text: 'Solicitar',
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 0.05,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).customColor4,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Satoshi',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
