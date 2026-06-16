import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:reclaim/app/design_system/design_system.dart';
import 'package:reclaim/assets_gen/assets.gen.dart';

class BottomNavigationShellPage extends StatelessWidget {
  const BottomNavigationShellPage({
    required this.navigationShell,
    super.key,
  });

  static const routeName = 'main';

  final StatefulNavigationShell navigationShell;

  void handleDestinationSelected(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;
    final paddingBottom = Platform.isIOS ? bottom : ReclaimSpacing.spacing10;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: navigationShell,
      bottomNavigationBar: DecoratedBox(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(10, 14, 28, 0.66),
              Color.fromRGBO(5, 7, 18, 0.94),
            ],
          ),
          border: Border(top: BorderSide(color: Colors.white.withValues(alpha: 0.11))),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: ReclaimSpacing.spacing20,
            right: ReclaimSpacing.spacing16,
            top: ReclaimSpacing.spacing20,
            bottom: paddingBottom,
          ),
          child: Row(
            spacing: ReclaimSpacing.spacing4,
            children: [
              Expanded(
                child: _ReclaimBottomNavigationBarItem(
                  svgPath: Assets.images.icHome,
                  label: 'Home',
                  isSelected: navigationShell.currentIndex == 0,
                  onTap: () => handleDestinationSelected(0),
                ),
              ),
              Expanded(
                child: _ReclaimBottomNavigationBarItem(
                  svgPath: Assets.images.icMorning,
                  label: 'Morning',
                  isSelected: navigationShell.currentIndex == 1,
                  onTap: () => handleDestinationSelected(1),
                ),
              ),
              Expanded(
                child: _ReclaimBottomNavigationBarItem(
                  svgPath: Assets.images.icProfile,
                  label: 'Profile',
                  isSelected: navigationShell.currentIndex == 2,
                  onTap: () => handleDestinationSelected(2),
                ),
              ),
              Expanded(
                child: _ReclaimBottomNavigationBarItem(
                  svgPath: Assets.images.icSettings,
                  label: 'Settings',
                  isSelected: navigationShell.currentIndex == 3,
                  onTap: () => handleDestinationSelected(3),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReclaimBottomNavigationBarItem extends StatelessWidget {
  const _ReclaimBottomNavigationBarItem({
    required this.isSelected,
    required this.label,
    required this.svgPath,
    this.onTap,
  });
  final String svgPath;
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final foregroundColor = isSelected ? Colors.white : Colors.white.withValues(alpha: 0.8);
    return IntrinsicHeight(
      child: Center(
        child: Container(
          constraints: const BoxConstraints(minWidth: 56),
          clipBehavior: isSelected ? Clip.hardEdge : Clip.none,
          decoration: isSelected
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    transform: GradientRotation(145 * pi / 180),
                    colors: [
                      Color.fromRGBO(155, 134, 217, 0.24),
                      Color.fromRGBO(155, 134, 217, 0.12),
                    ],
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.20),
                      blurRadius: 20,
                      offset: Offset(0, 8),
                    ),
                  ],
                )
              : null,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Content
              InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(18),
                child: Padding(
                  padding: const EdgeInsets.all(ReclaimSpacing.spacing6),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        width: 24,
                        height: 24,
                        svgPath,
                        colorFilter: ColorFilter.mode(foregroundColor, BlendMode.srcIn),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        label,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: foregroundColor, fontSize: 10),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ),

              // Radial highlight
              if (isSelected)
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        center: const Alignment(-0.16, -0.56), // ~42% 22%
                        radius: 0.4,
                        colors: [
                          Colors.white.withValues(alpha: 0.10),
                          Colors.transparent,
                        ],
                        stops: const [0.0, 1.0],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
