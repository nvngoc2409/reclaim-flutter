import 'package:flutter/material.dart';
import 'package:reclaim/app/design_system/colors.dart';

class ReclaimCard extends StatelessWidget {
  const ReclaimCard({
    required this.child,
    this.margin,
    this.backgroundColor,
    this.borderColor,
    this.elevation,
    this.shadowColor,
    this.cornerRadius,
    super.key,
  });

  const ReclaimCard.greyBorder({
    required this.child,
    super.key,
    this.margin,
    Color? backgroundColor,
    this.cornerRadius,
  })  : backgroundColor = backgroundColor ?? Colors.white,
        borderColor = ReclaimColors.darkOnSurface,
        elevation = 0,
        shadowColor = null;

  ReclaimCard.greyBorderWithShadow({
    required this.child,
    super.key,
    this.margin,
    Color? backgroundColor,
    this.cornerRadius,
  })  : backgroundColor = backgroundColor ?? Colors.white,
        borderColor = ReclaimColors.darkOnSurface,
        elevation = 8,
        shadowColor = Colors.black.withValues(alpha: 0.3);

  final Widget child;
  final EdgeInsets? margin;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? elevation;
  final Color? shadowColor;
  final double? cornerRadius;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation ?? 0,
      shadowColor: shadowColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cornerRadius ?? 25),
        side: borderColor == null ? BorderSide.none : BorderSide(color: borderColor!),
      ),
      clipBehavior: Clip.hardEdge,
      color: backgroundColor ?? Theme.of(context).colorScheme.primary,
      surfaceTintColor: Colors.transparent,
      margin: margin ?? EdgeInsets.zero,
      child: child,
    );
  }
}
