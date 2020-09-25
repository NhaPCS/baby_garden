class Response<D extends dynamic> {
  String message;
  dynamic errorId;
  D data;

  Response({this.message, this.errorId, this.data});

  bool isSuccess() {
    return data != null && (errorId == 200);
  }
}
