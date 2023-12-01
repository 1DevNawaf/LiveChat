import 'package:flutter/material.dart';
import 'package:live_chat/common/ReusableButton.dart';
import 'package:live_chat/common/ReusableEmailTextField.dart';
import 'package:live_chat/constants.dart';

import '../common/ReusablePasswordTextField.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = "registration_screen";

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
                height: 125.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),

            //email field
            ReusableEmailTextField(
              Text: "Enter Your E-mail",
              TextColor: Colors.black.withOpacity(0.5),
              BorderColor: kColor1,
              FoucusColor: kColor1,
              onChanged: (value) {
                Email = value;
              },
            ),
            SizedBox(
              height: 8.0,
            ),
            SizedBox(
              height: 8.0,
            ),
            //password field
            ReusablePasswordTextField(
              Text: "Enter Your Password",
              TextColor: Colors.black.withOpacity(0.5),
              BorderColor: kColor1,
              FoucusColor: kColor1,
              onChanged: (value) {
                password = value;
              },
            ),
            SizedBox(
              height: 24.0,
            ),

            //register button
            ReusableButton(
              onPressed: () {
                print(Email);
                print(password);
              },
              ButtonText: "Register",
              ButtonColor: kColor1,
            )
          ],
        ),
      ),
    );
  }
}
