import 'package:bmi_calculator/components/already_have_account_check.dart';
import 'package:bmi_calculator/components/rounded_button.dart';
import 'package:bmi_calculator/components/rounded_input_field.dart';
import 'package:bmi_calculator/components/rounded_password_field.dart';
import 'package:bmi_calculator/screens/login/login_screen.dart';
import 'package:bmi_calculator/service/user.dart';
import 'package:flutter/material.dart';

import 'background.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String name;
  String email;
  String password;
  int statusCode;

  void displayDialog(context, title, text) => showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text(title), content: Text(text)),
      );

  Future registerUser() async {
    User user = User(name: name, email: email, password: password);
    statusCode = await user.registerUser();
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
              "REGISTER",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Name",
              onChanged: (value) {
                name = value;
              },
            ),
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
              text: "REGISTER",
              press: () async {
                await registerUser();
                if (statusCode == 201) {
                  displayDialog(context, "Success",
                      "Your account have been created. Log in now.");
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return LoginScreen();
                  }));
                } else {
                  displayDialog(
                      context, "Error", "Unable to create your account");
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      //return SignUpScreen();
                      return LoginScreen();
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
