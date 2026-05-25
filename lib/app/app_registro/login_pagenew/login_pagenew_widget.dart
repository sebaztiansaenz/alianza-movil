import '/auth_ui/alianza_login_proposal_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'login_pagenew_model.dart';
export 'login_pagenew_model.dart';

class LoginPagenewWidget extends StatefulWidget {
  const LoginPagenewWidget({super.key});

  static String routeName = 'LoginPagenew';
  static String routePath = '/loginPagenew';

  @override
  State<LoginPagenewWidget> createState() => _LoginPagenewWidgetState();
}

class _LoginPagenewWidgetState extends State<LoginPagenewWidget> {
  late LoginPagenewModel _model;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginPagenewModel());

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.versionactual = await actions.getVersion1();
    });

    _model.correoTextController ??= TextEditingController();
    _model.correoFocusNode ??= FocusNode();
    _model.correoFocusNode!.addListener(() => safeSetState(() {}));
    _model.pinCodeFocusNode ??= FocusNode();

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
      child: AlianzaLoginProposalWidget(model: _model),
    );
  }
}
