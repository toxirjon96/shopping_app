import 'package:shopping_app/shopping_app_library.dart';

final controllerProvider = Provider((ref) {
  final controller = MainRequestController<GroceryItem>(
    baseUrl: "https://meals-app-cb524-default-rtdb.firebaseio.com",
    repository: HttpRequestService(),
  );
  return controller;
});
