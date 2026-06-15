import 'package:meta/meta.dart';
import 'package:reclaim/app/app.dart';
import 'package:reclaim/onboarding/data/models/onboarding_question.dart';

class OnboardingRepository {
  OnboardingRepository({required this.localStorageDataSource});

  @visibleForTesting
  final LocalStorageDataSource localStorageDataSource;

  Future<bool> isOnboardingDone() async {
    return await localStorageDataSource.read(StorageKey.isOnboardingDone) == 'true';
  }

  Future<void> saveOnboardingDone() async {
    await localStorageDataSource.write(key: StorageKey.isOnboardingDone, value: 'true');
  }

  List<OnboardingQuestion> get onboardingQuestions => _onboardingQuestion;
}

const _onboardingQuestion = [
  OnboardingQuestion(
    questionTitle: "Most nights, what's hardest for you?",
    answers: [
      'Falling asleep at the start',
      'Waking up in the middle of the night',
      'Waking up way too early',
      'It changes a lot',
    ],
  ),
  OnboardingQuestion(
    questionTitle: 'When sleep is hard, what feels strongest?',
    answers: [
      "My mind won't shut off",
      'My body feels restless or uncomfortable',
      'I feel hot or sweaty',
      'I just never feel sleepy at bedtime',
      "I'm not sure, I just need help",
    ],
  ),
  OnboardingQuestion(
    questionTitle: 'Have you noticed any changes in your cycle or hormones?',
    answers: [
      'My periods are still regular — no major changes',
      'Things are starting to shift (irregular periods, hot flashes)',
      "I'm past menopause (no period for 12+ months)",
      "I'm not sure",
    ],
  ),
];
