import 'package:flutter/material.dart';
import 'package:live_chat/common/ReusableButton.dart';
import 'package:live_chat/common/ReusableTextField.dart';
import 'package:live_chat/constants.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = "registration_screen";

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
                height: 125.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),

            //email field
            ReusableTextField(
                Text: "Enter Your E-mail",
                TextColor: Colors.black.withOpacity(0.5),
                BorderColor: kColor1,
                FoucusColor: kColor1),
            SizedBox(
              height: 8.0,
            ),

            //reenter email field
            ReusableTextField(
                Text: "Re-enter Your E-mail",
                TextColor: Colors.black.withOpacity(0.5),
                BorderColor: kColor1,
                FoucusColor: kColor1),
            SizedBox(
              height: 8.0,
            ),

            //password field
            ReusableTextField(
                Text: "Enter Your Password",
                TextColor: Colors.black.withOpacity(0.5),
                BorderColor: kColor1,
                FoucusColor: kColor1),
            SizedBox(
              height: 24.0,
            ),

            //register button
            ReusableButton(
              onPressed: () {},
              ButtonText: "Register",
              ButtonColor: kColor1,
            )
          ],
        ),
      ),
    );
  }
}
