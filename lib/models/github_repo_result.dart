import 'package:flutter_redux_boilerplate/models/repo.dart';

class GithubRepoResult {
  final int totalCount;
  final List<Repo> items;

  GithubRepoResult({
    this.totalCount,
    this.items,
  });

  factory GithubRepoResult.initial() {
    return GithubRepoResult(
      totalCount: 0,
      items: [],
    );
  }

  factory GithubRepoResult.fromJson(Map<String, dynamic> json) {
    return GithubRepoResult(
      totalCount: json['total_count'],
      items: (json['items'] as List).map((repo) {
        return Repo.fromJson(repo);
      }).toList(),
    );
  }
}