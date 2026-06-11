import 'package:meta/meta.dart';
import 'package:reclaim/auth/data/repositories/user_repository.dart';

class SplashRepository {
  SplashRepository({
    required this.userRepository,
  });

  @visibleForTesting
  final UserRepository userRepository;

  Future<void> init() async {
    await userRepository.init();
    // TODO(init): Init other repositories here.
  }
}
