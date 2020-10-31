import 'package:json_annotation/json_annotation.dart';

part 'bool_result.g.dart';

@JsonSerializable()
class BoolResult {
  bool result;

  BoolResult(this.result);

  factory BoolResult.fromJson(Map<String, dynamic> json) => _$BoolResultFromJson(json);
  Map<String, dynamic> toJson() => _$BoolResultToJson(this);

}