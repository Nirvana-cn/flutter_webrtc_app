import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  LoginButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.blueAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: Icon(
        Icons.arrow_forward,
        color: Colors.white,
        size: 40,
      ),
      onPressed: onPressed,
    );
  }
}
