import 'dart:convert';

import 'package:flutter_redux_boilerplate/models/repo.dart';
import 'package:http/http.dart';

class GithubApi {
  static Client client = Client();

  static Future<List<Repo>> fetchRepos(String query) async {
    final response = await client.get('https://api.github.com/search/repositories?q=$query&sort=stars');

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