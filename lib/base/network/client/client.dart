import 'package:flutterwebrtcapp/model/base_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'client.g.dart';

@RestApi(baseUrl: "http://192.168.2.102:8080")
abstract class Client {
  factory Client(Dio dio) = _Client;

  /// 获取行程信息
  @GET("/v1/login")
  Future<BaseModel> login(
      @Query("userId") String userId);
}