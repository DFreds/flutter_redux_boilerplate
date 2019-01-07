import 'package:flutter/material.dart';
import 'package:flutter_redux_boilerplate/containers/repo_list.dart';
import 'package:flutter_redux_boilerplate/containers/search_field.dart';

class RepoListScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SearchField(),
          Expanded(child: RepoList()),
        ],
      ),
    );
  }
}
