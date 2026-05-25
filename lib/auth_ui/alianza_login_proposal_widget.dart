import 'dart:async';
import 'dart:math' as math;

import '/app/app_registro/login_pagenew/login_pagenew_model.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'alianza_auth_colors.dart';
import 'alianza_login_lockout.dart';
import 'alianza_login_post_auth.dart';
import 'widgets/alianza_auth_fx_background.dart';
import 'widgets/alianza_auth_logo_header.dart';
import 'widgets/alianza_auth_page_layout.dart';
import 'widgets/alianza_auth_shell.dart';

/// Login progresivo (propuesta HTML) con la lógica de auth/navegación existente.
class AlianzaLoginProposalWidget extends StatefulWidget {
  const AlianzaLoginProposalWidget({
    super.key,
    required this.model,
  });

  final LoginPagenewModel model;

  @override
  State<AlianzaLoginProposalWidget> createState() =>
      _AlianzaLoginProposalWidgetState();
}

class _AlianzaLoginProposalWidgetState extends State<AlianzaLoginProposalWidget>
    with SingleTickerProviderStateMixin {
  int _stage = 1;
  bool _emailValid = false;
  bool _showPin = false;
  bool _loading = false;
  bool _showSuccess = false;
  AlianzaSignInResult? _lastError;
  AlianzaLoginLockStatus? _lockStatus;
  Timer? _lockTimer;
  late final AnimationController _shakeController;

  bool get _isLocked => _lockStatus?.isLocked ?? false;

  @override
  void initState() {
    super.initState();
    _shakeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 380),
    );
    widget.model.correoTextController?.addListener(_onEmailChanged);
    _onEmailChanged();
  }

  @override
  void dispose() {
    widget.model.correoTextController?.removeListener(_onEmailChanged);
    _lockTimer?.cancel();
    _shakeController.dispose();
    super.dispose();
  }

  Future<void> _refreshLockStatus() async {
    final email = widget.model.correoTextController?.text.trim() ?? '';
    if (email.isEmpty) {
      if (mounted) setState(() => _lockStatus = null);
      return;
    }
    final status = await AlianzaLoginLockout.check(email);
    if (!mounted) return;
    setState(() => _lockStatus = status);
    if (status.isLocked) {
      _startLockTicker();
    } else {
      _lockTimer?.cancel();
    }
  }

  void _startLockTicker() {
    _lockTimer?.cancel();
    _lockTimer = Timer.periodic(const Duration(seconds: 1), (_) async {
      await _refreshLockStatus();
      if (!mounted) return;
      if (_lockStatus?.isLocked != true &&
          _lastError == AlianzaSignInResult.temporarilyLocked) {
        setState(() => _lastError = null);
      }
    });
  }

  void _onEmailChanged() {
    final t = widget.model.correoTextController?.text ?? '';
    final ok = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(t);
    if (ok != _emailValid) {
      setState(() {
        _emailValid = ok;
        if (ok) {
          _lastError = null;
        }
      });
    }
  }

  void _goToPass() {
    if (!_emailValid) {
      setState(() => _lastError = AlianzaSignInResult.invalidEmail);
      return;
    }
    setState(() {
      _stage = 2;
      _lastError = null;
    });
    _refreshLockStatus();
  }

  void _backToEmail() {
    _lockTimer?.cancel();
    setState(() {
      _stage = 1;
      _lastError = null;
      _lockStatus = null;
    });
  }

  Future<void> _submit() async {
    if (_stage == 1) {
      _goToPass();
      return;
    }

    final email = widget.model.correoTextController!.text.trim();
    await _refreshLockStatus();
    if (!mounted) return;
    if (_isLocked) {
      setState(() => _lastError = AlianzaSignInResult.temporarilyLocked);
      return;
    }

    setState(() {
      _loading = true;
      _lastError = null;
    });

    final result = await alianzaAttemptEmailSignIn(context, widget.model);

    if (!mounted) {
      return;
    }

    if (result == AlianzaSignInResult.success) {
      await AlianzaLoginLockout.clear(email);
      setState(() {
        _loading = false;
        _showSuccess = true;
      });
      await Future.delayed(const Duration(milliseconds: 2000));
      if (mounted) {
        await alianzaCompleteLoginAfterAuth(context, widget.model);
      }
      return;
    }

    if (result == AlianzaSignInResult.wrongCredentials) {
      final status = await AlianzaLoginLockout.recordFailure(email);
      if (!mounted) return;
      setState(() {
        _loading = false;
        _lockStatus = status;
        _lastError = status.isLocked
            ? AlianzaSignInResult.temporarilyLocked
            : AlianzaSignInResult.wrongCredentials;
      });
      if (!status.isLocked) {
        _shakeController.forward(from: 0);
      }
      if (status.isLocked) _startLockTicker();
      return;
    }

    setState(() {
      _loading = false;
      _lastError = result;
      if (result == AlianzaSignInResult.invalidEmail ||
          result == AlianzaSignInResult.notRegistered) {
        _stage = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final name = currentUserDisplayName.isNotEmpty
        ? currentUserDisplayName.split(' ').first
        : 'Usuario';

    final wide = MediaQuery.sizeOf(context).width > 520;

    final pinLocked = _isLocked ||
        _lastError == AlianzaSignInResult.temporarilyLocked;
    final pinError = _lastError == AlianzaSignInResult.wrongCredentials ||
        pinLocked;

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor:
            wide ? const Color(0xFF1C2030) : AlianzaAuthColors.scaffold,
        body: AlianzaAuthShell(
          background: const AlianzaLoginFxBackground(),
          surfaceColor: AlianzaAuthColors.scaffold,
          child: Stack(
            children: [
              SafeArea(
                child: Form(
                  key: widget.model.formKey,
                  child: AlianzaAuthPageLayout(
                    topPadding: 22,
                    headerGap: 26,
                    centerBody: true,
                    header: const Padding(
                      padding: EdgeInsets.only(top: 6),
                      child: AlianzaAuthLogoHeader(),
                    ),
                    body: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 350),
                          switchInCurve: Curves.easeOutCubic,
                          switchOutCurve: Curves.easeInCubic,
                          transitionBuilder: (child, animation) {
                            final offset = Tween<Offset>(
                              begin: const Offset(0, 0.18),
                              end: Offset.zero,
                            ).animate(animation);
                            return FadeTransition(
                              opacity: animation,
                              child: SlideTransition(
                                position: offset,
                                child: child,
                              ),
                            );
                          },
                          child: _stage == 1
                              ? const Column(
                                  key: ValueKey('t1'),
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Hola 👋',
                                      style: TextStyle(
                                        fontFamily: 'Satoshi',
                                        fontSize: 23,
                                        fontWeight: FontWeight.w700,
                                        color: AlianzaAuthColors.textPrimary,
                                      ),
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      'Ingresa tu correo para continuar',
                                      style: TextStyle(
                                        fontFamily: 'Satoshi',
                                        fontSize: 13,
                                        color: AlianzaAuthColors.textSecondary,
                                      ),
                                    ),
                                  ],
                                )
                              : const Column(
                                  key: ValueKey('t2'),
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Ingresa tu clave',
                                      style: TextStyle(
                                        fontFamily: 'Satoshi',
                                        fontSize: 23,
                                        fontWeight: FontWeight.w700,
                                        color: AlianzaAuthColors.textPrimary,
                                      ),
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      'Tus 6 dígitos de seguridad',
                                      style: TextStyle(
                                        fontFamily: 'Satoshi',
                                        fontSize: 13,
                                        color: AlianzaAuthColors.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                        const SizedBox(height: 22),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 420),
                          switchInCurve: Curves.easeOutCubic,
                          switchOutCurve: Curves.easeInCubic,
                          transitionBuilder: (child, animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: SizeTransition(
                                sizeFactor: animation,
                                axisAlignment: -1,
                                child: child,
                              ),
                            );
                          },
                          child: _stage == 1
                              ? Column(
                                  key: const ValueKey('email-stage'),
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    _buildEmailStep(),
                                    if (_lastError != null) ...[
                                      const SizedBox(height: 10),
                                      _EmailErrorBanner(
                                        result: _lastError!,
                                        onRegister: () => context.pushNamed(
                                          SelectCountryWidget.routeName,
                                        ),
                                      ),
                                    ],
                                  ],
                                )
                              : Column(
                                  key: const ValueKey('pass-stage'),
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    _EmailChip(
                                      email:
                                          widget.model.correoTextController!.text,
                                      onEdit: _backToEmail,
                                    ),
                                    const SizedBox(height: 18),
                                    _buildPinStep(
                                      pinError: pinError,
                                      pinLocked: pinLocked,
                                    ),
                                    if (_lastError ==
                                            AlianzaSignInResult.wrongCredentials ||
                                        _lastError ==
                                            AlianzaSignInResult.temporarilyLocked)
                                      Padding(
                                        padding: const EdgeInsets.only(top: 12),
                                        child: _PinErrorMessage(
                                          result: _lastError!,
                                          lockStatus: _lockStatus,
                                        ),
                                      ),
                                  ],
                                ),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          height: 54,
                          child: ElevatedButton(
                            onPressed: (_loading || pinLocked) ? null : _submit,
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              backgroundColor: AlianzaAuthColors.orange,
                              disabledBackgroundColor: const Color(0xFFD96701),
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                const _ButtonSheen(),
                                Center(
                                  child: _loading
                                      ? const SizedBox(
                                          width: 22,
                                          height: 22,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2.5,
                                            color: Colors.white,
                                          ),
                                        )
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              _stage == 1
                                                  ? 'Continuar'
                                                  : 'Iniciar sesión',
                                              style: const TextStyle(
                                                fontFamily: 'Satoshi',
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            if (_stage == 1) ...[
                                              const SizedBox(width: 9),
                                              const Icon(
                                                Icons.arrow_forward,
                                                size: 18,
                                              ),
                                            ],
                                          ],
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 14),
                        Center(
                          child: GestureDetector(
                            onTap: () => context.pushNamed(
                              SelectCountryWidget.routeName,
                            ),
                            child: RichText(
                              text: const TextSpan(
                                style: TextStyle(
                                  fontFamily: 'Satoshi',
                                  fontSize: 13,
                                  color: AlianzaAuthColors.textSecondary,
                                ),
                                children: [
                                  TextSpan(text: '¿Aún no tienes cuenta? '),
                                  TextSpan(
                                    text: 'Registrarme',
                                    style: TextStyle(
                                      color: AlianzaAuthColors.orange,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    footer: const Center(
                      child: Text(
                        'Entidad vigilada · Datos cifrados',
                        style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontSize: 11,
                          color: AlianzaAuthColors.textMuted,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (_showSuccess) _SuccessOverlay(name: name),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailStep() {
    final hasError = _lastError == AlianzaSignInResult.invalidEmail ||
        _lastError == AlianzaSignInResult.notRegistered;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Correo electrónico',
          style: TextStyle(
            fontFamily: 'Satoshi',
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AlianzaAuthColors.label,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 54,
          decoration: BoxDecoration(
            color: AlianzaAuthColors.surface,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: hasError ? AlianzaAuthColors.error : AlianzaAuthColors.border,
              width: 1.5,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0A15224F),
                blurRadius: 10,
                offset: Offset(0, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            children: [
              Icon(
                Icons.mail_outline,
                size: 18,
                color: hasError
                    ? AlianzaAuthColors.error
                    : AlianzaAuthColors.textMuted,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  controller: widget.model.correoTextController,
                  focusNode: widget.model.correoFocusNode,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(
                    fontFamily: 'Satoshi',
                    fontSize: 14,
                    color: AlianzaAuthColors.textPrimary,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'tucorreo@ejemplo.com',
                    hintStyle: TextStyle(
                      fontFamily: 'Satoshi',
                      color: AlianzaAuthColors.textMuted,
                    ),
                  ),
                  validator: widget.model.correoTextControllerValidator
                      ?.asValidator(context),
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: _emailValid ? 1 : 0,
                child: const Icon(
                  Icons.check_circle,
                  color: AlianzaAuthColors.success,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPinStep({
    required bool pinError,
    required bool pinLocked,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Clave de 6 dígitos',
              style: TextStyle(
                fontFamily: 'Satoshi',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AlianzaAuthColors.label,
              ),
            ),
            GestureDetector(
              onTap: () => setState(() => _showPin = !_showPin),
              child: Row(
                children: [
                  Icon(
                    _showPin ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    size: 16,
                    color: AlianzaAuthColors.textMuted,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    _showPin ? 'Ocultar' : 'Mostrar',
                    style: const TextStyle(
                      fontFamily: 'Satoshi',
                      fontSize: 12,
                      color: AlianzaAuthColors.textMuted,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        AnimatedBuilder(
          animation: _shakeController,
          builder: (context, child) {
            final offset =
                math.sin(_shakeController.value * math.pi * 4) * 6;
            return Transform.translate(
              offset: Offset(offset, 0),
              child: child,
            );
          },
          child: PinCodeTextField(
            appContext: context,
            length: 6,
            controller: widget.model.pinCodeController,
            focusNode: widget.model.pinCodeFocusNode,
            obscureText: !_showPin,
            obscuringCharacter: '•',
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            autoDisposeControllers: false,
            enabled: !pinLocked,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            textStyle: const TextStyle(
              fontFamily: 'Satoshi',
              fontSize: 22,
              color: AlianzaAuthColors.textPrimary,
            ),
            pinTheme: PinTheme(
              fieldHeight: 56,
              fieldWidth: 46,
              borderRadius: BorderRadius.circular(12),
              shape: PinCodeFieldShape.box,
              activeColor:
                  pinError ? AlianzaAuthColors.error : AlianzaAuthColors.orange,
              inactiveColor:
                  pinError ? AlianzaAuthColors.error : AlianzaAuthColors.border,
              selectedColor:
                  pinError ? AlianzaAuthColors.error : AlianzaAuthColors.orange,
              activeFillColor: pinLocked
                  ? AlianzaAuthColors.warningBg
                  : AlianzaAuthColors.surface,
              inactiveFillColor: pinLocked
                  ? AlianzaAuthColors.warningBg
                  : AlianzaAuthColors.surface,
              selectedFillColor: pinLocked
                  ? AlianzaAuthColors.warningBg
                  : AlianzaAuthColors.surface,
            ),
            onChanged: (_) {
              if (_lastError == AlianzaSignInResult.wrongCredentials ||
                  _lastError == AlianzaSignInResult.temporarilyLocked) {
                setState(() => _lastError = null);
              }
            },
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () =>
                context.pushNamed(ChangePassword1Widget.routeName),
            child: const Text(
              '¿Olvidaste tu clave?',
              style: TextStyle(
                fontFamily: 'Satoshi',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AlianzaAuthColors.orange,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _PinErrorMessage extends StatelessWidget {
  const _PinErrorMessage({
    required this.result,
    required this.lockStatus,
  });

  final AlianzaSignInResult result;
  final AlianzaLoginLockStatus? lockStatus;

  String _lockTime() {
    final remaining = lockStatus?.remainingLock;
    if (remaining == null || remaining <= Duration.zero) {
      return '05:00';
    }
    final minutes = remaining.inMinutes.remainder(60);
    final seconds = remaining.inSeconds.remainder(60);
    final mm = minutes.toString().padLeft(2, '0');
    final ss = seconds.toString().padLeft(2, '0');
    return '$mm:$ss';
  }

  String _message() {
    final left = lockStatus?.remainingAttempts ?? 0;
    if (left <= 1) {
      return 'Clave incorrecta. Te queda 1 intento.';
    }
    return 'Clave incorrecta. Te quedan $left intentos.';
  }

  @override
  Widget build(BuildContext context) {
    final locked = result == AlianzaSignInResult.temporarilyLocked;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: (locked ? AlianzaAuthColors.warning : AlianzaAuthColors.error)
            .withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(11),
        border: Border.all(
          color: (locked ? AlianzaAuthColors.warning : AlianzaAuthColors.error)
              .withValues(alpha: 0.24),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            locked ? Icons.lock_clock_outlined : Icons.error_outline,
            size: 16,
            color:
                locked ? AlianzaAuthColors.warning : AlianzaAuthColors.error,
          ),
          const SizedBox(width: 7),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (locked) ...[
                  const Text(
                    'Bloqueo temporal',
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AlianzaAuthColors.warning,
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    'Demasiados intentos. Por seguridad, espera',
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AlianzaAuthColors.warning,
                      height: 1.35,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${_lockTime()} para reintentar',
                    style: const TextStyle(
                      fontFamily: 'Satoshi',
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: AlianzaAuthColors.warning,
                    ),
                  ),
                ] else
                  Text(
                    _message(),
                    style: const TextStyle(
                      fontFamily: 'Satoshi',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AlianzaAuthColors.errorText,
                      height: 1.4,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _EmailChip extends StatelessWidget {
  const _EmailChip({required this.email, required this.onEdit});
  final String email;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
      decoration: BoxDecoration(
        color: AlianzaAuthColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AlianzaAuthColors.border),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A15224F),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: AlianzaAuthColors.success.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(9),
            ),
            child: const Icon(
              Icons.check_circle,
              color: AlianzaAuthColors.success,
              size: 18,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Continuando como',
                  style: TextStyle(
                    fontFamily: 'Satoshi',
                    fontSize: 10,
                    color: AlianzaAuthColors.textMuted,
                  ),
                ),
                Text(
                  email,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'Satoshi',
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: AlianzaAuthColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onEdit,
            child: const Text(
              'Cambiar',
              style: TextStyle(
                fontFamily: 'Satoshi',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AlianzaAuthColors.orange,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmailErrorBanner extends StatelessWidget {
  const _EmailErrorBanner({
    required this.result,
    required this.onRegister,
  });

  final AlianzaSignInResult result;
  final VoidCallback onRegister;

  @override
  Widget build(BuildContext context) {
    final notFound = result == AlianzaSignInResult.notRegistered;
    final invalid = result == AlianzaSignInResult.invalidEmail;
    final title = invalid ? 'Correo inválido' : 'No registrado';
    final msg = invalid
        ? 'El correo no tiene un formato válido. Revisa que incluya @ y el dominio.'
        : 'No encontramos una cuenta con este correo. Verifícalo o crea una cuenta.';

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AlianzaAuthColors.error.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(11),
        border: Border.all(
          color: AlianzaAuthColors.error.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            notFound ? Icons.person_off_outlined : Icons.error_outline,
            size: 16,
            color: AlianzaAuthColors.error,
          ),
          const SizedBox(width: 7),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Satoshi',
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AlianzaAuthColors.error,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  msg,
                  style: const TextStyle(
                    fontFamily: 'Satoshi',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AlianzaAuthColors.errorText,
                    height: 1.4,
                  ),
                ),
                if (notFound) ...[
                  const SizedBox(height: 4),
                  GestureDetector(
                    onTap: onRegister,
                    child: const Text(
                      'Crear una cuenta nueva',
                      style: TextStyle(
                        fontFamily: 'Satoshi',
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: AlianzaAuthColors.orange,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SuccessOverlay extends StatelessWidget {
  const _SuccessOverlay({required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AlianzaAuthColors.blue, AlianzaAuthColors.blueDark],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -90,
            left: -40,
            child: Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.08),
              ),
            ),
          ),
          Positioned(
            right: -70,
            bottom: 110,
            child: Container(
              width: 210,
              height: 210,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AlianzaAuthColors.orange.withValues(alpha: 0.10),
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 28,
                ),
                child: TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.94, end: 1.0),
                  duration: const Duration(milliseconds: 520),
                  curve: Curves.easeOutCubic,
                  builder: (context, value, child) {
                    return Transform.translate(
                      offset: Offset(0, (1 - value) * 26),
                      child: Opacity(
                        opacity: ((value - 0.94) / 0.06).clamp(0.0, 1.0),
                        child: child,
                      ),
                    );
                  },
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 360),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.14),
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.18),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 34,
                                height: 34,
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.92),
                                  borderRadius: BorderRadius.circular(11),
                                ),
                                padding: const EdgeInsets.all(2),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(9),
                                  child: Image.asset(
                                    kAlianzaBrandLogoAsset,
                                    fit: BoxFit.contain,
                                    errorBuilder: (_, __, ___) => Container(
                                      color: AlianzaAuthColors.orange
                                          .withValues(alpha: 0.12),
                                      alignment: Alignment.center,
                                      child: const Icon(
                                        Icons.account_balance,
                                        color: AlianzaAuthColors.orange,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Alianza Capital',
                                    style: TextStyle(
                                      fontFamily: 'Satoshi',
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Acceso verificado',
                                    style: TextStyle(
                                      fontFamily: 'Satoshi',
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xCCFFFFFF),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 26),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.16),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.14),
                                blurRadius: 30,
                                offset: const Offset(0, 18),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const _SuccessPulseBadge(),
                                const SizedBox(height: 24),
                                const Text(
                                  'Bienvenido de nuevo',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Satoshi',
                                    fontSize: 27,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                    height: 1.15,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.12),
                                    borderRadius: BorderRadius.circular(999),
                                    border: Border.all(
                                      color:
                                          Colors.white.withValues(alpha: 0.14),
                                    ),
                                  ),
                                  child: Text(
                                    name,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontFamily: 'Satoshi',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 14),
                                const Text(
                                  'Estamos cargando tu resumen y dejando listo tu acceso para que entres sin esperas innecesarias.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Satoshi',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xD9FFFFFF),
                                    height: 1.45,
                                  ),
                                ),
                                const SizedBox(height: 22),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 14,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.12),
                                    borderRadius: BorderRadius.circular(18),
                                    border: Border.all(
                                      color:
                                          Colors.white.withValues(alpha: 0.14),
                                    ),
                                  ),
                                  child: const Row(
                                    children: [
                                      SizedBox(
                                        width: 18,
                                        height: 18,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2.4,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 12),
                                      Expanded(
                                        child: Text(
                                          'Preparando tu experiencia personalizada...',
                                          style: TextStyle(
                                            fontFamily: 'Satoshi',
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      _LoadingDots(),
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SuccessPulseBadge extends StatefulWidget {
  const _SuccessPulseBadge();

  @override
  State<_SuccessPulseBadge> createState() => _SuccessPulseBadgeState();
}

class _SuccessPulseBadgeState extends State<_SuccessPulseBadge>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final t = Curves.easeInOut.transform(_controller.value);
        return Stack(
          alignment: Alignment.center,
          children: [
            Transform.scale(
              scale: 1 + (t * 0.12),
              child: Container(
                width: 116,
                height: 116,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.05 + (t * 0.06)),
                ),
              ),
            ),
            Transform.scale(
              scale: 1 + (t * 0.06),
              child: Container(
                width: 86,
                height: 86,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.14 + (t * 0.06)),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.16 + (t * 0.06)),
                  ),
                ),
              ),
            ),
            const DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: SizedBox(
                width: 62,
                height: 62,
                child: Icon(
                  Icons.check_rounded,
                  size: 34,
                  color: AlianzaAuthColors.success,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _LoadingDots extends StatefulWidget {
  const _LoadingDots();

  @override
  State<_LoadingDots> createState() => _LoadingDotsState();
}

class _LoadingDotsState extends State<_LoadingDots>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(3, (index) {
            final phase = ((_controller.value + (index * 0.18)) % 1.0);
            final active = math.sin(phase * math.pi) * 0.5 + 0.5;
            return Container(
              width: 6,
              height: 6,
              margin: EdgeInsets.only(left: index == 0 ? 0 : 5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.35 + (active * 0.65)),
              ),
            );
          }),
        );
      },
    );
  }
}

class _ButtonSheen extends StatefulWidget {
  const _ButtonSheen();

  @override
  State<_ButtonSheen> createState() => _ButtonSheenState();
}

class _ButtonSheenState extends State<_ButtonSheen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final progress =
              _controller.value <= 0.6 ? _controller.value / 0.6 : 1.0;
          return Align(
            alignment: Alignment(-1.55 + (progress * 3.1), 0),
            child: Transform.rotate(
              angle: -0.35,
              child: Container(
                width: 76,
                height: 120,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.white.withValues(alpha: 0.32),
                      Colors.white.withValues(alpha: 0.08),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
