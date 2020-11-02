import 'package:bmi_calculator/components/already_have_account_check.dart';
import 'package:bmi_calculator/components/rounded_button.dart';
import 'package:bmi_calculator/components/rounded_input_field.dart';
import 'package:bmi_calculator/components/rounded_password_field.dart';
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:bmi_calculator/screens/signup/signup_screen.dart';
import 'package:bmi_calculator/service/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'background.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String email;
  String password;
  String jwt;
  String errorMessage;

  final storage = FlutterSecureStorage();

  void displayDialog(context, title, text) => showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text(title), content: Text(text)),
      );

  Future login() async {
    User user = User(email: email, password: password);
    dynamic response = await user.login();

    if (response["status"] == 200) {
      jwt = response["jwt"];
    } else {
      errorMessage = response["error"];
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            CircleAvatar(
              radius: 70.0,
              backgroundImage: AssetImage('images/bmi.png'),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                email = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                password = value;
              },
            ),
            RoundedButton(
              text: "LOGIN",
              press: () async {
                await login();
                if (jwt != null) {
                  storage.write(key: "jwt", value: jwt);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return InputPage();
                  }));
                } else {
                  print(errorMessage);
                  displayDialog(context, "Error", errorMessage);
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      //return SignUpScreen();
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
