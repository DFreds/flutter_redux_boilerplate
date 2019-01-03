import 'package:flutter/material.dart';
import 'package:flutter_redux_boilerplate/containers/repo_list.dart';
import 'package:flutter_redux_boilerplate/containers/search_field.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _createAppBar(),
      body: Container(
        child: Column(
          children: <Widget>[
            SearchField(),
            Expanded(child: RepoList()),
          ],
        ),
      ),
    );
  }

  AppBar _createAppBar() {
    return AppBar(
      title: Text('Redux App'),
    );
  }
}