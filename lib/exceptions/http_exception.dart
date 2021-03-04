class HttpException implements Exception {
  final String message;

  HttpException({this.message = '서버로부터 데이터를 받지 못했습니다'});

  @override
  String toString() {
    return message;
  }
}
