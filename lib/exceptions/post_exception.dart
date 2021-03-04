class PostException implements Exception {
  final String message;

  PostException({this.message = '포스트를 출력하는데 문제가 생겼습니다'});

  @override
  String toString() {
    return message;
  }
}
