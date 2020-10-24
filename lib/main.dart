import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';

import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFFF0A0E21),
          scaffoldBackgroundColor: Color(0xFFF0A0E21)),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/result': (context) => ShowResult()
      },
    );
  }
}
