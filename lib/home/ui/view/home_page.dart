import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reclaim/app/app.dart';
import 'package:reclaim/assets_gen/assets.gen.dart';
import 'package:reclaim/home/ui/home_cubit/home_cubit.dart';

/// The home page that's shown inside the [NavigationBar].
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = 'home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeCubit bloc = getIt<HomeCubit>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return ReclaimScaffold(
      appBar: const ReclaimAppBar(
        title: "Tonight, if you can't sleep:",
        subTitle: 'Good morning',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: ReclaimSpacing.normal, vertical: ReclaimSpacing.medium),
        child: SafeArea(
          child: Column(
            spacing: ReclaimSpacing.normal,
            children: [
              ReclaimCard.lavender(
                onTap: () {},
                child: Row(
                  spacing: ReclaimSpacing.normal,
                  children: [
                    _HomeActionIcon(
                      backgroundColor: ReclaimColors.lavender,
                      icon: SvgPicture.asset(Assets.images.leaf),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("I can't fall asleep", style: textTheme.titleMedium),
                          Text('Guided tools to settle your mind', style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurface.withValues(alpha: 0.8))),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward, color: ReclaimColors.lavender, size: 20),
                  ],
                ),
              ),
              ReclaimCard.rose(
                onTap: () {},
                child: Row(
                  spacing: ReclaimSpacing.normal,
                  children: [
                    _HomeActionIcon(
                      backgroundColor: ReclaimColors.pink,
                      icon: SvgPicture.asset(Assets.images.reset),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('I woke up', style: textTheme.titleMedium),
                          Text('Help getting back to sleep', style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurface.withValues(alpha: 0.8))),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward, color: ReclaimColors.pink, size: 20),
                  ],
                ),
              ),
              ReclaimCard.green(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: ReclaimSpacing.small,
                  children: [
                    Text('YOUR PROGRESS', style: textTheme.titleSmall),
                    Text("You've used Reclaim 1 time. We're just getting started.", style: textTheme.bodySmall),
                  ],
                ),
              ),
              ReclaimCard.yellow(
                child: Text('Tonight: if your mind races, try jotting down 3 worries before bed.', style: textTheme.bodySmall?.copyWith(color: ReclaimColors.yellow[90])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeActionIcon extends StatelessWidget {
  const _HomeActionIcon({
    required this.backgroundColor,
    this.icon,
  });

  final Color backgroundColor;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      height: 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            backgroundColor.withValues(alpha: 0.28),
            backgroundColor.withValues(alpha: 0.13),
          ],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.22),
            blurRadius: 28,
            offset: Offset(0, 14),
          ),
        ],
      ),
      child: Stack(
        children: [
          if (icon != null)
            Center(
              child: ColorFiltered(colorFilter: ColorFilter.mode(ColorScheme.of(context).onSurface, BlendMode.srcIn), child: icon),
            ),
          // Radial highlight
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment(-0.24, -0.48), // ~38% x, 26% y
                    radius: 0.34,
                    colors: [
                      Color.fromRGBO(255, 255, 255, 0.2),
                      Colors.transparent,
                    ],
                    stops: [0.0, 1.0],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
