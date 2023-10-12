class HttpStatusCodeException implements Exception {
  const HttpStatusCodeException(String message) : _message = message;

  final String _message;

  String get message => _message;
}