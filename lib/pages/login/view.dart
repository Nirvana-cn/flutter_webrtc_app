import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutterwebrtcapp/widgets/login_button.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(LoginState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Login"),
      centerTitle: true,
    ),
    body: Builder(
      builder: (context) => Center(
        child: Container(
          width: 300,
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "用户名",
                ),
                controller: state.controller,
                textAlign: TextAlign.center,
              ),
              LoginButton(
                onPressed: () {
                  dispatch(LoginActionCreator.onLogin(context));
                },
              )
            ],
          ),
        ),
      ),
    ),
  );
}
