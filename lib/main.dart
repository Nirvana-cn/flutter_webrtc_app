import 'package:flutter/material.dart';
import 'package:flutterwebrtcapp/app.dart';

import 'base/network/dio/dio_builder.dart';
import 'base/network/interceptor/base_interceptor.dart';
import 'base/network/interceptor/logger_interceptor.dart';

void main() {
  // dio初始化
  DioBuilder()
      .addInterceptor(BaseInterceptor())
      .addInterceptor(LoggerInterceptor())
      .build();

  runApp(createApp());
}
