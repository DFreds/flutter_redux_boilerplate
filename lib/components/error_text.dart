import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  final String error;

  ErrorText({
    Key key,
    this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error),
    );
  }
}
