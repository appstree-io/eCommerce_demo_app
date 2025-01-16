import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  bool get isDarkMode => themeMode == ThemeMode.dark;
  void toggleTheme(bool isOn) {
    themeMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}

class ButtonTheme {
  static const buttontheme = ButtonThemeData();
}

class MyThemes {
  static final darktheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xff151515),
    primaryColor: Colors.white,
    primaryColorLight: const Color(0xff232327),
    primaryColorDark: const Color(0xffC4C4C4),
    colorScheme:
        const ColorScheme.dark().copyWith(background: const Color(0xff000000)),
    bottomAppBarTheme: const BottomAppBarTheme(color: Color(0xff232327)),
  );

  static final lighttheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xffF5F5F5),
    primaryColor: const Color(0xff000000),
    primaryColorLight: const Color(0xffFFFFFF),
    primaryColorDark: const Color(0xff767575),
    colorScheme:
        const ColorScheme.light().copyWith(background: const Color(0xffEBEBEB)),
    bottomAppBarTheme: const BottomAppBarTheme(color: Color(0xffF5F5F5)),
  );
}
