import 'package:ecommerce_app/services/provider_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/bottom_bar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black54,
        ),
        home: const BottomBar(),
      ),
    );
  }
}
