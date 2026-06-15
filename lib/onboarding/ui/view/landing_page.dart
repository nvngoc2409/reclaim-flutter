import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reclaim/app/design_system/design_system.dart';
import 'package:reclaim/onboarding/onboarding.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  static const routeName = 'landing';

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return ReclaimScaffold(
      body: Padding(
        padding: const EdgeInsets.all(ReclaimSpacing.medium),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Let's personalize your experience.", style: textTheme.headlineLarge),
            const SizedBox(height: ReclaimSpacing.normal),
            Text('This takes less than 30 seconds.', style: textTheme.bodyMedium),
            const SizedBox(height: ReclaimSpacing.medium),
            SizedBox(
              width: double.infinity,
              child: ReclaimPrimaryButton.large(onPressed: () => context.pushNamed(OnboardingPage.routeName), title: 'Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
