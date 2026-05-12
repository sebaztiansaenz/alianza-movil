import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'horro_compontent2_model.dart';
export 'horro_compontent2_model.dart';

class HorroCompontent2Widget extends StatefulWidget {
  const HorroCompontent2Widget({super.key});

  static String routeName = 'horro_Compontent2';
  static String routePath = '/horroCompontent2';

  @override
  State<HorroCompontent2Widget> createState() => _HorroCompontent2WidgetState();
}

class _HorroCompontent2WidgetState extends State<HorroCompontent2Widget> {
  late HorroCompontent2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HorroCompontent2Model());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      ),
    );
  }
}
