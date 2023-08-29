import 'package:flutter/material.dart';
import 'package:expire_it/expire_it.dart';
import 'internal/expire_it_provider.dart';
import 'internal/expire_base_controller.dart';

/// Provides a centralized mechanism for managing expiration states
/// and rendering UI components accordingly.
class ExpireIt extends StatelessWidget {
  /// Creates an [ExpireIt] widget.
  ///
  /// The [expireBuilder], [builder], and [loadingBuilder] functions are used to
  /// construct different UI components based on different expiration states.
  const ExpireIt({
    Key? key,
    required this.expireBuilder,
    required this.builder,
    required this.loadingBuilder,
  }) : super(key: key);

  /// The builder function to construct the UI when the expiration is reached.
  final Widget Function(BuildContext context) expireBuilder;

  /// The builder function to construct the UI when the app is not expired.
  final Widget Function(BuildContext context) builder;

  /// The builder function to construct the UI when the expiration state is unaware.
  final Widget Function(BuildContext context) loadingBuilder;

  /// The controller managing the expiration state. Default is [DisabledExpireController].
  static ExpireBaseController controller = DisabledExpireController();

  @override
  Widget build(BuildContext context) {
    return ExpireItProvider(
      child: Builder(
        builder: (context) {
          return ExpireBuilder(
            expireBuilder: expireBuilder,
            builder: builder,
            loadingBuilder: loadingBuilder,
          );
        },
      ),
    );
  }
}
