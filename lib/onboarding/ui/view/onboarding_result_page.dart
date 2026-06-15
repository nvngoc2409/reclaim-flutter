import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reclaim/app/app.dart';
import 'package:reclaim/home/home.dart';
import 'package:reclaim/onboarding/onboarding.dart';

class OnboardingResultPage extends StatefulWidget {
  const OnboardingResultPage({required this.result, super.key});

  final OnboardingResult result;

  static const routeName = 'onboarding_result';

  @override
  State<OnboardingResultPage> createState() => _OnboardingResultPageState();
}

class _OnboardingResultPageState extends State<OnboardingResultPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ReclaimScaffold(
      appBar: ReclaimAppBar(
        title: 'Your pattern: ${widget.result.title}',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: ReclaimSpacing.normal, vertical: ReclaimSpacing.medium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.result.content, style: textTheme.bodyMedium),
            const SizedBox(height: ReclaimSpacing.medium),
            if (widget.result.tips.isNotEmpty)
              ReclaimCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: ReclaimSpacing.small,
                  children: [
                    Text('Quick tips to help you get the most from your plan:', style: textTheme.bodyMedium),
                    ...widget.result.tips.map(
                      (tip) => Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('• '),
                          Expanded(child: Text(tip)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: ReclaimSpacing.normal, vertical: ReclaimSpacing.small),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                child: ReclaimPrimaryButton.large(onPressed: () => context.goNamed(HomePage.routeName), title: 'Continue to home'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: textTheme.bodyMedium,
                  foregroundColor: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () => context.pop(),
                child: const Text('Edit my answers'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
