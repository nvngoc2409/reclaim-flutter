import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reclaim/app/design_system/design_system.dart';

class HowItWorkPage extends StatefulWidget {
  const HowItWorkPage({super.key});

  static const routeName = 'how-it-work';

  @override
  State<HowItWorkPage> createState() => _HowItWorkPageState();
}

class _HowItWorkPageState extends State<HowItWorkPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ReclaimScaffold(
      appBar: const ReclaimAppBar(title: "Here's how it works"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: ReclaimSpacing.normal, vertical: ReclaimSpacing.medium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: ReclaimSpacing.normal,
          children: [
            const _HowItWorkSection(
              title: 'Tonight',
              content: "When you can't sleep, open the app and tell us what's happening. We'll guide you through it step by step.",
            ),
            const _HowItWorkSection(
              title: 'Each session',
              content: "Takes about 5–10 minutes. You don't have to do anything except follow along.",
            ),
            const _HowItWorkSection(
              title: 'Over time',
              content: 'Your morning check-ins help us learn your patterns and get better at helping you.',
            ),
            Padding(
              padding: const EdgeInsets.only(top: ReclaimSpacing.small),
              child: Text(
                'Most women notice a shift within 2–3 weeks of consistent use.',
                style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.8)),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(ReclaimSpacing.normal),
          child: ReclaimPrimaryButton.large(title: 'Back to my Settings', onPressed: () => context.pop()),
        ),
      ),
    );
  }
}

class _HowItWorkSection extends StatelessWidget {
  const _HowItWorkSection({
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      spacing: ReclaimSpacing.extraSmall,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.bodyMedium?.copyWith(color: colorScheme.tertiary),
        ),
        Text(
          content,
          style: textTheme.bodyLarge?.copyWith(color: colorScheme.onSurface),
        ),
      ],
    );
  }
}
