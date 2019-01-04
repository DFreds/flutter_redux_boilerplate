import 'package:flutter_redux_boilerplate/models/repo.dart';

class GithubRepoResult {
  final int totalCount;
  final List<Repo> items;

  GithubRepoResult({
    this.totalCount,
    this.items,
  });

  factory GithubRepoResult.fromJson(Map<String, dynamic> json) {
    return GithubRepoResult(
      totalCount: json['totalCount'],
      items: (json['items'] as List).map((repo) {
        return Repo.fromJson(repo);
      }).toList(),
    );
  }
}