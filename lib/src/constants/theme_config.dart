import 'package:shopping_app/shopping_app_library.dart';

abstract class ThemeConfig {
  static ThemeData get mainTheme {
    return ThemeData.dark().copyWith(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 147, 229, 250),
        brightness: Brightness.dark,
        surface: const Color.fromARGB(255, 42, 51, 59),
      ),
      scaffoldBackgroundColor: const Color.fromARGB(255, 50, 58, 60),
    );
  }
}
