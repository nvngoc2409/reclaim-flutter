import 'package:meta/meta.dart';
import 'package:reclaim/example/data/data_sources/example_rest_data_source.dart';
import 'package:reclaim/example/data/models/example_data.dart';

class ExampleRepository {
  ExampleRepository({
    required this.exampleFeatureRestDataSource,
  });

  @visibleForTesting
  final ExampleRestDataSource exampleFeatureRestDataSource;

  Future<List<ExampleData>> getMostStarredGithubRepos() async {
    final apiResponse = await exampleFeatureRestDataSource.getMostStarredGithubRepos();
    return apiResponse.items;
  }
}
