import 'package:bmi_calculator/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFFF0A0E21),
          scaffoldBackgroundColor: Color(0xFFF0A0E21)),
      home: LoginScreen(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => LoginPage(),
      //   '/input': (context) => InputPage(),
      //   '/result': (context) => ShowResult()
      // },
    );
  }
}
