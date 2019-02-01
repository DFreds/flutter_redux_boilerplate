import 'package:flutter/material.dart';
import 'package:flutter_redux_boilerplate/containers/bottom_nav.dart';
import 'package:flutter_redux_boilerplate/containers/root_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _createAppBar(),
      body: RootScreen(),
      bottomNavigationBar: BottomNav(),
    );
  }

  AppBar _createAppBar() {
    return AppBar(
      title: Text('Redux App'),
    );
  }
}