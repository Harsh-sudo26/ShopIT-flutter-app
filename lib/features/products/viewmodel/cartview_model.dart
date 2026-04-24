import 'package:flutter/material.dart';
import 'products_model.dart';

class CartViewModel extends ChangeNotifier {
  final List<CartItem> _items = [];

  // 🔹 SAFE GETTER
  List<CartItem> get items => List.unmodifiable(_items);

  // 🔹 ADD TO CART (FIXED)
  void addToCart(Product product, {int quantity = 1}) {
    final index = _items.indexWhere((e) => e.product.id == product.id);

    if (index != -1) {
      _items[index] = _items[index].copyWith(
        quantity: _items[index].quantity + quantity,
      );
    } else {
      _items.add(CartItem(product: product, quantity: quantity));
    }

    notifyListeners();
  }

  // 🔹 REMOVE ITEM
  void removeFromCart(Product product) {
    _items.removeWhere((e) => e.product.id == product.id);
    notifyListeners();
  }

  // 🔹 INCREASE QTY
  void increaseQty(Product product) {
    final index = _items.indexWhere((e) => e.product.id == product.id);

    if (index != -1) {
      _items[index] = _items[index].copyWith(
        quantity: _items[index].quantity + 1,
      );
      notifyListeners();
    }
  }

  // 🔹 DECREASE QTY
  void decreaseQty(Product product) {
    final index = _items.indexWhere((e) => e.product.id == product.id);

    if (index != -1) {
      final current = _items[index];

      if (current.quantity > 1) {
        _items[index] = current.copyWith(
          quantity: current.quantity - 1,
        );
      } else {
        _items.removeAt(index);
      }

      notifyListeners();
    }
  }

  // 🔹 TOTAL PRICE
  double get totalPrice {
    return _items.fold(
      0,
      (sum, item) => sum + (item.product.price * item.quantity),
    );
  }

  // 🔹 TOTAL ITEMS (bonus)
  int get totalItems {
    return _items.fold(0, (sum, item) => sum + item.quantity);
  }

  // 🔹 CLEAR CART (bonus)
  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
class CartItem {
  final Product product;
  final int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });

  CartItem copyWith({
    Product? product,
    int? quantity,
  }) {
    return CartItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }
}