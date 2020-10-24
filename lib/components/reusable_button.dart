import 'package:flutter/material.dart';

import '../constants.dart';

class BMIButton extends StatelessWidget {
  final String text;
  final Function onPress;

  BMIButton({this.text, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: onPress,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(text, style: kCalculateLabel)],
        ),
      ),
      color: kBottomContainerBgColor,
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.only(bottom: 20.0),
      width: double.infinity,
      height: kBottomMenuHeight,
    );
  }
}
