import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  bool get isDarkMode => themeMode == ThemeMode.dark;
  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class ButtonTheme {
  static final buttontheme = const ButtonThemeData();
}

class MyThemes {
  static final darktheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xff151515),
    primaryColor: Colors.white,
    bottomAppBarColor: const Color(0xff232327),
    backgroundColor: const Color(0xff000000),
    primaryColorLight: const Color(0xff232327),
    selectedRowColor: const Color(0xffC4C4C4),
    primaryColorDark: const Color(0xffC4C4C4),
    colorScheme: const ColorScheme.dark(),
  );

  static final lighttheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xffF5F5F5),
    primaryColor: const Color(0xff000000),
    bottomAppBarColor: const Color(0xffF5F5F5),
    primaryColorLight: const Color(0xffFFFFFF),
    backgroundColor: const Color(0xffEBEBEB),
    selectedRowColor: const Color(0xff000000),
    primaryColorDark: const Color(0xff767575),
    colorScheme: const ColorScheme.light(),
  );
}
