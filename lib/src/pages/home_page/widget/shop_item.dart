import 'package:shopping_app/shopping_app_library.dart';

class ShopItem extends StatelessWidget {
  const ShopItem({
    required this.groceryItem,
    super.key,
  });

  final GroceryItem groceryItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 25,
        height: 25,
        color: groceryItem.category.color,
      ),
      title: Text(groceryItem.name),
      trailing: Text("${groceryItem.quantity}"),
    );
  }
}
