class AdsException implements Exception {
  final String message;

  AdsException({this.message = '광고를 출력하는데 문제가 생겼습니다'});

  @override
  String toString() {
    return message;
  }
}
