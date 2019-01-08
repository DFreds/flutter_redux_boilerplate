class OwnerDetailsResult {
  final String login;
  final String name;
  final String location;
  final int publicRepos;
  final int followers;
  final int following;

  OwnerDetailsResult({
    this.login,
    this.name,
    this.location,
    this.publicRepos,
    this.followers,
    this.following,
  });

  factory OwnerDetailsResult.fromJson(Map<String, dynamic> json) {
    return OwnerDetailsResult(
      login: json['login'],
      name: json['name'],
      location: json['location'],
      publicRepos: json['public_repos'],
      followers: json['followers'],
      following: json['following'],
    );
  }
}