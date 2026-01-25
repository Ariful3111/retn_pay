import 'package:flutter/material.dart';

class CustomTableAnimation extends StatelessWidget {
  final Widget child;
  final int ? delay;
  const CustomTableAnimation({super.key, required this.child, this.delay});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds:delay?? 400),
      switchInCurve: Curves.easeOut,
      switchOutCurve: Curves.easeIn,
      transitionBuilder: (child, animation) {
        final fade = FadeTransition(opacity: animation, child: child);
        final slide = SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0, 0.05),
            end: Offset.zero,
          ).animate(animation),
          child: fade,
        );
        return slide;
      },
      child: SizedBox(key: ValueKey(child.runtimeType), child: child),
    );
  }
}
