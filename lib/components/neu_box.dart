import 'package:flutter/material.dart';

class NeuBox extends StatelessWidget {
  final Widget child;
  const NeuBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceDim,
          borderRadius: const BorderRadius.all(Radius.circular(13)),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.surfaceBright,
              blurRadius: 5,
              offset: const Offset(-4, -4),
            ),
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow,
              blurRadius: 8,
              offset: const Offset(4, 4),
            ),
          ]),
      child: child,
    );
  }
}
