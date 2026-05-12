import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'banks_copy_model.dart';
export 'banks_copy_model.dart';

class BanksCopyWidget extends StatefulWidget {
  const BanksCopyWidget({super.key});

  @override
  State<BanksCopyWidget> createState() => _BanksCopyWidgetState();
}

class _BanksCopyWidgetState extends State<BanksCopyWidget> {
  late BanksCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BanksCopyModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.textController?.text = 'Busca el nombre del banco';
        }));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: StreamBuilder<List<BanksRecord>>(
        stream: queryBanksRecord(
          queryBuilder: (banksRecord) => banksRecord.orderBy('order'),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            );
          }
          List<BanksRecord> containerBanksRecordList = snapshot.data!;

          return Container(
            width: double.infinity,
            height: 780.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                    child: Container(
                      width: 32.0,
                      height: 4.0,
                      decoration: BoxDecoration(
                        color: Color(0x80FFFFFF),
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                    ),
                  ),
                  Stack(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    children: [
                      Align(
                        alignment: AlignmentDirectional(1.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderRadius: 8.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.close_sharp,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 20.0,
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: 32.0,
                          height: 4.0,
                          decoration: BoxDecoration(
                            color: Color(0x7F262632),
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: 48.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: Color(0xFFEEF1FA),
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(14.0, 12.0, 14.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.search,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          Expanded(
                            child: Container(
                              width: 200.0,
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController',
                                  Duration(milliseconds: 2000),
                                  () async {
                                    safeSetState(() {
                                      _model.simpleSearchResults = TextSearch(
                                        containerBanksRecordList
                                            .map(
                                              (record) =>
                                                  TextSearchItem.fromTerms(
                                                      record,
                                                      [record.bankName!]),
                                            )
                                            .toList(),
                                      )
                                          .search(_model.textController.text)
                                          .map((r) => r.object)
                                          .toList();
                                      ;
                                    });
                                  },
                                ),
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Satoshi',
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'TextField',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Satoshi',
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Satoshi',
                                      letterSpacing: 0.0,
                                    ),
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 28.0, 0.0, 0.0),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.option = 'BANCOLOMBIA';
                            safeSetState(() {});
                            FFAppState().bankName = 'BANCOLOMBIA';
                            FFAppState().update(() {});
                            await Future.delayed(
                              Duration(
                                milliseconds: 1000,
                              ),
                            );
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: double.infinity,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: Color(0x10262632),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 24.0,
                                          height: 24.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/image123.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Flexible(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AutoSizeText(
                                                'BANCOLOMBIA',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          lineHeight: 1.0,
                                                        ),
                                              ),
                                            ].divide(SizedBox(height: 2.0)),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                  ),
                                  if (_model.option == 'BANCOLOMBIA')
                                    Icon(
                                      Icons.radio_button_checked,
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      size: 24.0,
                                    ),
                                  if (_model.option != 'BANCOLOMBIA')
                                    Icon(
                                      Icons.radio_button_off,
                                      color: Color(0x8157636C),
                                      size: 24.0,
                                    ),
                                ].divide(SizedBox(width: 20.0)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.option = 'BANCO DAVIVIENDA';
                            safeSetState(() {});
                            FFAppState().bankName = 'BANCO DAVIVIENDA';
                            FFAppState().update(() {});
                            await Future.delayed(
                              Duration(
                                milliseconds: 1000,
                              ),
                            );
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: double.infinity,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: Color(0x10262632),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 24.0,
                                          height: 24.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/BANCO_DAVIVIENDA.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Flexible(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AutoSizeText(
                                                'BANCO DAVIVIENDA',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          lineHeight: 1.0,
                                                        ),
                                              ),
                                            ].divide(SizedBox(height: 2.0)),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                  ),
                                  if (_model.option == 'BANCO DAVIVIENDA')
                                    Icon(
                                      Icons.radio_button_checked,
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      size: 24.0,
                                    ),
                                  if (_model.option != 'BANCO DAVIVIENDA')
                                    Icon(
                                      Icons.radio_button_off,
                                      color: Color(0x8157636C),
                                      size: 24.0,
                                    ),
                                ].divide(SizedBox(width: 20.0)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.option = 'NEQUI';
                            safeSetState(() {});
                            FFAppState().bankName = 'NEQUI';
                            FFAppState().update(() {});
                            await Future.delayed(
                              Duration(
                                milliseconds: 1000,
                              ),
                            );
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: double.infinity,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: Color(0x10262632),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 24.0,
                                          height: 24.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/NEQUI.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Flexible(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AutoSizeText(
                                                'NEQUI',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          lineHeight: 1.0,
                                                        ),
                                              ),
                                            ].divide(SizedBox(height: 2.0)),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                  ),
                                  if (_model.option == 'NEQUI')
                                    Icon(
                                      Icons.radio_button_checked,
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      size: 24.0,
                                    ),
                                  if (_model.option != 'NEQUI')
                                    Icon(
                                      Icons.radio_button_off,
                                      color: Color(0x8157636C),
                                      size: 24.0,
                                    ),
                                ].divide(SizedBox(width: 20.0)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.option = 'DAVIPLATA';
                            safeSetState(() {});
                            FFAppState().bankName = 'DAVIPLATA';
                            FFAppState().update(() {});
                            await Future.delayed(
                              Duration(
                                milliseconds: 1000,
                              ),
                            );
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: double.infinity,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: Color(0x10262632),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 24.0,
                                          height: 24.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/DAVIPLATA.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Flexible(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AutoSizeText(
                                                'DAVIPLATA',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          lineHeight: 1.0,
                                                        ),
                                              ),
                                            ].divide(SizedBox(height: 2.0)),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                  ),
                                  if (_model.option == 'DAVIPLATA')
                                    Icon(
                                      Icons.radio_button_checked,
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      size: 24.0,
                                    ),
                                  if (_model.option != 'DAVIPLATA')
                                    Icon(
                                      Icons.radio_button_off,
                                      color: Color(0x8157636C),
                                      size: 24.0,
                                    ),
                                ].divide(SizedBox(width: 20.0)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.option = 'DALE';
                            safeSetState(() {});
                            FFAppState().bankName = 'DALE';
                            FFAppState().update(() {});
                            await Future.delayed(
                              Duration(
                                milliseconds: 1000,
                              ),
                            );
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: double.infinity,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: Color(0x10262632),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 24.0,
                                          height: 24.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/DALE.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Flexible(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AutoSizeText(
                                                'DALE',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          lineHeight: 1.0,
                                                        ),
                                              ),
                                            ].divide(SizedBox(height: 2.0)),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                  ),
                                  if (_model.option == 'DALE')
                                    Icon(
                                      Icons.radio_button_checked,
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      size: 24.0,
                                    ),
                                  if (_model.option != 'DALE')
                                    Icon(
                                      Icons.radio_button_off,
                                      color: Color(0x8157636C),
                                      size: 24.0,
                                    ),
                                ].divide(SizedBox(width: 20.0)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.option = 'LULO BANK';
                            safeSetState(() {});
                            FFAppState().bankName = 'LULO BANK';
                            FFAppState().update(() {});
                            await Future.delayed(
                              Duration(
                                milliseconds: 1000,
                              ),
                            );
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: double.infinity,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: Color(0x10262632),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 24.0,
                                          height: 24.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/LULO_BANK.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Flexible(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AutoSizeText(
                                                'LULO BANK',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          lineHeight: 1.0,
                                                        ),
                                              ),
                                            ].divide(SizedBox(height: 2.0)),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                  ),
                                  if (_model.option == 'LULO BANK')
                                    Icon(
                                      Icons.radio_button_checked,
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      size: 24.0,
                                    ),
                                  if (_model.option != 'LULO BANK')
                                    Icon(
                                      Icons.radio_button_off,
                                      color: Color(0x8157636C),
                                      size: 24.0,
                                    ),
                                ].divide(SizedBox(width: 20.0)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.option = 'BANCO BBVA COLOMBIA S.A.';
                            safeSetState(() {});
                            FFAppState().bankName = 'BANCO BBVA COLOMBIA S.A.';
                            FFAppState().update(() {});
                            await Future.delayed(
                              Duration(
                                milliseconds: 1000,
                              ),
                            );
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: double.infinity,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: Color(0x10262632),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 24.0,
                                          height: 24.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/BBVA.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Flexible(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AutoSizeText(
                                                'BANCO BBVA COLOMBIA S.A.',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          lineHeight: 1.0,
                                                        ),
                                              ),
                                            ].divide(SizedBox(height: 2.0)),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                  ),
                                  if (_model.option ==
                                      'BANCO BBVA COLOMBIA S.A.')
                                    Icon(
                                      Icons.radio_button_checked,
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      size: 24.0,
                                    ),
                                  if (_model.option !=
                                      'BANCO BBVA COLOMBIA S.A.')
                                    Icon(
                                      Icons.radio_button_off,
                                      color: Color(0x8157636C),
                                      size: 24.0,
                                    ),
                                ].divide(SizedBox(width: 20.0)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.option = 'BANCO DE BOGOTA';
                            safeSetState(() {});
                            FFAppState().bankName = 'BANCO DE BOGOTA';
                            FFAppState().update(() {});
                            await Future.delayed(
                              Duration(
                                milliseconds: 1000,
                              ),
                            );
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: double.infinity,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: Color(0x10262632),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 24.0,
                                          height: 24.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/BANCO.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Flexible(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AutoSizeText(
                                                'BANCO DE BOGOTA',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          lineHeight: 1.0,
                                                        ),
                                              ),
                                            ].divide(SizedBox(height: 2.0)),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                  ),
                                  if (_model.option == 'BANCO DE BOGOTA')
                                    Icon(
                                      Icons.radio_button_checked,
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      size: 24.0,
                                    ),
                                  if (_model.option != 'BANCO DE BOGOTA')
                                    Icon(
                                      Icons.radio_button_off,
                                      color: Color(0x8157636C),
                                      size: 24.0,
                                    ),
                                ].divide(SizedBox(width: 20.0)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.option = 'ALIANZA FIDUCIARIA';
                            safeSetState(() {});
                            FFAppState().bankName = 'ALIANZA FIDUCIARIA';
                            FFAppState().update(() {});
                            await Future.delayed(
                              Duration(
                                milliseconds: 1000,
                              ),
                            );
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: double.infinity,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: Color(0x10262632),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 24.0,
                                          height: 24.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/ALIANZA_FIDUCIARIA.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Flexible(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AutoSizeText(
                                                'ALIANZA FIDUCIARIA',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          lineHeight: 1.0,
                                                        ),
                                              ),
                                            ].divide(SizedBox(height: 2.0)),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                  ),
                                  if (_model.option == 'ALIANZA FIDUCIARIA')
                                    Icon(
                                      Icons.radio_button_checked,
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      size: 24.0,
                                    ),
                                  if (_model.option != 'ALIANZA FIDUCIARIA')
                                    Icon(
                                      Icons.radio_button_off,
                                      color: Color(0x8157636C),
                                      size: 24.0,
                                    ),
                                ].divide(SizedBox(width: 20.0)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.option = 'BANCO COOPERATIVO COOPCENTRAL';
                            safeSetState(() {});
                            FFAppState().bankName =
                                'BANCO COOPERATIVO COOPCENTRAL';
                            FFAppState().update(() {});
                            await Future.delayed(
                              Duration(
                                milliseconds: 1000,
                              ),
                            );
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: double.infinity,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: Color(0x10262632),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 24.0,
                                          height: 24.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/BANCO_COOPERATIVO_COOPCENTRAL.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Flexible(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AutoSizeText(
                                                'BANCO COOPERATIVO COOPCENTRAL',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          lineHeight: 1.0,
                                                        ),
                                              ),
                                            ].divide(SizedBox(height: 2.0)),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                  ),
                                  if (_model.option ==
                                      'BANCO COOPERATIVO COOPCENTRAL')
                                    Icon(
                                      Icons.radio_button_checked,
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      size: 24.0,
                                    ),
                                  if (_model.option !=
                                      'BANCO COOPERATIVO COOPCENTRAL')
                                    Icon(
                                      Icons.radio_button_off,
                                      color: Color(0x8157636C),
                                      size: 24.0,
                                    ),
                                ].divide(SizedBox(width: 20.0)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.option = 'BANCO AV VILLAS';
                            safeSetState(() {});
                            FFAppState().bankName = 'BANCO AV VILLAS';
                            FFAppState().update(() {});
                            await Future.delayed(
                              Duration(
                                milliseconds: 1000,
                              ),
                            );
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: double.infinity,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: Color(0x10262632),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 24.0,
                                          height: 24.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/BANCO_AV_VILLAS.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Flexible(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AutoSizeText(
                                                'BANCO AV VILLAS',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          lineHeight: 1.0,
                                                        ),
                                              ),
                                            ].divide(SizedBox(height: 2.0)),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                  ),
                                  if (_model.option == 'BANCO AV VILLAS')
                                    Icon(
                                      Icons.radio_button_checked,
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      size: 24.0,
                                    ),
                                  if (_model.option != 'BANCO AV VILLAS')
                                    Icon(
                                      Icons.radio_button_off,
                                      color: Color(0x8157636C),
                                      size: 24.0,
                                    ),
                                ].divide(SizedBox(width: 20.0)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.option = 'BANCAMINA S.A';
                            safeSetState(() {});
                            FFAppState().bankName = 'BANCAMINA S.A';
                            FFAppState().update(() {});
                            await Future.delayed(
                              Duration(
                                milliseconds: 1000,
                              ),
                            );
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: double.infinity,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: Color(0x10262632),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 24.0,
                                          height: 24.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/BANCAMINA.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Flexible(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AutoSizeText(
                                                'BANCAMINA S.A',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          lineHeight: 1.0,
                                                        ),
                                              ),
                                            ].divide(SizedBox(height: 2.0)),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                  ),
                                  if (_model.option == 'BANCAMINA S.A')
                                    Icon(
                                      Icons.radio_button_checked,
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      size: 24.0,
                                    ),
                                  if (_model.option != 'BANCAMINA S.A')
                                    Icon(
                                      Icons.radio_button_off,
                                      color: Color(0x8157636C),
                                      size: 24.0,
                                    ),
                                ].divide(SizedBox(width: 20.0)),
                              ),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(height: 4.0)),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
