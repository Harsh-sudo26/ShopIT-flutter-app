import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  void addToCart(Map<String, dynamic> product) {
    // Check if item already exists
    int index = _cartItems.indexWhere((item) => item['id'] == product['id']);

    if (index != -1) {
      _cartItems[index]['quantity'] += 1;
    } else {
      _cartItems.add(product);
    }

    notifyListeners(); // 
  }

  void removeFromCart(int id) {
    _cartItems.removeWhere((item) => item['id'] == id);
    notifyListeners();
  }

  double get totalPrice {
    double total = 0;
    for (var item in _cartItems) {
      total += item['price'] * item['quantity'];
    }
    return total;
  }
}