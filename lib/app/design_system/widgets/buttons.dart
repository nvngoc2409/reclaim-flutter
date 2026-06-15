import 'package:flutter/material.dart';
import 'package:reclaim/app/design_system/colors.dart';
import 'package:reclaim/app/design_system/spacing.dart';

const largeButtonHeight = 46.0;
const smallButtonHeight = 40.0;
const iconButtonSize = 36.0;

class ReclaimPrimaryButton extends StatelessWidget {
  const ReclaimPrimaryButton.large({
    required this.onPressed,
    required this.title,
    super.key,
  }) : _height = largeButtonHeight;

  const ReclaimPrimaryButton.small({
    required this.onPressed,
    required this.title,
    super.key,
  }) : _height = smallButtonHeight;

  final String title;
  final double _height;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      fit: StackFit.passthrough,
      children: [
        FilledButtonTheme(
          data: FilledButtonThemeData(
            style: FilledButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(_height),
                side: BorderSide(color: ReclaimColors.neutral[100]!.withValues(alpha: 0.18)),
              ),
              fixedSize: Size.fromHeight(_height),
              backgroundColor: Colors.transparent,
              foregroundColor: theme.colorScheme.onPrimary,
              disabledForegroundColor: theme.colorScheme.onPrimary,
              textStyle: theme.textTheme.titleMedium,
            ),
          ),
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ReclaimColors.yellow[90]!,
                  ReclaimColors.yellow,
                  ReclaimColors.pink,
                ],
              ),
              borderRadius: BorderRadius.circular(_height),
            ),
            child: FilledButton(
              onPressed: onPressed,
              child: Text(title),
            ),
          ),
        ),
        if (onPressed == null)
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            bottom: 0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.5),

                borderRadius: BorderRadius.circular(_height),
              ),
            ),
          ),
      ],
    );
  }
}

class ReclaimSecondaryButton extends StatelessWidget {
  const ReclaimSecondaryButton.large({
    required this.onPressed,
    required this.title,
    super.key,
  }) : _height = largeButtonHeight;

  const ReclaimSecondaryButton.small({
    required this.onPressed,
    required this.title,
    super.key,
  }) : _height = smallButtonHeight;

  final String title;
  final double _height;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        FilledButtonTheme(
          data: FilledButtonThemeData(
            style: FilledButton.styleFrom(
              fixedSize: Size.fromHeight(_height),
              backgroundColor: Colors.transparent,
              disabledBackgroundColor: Colors.transparent,
              foregroundColor: theme.colorScheme.onPrimary,
              disabledForegroundColor: theme.colorScheme.onPrimary,
              textStyle: theme.textTheme.titleMedium,
            ),
          ),
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ReclaimColors.blue[70]!,
                  ReclaimColors.blue,
                ],
              ),
              borderRadius: BorderRadius.circular(100),
            ),
            child: FilledButton(
              onPressed: onPressed,
              child: Text(title),
            ),
          ),
        ),
        if (onPressed == null)
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            bottom: 0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.5),

                borderRadius: BorderRadius.circular(_height),
              ),
            ),
          ),
      ],
    );
  }
}

class ReclaimTextButton extends StatelessWidget {
  const ReclaimTextButton({
    required this.onPressed,
    required this.title,
    super.key,
  });

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(title),
    );
  }
}

class ReclaimOutlinedButton extends StatelessWidget {
  const ReclaimOutlinedButton.large({
    required this.onPressed,
    required this.title,
    super.key,
  }) : _height = largeButtonHeight;

  const ReclaimOutlinedButton.small({
    required this.onPressed,
    required this.title,
    super.key,
  }) : _height = smallButtonHeight;

  final String title;
  final double _height;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Material(
          borderRadius: BorderRadius.circular(_height),
          color: Colors.white.withValues(alpha: 0.0085),
          child: InkWell(
            borderRadius: BorderRadius.circular(_height),
            onTap: onPressed,
            child: Container(
              height: _height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_height),
                border: Border.all(color: Colors.white.withValues(alpha: 0.13)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withValues(alpha: 0.08),
                    offset: const Offset(0, -1),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: ReclaimSpacing.medium, vertical: ReclaimSpacing.extraSmall),
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextTheme.of(context).titleMedium,
              ),
            ),
          ),
        ),
        if (onPressed == null)
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            bottom: 0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.5),

                borderRadius: BorderRadius.circular(_height),
              ),
            ),
          ),
      ],
    );
  }
}

class ReclaimIconButton extends StatelessWidget {
  const ReclaimIconButton({
    required this.icon,
    this.onPressed,
    super.key,
  });

  final Widget icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: iconButtonSize,
      height: iconButtonSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const RadialGradient(
          center: Alignment(-0.3, -0.5), // ~35% 24%
          colors: [
            Color.fromRGBO(255, 255, 255, 0.10),
            Color.fromRGBO(255, 255, 255, 0.08),
          ],
          stops: [0.0, 0.4],
        ),
        border: Border.all(
          color: const Color.fromRGBO(255, 255, 255, 0.13),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.22),
            blurRadius: 28,
            offset: Offset(0, 14),
          ),
        ],
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        style: IconButton.styleFrom(
          backgroundColor: Colors.transparent,
          padding: const EdgeInsets.all(4),
          shape: const CircleBorder(),
          foregroundColor: Colors.white,
          fixedSize: const Size.square(iconButtonSize),
        ),
      ),
    );
  }
}
