import 'package:ecommerce_app/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/bottom_bar.dart';
import 'provider/provider_cart.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
      ],
      builder: (context, _) {
        final themeprovider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeprovider.themeMode,
          darkTheme: MyThemes.darktheme,
          theme: MyThemes.lighttheme,
          home: const BottomBar(),
        );
      },
    );
  }
}
