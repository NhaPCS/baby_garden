class Response {
  int result;
  dynamic error;
  dynamic data;

  Response({this.result, this.error, this.data});

  bool isSuccess() {
    return result != null && result == 1;
  }
}
