import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:reclaim/app/app.dart';
import 'package:reclaim/example/example.dart';
import 'package:reclaim/home/home.dart';
import 'package:reclaim/onboarding/onboarding.dart';
import 'package:reclaim/splash_screen/splash_screen.dart';

final router = GoRouter(
  initialLocation: '/${SplashScreenPage.routeName}',
  routes: [
    GoRoute(
      name: SplashScreenPage.routeName,
      path: '/${SplashScreenPage.routeName}',
      builder: (context, routerState) => const SplashScreenPage(),
    ),
    GoRoute(
      name: LandingPage.routeName,
      path: '/${LandingPage.routeName}',
      builder: (context, routerState) => const LandingPage(),
    ),
    GoRoute(
      name: OnboardingPage.routeName,
      path: '/${OnboardingPage.routeName}',
      builder: (context, routerState) => const OnboardingPage(),
    ),
    GoRoute(
      name: OnboardingResultPage.routeName,
      path: '/${OnboardingResultPage.routeName}',
      builder: (context, routerState) => OnboardingResultPage(
        result: routerState.extra! as OnboardingResult,
      ),
    ),
    StatefulShellRoute.indexedStack(
      pageBuilder: (context, routerState, navigationShell) {
        // Fade transition coming from the SplashScreenPage.
        return CustomTransitionPage<void>(
          key: routerState.pageKey,
          child: BottomNavigationShellPage(navigationShell: navigationShell),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
              child: child,
            );
          },
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: HomePage.routeName,
              path: '/${HomePage.routeName}',
              builder: (context, routerState) => const HomePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: 'morning',
              path: '/morning',
              builder: (context, routerState) => const SizedBox.shrink(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: 'profile',
              path: '/profile',
              builder: (context, routerState) => const SizedBox.shrink(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: 'settings',
              path: '/settings',
              builder: (context, routerState) => const SizedBox.shrink(),
            ),
          ],
        ),
      ],
    ),
  ],
);
