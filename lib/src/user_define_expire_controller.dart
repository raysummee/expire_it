import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ntp/ntp.dart';
import 'package:expire_it/src/expire_state.dart';
import 'package:expire_it/src/internal/expire_logger.dart';
import 'internal/expire_base_controller.dart';

/// A controller implementation for managing expiration based on user-defined expiry dates.
///
/// The [UserDefineExpireController] is responsible for checking whether the given expiry date
/// has been reached or not. It uses [NTP] to synchronize with a time server for accurate time
/// comparison and falls back to local time in case the server is unavailable.
class UserDefineExpireController implements ExpireBaseController {
  /// A timer for periodic expiration checks.
  Timer? _timer;

  /// The expiry date to be checked against.
  DateTime expiryDate;

  /// Creates a [UserDefineExpireController] with the given [expiryDate].
  UserDefineExpireController({required this.expiryDate});

  /// The [ValueNotifier] that holds the current expiration state.
  @override
  ValueNotifier<ExpireState> expireState =
      ValueNotifier<ExpireState>(ExpireState.unaware);

  /// Initializes the controller by starting the expiration loop.
  @override
  void init() => _runExpireLoop(expiryDate);

  /// Starts a periodic timer for checking the expiration state.
  void _runExpireLoop(DateTime expiryDate) {
    _checkExpired(expiryDate);
    _timer = Timer.periodic(const Duration(minutes: 10), (timer) {
      _checkExpired(expiryDate);
    });
  }

  /// Checks if the provided [expiryDate] has been reached or not.
  Future<void> _checkExpired(DateTime expiryDate) async {
    try {
      DateTime serverTime = await NTP.now();
      final isExpired = serverTime.isAfter(expiryDate);
      _setExpire(isExpired);
    } catch (err) {
      ExpireLogger.error(
        "Check Expired: Server time not available. Using local time",
      );
      final isExpired = DateTime.now().isAfter(expiryDate);
      _setExpire(isExpired);
    }
  }

  /// Updates the [expireState] based on the given [isExpired] value.
  void _setExpire(bool isExpired) {
    if (isExpired) {
      expireState.value = ExpireState.expired;
    } else {
      expireState.value = ExpireState.running;
    }
  }

  /// Disposes of the resources held by the controller.
  @override
  dispose() {
    expireState.dispose();
    _timer?.cancel();
  }
}
