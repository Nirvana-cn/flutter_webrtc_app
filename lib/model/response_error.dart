class ResponseError implements Exception {
  String errorCode;
  String message;

  ResponseError(this.errorCode, this.message);
}