class JsonDecodeException implements Exception {
  const JsonDecodeException(String message) : _message = message;

  final String _message;

  String get message => _message;
}