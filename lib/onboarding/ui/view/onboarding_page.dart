import 'package:bloc_effects/bloc_effects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reclaim/app/app.dart';
import 'package:reclaim/onboarding/onboarding.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  static const routeName = 'onboarding';

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _pageController = PageController();
  final OnboardingCubit _bloc = getIt<OnboardingCubit>();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocEffectListener(
      effector: _bloc,
      listener: (context, effect) {
        switch (effect) {
          case OnboardingEffectNextPage():
            _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
          case OnboardingEffectComplete():
            _showResultPage(effect.result);
        }
      },
      child: BlocBuilder<OnboardingCubit, OnboardingState>(
        bloc: _bloc,
        builder: (context, state) {
          final question = state.questions[state.currrenIndex.clamp(0, state.questions.length - 1)];
          return PopScope(
            canPop: !state.isAnalysing,
            child: Stack(
              children: [
                Visibility(
                  visible: !state.isAnalysing,
                  child: ReclaimScaffold(
                    appBar: ReclaimAppBar(
                      title: question.questionTitle,
                      progressIndicatorSteps: state.questions.length,
                      progressIndicatorCurrentStep: state.progress,
                    ),
                    body: PageView.builder(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.questions.length,
                      itemBuilder: (context, index) {
                        final question = state.questions[index];
                        return QuestionAnsersContent(
                          answers: question.answers,
                          selectedIndex: question.selectedIndex,
                          onAnswerChanged: _bloc.onAnswerChanged,
                        );
                      },
                    ),
                  ),
                ),
                Visibility(
                  visible: state.isAnalysing,
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: ReclaimSpacing.normal, vertical: ReclaimSpacing.extraLarge),
                      child: Column(
                        children: [
                          Text('Building your sleep support…', style: textTheme.headlineMedium),
                          const SizedBox(height: ReclaimSpacing.normal),
                          Text("I'm putting this together based on your answers — using proven tools for midlife sleep.", style: textTheme.bodyMedium),
                          const SizedBox(height: ReclaimSpacing.large),
                          const LoadingDots(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _showResultPage(OnboardingResult result) async {
    await context.pushNamed(OnboardingResultPage.routeName, extra: result);
    if (mounted) {
      _bloc.onEditAnswers();
    }
  }
}

class QuestionAnsersContent extends StatelessWidget {
  const QuestionAnsersContent({required this.answers, required this.selectedIndex, required this.onAnswerChanged, super.key});
  final List<String> answers;
  final int? selectedIndex;
  final ValueChanged<String> onAnswerChanged;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: ReclaimSpacing.normal, vertical: ReclaimSpacing.medium),
      child: Column(
        spacing: ReclaimSpacing.normal,
        children: answers
            .map(
              (answer) => SizedBox(
                width: double.infinity,
                child: ReclaimSelectionCard(
                  isSelected: selectedIndex != null && answers[selectedIndex!] == answer,
                  onTap: () => onAnswerChanged(answer),
                  child: Text(
                    answer,
                    style: TextTheme.of(context).labelLarge,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
