class PostException implements Exception {
  final String message;

  PostException(this.message);

  @override
  String toString() {
    return message;
  }
}
