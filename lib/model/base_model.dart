import 'package:json_annotation/json_annotation.dart';

part 'base_model.g.dart';

@JsonSerializable(nullable: false)
class BaseModel {
  String code;
  String description;
  BoolResult data;

  BaseModel(this.code, this.description, this.data);

  factory BaseModel.fromJson(Map<String, dynamic> json) => _$BaseModelFromJson(json);
  Map<String, dynamic> toJson() => _$BaseModelToJson(this);
}

@JsonSerializable(nullable: false)
class BoolResult {
  bool result;

  BoolResult(this.result);

  factory BoolResult.fromJson(Map<String, dynamic> json) => _$BoolResultFromJson(json);
  Map<String, dynamic> toJson() => _$BoolResultToJson(this);

}