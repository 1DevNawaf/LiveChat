import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:live_chat/common/ReusableButton.dart';
import 'package:live_chat/constants.dart';

import '../common/ReusableEmailTextField.dart';
import '../common/ReusablePasswordTextField.dart';
import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;

  late String email;
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
                email = value;
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
                onPressed: () async {
                  print(email);
                  print(password);

                  try {
                    //sign in with email and password
                    final testUser = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);

                    //check if the credentials are correct
                    if (testUser != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                ButtonText: "Log in",
                ButtonColor: kColor2)
          ],
        ),
      ),
    );
  }
}
