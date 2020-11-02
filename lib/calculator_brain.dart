import 'dart:math';

class CalculatorBrain {
  int height;
  int weight;
  double _bmi;

  CalculatorBrain({this.height, this.weight});

  String calculateBM() {
    weight = weight ~/ 2.205;
    height = (height * 30.48).toInt();
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getInterpretation() {
    if (_bmi > 25.0) {
      return "You have a higher than normal body weight. More Exercise Please!";
    } else if (_bmi > 18.5) {
      return "You have a normal body weight. Good Job!";
    } else {
      return "You have a lower than normal body weight. More Food Please!";
    }
  }

  double getBMIValue() {
    return double.parse(calculateBM());
  }

  String getResult() {
    if (_bmi > 25.0) {
      return "Overweight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }
}
