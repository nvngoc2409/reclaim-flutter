import 'package:bloc_effects/bloc_effects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reclaim/onboarding/data/models/onboarding_question.dart';
import 'package:reclaim/onboarding/onboarding.dart';

part 'onboarding_cubit.freezed.dart';

@freezed
sealed class OnboardingEffect with _$OnboardingEffect {
  const factory OnboardingEffect.nextPage() = OnboardingEffectNextPage;
  const factory OnboardingEffect.complete(OnboardingResult result) = OnboardingEffectComplete;
}

@freezed
sealed class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    @Default(0) int currrenIndex,
    @Default(0) int progress,
    @Default([]) List<OnboardingQuestion> questions,
    @Default(false) bool isAnalysing,
  }) = _OnboardingState;
}

class OnboardingCubit extends CubitWithEffects<OnboardingState, OnboardingEffect> {
  OnboardingCubit({required this.onboardingRepository}) : super(OnboardingState(questions: onboardingRepository.onboardingQuestions));

  @visibleForTesting
  final OnboardingRepository onboardingRepository;

  void onAnswerChanged(String answer) {
    if (state.currrenIndex != state.progress) {
      // Block if there is an ongoing animation
      return;
    }
    final currentQuestion = state.questions[state.currrenIndex];
    final newQuestions = [...state.questions]..[state.currrenIndex] = currentQuestion.copyWith(selectedIndex: currentQuestion.answers.indexOf(answer));
    emit(state.copyWith(progress: state.currrenIndex + 1, questions: newQuestions));

    Future.delayed(const Duration(milliseconds: 500), () {
      if (state.currrenIndex < state.questions.length - 1) {
        emitEffect(const OnboardingEffect.nextPage());
      } else {
        emitEffect(
          OnboardingEffect.complete(
            OnboardingResult(
              title: 'The Hormonal Waker',
              content: 'Hot flashes and night sweats don’t just wake you up — they trigger an adrenaline surge that keeps you wired.\n\nYour body’s temperature system is being disrupted by hormonal shifts. That creates a chain reaction that standard sleep advice can’t touch.\n\nThe good news: there are specific techniques designed for exactly this.',
              tips: [
                "Tonight: I'll guide you step-by-step when you can't sleep.",
                "Over time: we'll help your mind start linking bed with sleep again, not stress.",
              ],
            ),
          ),
        );
        // Mark onboarding completed
        // onboardingRepository.saveOnboardingDone();
      }
      emit(state.copyWith(currrenIndex: state.currrenIndex + 1, isAnalysing: state.currrenIndex == state.questions.length - 1));
    });
  }

  void onEditAnswers() {
    emit(state.copyWith(currrenIndex: 0, progress: 0, isAnalysing: false));
  }
}
