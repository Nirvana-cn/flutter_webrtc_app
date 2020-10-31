import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

Dio dio;

class DioBuilder {
  BaseOptions options;

  String _protocol = "http";

  // 请求基地址，一般为域名，可以包含路径
  String _baseUrl = "localhost";

  Map<String, dynamic> _headers = {};

  // 连接服务器超时时间，单位是毫秒
  int _connectTimeout = 8 * 1000;

  // 代理设置
  String _proxyHost = "";
  String _proxyPort = "";

  List<Interceptor> _interceptors = [];

  DioBuilder setBaseUrl(String baseUrl) {
    _baseUrl = baseUrl;
    return this;
  }

  DioBuilder setHeaders(Map<String, dynamic> headers) {
    headers.forEach((String key, dynamic value) {
      _headers[key] = value;
    });
    return this;
  }

  DioBuilder setConnectTimeout(int connectTimeout) {
    _connectTimeout = connectTimeout;
    return this;
  }

  DioBuilder addInterceptor(Interceptor interceptor) {
    _interceptors.add(interceptor);
    return this;
  }

  DioBuilder addProxy(String proxyHost, String proxyPort) {
    _proxyHost = proxyHost;
    _proxyPort = proxyPort;
    return this;
  }

  build() {
    options = BaseOptions(
      baseUrl: "$_protocol://$_baseUrl",
      connectTimeout: _connectTimeout,

      /// [如果返回数据是json(content-type)，dio默认会自动将数据转为json，无需再手动转](https://github.com/flutterchina/dio/issues/30)
      responseType: ResponseType.plain,

      ///  响应流上前后两次接受到数据的间隔，单位为毫秒。如果两次间隔超过[receiveTimeout]，
      ///  [Dio] 将会抛出一个[DioErrorType.RECEIVE_TIMEOUT]的异常.
      ///  注意: 这并不是接收数据的总时限.
      receiveTimeout: 3000,
      headers: _headers,
    );
    dio = new Dio(options);

    if (_proxyPort.isNotEmpty && _proxyPort.isNotEmpty) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
        client.findProxy = (uri) {
          //proxy all request to localhost:8888
          return "PROXY $_proxyHost:$_proxyPort";
        };
      };
    }

    _interceptors.forEach((Interceptor interceptor) {
      dio.interceptors.add(interceptor);
    });
  }
}
