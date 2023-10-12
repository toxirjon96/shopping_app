class HttpRequestException implements Exception {
  const HttpRequestException(String message) : _message = message;

  final String _message;

  String get message => _message;
}
