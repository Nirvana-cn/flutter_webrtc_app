import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class LoggerInterceptor extends Interceptor{
  Logger logger = Logger();

  @override
  Future onRequest(RequestOptions options) {
    logger.d('${options.method} => ${options.uri}');
    logger.d(options.data);
    return super.onRequest(options);
  }

  @override
  Future onError(DioError err) {
    logger.e(err);
    return super.onError(err);
  }

  @override
  Future onResponse(Response response) {
    logger.d(response.data);
    return super.onResponse(response);
  }
}