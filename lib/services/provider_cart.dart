import 'dart:collection';
import 'dart:math';
import 'package:ecommerce_app/model/cart_product_modal.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<CartProduct> _cartProd = [];
  List<CartProduct> get cartProd => _cartProd;

  void addtocart(CartProduct cartprods) {
    _cartProd.add(cartprods);
    notifyListeners();
  }

  void removefromcart(int id) {
    _cartProd.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  int get count {
    return _cartProd.length;
  }
}
