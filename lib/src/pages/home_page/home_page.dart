import 'package:shopping_app/shopping_app_library.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final List<GroceryItem> _groceryItems = [];
  bool _isLoading = true;
  String _exceptionMessage = '';

  void _addItem() async {
    try {
      final newItem = await Navigator.of(context).push<GroceryItem>(
        MaterialPageRoute(
          builder: (ctx) => const NewItem(),
        ),
      );
      if (newItem != null) {
        setState(() {
          _groceryItems.add(newItem);
        });
      }
    } on UrlParseException catch (e) {
      setState(() {
        _exceptionMessage = e.message;
      });
    } on HttpStatusCodeException catch (e) {
      setState(() {
        _exceptionMessage = e.message;
      });
    } on HttpRequestException catch (e) {
      setState(() {
        _exceptionMessage = e.message;
      });
    }
  }

  void _makeRequest() async {
    try {
      final controller = ref.read(controllerProvider);
      final result = await controller.get();
      if (result != null) {
        setState(() {
          _groceryItems.clear();
          _groceryItems.addAll(result);
          _isLoading = false;
        });
      }
    } on UrlParseException catch (e) {
      setState(() {
        _exceptionMessage = e.message;
        _isLoading = false;
      });
    } on HttpStatusCodeException catch (e) {
      setState(() {
        _exceptionMessage = e.message;
        _isLoading = false;
      });
    } on HttpRequestException catch (e) {
      setState(() {
        _exceptionMessage = e.message;
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    _makeRequest();
    super.initState();
  }

  void _removeItem(GroceryItem item) async {
    final controller = ref.read(controllerProvider);
    int index = _groceryItems.indexOf(item);
    setState(() {
      _groceryItems.remove(item);
    });
    try {
      final isDeleted =
          await controller.delete("/shopping-list/${item.id}.json");
      print(isDeleted);
      if (!isDeleted) {
        _groceryItems.insert(index, item);
      }
    } on UrlParseException catch (e) {
      _exceptionMessage = e.message;
    } on HttpStatusCodeException catch (e) {
      _exceptionMessage = e.message;
    } on HttpRequestException catch (e) {
      _exceptionMessage = e.message;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: Text(_exceptionMessage.isEmpty
          ? "No items found! Try to add some!"
          : _exceptionMessage),
    );
    if (_isLoading) {
      mainContent = const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_groceryItems.isNotEmpty) {
      mainContent = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: ValueKey(_groceryItems[index].id),
            child: ShopItem(
              groceryItem: _groceryItems[index],
            ),
            onDismissed: (direction) {
              _removeItem(_groceryItems[index]);
            },
          );
        },
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Groceries"),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: mainContent,
    );
  }
}
