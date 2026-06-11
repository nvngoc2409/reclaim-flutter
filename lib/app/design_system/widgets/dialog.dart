import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reclaim/app/design_system/design_system.dart';

Future<void> showReclaimConfirmDialog(
  BuildContext context, {
  required String title,
  required String content,
  bool barrierDismissible = true,
  String? confirmText,
  String? cancelText,
  Future<void> Function()? onConfirm,
  Future<void> Function()? onCancel,
}) async {
  final theme = Theme.of(context);
  cancelText = cancelText ?? 'Cancel';
  final isConfirmed = await showDialog<bool>(
    context: context,
    useRootNavigator: false,
    barrierDismissible: barrierDismissible,
    builder: (context) => BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
      child: Dialog(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(ReclaimSpacing.normal, ReclaimSpacing.medium, ReclaimSpacing.normal, ReclaimSpacing.medium),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700, height: 1.15)),
              const SizedBox(height: ReclaimSpacing.spacing12),
              Text(content, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: ReclaimSpacing.large),
              SizedBox(
                width: double.infinity,
                child: ReclaimPrimaryButton.small(
                  title: confirmText ?? 'Confirm',
                  onPressed: () => context.pop(true),
                ),
              ),
              if (cancelText!.isNotEmpty)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: ReclaimSpacing.small),
                    child: ReclaimTextButton(
                      title: cancelText,
                      onPressed: () => context.pop(false),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    ),
  );
  if (context.mounted && isConfirmed != null) {
    if (onConfirm != null && isConfirmed) {
      await onConfirm();
    } else if (onCancel != null && !isConfirmed) {
      await onCancel();
    }
  }
}

Future<void> showReclaimAlertDialog(
  BuildContext context, {
  required String title,
  required String content,
  bool barrierDismissible = true,
  String? buttonText,
  Future<void> Function()? onButtonPressed,
}) async {
  return showReclaimConfirmDialog(
    context,
    title: title,
    content: content,
    confirmText: buttonText ?? 'Okay',
    cancelText: '',
    onConfirm: onButtonPressed,
    barrierDismissible: barrierDismissible,
  );
}
