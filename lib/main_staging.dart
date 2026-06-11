import 'package:reclaim/app/app.dart';
import 'package:reclaim/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() async {
    await StagingServiceLocator().setup();
    return const App();
  });
}
