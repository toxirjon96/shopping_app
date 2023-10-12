import 'package:shopping_app/shopping_app_library.dart';

enum Method {
  get,
  post,
  put,
  patch,
  delete,
}

abstract interface class HttpRequestRepository {
  Future<Response> request(
    Uri url, {
    Method method = Method.get,
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  });
}
