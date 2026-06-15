import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_question.freezed.dart';
part 'onboarding_question.g.dart';

@freezed
abstract class OnboardingQuestion with _$OnboardingQuestion {
  const factory OnboardingQuestion({
    required String questionTitle,
    required List<String> answers,
    int? selectedIndex,
  }) = _OnboardingQuestion;

  factory OnboardingQuestion.fromJson(Map<String, dynamic> json) => _$OnboardingQuestionFromJson(json);
}
