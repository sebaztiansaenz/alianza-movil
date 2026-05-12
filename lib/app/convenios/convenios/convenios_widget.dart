import '/app/convenios/convenios_bottom_sheet/convenios_bottom_sheet_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'convenios_model.dart';
export 'convenios_model.dart';

class ConveniosWidget extends StatefulWidget {
  const ConveniosWidget({super.key});

  static String routeName = 'Convenios';
  static String routePath = '/convenios';

  @override
  State<ConveniosWidget> createState() => _ConveniosWidgetState();
}

class _ConveniosWidgetState extends State<ConveniosWidget> {
  late ConveniosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConveniosModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 56.0, 20.0, 0.0),
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
                        AutoSizeText(
                          'Convenios ',
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          minFontSize: 14.0,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Satoshi',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ].divide(SizedBox(width: 8.0)),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 25.0, 20.0, 0.0),
                    child: StreamBuilder<List<CarruselconveniosRecord>>(
                      stream: queryCarruselconveniosRecord(
                        queryBuilder: (carruselconveniosRecord) =>
                            carruselconveniosRecord.orderBy('nombre'),
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
                        List<CarruselconveniosRecord>
                            pageViewCarruselconveniosRecordList =
                            snapshot.data!;

                        return Container(
                          width: 350.0,
                          height: 140.0,
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 15.0),
                                child: PageView.builder(
                                  controller: _model.pageViewController ??=
                                      PageController(
                                          initialPage: max(
                                              0,
                                              min(
                                                  0,
                                                  pageViewCarruselconveniosRecordList
                                                          .length -
                                                      1))),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: pageViewCarruselconveniosRecordList
                                      .length,
                                  itemBuilder: (context, pageViewIndex) {
                                    final pageViewCarruselconveniosRecord =
                                        pageViewCarruselconveniosRecordList[
                                            pageViewIndex];
                                    return Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          valueOrDefault<String>(
                                            pageViewCarruselconveniosRecord
                                                .foto,
                                            'https://i.postimg.cc/y8S83y48/menual-removebg-preview-1.png',
                                          ),
                                          width: 350.0,
                                          height: 140.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child:
                                    smooth_page_indicator.SmoothPageIndicator(
                                  controller: _model.pageViewController ??=
                                      PageController(
                                          initialPage: max(
                                              0,
                                              min(
                                                  0,
                                                  pageViewCarruselconveniosRecordList
                                                          .length -
                                                      1))),
                                  count: pageViewCarruselconveniosRecordList
                                      .length,
                                  axisDirection: Axis.horizontal,
                                  onDotClicked: (i) async {
                                    await _model.pageViewController!
                                        .animateToPage(
                                      i,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
                                    safeSetState(() {});
                                  },
                                  effect:
                                      smooth_page_indicator.ExpandingDotsEffect(
                                    expansionFactor: 3.0,
                                    spacing: 8.0,
                                    radius: 16.0,
                                    dotWidth: 8.0,
                                    dotHeight: 8.0,
                                    dotColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    activeDotColor: Color(0xFF002CE9),
                                    paintStyle: PaintingStyle.fill,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 0.0),
                    child: StreamBuilder<List<CategoriasconveniosRecord>>(
                      stream: queryCategoriasconveniosRecord(
                        queryBuilder: (categoriasconveniosRecord) =>
                            categoriasconveniosRecord.orderBy('nombre'),
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
                        List<CategoriasconveniosRecord>
                            gridViewCategoriasconveniosRecordList =
                            snapshot.data!;

                        return GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16.0,
                            mainAxisSpacing: 16.0,
                            childAspectRatio: 1.0,
                          ),
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount:
                              gridViewCategoriasconveniosRecordList.length,
                          itemBuilder: (context, gridViewIndex) {
                            final gridViewCategoriasconveniosRecord =
                                gridViewCategoriasconveniosRecordList[
                                    gridViewIndex];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  useSafeArea: true,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () {
                                        FocusScope.of(context).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: ConveniosBottomSheetWidget(),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              child: Container(
                                width: 167.0,
                                height: 156.0,
                                decoration: BoxDecoration(
                                  color:
                                      FlutterFlowTheme.of(context).customColor5,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    gridViewCategoriasconveniosRecord
                                        .imagenprincipal,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: valueOrDefault<double>(
                MediaQuery.sizeOf(context).width * 1.00,
                393.0,
              ),
              height: valueOrDefault<double>(
                MediaQuery.sizeOf(context).height * 0.948,
                800.0,
              ),
              child: custom_widgets.DraggableFloatingButton(
                width: valueOrDefault<double>(
                  MediaQuery.sizeOf(context).width * 1.00,
                  393.0,
                ),
                height: valueOrDefault<double>(
                  MediaQuery.sizeOf(context).height * 0.948,
                  800.0,
                ),
                onPressed: () async {
                  context.pushNamed(
                    AyudaWidget.routeName,
                    extra: <String, dynamic>{
                      '__transition_info__': TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );
                },
              ),
            ),
            Container(
              width: valueOrDefault<double>(
                MediaQuery.sizeOf(context).width * 1.00,
                393.0,
              ),
              height: valueOrDefault<double>(
                MediaQuery.sizeOf(context).height * 1,
                852.0,
              ),
              child: custom_widgets.FloatingNavBar(
                width: valueOrDefault<double>(
                  MediaQuery.sizeOf(context).width * 1.00,
                  393.0,
                ),
                height: valueOrDefault<double>(
                  MediaQuery.sizeOf(context).height * 1,
                  852.0,
                ),
                onLeftPressed: () async {
                  context.pushNamed(
                    ConveniosWidget.routeName,
                    extra: <String, dynamic>{
                      '__transition_info__': TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );
                },
                onCenterPressed: () async {
                  context.pushNamed(
                    AHORROSPage1CopyCopyWidget.routeName,
                    extra: <String, dynamic>{
                      '__transition_info__': TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );
                },
                onRightPressed: () async {
                  context.pushNamed(
                    Perfil01Widget.routeName,
                    extra: <String, dynamic>{
                      '__transition_info__': TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
