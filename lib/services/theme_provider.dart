import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  bool get isDarkMode => themeMode == ThemeMode.dark;
  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darktheme = ThemeData(
    scaffoldBackgroundColor: Color(0xff151515),
    primaryColor: Colors.white,
    bottomAppBarColor: Color(0xff232327),
    backgroundColor: Color(0xff000000),
    primaryColorLight: Color(0xff232327),
    selectedRowColor: Color(0xffC4C4C4),
    primaryColorDark: Color(0xffC4C4C4),
    colorScheme: ColorScheme.dark(),
  );

  static final lighttheme = ThemeData(
    scaffoldBackgroundColor: Color(0xffF5F5F5),
    primaryColor: Color(0xff000000),
    bottomAppBarColor: Color(0xffF5F5F5),
    primaryColorLight: Color(0xffFFFFFF),
    backgroundColor: Color(0xffEBEBEB),
    selectedRowColor: Color(0xff000000),
    primaryColorDark: Color(0xff767575),
    colorScheme: ColorScheme.light(),
  );
}
