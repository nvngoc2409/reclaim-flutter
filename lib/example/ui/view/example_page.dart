import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reclaim/app/app.dart';
import 'package:reclaim/example/example.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});

  static const routeName = 'example';

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  final ExampleCubit _bloc = getIt<ExampleCubit>();

  @override
  void initState() {
    super.initState();
    _bloc.load();
  }

  @override
  Widget build(BuildContext context) {
    return ReclaimScaffold(
      appBar: const ReclaimAppBar(
        title: 'Example',
        subTitle: 'W',
      ),
      body: BlocBuilder<ExampleCubit, ExampleState>(
        bloc: _bloc,
        builder: (context, state) {
          return switch (state) {
            ExampleStateLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
            ExampleStateSuccess(:final mostStarredGithubRepositories) => GithubRepositoriesList(
              mostStarredRepositories: mostStarredGithubRepositories,
            ),
            ExampleStateError() => const Center(
              child: Text('Error'),
            ),
          };
        },
      ),
    );
  }
}

class GithubRepositoriesList extends StatelessWidget {
  const GithubRepositoriesList({
    required this.mostStarredRepositories,
    super.key,
  });

  final List<ExampleData> mostStarredRepositories;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListView.separated(
      itemCount: mostStarredRepositories.length,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      itemBuilder: (context, index) {
        final repository = mostStarredRepositories[index];
        final child = ListTile(
          title: Text(repository.fullName),
          subtitle: Row(
            children: [
              const Icon(Icons.star),
              const SizedBox(width: ReclaimSpacing.normal),
              Text(
                '${repository.starCount}',
                style: textTheme.bodyLarge,
              ),
            ],
          ),
        );
        switch (index % 4) {
          case 1:
            return ReclaimCard.green(
              child: child,
              onTap: () {},
            );
          case 2:
            return ReclaimCard.yellow(
              child: child,
              onTap: () {},
            );
          case 3:
            return ReclaimCard.lavender(
              child: child,
              onTap: () {},
            );
          default:
            return ReclaimCard(
              child: child,
              onTap: () {},
            );
        }
      },
      separatorBuilder: (_, index) => const SizedBox(height: ReclaimSpacing.normal),
    );
  }
}
