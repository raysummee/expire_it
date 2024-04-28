import 'package:expire_it/src/internal/expire_base_controller.dart';
import 'package:flutter/material.dart';
import 'internal/expire_state.dart';

/// A widget that dynamically constructs UI based on the expiration state.
///
/// The [ExpireBuilder] widget allows you to define different UI components
/// based on the expiration state of an app. It takes three builder functions:
///
/// - [expireBuilder]: Constructs the UI when the expiration is reached.
/// - [builder]: Constructs the UI when the app is not expired.
/// - [loadingBuilder]: Constructs the UI when the expiration state is unaware.
///
/// You also need to provide an [ExpireBaseController] to manage the expiration state.
///
/// Example usage:
/// ```dart
/// ExpireBuilder(
///   expireBuilder: (context) => ExpiredScreen(),
///   builder: (context) => HomeScreen(),
///   loadingBuilder: (context) => LoadingScreen(),
///   controller: UserDefineExpireController(
///     expiryDate: DateTime(2025),
///   ),
/// )
/// ```
class ExpireBuilder extends StatefulWidget {
  const ExpireBuilder({
    super.key,
    required this.expireBuilder,
    required this.builder,
    required this.loadingBuilder,
    required this.controller,
  });

  /// The builder function to construct the UI when the expiration is reached.
  final Widget Function(BuildContext context) expireBuilder;

  /// The builder function to construct the UI when the app is not expired.
  final Widget Function(BuildContext context) builder;

  /// The builder function to construct the UI when the expiration state is unaware.
  final Widget Function(BuildContext context) loadingBuilder;

  /// The [ExpireBaseController] managing the expiration state for the [ExpireBuilder].
  final ExpireBaseController controller;

  @override
  State<ExpireBuilder> createState() => _ExpireBuilderState();
}

class _ExpireBuilderState extends State<ExpireBuilder> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.controller.init(); // Lazily call init method here
  }

  @override
  void didUpdateWidget(covariant ExpireBuilder oldWidget) {
    if (widget.controller.expireState.value == ExpireState.unaware) {
      widget.controller.init();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.controller.expireState,
      builder: (context, value, child) {
        switch (value) {
          case ExpireState.expired:
            return widget.expireBuilder(context);
          case ExpireState.running:
            return widget.builder(context);
          case ExpireState.unaware:
            return widget.loadingBuilder(context);
        }
      },
    );
  }
}
