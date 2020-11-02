import 'package:bmi_calculator/screens/historyData.dart';
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final String bmiResult;
  final String resultText;
  final String interpretation;
  _HistoryScreenState({this.bmiResult, this.interpretation, this.resultText});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFFF0A0E21),
          scaffoldBackgroundColor: Color(0xFFF0A0E21)),
      home: Scaffold(
          appBar: AppBar(
            title: Text('BMI History',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700)),
            leading: IconButton(
              icon: const Icon(FontAwesomeIcons.arrowLeft),
              tooltip: 'Home',
              hoverColor: Colors.teal,
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return InputPage();
                }));
              },
            ),
          ),
          body: SafeArea(
            child: HistoryScreen2(),
          )),
    );
  }
}
