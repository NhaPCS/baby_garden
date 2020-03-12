class Response {
  String message;
  dynamic errorId;
  dynamic data;

  Response({this.message, this.errorId, this.data});

  bool isSuccess() {
    return errorId != null && errorId == 200;
  }
}
