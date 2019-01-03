/// This is an individual repo information.
/// 
/// See this link for an example: [https://api.github.com/search/repositories?q=python&sort=stars]
class Repo {
  final String name;
  final int stars;

  Repo({
    this.name,
    this.stars,
  });

  factory Repo.fromJson(Map<String, dynamic> json) {
    return Repo(
      name: json['name'],
      stars: json['stargazers_count'],
    );
  }
}