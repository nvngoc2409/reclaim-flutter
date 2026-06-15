import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reclaim/onboarding/onboarding.dart';
import 'package:reclaim/splash_screen/data/repositories/splash_repository.dart';

part 'splash_cubit.freezed.dart';

@freezed
sealed class SplashState with _$SplashState {
  const factory SplashState.loading() = SplashStateLoading;

  const factory SplashState.loaded({
    required bool isOnboardingDone,
  }) = SplashStateLoaded;
}

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({
    required this.splashRepository,
    required this.onboardingRepository,
  }) : super(const SplashState.loading());

  @visibleForTesting
  final SplashRepository splashRepository;

  @visibleForTesting
  final OnboardingRepository onboardingRepository;

  static const _delayTime = Duration(seconds: 2);

  Future<void> load() async {
    await Future.wait([
      Future.delayed(_delayTime, () {}),
      splashRepository.init(),
    ]);

    final isOnboardingDone = await onboardingRepository.isOnboardingDone();
    emit(SplashState.loaded(isOnboardingDone: isOnboardingDone));
  }
}
