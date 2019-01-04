import 'package:flutter/material.dart';
import 'package:flutter_redux_boilerplate/models/repo.dart';

class RepoListTile extends StatelessWidget {
  final Repo repo;

  const RepoListTile({
    @required this.repo,
  }) : assert(repo != null);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(repo.name),
      trailing: Text(repo.stars.toString()),
    );
  }
}
