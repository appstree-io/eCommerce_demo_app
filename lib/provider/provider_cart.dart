import 'package:ecommerce_app/model/cart_product_modal.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<CartProduct> _cartProducts = [];
  List<CartProduct> get cartProducts => _cartProducts;

  void addtocart(CartProduct product) {
    _cartProducts.add(product);
    notifyListeners();
  }

  void removefromcart(int id) {
    _cartProducts.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  double get totalAmount {
    var total = 0.0;
    for (var cartProd in _cartProducts) {
      total += cartProd.price * cartProd.qty;
    }
    return total;
  }

  qtyplus(int index) {
    _cartProducts[index] =
        _cartProducts[index].copyWith(qty: _cartProducts[index].qty + 1);
    notifyListeners();

    print(_cartProducts[index].copyWith().qty);
  }

  qtyminus(int index) {
    _cartProducts[index] =
        _cartProducts[index].copyWith(qty: _cartProducts[index].qty - 1);
    notifyListeners();
    print(_cartProducts[index].copyWith().qty);
  }

  int quantity(int index) {
    int quantity;
    return quantity = _cartProducts[index].qty;
  }

  int get totalitems {
    int items = 0;
    for (var cartProd in _cartProducts) {
      items += cartProd.qty;
    }
    return items;
  }

  int get count {
    return _cartProducts.length;
  }
}
