import 'package:flutter_redux_boilerplate/models/github_repo_result.dart';
import 'package:flutter_redux_boilerplate/services/github_web_client.dart';

class GithubRepository {
  final GithubWebClient githubWebClient;

  const GithubRepository({
    this.githubWebClient = const GithubWebClient(),
  });

  Future<GithubRepoResult> loadRepoResult(String query) async {
    return await githubWebClient.fetchRepoResult(query);
  }
}
