import 'package:shopping_app/shopping_app_library.dart';

class GroceryItem {
  final String id;
  final String name;
  final int quantity;
  final Category category;

  const GroceryItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.category,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroceryItem &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          quantity == other.quantity &&
          category == other.category;

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ quantity.hashCode ^ category.hashCode;

  @override
  String toString() {
    return 'GroceryItem{'
        'id: $id, '
        'name: $name, '
        'quantity: $quantity, '
        'category: $category}';
  }
}
