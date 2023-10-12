import 'package:shopping_app/shopping_app_library.dart';

class HttpRequestService implements HttpRequestRepository {
  @override
  Future<Response> request(
    Uri url, {
    Method method = Method.get,
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) {
    return switch (method) {
      Method.get => get(
          url,
          headers: headers,
        ).timeout(
          const Duration(seconds: 10),
          onTimeout: () => throw const HttpRequestException(
            "Network error! Please check your connection",
          ),
        ),
      Method.post => post(
          url,
          headers: headers,
          body: body,
          encoding: encoding,
        ).timeout(
          const Duration(seconds: 10),
          onTimeout: () => throw const HttpRequestException(
            "Network error! Please check your connection",
          ),
        ),
      Method.put => put(
          url,
          headers: headers,
          body: body,
          encoding: encoding,
        ).timeout(
          const Duration(seconds: 10),
          onTimeout: () => throw const HttpRequestException(
            "Network error! Please check your connection",
          ),
        ),
      Method.patch => patch(
          url,
          headers: headers,
          body: body,
          encoding: encoding,
        ).timeout(
          const Duration(seconds: 10),
          onTimeout: () => throw const HttpRequestException(
            "Network error! Please check your connection",
          ),
        ),
      Method.delete => delete(
          url,
          headers: headers,
          body: body,
          encoding: encoding,
        ).timeout(
          const Duration(seconds: 10),
          onTimeout: () => throw const HttpRequestException(
            "Network error! Please check your connection",
          ),
        ),
    };
  }
}
