import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  Loading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
