import '/auth_ui/alianza_onboarding_proposal_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'onboarding_app_movil_model.dart';
export 'onboarding_app_movil_model.dart';

class OnboardingAppMovilWidget extends StatefulWidget {
  const OnboardingAppMovilWidget({super.key});

  static String routeName = 'OnboardingAppMovil';
  static String routePath = '/onboardingAppMovil';

  @override
  State<OnboardingAppMovilWidget> createState() =>
      _OnboardingAppMovilWidgetState();
}

class _OnboardingAppMovilWidgetState extends State<OnboardingAppMovilWidget> {
  late OnboardingAppMovilModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingAppMovilModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const AlianzaOnboardingProposalWidget();
  }
}
