import 'package:flutter/material.dart';
import 'package:flutter_redux_boilerplate/containers/repo_list.dart';
import 'package:flutter_redux_boilerplate/containers/search_field.dart';
import 'package:flutter_redux_boilerplate/containers/total_results_text.dart';

class RepoListScreen extends StatelessWidget {
  RepoListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SearchField(),
          TotalResultsText(),
          Expanded(child: RepoList()),
        ],
      ),
    );
  }
}
