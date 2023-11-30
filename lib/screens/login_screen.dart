import 'package:flutter/material.dart';
import 'package:live_chat/common/ReusableButton.dart';
import 'package:live_chat/constants.dart';

import '../common/ReusableTextField.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            ReusableTextField(
              Text: "E-mail",
              TextColor: Colors.black.withOpacity(0.5),
              BorderColor: kColor2,
              FoucusColor: kColor2,
            ),
            SizedBox(
              height: 8.0,
            ),
            ReusableTextField(
              Text: "Password",
              TextColor: Colors.black.withOpacity(0.5),
              BorderColor: kColor2,
              FoucusColor: kColor2,
            ),
            SizedBox(
              height: 24.0,
            ),

            //Log in Button
            ReusableButton(
                onPressed: () {}, ButtonText: "Log in", ButtonColor: kColor2)
          ],
        ),
      ),
    );
  }
}
