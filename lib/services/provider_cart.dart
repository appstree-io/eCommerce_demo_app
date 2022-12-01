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

  double get totalAmount {
    var total = 0.0;
    _cartProd.forEach((cartProd) {
      total += cartProd.price * cartProd.qty;
    });

    return total;
  }

  qtyplus(int index) {
    _cartProd[index] =
        _cartProd[index].copyWith(qty: _cartProd[index].copyWith().qty + 1);
    notifyListeners();

    print(_cartProd[index].copyWith().qty);
  }

  qtyminus(int index) {
    _cartProd[index] =
        _cartProd[index].copyWith(qty: _cartProd[index].copyWith().qty - 1);
    notifyListeners();
    print(_cartProd[index].copyWith().qty);
  }

  int quantity(int index) {
    int quantity;
    return quantity = _cartProd[index].copyWith().qty;
  }

  int get totalitems {
    int items = 0;
    _cartProd.forEach((cartProd) {
      items += cartProd.copyWith().qty;
    });
    return items;
  }

  int get count {
    return _cartProd.length;
  }
}
