// cart_viewmodel.dart
import 'package:flutter/material.dart';
import 'package:shopit/features/products/model/productsmodel.dart';

class CartViewModel with ChangeNotifier {
  final List<Product> _cart = [];

  List<Product> get carts => _cart;
  
  void addToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  void addWithQuantity(Product product, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(product);
    }
    notifyListeners();
  }

  void decreaseWithQuantity(Product product, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.remove(product);
    }
    notifyListeners();
  }
}
