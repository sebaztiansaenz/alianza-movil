import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'creditoshome_model.dart';
export 'creditoshome_model.dart';

class CreditoshomeWidget extends StatefulWidget {
  const CreditoshomeWidget({super.key});

  static String routeName = 'creditoshome';
  static String routePath = '/creditoshome';

  @override
  State<CreditoshomeWidget> createState() => _CreditoshomeWidgetState();
}

class _CreditoshomeWidgetState extends State<CreditoshomeWidget> {
  late CreditoshomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreditoshomeModel());

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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [],
        ),
      ),
    );
  }
}
