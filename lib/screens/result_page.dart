import 'package:bmi_calculator/components/reusable_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ShowResult extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  ShowResult({this.bmiResult, this.interpretation, this.resultText});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFFF0A0E21),
          scaffoldBackgroundColor: Color(0xFFF0A0E21)),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Your Result',
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w700)),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: ReusableCard(
              kActiveCardColor,
              childCard: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resultText,
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 45.0,
                          fontWeight: FontWeight.w900),
                    ),
                    Text(bmiResult, style: kNumberResultTextStyle),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF8D8E98),
                        fontSize: 25.0,
                      ),
                    ),
                  ],
                ),
              ),
            )),
            BMIButton(
              text: "RE-CALCULATE",
              onPress: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  }
}
