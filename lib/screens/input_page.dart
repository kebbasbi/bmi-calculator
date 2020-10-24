import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../calculator_brain.dart';
import '../components/icon_content.dart';
import '../components/reusable_button.dart';
import '../constants.dart';

enum Gender { FEMALE, MALE }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                        selectedGender == Gender.MALE
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        childCard: CardIcon(
                            label: "MALE", icon: FontAwesomeIcons.mars),
                        onPress: () => setState(() {
                              selectedGender = Gender.MALE;
                            })),
                  ),
                  Expanded(
                    child: ReusableCard(
                        selectedGender == Gender.FEMALE
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        childCard: CardIcon(
                            label: "FEMALE", icon: FontAwesomeIcons.venus),
                        onPress: () => setState(() {
                              selectedGender = Gender.FEMALE;
                            })),
                  ),
                ],
              ),
            ),
            Expanded(
                child: ReusableCard(
              kActiveCardColor,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "HEIGHT",
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(), style: kNumberTextStyle),
                      Text("cm", style: kLabelTextStyle)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbColor: Color(0xFFEB1555),
                        activeTrackColor: Colors.white,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayColor: Color(0x29EB1555),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        // activeColor: Color(0xFFEB1555),
                        // activeColor: Colors.white,
                        onChanged: (double newValue) =>
                            setState(() => {height = newValue.round()})),
                  )
                ],
              ),
            )),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      kActiveCardColor,
                      childCard: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundActionButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPress: () => setState(() => weight--)),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundActionButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPress: () => setState(() => weight++))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      kActiveCardColor,
                      childCard: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundActionButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPress: () => setState(() => age--)),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundActionButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPress: () => setState(() => age++))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BMIButton(
              text: "CALCULATE",
              onPress: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);
                String result = calc.calculateBM();

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShowResult(
                        bmiResult: result,
                        resultText: calc.getResult(),
                        interpretation: calc.getInterpretation(),
                      ),
                    ));
              },
            )
          ],
        ));
  }
}

class RoundActionButton extends StatelessWidget {
  final IconData icon;
  final Function onPress;

  RoundActionButton({this.icon, this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPress,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      //elevation: 6.0,
      elevation: 0.0,
      // shape: CircleBorder(),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
