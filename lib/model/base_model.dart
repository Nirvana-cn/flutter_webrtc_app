class BaseModel {
  bool result;

  BaseModel({this.result});

  factory BaseModel.fromJson(Map<String, dynamic> json) {
    return BaseModel(result: json['result']);
  }
}