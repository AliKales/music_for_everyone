import 'package:flutter/material.dart';

class AppColors {
  final bool isDark = false;

  /// Common
  final Color accent1 = const Color(0xFF005C4B);
  final Color accent1Off = const Color.fromARGB(255, 22, 141, 119);
  final Color black = const Color(0xFF000000);
  final Color white = const Color(0xFFFFFFFF);
  final Color fairyBubblegumCloud = const Color(0xFFffeafd);

  Color get blackOrWhite => isDark ? white : black;
  Color get blackOrWhiteReverse => !isDark ? white : black;

  ThemeData toThemeData() {
    /// Create a TextTheme and ColorScheme, that we can use to generate ThemeData
    TextTheme txtTheme =
        (isDark ? ThemeData.dark() : ThemeData.light()).textTheme;

    ColorScheme colorScheme = ColorScheme(
        // Decide how you want to apply your own custom them, to the MaterialApp
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: accent1,
        primaryContainer: accent1,
        secondary: accent1,
        secondaryContainer: accent1,
        background: const Color(0xFFFFFFFF),
        surface: accent1,
        onBackground: Colors.green,
        onSurface: blackOrWhite,
        onError: Colors.white,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        error: Colors.red.shade400);

    /// Now that we have ColorScheme and TextTheme, we can create the ThemeData
    /// Also add on some extra properties that ColorScheme seems to miss
    var t = ThemeData.from(textTheme: txtTheme, colorScheme: colorScheme)
        .copyWith(
            textSelectionTheme: TextSelectionThemeData(cursorColor: accent1),
            highlightColor: accent1,
            useMaterial3: true);

    /// Return the themeData which MaterialApp can now use
    return t;
  }
}
