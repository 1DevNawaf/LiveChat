import 'package:flutter/material.dart';

class ReusableEmailTextField extends StatelessWidget {
  const ReusableEmailTextField({
    super.key,
    required this.Text,
    required this.TextColor,
    required this.BorderColor,
    required this.FoucusColor,
    required this.onChanged,
  });

  final String Text;
  final Color TextColor;
  final Color BorderColor;
  final Color FoucusColor;
  final dynamic onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      keyboardType: TextInputType.emailAddress,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: Text,
        hintStyle: TextStyle(
          color: TextColor,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: BorderColor, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: FoucusColor, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}
