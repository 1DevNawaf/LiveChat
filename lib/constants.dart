import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kWelcomeScreenTextStyle =
    TextStyle(fontSize: 45.0, fontWeight: FontWeight.w900, color: kColor1);

const kBackgroundColor = Color(0xffFFF8DE);

const kColor1 = Color(0xff243B3B);

const kColor2 = Color(0xffE1C97D);
