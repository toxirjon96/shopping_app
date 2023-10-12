import 'package:shopping_app/shopping_app_library.dart';

class MainRequestController<T> {
  MainRequestController({
    required this.baseUrl,
    required this.repository,
  }) {
    try {
      Uri.parse(baseUrl);
    } catch (e) {
      throw const UrlParseException("Given url is not valid!");
    }
  }

  final HttpRequestRepository repository;
  final String baseUrl;

  Future<String?> post(
    String path, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    try {
      Uri url = Uri.parse(baseUrl + path);
      Response response = await repository.request(
        url,
        method: Method.post,
        headers: headers,
        body: body,
        encoding: encoding,
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return jsonDecode(response.body)["name"] as String;
      } else {
        throw HttpStatusCodeException(
            "Request returns ${response.statusCode}!");
      }
    } catch (e, stackTrace) {
      if (e is HttpRequestException) {
        rethrow;
      }
      throw const UrlParseException("Given path is not valid!");
    }
  }

  Future<List<GroceryItem>?> get() async {
    try {
      Uri url = Uri.parse("$baseUrl/shopping-list.json");
      Response response = await repository.request(url);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final List<GroceryItem> loadingItems = [];
        if (response.body.toLowerCase() == "null"){
          return loadingItems;
        }
        final Map<String, Object?> result = jsonDecode(response.body);
        for (final item in result.entries) {
          Map<String, Object?> json = item.value as Map<String, Object?>;
          final category = categories.entries.firstWhere(
            (e) => e.value.title == json['category'] as String,
          );
          loadingItems.add(
            GroceryItem(
              id: item.key,
              name: json["name"] as String,
              quantity: json["quantity"] as int,
              category: category.value,
            ),
          );
        }
        return loadingItems;
      } else {
        throw HttpStatusCodeException(
            "Request returns ${response.statusCode}!");
      }
    } catch (e, stackTrace) {
      if (e is HttpRequestException) {
        rethrow;
      }
      throw const UrlParseException("Given path is not valid!");
    }
  }

  Future<bool> delete(String path) async {
    try {
      Uri url = Uri.parse(baseUrl + path);
      Response response = await repository.request(
        url,
        method: Method.delete,
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else {
        throw HttpStatusCodeException(
            "Request returns ${response.statusCode}!");
      }
    } catch (e, stackTrace) {
      if (e is HttpRequestException) {
        rethrow;
      }
      throw const UrlParseException("Given path is not valid!");
    }
  }
}
