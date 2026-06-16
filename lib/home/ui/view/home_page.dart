import 'package:bloc_effects/bloc_effects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:reclaim/app/app.dart';
import 'package:reclaim/home/ui/home_cubit/home_cubit.dart';
import 'package:reclaim/onboarding/ui/view/landing_page.dart';

class NavigationDestinationIconSvg extends StatelessWidget {
  const NavigationDestinationIconSvg({
    required this.svgPath,
    required this.isSelected,
    super.key,
  });

  final String svgPath;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgPath,
      height: 30,
      colorFilter: ColorFilter.mode(
        isSelected //
            ? Theme.of(context).navigationBarTheme.backgroundColor!
            : Theme.of(context).colorScheme.onSurface,
        BlendMode.srcIn,
      ),
    );
  }
}

/// The home page that's shown inside the [NavigationBar].
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = 'home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeCubit _bloc = getIt<HomeCubit>();

  @override
  void initState() {
    super.initState();
    _bloc.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return BlocEffectListener(
      effector: _bloc,
      listener: (context, effect) {
        switch (effect) {
          case HomeStateEffectLogout():
            context.pushNamed(LandingPage.routeName);
          case HomeStateEffectError(errorMessage: final errorMessage):
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(errorMessage)),
            );
        }
      },
      child: ReclaimScaffold(
        appBar: const ReclaimAppBar(
          title: 'Home',
          subTitle: 'Welcome',
          progressIndicatorSteps: 3,
          progressIndicatorCurrentStep: 2,
        ),
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: ReclaimSecondaryButton.large(onPressed: _bloc.logout, title: 'Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
