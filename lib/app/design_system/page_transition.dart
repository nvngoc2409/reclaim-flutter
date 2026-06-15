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
  DelegatedTransitionBuilder? get delegatedTransition => _delegatedTransition;

  static final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);

  static Widget? _delegatedTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    bool allowSnapshotting,
    Widget? child,
  ) {
    final animation = CurvedAnimation(
      parent: secondaryAnimation,
      curve: Curves.linearToEaseOut,
      reverseCurve: Curves.easeInToLinear,
    );
    final delegatedPositionAnimation = animation.drive(_kLeftTween);
    final delegatedFadingAnimation = animation.drive(Tween<double>(begin: 1, end: 0));
    animation.dispose();

    final textDirection = Directionality.of(context);
    return SlideTransition(
      position: delegatedPositionAnimation,
      textDirection: textDirection,
      transformHitTests: false,
      child: FadeTransition(opacity: delegatedFadingAnimation, child: child),
    );
  }

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return CupertinoRouteTransitionMixin.buildPageTransitions<T>(
      route,
      context,
      animation,
      secondaryAnimation,
      FadeTransition(opacity: animation.drive(_easeInTween), child: child),
    );
  }
}
