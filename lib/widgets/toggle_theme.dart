import 'package:ecommerce_app/services/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ToggleThemeWidget extends StatelessWidget {
  const ToggleThemeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeprovider = Provider.of<ThemeProvider>(context);
    final provider = Provider.of<ThemeProvider>(context, listen: false);
    return Switch.adaptive(
      activeColor: Color(0xffFFCB11),
      value: themeprovider.isDarkMode,
      onChanged: (value) {
        provider.toggleTheme(value);
      },
    );
  }
}
