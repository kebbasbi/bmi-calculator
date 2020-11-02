import 'networking.dart';

class User {
  User({this.id, this.name, this.email, this.password, this.joinedDate});

  final int id;
  final String name;
  final String email;
  final String password;
  final DateTime joinedDate;
  int _statusCode;

  final String _baseUrl = 'http://10.0.2.2:5000/bmi';

  Future<int> registerUser() async {
    try {
      String url = '$_baseUrl/register';
      NetworkHelper networkHelper = NetworkHelper(url);
      _statusCode = await networkHelper
          .signUp({"name": name, "email": email, "password": password});
    } catch (e) {
      print(e);
    }
    return _statusCode;
  }

  Future<dynamic> login() async {
    try {
      String url = '$_baseUrl/login';
      NetworkHelper networkHelper = NetworkHelper(url);
      var userData =
          await networkHelper.login({"email": email, "password": password});
      return userData;
    } catch (e) {
      print(e);
    }
  }
}
