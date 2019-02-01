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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OwnerDetailsResult &&
          runtimeType == other.runtimeType &&
          login == other.login &&
          name == other.name &&
          location == other.location &&
          publicRepos == other.publicRepos &&
          followers == other.followers &&
          following == other.following;

  @override
  int get hashCode =>
      login.hashCode ^
      name.hashCode ^
      location.hashCode ^
      publicRepos.hashCode ^
      followers.hashCode ^
      following.hashCode;
}
