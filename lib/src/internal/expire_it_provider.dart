import 'package:flutter/material.dart';
import '../expire_it.dart';
import 'expire_base_controller.dart';

/// An InheritedWidget that provides access to the expiration controller to its descendants.
///
/// This widget allows descendant widgets to access the expiration controller through
/// the [of] method, enabling them to interact with and observe the expiration state.
class ExpireItProvider extends InheritedWidget {
  /// Creates an instance of [ExpireItProvider].
  ///
  /// The [child] is the widget subtree that this provider wraps and provides
  /// access to the expiration controller.
  const ExpireItProvider({
    super.key,
    required Widget child,
  }) : super(child: child);

  /// Retrieves the nearest ancestor [ExpireItProvider] instance from the widget tree.
  ///
  /// This method allows descendant widgets to obtain the expiration controller instance.
  /// It is typically used in combination with the [BuildContext] parameter to access
  /// the controller and manage expiration-related functionality.
  static ExpireItProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ExpireItProvider>();
  }

  /// Returns the [ExpireBaseController] instance associated with this provider.
  ///
  /// This getter allows access to the expiration controller, which can be used
  /// to manage and observe the expiration state. The controller can be accessed
  /// from any descendant widget that uses [of] method to obtain the provider.
  ExpireBaseController get controller => ExpireIt.controller;

  @override
  bool updateShouldNotify(covariant ExpireItProvider oldWidget) {
    return controller != oldWidget.controller;
  }
}
