import 'package:flutter/material.dart';
import 'package:reclaim/app/app.dart';

/// Style configuration for [ReclaimCard] variants.
class _ReclaimCardStyle {
  const _ReclaimCardStyle({
    required this.defaultBorderColor,
    required this.backgroundLayers,
  });

  final Color defaultBorderColor;
  final List<_GradientLayer> backgroundLayers;
}

/// A single gradient layer to be stacked as a [Positioned.fill] background.
class _GradientLayer {
  const _GradientLayer({this.color, this.gradient});

  /// Solid color fill.
  final Color? color;

  /// Gradient fill (takes precedence over [color] if both set).
  final Gradient? gradient;
}

class ReclaimCard extends StatelessWidget {
  /// Plain card with a translucent white background.
  const ReclaimCard({
    required this.child,
    this.margin,
    this.borderColor,
    this.cornerRadius,
    this.padding,
    this.onTap,
    super.key,
  }) : _style = null;

  /// Lavender-tinted card.
  const ReclaimCard.lavender({
    required this.child,
    this.margin,
    this.borderColor,
    this.cornerRadius,
    this.padding,
    this.onTap,
    super.key,
  }) : _style = const _ReclaimCardStyle(
         defaultBorderColor: Color(0x33FFFFFF), // neutral white @ 0.2
         backgroundLayers: [
           _GradientLayer(color: Color(0x147F69BE)), // lavender @ 0.08
           _GradientLayer(
             gradient: LinearGradient(
               begin: Alignment.topLeft,
               end: Alignment.bottomRight,
               colors: [
                 Color.fromRGBO(255, 255, 255, 0.108),
                 Color.fromRGBO(255, 255, 255, 0.044),
               ],
             ),
           ),
         ],
       );

  /// Rose-tinted card.
  const ReclaimCard.rose({
    required this.child,
    this.margin,
    this.borderColor,
    this.cornerRadius,
    this.padding,
    this.onTap,
    super.key,
  }) : _style = const _ReclaimCardStyle(
         defaultBorderColor: Color(0x33FFFFFF), // neutral white @ 0.2
         backgroundLayers: [
           _GradientLayer(color: Color(0x14D9869D)), // rose @ 0.08
           _GradientLayer(
             gradient: LinearGradient(
               begin: Alignment.topLeft,
               end: Alignment.bottomRight,
               colors: [
                 Color.fromRGBO(255, 255, 255, 0.108),
                 Color.fromRGBO(255, 255, 255, 0.044),
               ],
             ),
           ),
         ],
       );

  /// Green-tinted card.
  const ReclaimCard.green({
    required this.child,
    this.margin,
    this.borderColor,
    this.cornerRadius,
    this.padding,
    this.onTap,
    super.key,
  }) : _style = const _ReclaimCardStyle(
         defaultBorderColor: Color(0x2E76CFC0), // blue @ 0.18
         backgroundLayers: [
           _GradientLayer(
             gradient: LinearGradient(
               begin: Alignment.topLeft,
               end: Alignment.bottomRight,
               colors: [
                 Color.fromRGBO(31, 76, 74, 0.5),
                 Color.fromRGBO(17, 44, 54, 0.68),
               ],
             ),
           ),
           _GradientLayer(
             gradient: RadialGradient(
               center: Alignment(0.92, -1),
               radius: 0.36,
               colors: [
                 Color.fromRGBO(91, 142, 158, 0.12),
                 Colors.transparent,
               ],
             ),
           ),
         ],
       );

  /// Yellow-tinted card.
  const ReclaimCard.yellow({
    required this.child,
    this.margin,
    this.borderColor,
    this.cornerRadius,
    this.padding,
    this.onTap,
    super.key,
  }) : _style = const _ReclaimCardStyle(
         defaultBorderColor: Color(0x33FFD700), // yellow @ 0.2
         backgroundLayers: [
           _GradientLayer(
             gradient: LinearGradient(
               begin: Alignment.topLeft,
               end: Alignment.bottomRight,
               colors: [
                 Color.fromRGBO(79, 62, 39, 0.42),
                 Color.fromRGBO(37, 35, 41, 0.72),
               ],
             ),
           ),
           _GradientLayer(
             gradient: RadialGradient(
               center: Alignment(0.92, -1),
               radius: 0.36,
               colors: [
                 Color.fromRGBO(255, 215, 0, 0.11),
                 Colors.transparent,
               ],
             ),
           ),
         ],
       );

  final Widget child;
  final EdgeInsetsGeometry? margin;
  final Color? borderColor;
  final double? cornerRadius;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final _ReclaimCardStyle? _style;

  @override
  Widget build(BuildContext context) {
    final style = _style;
    final defaultPadding = padding ?? const EdgeInsets.symmetric(horizontal: ReclaimSpacing.normal, vertical: ReclaimSpacing.normal);

    // Plain card (no style)
    if (style == null) {
      final finalCornerRadius = cornerRadius ?? 20;
      final cardBorderColor = borderColor ?? ReclaimColors.neutral[100]!.withValues(alpha: 0.14);

      return Container(
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(finalCornerRadius),
          border: Border.all(color: cardBorderColor, width: 2),
          color: Colors.white.withValues(alpha: 0.086),
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

    // Themed card
    final finalCornerRadius = cornerRadius ?? 24;
    final cardBorderColor = borderColor ?? style.defaultBorderColor;

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
            // Background layers
            for (final layer in style.backgroundLayers)
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: layer.color,
                    gradient: layer.gradient,
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

class ReclaimSelectionCard extends StatelessWidget {
  const ReclaimSelectionCard({
    required this.child,
    this.margin,
    this.cornerRadius,
    this.padding,
    this.isSelected = false,
    this.onTap,
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry? margin;
  final double? cornerRadius;
  final EdgeInsetsGeometry? padding;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final finalCornerRadius = cornerRadius ?? 20;

    // Base style from home-action-lavender
    final cardBorderColor = isSelected ? ReclaimColors.lavender.withValues(alpha: 0.5) : ReclaimColors.neutral[100]!.withValues(alpha: 0.14);
    final defaultPadding = padding ?? const EdgeInsets.symmetric(horizontal: ReclaimSpacing.normal, vertical: ReclaimSpacing.normal);

    return Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(finalCornerRadius),
        border: Border.all(color: cardBorderColor, width: 2),
        color: Colors.white.withValues(alpha: 0.086),
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
