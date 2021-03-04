class AdsException implements Exception {
  final String message;

  AdsException(this.message);

  @override
  String toString() {
    return message;
  }
}
