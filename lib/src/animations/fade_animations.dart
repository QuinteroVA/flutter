import 'package:flutter/material.dart';

class FadeAnimation extends StatelessWidget {
  const FadeAnimation(
      {super.key,
      required this.child,
      this.begin = 0,
      this.end = 1,
      this.intervalStart = 0,
      this.intervalEnd = 1,
      this.duration = const Duration(milliseconds: 1500),
      this.curve = Curves.fastOutSlowIn});
  final double begin, end, intervalStart, intervalEnd;
  final Duration duration;
  final Curve curve;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: begin, end: end),
      duration: duration,
      curve: Interval(intervalStart, intervalEnd, curve: curve),
      child: child,
      builder: (BuildContext context, double? value, Widget? child) {
        return Opacity(
          opacity: value!,
          child: child,
        );
      },
    );
  }
}
