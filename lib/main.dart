import 'package:flutter/material.dart';
import 'package:flutter_redux_boilerplate/redux_app.dart';
import 'package:flutter_redux_boilerplate/store/store.dart';

void main() {
  final store = createStore();
  runApp(ReduxApp(store: store));
}