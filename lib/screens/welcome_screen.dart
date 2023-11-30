import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:live_chat/common.dart';
import 'package:live_chat/constants.dart';
import 'package:live_chat/screens/login_screen.dart';
import 'package:live_chat/screens/registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = "welcome_screen";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  //Animation property and values
  late AnimationController controller;
  //animation style
  late Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });

    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  //the tag is like an id for the image to be transitioned between screens
                  tag: "logo",
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 150,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    RotateAnimatedText(
                      "Live",
                      textStyle: kWelcomeScreenTextStyle,
                      duration: Duration(milliseconds: 1250),
                    ),
                    RotateAnimatedText("Chat",
                        textStyle: kWelcomeScreenTextStyle,
                        duration: Duration(milliseconds: 1250)),
                    TypewriterAnimatedText(
                      "Live\nChat",
                      speed: Duration(milliseconds: 150),
                      textStyle: kWelcomeScreenTextStyle,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            kReusableButton(
              ButtonText: "Log In",
              ButtonColor: Colors.lightBlue,
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            kReusableButton(
              ButtonText: "Register",
              ButtonColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
