import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutterwebrtcapp/base/network/client/client.dart';
import 'package:flutterwebrtcapp/base/network/dio/dio_builder.dart';
import 'package:flutterwebrtcapp/model/base_model.dart';
import 'action.dart';
import 'state.dart';

const EMPTY_USER = "用户名不能为空";
const INVALID_USER = "用户名不存在";
const LOGIN_SUCCESS = "登录成功";

Effect<LoginState> buildEffect() {
  return combineEffects(<Object, Effect<LoginState>>{
    LoginAction.action: _onAction,
    LoginAction.onLogin: _onLogin,
    LoginAction.onShowSnackBar: _onShowSnackBar,
  });
}

void _onAction(Action action, Context<LoginState> ctx) {}

void _onLogin(Action action, Context<LoginState> ctx) async {
  if (ctx.state.controller.text.trim().isEmpty) {
    /// 用户名为空
    ctx.dispatch(LoginActionCreator.onShowSnackBar(ShowSnackBarModel(action.payload, EMPTY_USER)));
  } else {
    Client client = Client(dio);
    BaseModel baseModel = await client.login(ctx.state.controller.text);

    if (baseModel.data.result) {
      /// 登录成功
      ctx.dispatch(LoginActionCreator.onShowSnackBar(ShowSnackBarModel(action.payload, LOGIN_SUCCESS)));
    } else {
      ctx.dispatch(LoginActionCreator.onShowSnackBar(ShowSnackBarModel(action.payload, INVALID_USER)));
    }
  }
}

void _onShowSnackBar(Action action, Context<LoginState> ctx) {
  if (action.payload is ShowSnackBarModel) {
    final snackBar = SnackBar(
      content: Text(action.payload.text, textAlign: TextAlign.center),
      duration: Duration(seconds: 1),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.grey,
      elevation: 0,
    );

    Scaffold.of(action.payload.context).showSnackBar(snackBar);
  }
}
