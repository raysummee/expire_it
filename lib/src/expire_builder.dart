import 'package:expire_it/src/internal/expire_base_controller.dart';
import 'package:flutter/material.dart';
import 'internal/expire_it_provider.dart';
import 'internal/expire_state.dart';

/// A widget that dynamically builds its content based on the state of expiration.
///
/// The [ExpireBuilder] widget listens to the state of the provided [controller]'s [ExpireState]
/// and constructs its UI accordingly. It offers different builders for three possible states:
/// expired, running, and unaware. This widget is particularly useful when you want to display
/// different UI elements based on the expiration state.
class ExpireBuilder extends StatefulWidget {
  /// Creates an [ExpireBuilder].
  ///
  /// The [expireBuilder] is called when the expiration is reached, allowing you to build
  /// appropriate UI for that scenario. The [builder] is used when the app is not expired,
  /// and [loadingBuilder] is used when the expiration state is unaware.
  const ExpireBuilder({
    super.key,
    required this.expireBuilder,
    required this.builder,
    required this.loadingBuilder,
  });

  /// The builder function to construct the UI when the expiration is reached.
  final Widget Function(BuildContext context) expireBuilder;

  /// The builder function to construct the UI when the app is not expired.
  final Widget Function(BuildContext context) builder;

  /// The builder function to construct the UI when the expiration state is unaware.
  final Widget Function(BuildContext context) loadingBuilder;

  @override
  State<ExpireBuilder> createState() => _ExpireBuilderState();
}

class _ExpireBuilderState extends State<ExpireBuilder> {
  late ExpireBaseController _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller = ExpireItProvider.of(context)!.controller;
    _controller.init(); // Lazily call init method here
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _controller.expireState,
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
