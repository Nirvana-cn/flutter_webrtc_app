import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'common/router.dart';

Widget createApp() {
  final AbstractRoutes routes = PageRoutes(
    pages: router,
    visitor: (String path, Page<Object, dynamic> page) {
      /// 只有特定的范围的 Page 才需要建立和 AppStore 的连接关系
      /// 满足 Page<T> ，T 是 GlobalBaseState 的子类
    },
  );

  return MaterialApp(
    title: 'Fluro',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.blueAccent,
    ),
    home: routes.buildPage('login', null),
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(
        builder: (BuildContext context) {
          return routes.buildPage(settings.name, settings.arguments);
        },
      );
    },
  );
}
