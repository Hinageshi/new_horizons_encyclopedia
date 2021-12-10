import 'package:flutter/widgets.dart';

class FadeRouteBuilder<T> extends PageRouteBuilder<T> {
  FadeRouteBuilder({
    required Widget page,
    Duration? duration,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: duration ?? const Duration(milliseconds: 200),
          transitionsBuilder: (
            context,
            animation,
            secondaryAnimation,
            child,
          ) =>
              FadeTransition(opacity: animation, child: child),
        );
}
