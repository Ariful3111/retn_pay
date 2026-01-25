import 'package:flutter/material.dart';

class CustomAnimatedSwitcher extends StatelessWidget {
  final Widget child;
  const CustomAnimatedSwitcher({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween(begin: 0.97, end: 1.0).animate(animation),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
