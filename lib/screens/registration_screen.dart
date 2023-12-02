import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:live_chat/common/ReusableButton.dart';
import 'package:live_chat/common/ReusableEmailTextField.dart';
import 'package:live_chat/constants.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../common/ReusablePasswordTextField.dart';
import 'chat_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = "registration_screen";

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  //firebase authentication variable
  final _auth = FirebaseAuth.instance;

  late String email;
  late String reEmail;
  late String password;
  bool spinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: Padding(
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
                  email = value;
                },
              ),

              SizedBox(
                height: 8.0,
              ),

              //Re-enter email field
              ReusableEmailTextField(
                Text: "Re-enter Your E-mail",
                TextColor: Colors.black.withOpacity(0.5),
                BorderColor: kColor1,
                FoucusColor: kColor1,
                onChanged: (value) {
                  reEmail = value;
                },
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
                onPressed: () async {
                  setState(() {
                    spinner = true;
                  });

                  //creating a user
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email, password: password);

                  if (newUser != null && reEmail == email) {
                    Navigator.pushNamed(context, ChatScreen.id);
                  }

                  setState(() {
                    spinner = false;
                  });
                },
                ButtonText: "Register",
                ButtonColor: kColor1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
