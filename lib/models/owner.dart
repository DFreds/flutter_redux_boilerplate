/// This is an individual owner.class
///
/// See these links for examples:
/// [https://api.github.com/search/repositories?q=python&sort=stars]
/// [https://api.github.com/users/dfreds]
class Owner {
  final String login;

  Owner({
    this.login,
  });

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      login: json['login'],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Owner &&
          runtimeType == other.runtimeType &&
          login == other.login;

  @override
  int get hashCode => login.hashCode;
}
