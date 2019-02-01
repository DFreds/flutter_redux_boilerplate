import 'package:flutter/material.dart';

class PartialBoldText extends StatelessWidget {
  final String boldText;
  final String normalText;
  final String defaultText;

  PartialBoldText({
    Key key,
    @required this.boldText,
    this.normalText,
    this.defaultText = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: boldText,
          style: Theme.of(context).textTheme.body2,
        ),
        TextSpan(
          text: normalText ?? defaultText,
          style: Theme.of(context).textTheme.body1,
        ),
      ]),
    );
  }
}
