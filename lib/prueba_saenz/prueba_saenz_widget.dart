import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'prueba_saenz_model.dart';
export 'prueba_saenz_model.dart';

/// 14eero
class PruebaSaenzWidget extends StatefulWidget {
  const PruebaSaenzWidget({super.key});

  static String routeName = 'PruebaSaenz';
  static String routePath = '/pruebaSaenz';

  @override
  State<PruebaSaenzWidget> createState() => _PruebaSaenzWidgetState();
}

class _PruebaSaenzWidgetState extends State<PruebaSaenzWidget> {
  late PruebaSaenzModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PruebaSaenzModel());

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
