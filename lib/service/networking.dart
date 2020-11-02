import 'dart:convert';

import 'package:http/http.dart';

class NetworkHelper {
  NetworkHelper(this.url);

  final url;

  Map<String, String> headers = {
    "Accept": "application/json",
    "Content-Type": "application/json"
  };

  Future getBMI(jwt) async {
    headers["Authorization"] = 'Bearer ' + jwt;
    Response res = await get(url, headers: headers);
    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } else {
      print(res.statusCode);
    }
  }

  Future<int> addBMI(bmi) async {
    headers["Authorization"] = 'Bearer ' + bmi["jwt"];
    Response res = await post(url, body: json.encode(bmi), headers: headers);
    print(res.body);
    return res.statusCode;
  }

  Future getUser() async {
    Response res = await get(url, headers: headers);
    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } else {
      print(res.statusCode);
    }
  }

  Future login(user) async {
    Response res = await post(url, body: json.encode(user), headers: headers);
    var responseData = Map();

    switch (res.statusCode) {
      case 200:
        {
          var data = jsonDecode(res.body);
          responseData["status"] = 200;
          responseData["jwt"] = data["access_token"];
        }
        break;

      case 400:
        {
          var data = jsonDecode(res.body);
          responseData["status"] = 400;
          responseData["error"] = data["msg"];
        }
        break;
      case 401:
        {
          var data = jsonDecode(res.body);
          responseData["status"] = 401;
          responseData["error"] = data["msg"];
        }
        break;

      case 500:
        {
          responseData["status"] = 500;
          responseData["error"] =
              "Unable to login due to server error, please try again later";
        }
        break;

      default:
        {
          responseData["status"] = res.statusCode;
          responseData["error"] =
              "Unable to login due to server error, please try again later";
          print(res.statusCode);
        }
        break;
    }
    return responseData;
  }

  Future<int> signUp(user) async {
    Response res = await post(url, body: json.encode(user), headers: headers);
    print(res.statusCode);
    return res.statusCode;
  }
}
