import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reclaim/app/design_system/spacing.dart';
import 'package:reclaim/app/design_system/widgets/buttons.dart';
import 'package:reclaim/app/design_system/widgets/progress_indicator.dart';

class ReclaimScaffold extends StatelessWidget {
  const ReclaimScaffold({
    required this.body,
    super.key,
    this.appBar,
    this.bottomNavigationBar,
    this.extendBody = false,
  });

  final Widget body;
  final ReclaimAppBar? appBar;
  final Widget? bottomNavigationBar;
  final bool extendBody;

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.paddingOf(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: extendBody,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (appBar != null)
            Padding(
              padding: EdgeInsets.only(top: padding.top),
              child: appBar,
            ),
          Expanded(
            child: MediaQuery.removePadding(
              removeTop: appBar != null,
              context: context,
              child: body,
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

class ReclaimAppBar extends StatelessWidget {
  const ReclaimAppBar({
    required this.title,
    this.subTitle,
    this.automaticallyImplyLeading = true,
    this.progressIndicatorSteps,
    this.progressIndicatorCurrentStep,
    super.key,
  });

  final String title;
  final String? subTitle;

  final bool automaticallyImplyLeading;

  /// Number of steps to display in the progress indicator. Hide the progress indicator if this is null.
  final int? progressIndicatorSteps;

  /// The current step of the progress indicator.
  final int? progressIndicatorCurrentStep;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: ReclaimSpacing.normal, vertical: ReclaimSpacing.small),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (automaticallyImplyLeading && context.canPop())
            Padding(
              padding: const EdgeInsets.only(bottom: ReclaimSpacing.normal),
              child: ReclaimIconButton(
                icon: const Icon(Icons.chevron_left_rounded),
                onPressed: context.pop,
              ),
            ),
          if (progressIndicatorSteps != null)
            Padding(
              padding: const EdgeInsets.only(bottom: ReclaimSpacing.normal),
              child: ReclaimStepsProgressIndicator(
                steps: progressIndicatorSteps!,
                currentStep: progressIndicatorCurrentStep ?? 0,
              ),
            ),
          if (subTitle != null) Text(subTitle!, style: textTheme.bodyLarge),
          Text(title, style: textTheme.headlineMedium),
        ],
      ),
    );
  }
}
