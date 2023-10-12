import 'package:shopping_app/shopping_app_library.dart';

class Category {
  const Category(this.title, this.color);

  final String title;
  final Color color;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Category &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          color == other.color;

  @override
  int get hashCode => title.hashCode ^ color.hashCode;

  @override
  String toString() {
    return 'Category{name: $title, color: $color}';
  }
}
