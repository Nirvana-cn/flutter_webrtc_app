// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseModel _$BaseModelFromJson(Map<String, dynamic> json) {
  return BaseModel(
    json['code'] as String,
    json['description'] as String,
    BoolResult.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BaseModelToJson(BaseModel instance) => <String, dynamic>{
      'code': instance.code,
      'description': instance.description,
      'data': instance.data,
    };

BoolResult _$BoolResultFromJson(Map<String, dynamic> json) {
  return BoolResult(
    json['result'] as bool,
  );
}

Map<String, dynamic> _$BoolResultToJson(BoolResult instance) =>
    <String, dynamic>{
      'result': instance.result,
    };
