import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'networking.dart';

class BMI {
  BMI(
      {this.id,
      this.weight,
      this.height,
      this.status,
      this.bmi,
      this.userId,
      this.createdDate});

  final int id;
  final int weight;
  final int height;
  final int userId;
  final double bmi;
  final String status;
  final DateTime createdDate;
  int _statusCode;

  String getInterpretation() {
    if (bmi > 25) {
      return "You have a higher than normal body weight. More Exercise Please!";
    } else if (bmi > 18.5) {
      return "You have a normal body weight. Good Job!";
    } else {
      return "You have a lower than normal body weight. More Food Please!";
    }
  }

  //This is for android
  final String url = 'http://10.0.2.2:5000';

  //This is for ios
  //final String url = 'http://localhost:5000';

  //cloud
  //final String url = 'http://kebba.com';

  Future<int> saveBMI() async {
    try {
      NetworkHelper networkHelper = NetworkHelper("$url/bmi");
      print("bmi is: $bmi");
      _statusCode = await networkHelper.addBMI({
        "weight": weight,
        "height": height,
        "bmi": bmi,
        "status": status,
        "jwt": await _getTokenData(),
      });
    } catch (e) {
      print(e);
    }
    return _statusCode;
  }

  Future<List<BMI>> getBMI() async {
    try {
      NetworkHelper networkHelper = NetworkHelper("$url/user/bmi");
      dynamic response = await networkHelper.getBMI(
        await _getTokenData(),
      );
      return toBMI(response);
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<String> _getTokenData() async {
    final storage = FlutterSecureStorage();
    return await storage.read(key: "jwt");
  }

  List<BMI> toBMI(response) {
    List<BMI> bmiList = [];
    for (var res in response) {
      BMI bmi = BMI(
          id: res["id"],
          bmi: res["bmi"],
          createdDate: DateTime.parse(res["bmi_date"]),
          status: res["status"]);
      bmiList.add(bmi);
    }
    bmiList.sort((a, b) => a.id.compareTo(b.id));
    return bmiList;
  }
}
