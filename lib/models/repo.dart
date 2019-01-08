import 'package:flutter_redux_boilerplate/models/owner.dart';

/// This is an individual repo information.
/// 
/// See this link for an example: [https://api.github.com/search/repositories?q=python&sort=stars]
class Repo {
  final String name;
  final Owner owner;
  final int stars;

  Repo({
    this.name,
    this.owner,
    this.stars,
  });

  factory Repo.fromJson(Map<String, dynamic> json) {
    return Repo(
      name: json['name'],
      owner: Owner.fromJson(json['owner']),
      stars: json['stargazers_count'],
    );
  }
}