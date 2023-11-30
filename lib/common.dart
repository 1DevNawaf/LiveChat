import 'package:flutter/material.dart';

class kReusableButton extends StatelessWidget {
  kReusableButton({
    required this.onPressed,
    required this.ButtonText,
    required this.ButtonColor,
  });

  final VoidCallback onPressed;
  final String ButtonText;
  final Color ButtonColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: ButtonColor,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            ButtonText,
          ),
        ),
      ),
    );
  }
}
