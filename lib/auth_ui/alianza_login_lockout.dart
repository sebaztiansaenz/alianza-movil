import 'package:shared_preferences/shared_preferences.dart';

/// Control de intentos fallidos de clave por correo (bloqueo 5 min tras 3 fallos).
class AlianzaLoginLockout {
  AlianzaLoginLockout._();

  static const int maxAttempts = 3;
  static const Duration lockDuration = Duration(minutes: 5);

  static String _attemptsKey(String email) =>
      'alianza_login_attempts_${email.toLowerCase()}';

  static String _lockUntilKey(String email) =>
      'alianza_login_lock_until_${email.toLowerCase()}';

  static Future<AlianzaLoginLockStatus> check(String email) async {
    final normalized = email.trim().toLowerCase();
    if (normalized.isEmpty) {
      return const AlianzaLoginLockStatus(attemptsUsed: 0);
    }

    final prefs = await SharedPreferences.getInstance();
    final lockUntilMs = prefs.getInt(_lockUntilKey(normalized));
    final now = DateTime.now();

    if (lockUntilMs != null) {
      final lockUntil = DateTime.fromMillisecondsSinceEpoch(lockUntilMs);
      if (now.isBefore(lockUntil)) {
        return AlianzaLoginLockStatus(
          attemptsUsed: maxAttempts,
          lockedUntil: lockUntil,
        );
      }
      await _clearLock(prefs, normalized);
    }

    return AlianzaLoginLockStatus(
      attemptsUsed: prefs.getInt(_attemptsKey(normalized)) ?? 0,
    );
  }

  /// Registra un intento fallido. Devuelve el estado actualizado.
  static Future<AlianzaLoginLockStatus> recordFailure(String email) async {
    final normalized = email.trim().toLowerCase();
    final prefs = await SharedPreferences.getInstance();
    final current = (prefs.getInt(_attemptsKey(normalized)) ?? 0) + 1;

    if (current >= maxAttempts) {
      final until = DateTime.now().add(lockDuration);
      await prefs.setInt(
        _lockUntilKey(normalized),
        until.millisecondsSinceEpoch,
      );
      await prefs.remove(_attemptsKey(normalized));
      return AlianzaLoginLockStatus(
        attemptsUsed: maxAttempts,
        lockedUntil: until,
      );
    }

    await prefs.setInt(_attemptsKey(normalized), current);
    return AlianzaLoginLockStatus(attemptsUsed: current);
  }

  static Future<void> clear(String email) async {
    final normalized = email.trim().toLowerCase();
    if (normalized.isEmpty) return;
    final prefs = await SharedPreferences.getInstance();
    await _clearLock(prefs, normalized);
  }

  static Future<void> _clearLock(
    SharedPreferences prefs,
    String normalized,
  ) async {
    await prefs.remove(_attemptsKey(normalized));
    await prefs.remove(_lockUntilKey(normalized));
  }
}

class AlianzaLoginLockStatus {
  const AlianzaLoginLockStatus({
    required this.attemptsUsed,
    this.lockedUntil,
  });

  final int attemptsUsed;
  final DateTime? lockedUntil;

  bool get isLocked =>
      lockedUntil != null && DateTime.now().isBefore(lockedUntil!);

  int get remainingAttempts =>
      (AlianzaLoginLockout.maxAttempts - attemptsUsed).clamp(0, 999);

  Duration? get remainingLock {
    if (!isLocked || lockedUntil == null) return null;
    final diff = lockedUntil!.difference(DateTime.now());
    return diff.isNegative ? Duration.zero : diff;
  }
}
