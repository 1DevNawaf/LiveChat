import 'package:flutter/material.dart';
import 'package:live_chat/screens/welcome_screen.dart';

void main() => runApp(LiveChat());

class LiveChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black54),
        ),
      ),
      home: WelcomeScreen(),
    );
  }
}
