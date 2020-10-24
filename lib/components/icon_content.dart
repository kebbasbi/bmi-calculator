import 'package:flutter/material.dart';

import '../constants.dart';

class CardIcon extends StatelessWidget {
  final String label;
  final IconData icon;

  CardIcon({this.label, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: kIconSize,
        ),
        SizedBox(
          height: kIconVerticalSpace,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
