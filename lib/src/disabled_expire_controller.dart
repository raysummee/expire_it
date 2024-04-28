import 'package:expire_it/src/internal/expire_state.dart';
import 'package:expire_it/src/internal/expire_base_controller.dart';
import 'package:flutter/foundation.dart';

/// A controller implementation for managing an always "running" expiration state.
///
/// The [DisabledExpireController] class is intended for scenarios where the concept of
/// expiration is not applicable. It maintains a constant [ExpireState.running] state,
/// indicating that the entity is always in a "running" state and never expires.
class DisabledExpireController implements ExpireBaseController {
  const DisabledExpireController();

  /// Returns a [ValueNotifier] with a constant [ExpireState.running] state.
  @override
  ValueNotifier<ExpireState> get expireState =>
      ValueNotifier(ExpireState.running);

  /// Initializes the controller. No specific initialization needed for this implementation.
  @override
  void init() {}

  /// Disposes of the resources held by the controller.
  ///
  /// Since this controller only holds a [ValueNotifier], disposing it ensures that
  /// any listener attached to the notifier is properly removed.
  @override
  void dispose() {
    expireState.dispose();
  }
}
