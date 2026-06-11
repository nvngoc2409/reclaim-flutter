import 'package:meta/meta.dart';
import 'package:reclaim/auth/auth.dart';

class LogoutUseCase {
  LogoutUseCase({
    required this.userRepository,
  });

  @visibleForTesting
  final UserRepository userRepository;

  Future<void> call() async {
    await userRepository.logout();
    // TODO(init): Clear other data
  }
}
