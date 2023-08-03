part of expire_it;

class ExpireBuilder extends StatelessWidget {
  const ExpireBuilder({
    super.key,
    required this.expireBuilder,
    required this.builder,
    required this.loadingBuilder,
  });

  final Widget Function(BuildContext context) expireBuilder;
  final Widget Function(BuildContext context) builder;
  final Widget Function(BuildContext context) loadingBuilder;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ExpireController.instance._expireState,
      builder: (context, value, child) {
        switch (value) {
          case ExpireState.expired:
            return expireBuilder(context);
          case ExpireState.running:
            return builder(context);
          case ExpireState.unaware:
            return loadingBuilder(context);
        }
      },
    );
  }
}
