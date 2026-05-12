import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mensajeconfirmacion_model.dart';
export 'mensajeconfirmacion_model.dart';

class MensajeconfirmacionWidget extends StatefulWidget {
  const MensajeconfirmacionWidget({super.key});

  @override
  State<MensajeconfirmacionWidget> createState() =>
      _MensajeconfirmacionWidgetState();
}

class _MensajeconfirmacionWidgetState extends State<MensajeconfirmacionWidget> {
  late MensajeconfirmacionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MensajeconfirmacionModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(
        Duration(
          milliseconds: 3000,
        ),
      );
      Navigator.pop(context);
    });

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
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alianza-b7y88v/assets/zg6iqulgy0os/Group.png',
                width: 72.0,
                height: 72.0,
                fit: BoxFit.cover,
              ),
              Text(
                'Código exitoso',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Satoshi',
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ].divide(SizedBox(height: 24.0)),
          ),
        ),
      ),
    );
  }
}
