import 'package:dio/dio.dart';
import 'package:flutterwebrtcapp/model/response_error.dart';
import 'package:logger/logger.dart';

class ErrorInterceptor extends Interceptor{
  Logger logger = Logger();

  @override
  Future onRequest(RequestOptions options) {
    return super.onRequest(options);
  }

  @override
  Future onError(DioError err) {
    logger.e(err);
    if(err.error is ResponseError) {
      logger.d(err.error.message);
    }
    return super.onError(err);
  }

  @override
  Future onResponse(Response response) {
    return super.onResponse(response);
  }
}