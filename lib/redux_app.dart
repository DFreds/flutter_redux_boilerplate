import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/screens/main_screen.dart';
import 'package:redux/redux.dart';

class ReduxApp extends StatelessWidget {
  final Store<AppState> store;
  
  ReduxApp({
    Key key,
    this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) {
            return MainScreen();
          }
        },
      ),
    );
  }
}