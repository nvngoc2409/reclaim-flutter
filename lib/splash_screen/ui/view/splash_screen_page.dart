import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reclaim/app/app.dart';
import 'package:reclaim/auth/auth.dart';
import 'package:reclaim/home/home.dart';
import 'package:reclaim/splash_screen/splash_screen.dart';
import 'package:typewritertext/typewritertext.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  static const routeName = 'splash';

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  final SplashCubit _bloc = getIt<SplashCubit>();
  final _letterDuration = const Duration(milliseconds: 200);
  final _appName = 'RECLAIM';
  bool _isShowSlogan = false;

  @override
  void initState() {
    super.initState();
    _bloc.load();
    Future.delayed(Duration(milliseconds: _letterDuration.inMilliseconds * _appName.length + 200), () {
      setState(() {
        _isShowSlogan = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      bloc: _bloc,
      listener: (context, state) {
        if (state is SplashStateLoaded) {
          _showNextScreen(hasUserLoggedIn: state.hasUserLoggedIn);
        }
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF10162A),
                Color(0xFF050712),
              ],
            ),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Purple glow (50%, 31%)
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment(0, -0.38),
                    radius: 0.8,
                    colors: [
                      Color.fromRGBO(181, 140, 255, 0.5),
                      Color.fromRGBO(181, 140, 255, 0.1),
                      Colors.transparent,
                    ],
                    stops: [0.0, 0.6, 1],
                  ),
                ),
              ),

              // Teal glow (28%, 62%)
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment(-0.44, 0.24),
                    radius: 2,
                    colors: [
                      Color.fromRGBO(123, 230, 207, 0.2),
                      Colors.transparent,
                    ],
                    stops: [0.0, 0.4],
                  ),
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AppLogo(),
                  const SizedBox(height: ReclaimSpacing.spacing16),
                  TypeWriter.text(
                    _appName,
                    style: const TextStyle(
                      letterSpacing: 5,
                      fontSize: 36,
                      fontFamily: 'sans-serif',
                    ),
                    duration: _letterDuration,
                  ),
                  const SizedBox(height: ReclaimSpacing.spacing8),
                  AnimatedOpacity(
                    opacity: _isShowSlogan ? 1 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: Text(
                      'sleep recovery',
                      style: TextTheme.of(context).bodySmall,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showNextScreen({required bool hasUserLoggedIn}) {
    if (hasUserLoggedIn) {
      context.goNamed(HomePage.routeName);
    } else {
      context.goNamed(LoginPage.routeName);
    }
  }
}

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 164,
      height: 164,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(46),
        boxShadow: const [
          // 0 32px 80px rgba(0,0,0,.46)
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.46),
            blurRadius: 80,
            offset: Offset(0, 32),
          ),

          // 0 0 70px rgba(181,140,255,.24)
          BoxShadow(
            color: Color.fromRGBO(181, 140, 255, 0.24),
            blurRadius: 70,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(46),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Main gradient
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF7BE6CF),
                    Color(0xFFB58CFF),
                    Color(0xFFFF8EA8),
                  ],
                  stops: [0.0, 0.54, 1.0],
                ),
              ),
            ),

            // White glow center
            Positioned(
              child: Align(
                alignment: const Alignment(-0.04, 0.4), // ~48%,58%
                child: Container(
                  width: 88,
                  height: 88,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withValues(alpha: 0.4),
                  ),
                ),
              ),
            ),

            // Small white dot #1 (36%,35%)
            Positioned(
              left: 49,
              top: 46,
              child: Container(
                width: 22,
                height: 22,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFFF8EE),
                ),
              ),
            ),

            // Small white dot #2 (62%,38%)
            Positioned(
              left: 92,
              top: 52,
              child: Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFFF8EE),
                ),
              ),
            ),

            // Simulate inset top highlight
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: Container(
                height: 1,
                color: const Color.fromRGBO(
                  255,
                  255,
                  255,
                  0.42,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
