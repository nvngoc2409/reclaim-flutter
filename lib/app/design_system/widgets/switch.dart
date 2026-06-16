import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReclaimSwitch extends StatelessWidget {
  const ReclaimSwitch({
    super.key,
    this.value = false,
    required this.onChanged,
  });
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    return SizedBox(
      height: 24,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: CupertinoSwitch(
          value: value,
          onChanged: onChanged,
          activeTrackColor: colorScheme.tertiary,
          inactiveTrackColor: colorScheme.onSurface.withValues(alpha: 0.1),
        ),
      ),
    );
  }
}
