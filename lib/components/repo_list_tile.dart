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
      title: Text(
        repo.name,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(repo.owner.login),
      trailing: _createTrailing(),
      onTap: () {
      },
    );
  }

  Row _createTrailing() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(repo.stars.toString()),
        const SizedBox(width: 4),
        Icon(Icons.star),
      ],
    );
  }
}
