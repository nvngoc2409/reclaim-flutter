import 'package:flutter/material.dart';
import 'package:reclaim/app/app.dart';

class ReclaimLavenderCard extends StatelessWidget {
  const ReclaimLavenderCard({
    required this.child,
    this.margin,
    this.borderColor,
    this.cornerRadius,
    this.padding,
    this.onTap,
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry? margin;
  final Color? borderColor;
  final double? cornerRadius;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final finalCornerRadius = cornerRadius ?? 24;

    // Base style from home-action-lavender
    final cardBorderColor = borderColor ?? ReclaimColors.neutral[100]!.withValues(alpha: 0.2);
    final defaultPadding = padding ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 24);

    return Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(finalCornerRadius),
        border: Border.all(color: cardBorderColor, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.24),
            blurRadius: 38,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(finalCornerRadius - 1),
        child: Stack(
          children: [
            // 1. Solid base background color (home-action-lavender tint)
            Positioned.fill(
              child: Container(
                color: ReclaimColors.lavender.withValues(alpha: 0.08),
              ),
            ),
            // 2. Base Linear Gradient (145deg: top-left to bottom-right)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withValues(alpha: 0.108),
                      Colors.white.withValues(alpha: 0.044),
                    ],
                  ),
                ),
              ),
            ),
            // Ripple overlay when tapped
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(finalCornerRadius - 1),
                onTap: onTap,
                child: Padding(
                  padding: defaultPadding,
                  child: child,
                ),
              ),
            ),
            // 3. Top-left radial gradient (circle at 9% 14%, warm orange/yellow tint)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(-0.82, -0.72),
                    radius: 0.26,
                    colors: [
                      const Color(0xFFE8D6B8).withValues(alpha: 0.095),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            // 4. Bottom-right radial gradient (circle at 98% 100%, steel blue tint)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(0.96, 1),
                    radius: 0.3,
                    colors: [
                      const Color(0xFF5B8E9E).withValues(alpha: 0.08),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReclaimGreenCard extends StatelessWidget {
  const ReclaimGreenCard({
    required this.child,
    this.margin,
    this.borderColor,
    this.cornerRadius,
    this.padding,
    this.onTap,
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry? margin;
  final Color? borderColor;
  final double? cornerRadius;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final finalCornerRadius = cornerRadius ?? 24;

    // Base style from green card CSS
    final cardBorderColor = borderColor ?? ReclaimColors.blue.withValues(alpha: 0.18);
    final defaultPadding = padding ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 24);

    return Container(
      margin: margin,
      constraints: const BoxConstraints(
        minHeight: 96,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(finalCornerRadius),
        border: Border.all(color: cardBorderColor, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.24),
            blurRadius: 38,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(finalCornerRadius - 1),
        child: Stack(
          children: [
            // 1. Base Linear Gradient (145deg: top-left to bottom-right)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFF1F4C4A).withValues(alpha: 0.5),
                      const Color(0xFF112C36).withValues(alpha: 0.68),
                    ],
                  ),
                ),
              ),
            ),
            // 2. Top-right radial gradient (circle at 96% 0%, ReclaimColors.blue/mint glow)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(0.92, -1),
                    radius: 0.36,
                    colors: [
                      ReclaimColors.blue.withValues(alpha: 0.12),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            // Ripple overlay when tapped
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(finalCornerRadius - 1),
                onTap: onTap,
                child: Padding(
                  padding: defaultPadding,
                  child: child,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReclaimYellowCard extends StatelessWidget {
  const ReclaimYellowCard({
    required this.child,
    this.margin,
    this.borderColor,
    this.cornerRadius,
    this.padding,
    this.onTap,
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry? margin;
  final Color? borderColor;
  final double? cornerRadius;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final finalCornerRadius = cornerRadius ?? 24;

    // Base style from yellow card CSS
    final cardBorderColor = borderColor ?? ReclaimColors.yellow.withValues(alpha: 0.2);
    final defaultPadding = padding ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 24);

    return Container(
      margin: margin,
      constraints: const BoxConstraints(
        minHeight: 96,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(finalCornerRadius),
        border: Border.all(color: cardBorderColor, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.24),
            blurRadius: 38,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(finalCornerRadius - 1),
        child: Stack(
          children: [
            // 1. Base Linear Gradient (145deg: top-left to bottom-right)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFF4F3E27).withValues(alpha: 0.42),
                      const Color(0xFF252329).withValues(alpha: 0.72),
                    ],
                  ),
                ),
              ),
            ),
            // 2. Top-right radial gradient (circle at 96% 0%, ReclaimColors.yellow glow)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(0.92, -1),
                    radius: 0.36,
                    colors: [
                      ReclaimColors.yellow.withValues(alpha: 0.11),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            // Ripple overlay when tapped
            if (onTap != null)
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(finalCornerRadius - 1),
                  onTap: onTap,
                  child: Padding(
                    padding: defaultPadding,
                    child: child,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class ReclaimCard extends StatelessWidget {
  const ReclaimCard({
    required this.child,
    this.margin,
    this.borderColor,
    this.cornerRadius,
    this.padding,
    this.onTap,
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry? margin;
  final Color? borderColor;
  final double? cornerRadius;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final finalCornerRadius = cornerRadius ?? 24;

    // Base style from home-action-lavender
    final cardBorderColor = borderColor ?? ReclaimColors.neutral[100]!.withValues(alpha: 0.2);
    final defaultPadding = padding ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 24);

    return Container(
      margin: margin,
      constraints: const BoxConstraints(
        minHeight: 96,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(finalCornerRadius),
        border: Border.all(color: cardBorderColor, width: 2),
        gradient: LinearGradient(colors: [Colors.white.withValues(alpha: 0.0086), Colors.white.withValues(alpha: 0.035)]),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(finalCornerRadius - 1),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(finalCornerRadius - 1),
          child: Padding(padding: defaultPadding, child: child),
        ),
      ),
    );
  }
}
