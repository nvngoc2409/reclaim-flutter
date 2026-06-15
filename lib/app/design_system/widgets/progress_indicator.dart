import 'package:flutter/material.dart';
import 'package:reclaim/app/design_system/colors.dart';

class ReclaimLinearProgressIndicator extends StatelessWidget {
  const ReclaimLinearProgressIndicator({
    required this.value,
    super.key,
    this.height = 3.0,
    this.backgroundColor,
    this.animateValueChange = true,
  });

  final double value;
  final double height;
  final Color? backgroundColor;
  final bool animateValueChange;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final trackColor = backgroundColor ?? theme.colorScheme.onSurface.withValues(alpha: 0.15);

    final progress = value.clamp(0.0, 1.0);

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: progress),
      duration: animateValueChange ? const Duration(milliseconds: 500) : Duration.zero,
      curve: Curves.easeInOut,
      builder: (context, animatedValue, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final maxWidth = constraints.maxWidth;
            final activeWidth = maxWidth * animatedValue;

            return Container(
              height: height,
              width: maxWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(height),
                color: trackColor,
              ),
              clipBehavior: Clip.hardEdge,
              child: Stack(
                children: [
                  if (activeWidth > 0)
                    Positioned(
                      left: 0,
                      top: 0,
                      bottom: 0,
                      width: activeWidth,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(height),
                        child: OverflowBox(
                          alignment: Alignment.centerLeft,
                          minWidth: maxWidth,
                          maxWidth: maxWidth,
                          child: Container(
                            width: maxWidth,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  ReclaimColors.green,
                                  ReclaimColors.lavender,
                                  ReclaimColors.pink,
                                ],
                                stops: [
                                  0,
                                  0.65,
                                  1,
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class ReclaimStepsProgressIndicator extends StatelessWidget {
  const ReclaimStepsProgressIndicator({
    required this.steps,
    required this.currentStep,
    super.key,
  });

  final int steps;
  final int currentStep;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 3,
      children: List.generate(steps, (index) {
        return Expanded(
          child: ReclaimLinearProgressIndicator(
            value: currentStep > index ? 1 : 0,
            animateValueChange: currentStep == index + 1,
          ),
        );
      }),
    );
  }
}
