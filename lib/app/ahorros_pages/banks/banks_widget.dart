import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'banks_model.dart';
export 'banks_model.dart';

class BanksWidget extends StatefulWidget {
  const BanksWidget({super.key});

  @override
  State<BanksWidget> createState() => _BanksWidgetState();
}

class _BanksWidgetState extends State<BanksWidget> {
  late BanksModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BanksModel());

    _model.searchTextController ??= TextEditingController();
    _model.searchFocusNode ??= FocusNode();
    _model.searchFocusNode!.addListener(
      () async {
        safeSetState(() {});
      },
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
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
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0),
                  ),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (_model.simpleSearchResults.length == 0)
                              Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 140.0, 0.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final allBanks =
                                          containerBanksRecordList.toList();

                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: allBanks.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 4.0),
                                        itemBuilder: (context, allBanksIndex) {
                                          final allBanksItem =
                                              allBanks[allBanksIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.option =
                                                  allBanksItem.bankName;
                                              safeSetState(() {});
                                              FFAppState().bankName =
                                                  allBanksItem.bankName;
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor5,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Flexible(
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 24.0,
                                                            height: 24.0,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child:
                                                                Image.network(
                                                              allBanksItem
                                                                  .bankLogo,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Flexible(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Flexible(
                                                                  child:
                                                                      AutoSizeText(
                                                                    allBanksItem
                                                                        .bankName,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Satoshi',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          lineHeight:
                                                                              1.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 2.0)),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 12.0)),
                                                      ),
                                                    ),
                                                    if (_model.option ==
                                                        allBanksItem.bankName)
                                                      Icon(
                                                        Icons
                                                            .radio_button_checked,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        size: 24.0,
                                                      ),
                                                    if (_model.option !=
                                                        allBanksItem.bankName)
                                                      Icon(
                                                        Icons.radio_button_off,
                                                        color:
                                                            Color(0x8157636C),
                                                        size: 24.0,
                                                      ),
                                                  ].divide(
                                                      SizedBox(width: 20.0)),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            if (_model.simpleSearchResults.length > 0)
                              Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 140.0, 0.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final allBanks =
                                          _model.simpleSearchResults.toList();

                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: allBanks.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 4.0),
                                        itemBuilder: (context, allBanksIndex) {
                                          final allBanksItem =
                                              allBanks[allBanksIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.option =
                                                  allBanksItem.bankName;
                                              safeSetState(() {});
                                              FFAppState().bankName =
                                                  allBanksItem.bankName;
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor5,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Flexible(
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 24.0,
                                                            height: 24.0,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child:
                                                                Image.network(
                                                              allBanksItem
                                                                  .bankLogo,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Flexible(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Flexible(
                                                                  child:
                                                                      AutoSizeText(
                                                                    allBanksItem
                                                                        .bankName,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Satoshi',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          lineHeight:
                                                                              1.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 2.0)),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 12.0)),
                                                      ),
                                                    ),
                                                    if (_model.option ==
                                                        allBanksItem.bankName)
                                                      Icon(
                                                        Icons
                                                            .radio_button_checked,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        size: 24.0,
                                                      ),
                                                    if (_model.option !=
                                                        allBanksItem.bankName)
                                                      Icon(
                                                        Icons.radio_button_off,
                                                        color:
                                                            Color(0x8157636C),
                                                        size: 24.0,
                                                      ),
                                                  ].divide(
                                                      SizedBox(width: 20.0)),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Container(
                        height: 140.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: Stack(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 20.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderRadius: 8.0,
                                        buttonSize: 40.0,
                                        icon: Icon(
                                          Icons.close_sharp,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 20.0,
                                        ),
                                        onPressed: () async {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      width: 32.0,
                                      height: 4.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x7F262632),
                                        borderRadius:
                                            BorderRadius.circular(2.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.searchTextController,
                                      focusNode: _model.searchFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.searchTextController',
                                        Duration(milliseconds: 2000),
                                        () async {
                                          safeSetState(() {
                                            _model.simpleSearchResults =
                                                TextSearch(
                                              containerBanksRecordList
                                                  .map(
                                                    (record) => TextSearchItem
                                                        .fromTerms(record,
                                                            [record.bankName!]),
                                                  )
                                                  .toList(),
                                            )
                                                    .search(_model
                                                        .searchTextController
                                                        .text)
                                                    .map((r) => r.object)
                                                    .toList();
                                            ;
                                          });

                                          safeSetState(() {});
                                        },
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: false,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                        hintText: 'Busca el nombre del banco',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Satoshi',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .customColor5,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                46.0, 0.0, 0.0, 0.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Satoshi',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                      validator: _model
                                          .searchTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        14.0, 20.0, 0.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/Framesearch.png',
                                        width: 24.0,
                                        height: 24.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
