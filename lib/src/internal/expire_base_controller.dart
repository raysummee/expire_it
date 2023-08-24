import 'package:expire_it/src/expire_state.dart';
import 'package:flutter/foundation.dart';

/// [ExpireBaseController] for managing expiration state.
///
/// This abstract class serves as the foundation for controllers that handle expiration-related
/// state management. It provides methods for initialization and disposal of the associated state.
abstract class ExpireBaseController {
  /// Notifier for the expiration state.
  ///
  /// This [ValueNotifier] holds the current [ExpireState] and notifies listeners when the state
  /// changes.
  final ValueNotifier<ExpireState> expireState;

  /// Creates an [ExpireBaseController] with the given [expireState].
  ///
  /// The [expireState] parameter is used to initialize the expiration state notifier for this controller.
  ExpireBaseController(this.expireState);

  /// Initializes the controller.
  ///
  /// This method is responsible for performing any necessary setup operations when the controller
  /// is created or initialized.
  void init();

  /// Disposes of the resources held by the controller.
  ///
  /// This method should be called when the controller is no longer needed. It disposes of the
  /// [expireState] notifier to release any associated resources.
  void dispose() {
    expireState.dispose();
  }
}
