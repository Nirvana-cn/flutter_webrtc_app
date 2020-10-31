import 'package:dio/dio.dart';
import 'package:flutterwebrtcapp/common/constant.dart';
import 'package:flutterwebrtcapp/model/base_model.dart';
import 'package:flutterwebrtcapp/model/response_error.dart';

class BaseInterceptor extends Interceptor{

  @override
  Future onRequest(RequestOptions options) {
    /// 添加公共请求头
    _addCommonHeaders(options);
    return super.onRequest(options);
  }

  @override
  Future onError(DioError err) {
    return super.onError(err);
  }

  @override
  Future onResponse(Response response) {
    /// 请求成功时替换data值
    if (response.statusCode == Constant.HTTP_SUCCESS) {
      BaseModel baseModel = BaseModel.fromJson(response.data);
      if (baseModel.code == Constant.RESPONSE_SUCCESS) {
        response.data = baseModel.data;
      } else {
        throw (new ResponseError(baseModel.code, baseModel.description));
      }
    }
    return super.onResponse(response);
  }
}



RequestOptions _addCommonHeaders(RequestOptions options) {
  options.headers.addAll({
    "Connection": "keep-alive",
    "Accept-Language": "zh-CN"
  });
  return options;
}