import 'package:expire_it/src/expire_builder.dart';
import 'package:flutter/material.dart';
import 'internal/expire_base_controller.dart';

/// Provides a centralized mechanism for managing expiration states
/// and rendering UI components accordingly.
class ExpireIt extends StatelessWidget {
  /// Creates an [ExpireIt] widget.
  ///
  /// The [expireBuilder], [builder], [controller], and [loadingBuilder] functions are used to
  /// construct different UI components based on different expiration states.
  const ExpireIt({
    Key? key,
    required this.expireBuilder,
    required this.builder,
    required this.loadingBuilder,
    required this.controller,
  }) : super(key: key);

  /// The builder function to construct the UI when the expiration is reached.
  final Widget Function(BuildContext context) expireBuilder;

  /// The builder function to construct the UI when the app is not expired.
  final Widget Function(BuildContext context) builder;

  /// The builder function to construct the UI when the expiration state is unaware.
  final Widget Function(BuildContext context) loadingBuilder;

  /// The controller managing the expiration state. Default is [DisabledExpireController].
  final ExpireBaseController controller;

  @override
  Widget build(BuildContext context) {
    return ExpireBuilder(
      controller: controller,
      expireBuilder: expireBuilder,
      builder: builder,
      loadingBuilder: loadingBuilder,
    );
  }
}
