import 'package:flutter/cupertino.dart';

final Animatable<Offset> _kLeftTween = Tween<Offset>(
  begin: Offset.zero,
  end: const Offset(-1, 0),
);
const kPageTransitionDuration = Duration(milliseconds: 300);

/// Defines a custom page transition animation that matches the iOS transition.
///
/// This [PageTransitionsBuilder] implementation provides a left-to-right slide
/// transition that is commonly used in iOS apps. The transition duration is
/// 500 milliseconds and uses an ease-in curve for the opacity animation.
///
/// This builder can be used with [PageRouteBuilder] to customize the page
/// transition animation for a specific route.
class ReclaimCupertinoPageTransitionsBuilder extends PageTransitionsBuilder {
  /// Constructs a page transition animation that matches the iOS transition.
  const ReclaimCupertinoPageTransitionsBuilder();

  @override
  Duration get transitionDuration => kPageTransitionDuration;

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return DualTransitionBuilder(
      animation: animation,
      forwardBuilder: (context, animation, child) {
        return SlideTransition(
          position:
              Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOutCubic,
                ),
              ),
          child: child,
        );
      },
      reverseBuilder: (context, animation, child) {
        return SlideTransition(
          position:
              Tween<Offset>(
                begin: Offset.zero,
                end: const Offset(1, 0),
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOutCubic,
                ),
              ),
          child: child,
        );
      },
      child: SlideTransition(
        position:
            Tween<Offset>(
              begin: Offset.zero,
              end: const Offset(-1, 0),
            ).animate(
              CurvedAnimation(
                parent: secondaryAnimation,
                curve: Curves.easeOutCubic,
              ),
            ),
        child: child,
      ),
    );
  }
}
