import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reclaim/app/app.dart';
import 'package:reclaim/settings/settings.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  static const routeName = 'settings';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return ReclaimScaffold(
      appBar: const ReclaimAppBar(title: 'Settings'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: ReclaimSpacing.medium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SettingItem(
              title: 'How this works',
              onTap: () => context.pushNamed(HowItWorkPage.routeName),
            ),
            const Divider(
              indent: ReclaimSpacing.normal,
              endIndent: ReclaimSpacing.normal,
              height: 1,
            ),
            const SizedBox(height: ReclaimSpacing.normal),
            _SettingsSection(
              title: 'Notifications',
              children: [
                _SettingItem(
                  title: 'Bedtime nudge',
                  trailing: ReclaimSwitch(
                    value: true,
                    onChanged: (value) {},
                  ),
                ),
                _SettingItem(
                  title: 'Wake-up reminder',
                  trailing: ReclaimSwitch(
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
            const Divider(
              indent: ReclaimSpacing.normal,
              endIndent: ReclaimSpacing.normal,
              height: 1,
            ),
            const SizedBox(height: ReclaimSpacing.normal),
            const _SettingsSection(
              title: 'Sound preferences',
              children: [
                _SettingItem(title: 'Audio quality'),
              ],
            ),
            const Divider(
              indent: ReclaimSpacing.normal,
              endIndent: ReclaimSpacing.normal,
              height: 1,
            ),
            const SizedBox(height: ReclaimSpacing.normal),
            const _SettingsSection(
              title: 'Safety info',
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: ReclaimSpacing.normal),
                  child: Text(
                    "This app is designed to help with the kind of sleeplessness that comes with midlife — restless nights, racing thoughts, and wake-ups.\n\nTalk to your doctor if you regularly wake up feeling unrefreshed even after a full night, feel exhausted during the day despite sleeping, have been told you snore loudly or stop breathing at night, experience legs that won't stop moving, or notice severe mood changes that don't improve.\n\nA sleep study can rule out conditions that look like insomnia but need different treatment.",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsSection extends StatelessWidget {
  const _SettingsSection({
    required this.title,
    required this.children,
  });
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: ReclaimSpacing.normal,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: ReclaimSpacing.normal),
          child: Text(title, style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w900)),
        ),
        ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) => children[index],
          separatorBuilder: (context, index) => const Divider(
            indent: ReclaimSpacing.normal,
            endIndent: ReclaimSpacing.normal,
            height: 1,
          ),
          itemCount: children.length,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
        ),
      ],
    );
  }
}

class _SettingItem extends StatelessWidget {
  const _SettingItem({
    required this.title,
    this.trailing,
    this.onTap,
  });
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: ReclaimSpacing.normal, vertical: ReclaimSpacing.normal),
        child: Row(
          spacing: ReclaimSpacing.normal,
          children: [
            Expanded(child: Text(title, style: Theme.of(context).textTheme.bodyLarge)),
            trailing ?? Icon(Icons.chevron_right_rounded, color: ColorScheme.of(context).onSurface, size: 16),
          ],
        ),
      ),
    );
  }
}
