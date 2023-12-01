import 'package:flutter/material.dart';
import 'package:live_chat/common/ReusableButton.dart';
import 'package:live_chat/constants.dart';

import '../common/ReusableEmailTextField.dart';
import '../common/ReusablePasswordTextField.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String Email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: "logo",
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            ReusableEmailTextField(
              Text: "E-mail",
              TextColor: Colors.black.withOpacity(0.5),
              BorderColor: kColor2,
              FoucusColor: kColor2,
              onChanged: (value) {
                Email = value;
              },
            ),
            SizedBox(
              height: 8.0,
            ),
            ReusablePasswordTextField(
              Text: "Password",
              TextColor: Colors.black.withOpacity(0.5),
              BorderColor: kColor2,
              FoucusColor: kColor2,
              onChanged: (value) {
                password = value;
              },
            ),
            SizedBox(
              height: 24.0,
            ),

            //Log in Button
            ReusableButton(
                onPressed: () {
                  print(Email);
                  print(password);
                },
                ButtonText: "Log in",
                ButtonColor: kColor2)
          ],
        ),
      ),
    );
  }
}
