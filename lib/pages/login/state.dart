import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class LoginState implements Cloneable<LoginState> {
  TextEditingController controller;

  @override
  LoginState clone() {
    return LoginState()..controller = controller;
  }
}

LoginState initState(Map<String, dynamic> args) {
  return LoginState()..controller = TextEditingController();
}
