import 'dart:convert';
import 'package:flutter_redux_boilerplate/models/github_repo_result.dart';
import 'package:flutter_redux_boilerplate/models/owner_details_result.dart';
import 'package:http/http.dart' as http;

class GithubWebClient {
  static String baseURL = 'https://api.github.com';

  const GithubWebClient();

  Future<GithubRepoResult> fetchRepoResult(String query) async {
    final response =
        await http.get('$baseURL/search/repositories?q=$query&sort=stars');

    var githubRepoResultJson = json.decode(response.body);

    if (response.statusCode == 200) {
      return GithubRepoResult.fromJson(githubRepoResultJson);
    } else {
      throw Exception('Failed to load repos');
    }
  }

  Future<OwnerDetailsResult> fetchOwnerDetails(String owner) async {
    final response = await http.get('$baseURL/users/$owner');

    var ownerDetailsJson = json.decode(response.body);

    if (response.statusCode == 200) {
      return OwnerDetailsResult.fromJson(ownerDetailsJson);
    } else {
      throw Exception('Failed to load owner details');
    }
  }
}
