import 'dart:convert';
import 'package:flutter_redux_boilerplate/models/github_repo_result.dart';
import 'package:flutter_redux_boilerplate/models/repo.dart';
import 'package:http/http.dart' as http;

class GithubWebClient {
  const GithubWebClient();

  Future<GithubRepoResult> fetchRepoResult(String query) async {
    final response = await http
        .get('https://api.github.com/search/repositories?q=$query&sort=stars');

    var githubRepoResultJson = json.decode(response.body);

    if (response.statusCode == 200) {
      return GithubRepoResult.fromJson(githubRepoResultJson);
    } else {
      throw Exception('Failed to load repos');
    }
  }

  Future<List<Repo>> fetchRepos(String query) async {
    final response = await http
        .get('https://api.github.com/search/repositories?q=$query&sort=stars');

    var list = json.decode(response.body)['items'] as List;

    if (response.statusCode == 200) {
      List<Repo> repos = list.map((repo) {
        return Repo.fromJson(repo);
      }).toList();

      return repos;
    } else {
      throw Exception('Failed to load repos');
    }
  }
}
