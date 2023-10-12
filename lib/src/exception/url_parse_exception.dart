class UrlParseException implements Exception {
  const UrlParseException(String message) : _message = message;

  final String _message;

  String get message => _message;
}