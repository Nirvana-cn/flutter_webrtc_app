import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

enum LoginAction { action, onLogin, onShowSnackBar }

class LoginActionCreator {
  static Action onAction() {
    return const Action(LoginAction.action);
  }

  static Action onLogin(BuildContext context) {
    return Action(LoginAction.onLogin, payload: context);
  }

  static Action onShowSnackBar(ShowSnackBarModel model) {
    return Action(LoginAction.onShowSnackBar, payload: model);
  }
}

class ShowSnackBarModel {
  BuildContext context;
  String text;

  ShowSnackBarModel(this.context, this.text);
}
