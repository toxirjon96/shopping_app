import 'package:shopping_app/shopping_app_library.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        title: "Grocery App",
        debugShowCheckedModeBanner: false,
        theme: ThemeConfig.mainTheme,
        home: const HomePage(),
      ),
    ),
  );
}
