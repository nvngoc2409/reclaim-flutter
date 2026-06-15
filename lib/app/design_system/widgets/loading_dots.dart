import 'package:flutter/material.dart';
import 'package:reclaim/app/design_system/spacing.dart';

class LoadingDots extends StatefulWidget {
  const LoadingDots({
    super.key,
    this.color, // accent-lavender
    this.size = 8,
  });

  final Color? color;
  final double size;

  @override
  State<LoadingDots> createState() => _LoadingDotsState();
}

class _LoadingDotsState extends State<LoadingDots> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.color ?? Theme.of(context).colorScheme.tertiary;
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, animation) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          spacing: ReclaimSpacing.spacing8,
          children: List.generate(
            3,
            (index) => _Dot(
              progress: _controller.value,
              delay: index * 0.2,
              size: widget.size,
              color: color,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _Dot extends StatelessWidget {
  const _Dot({
    required this.progress,
    required this.delay,
    required this.size,
    required this.color,
  });

  final double progress;
  final double delay;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    var t = (progress - delay) % 1.0;
    if (t < 0) t += 1.0;

    final scale = 0.7 + 0.6 * (1 - (2 * t - 1).abs());
    final opacity = 0.4 + 0.6 * (1 - (2 * t - 1).abs());

    return Opacity(
      opacity: opacity,
      child: Transform.scale(
        scale: scale,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
