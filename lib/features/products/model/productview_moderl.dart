import 'package:flutter/material.dart';
import 'package:shopit/features/products/data/product_repo.dart';
import 'package:shopit/features/products/model/products_model.dart';

class ProductViewModel with ChangeNotifier {
  final ProductRepository _repo = ProductRepository();

  List<Product> _products = [];
  List<Product> get products => _products;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  // 🔹 LOAD PRODUCTS
  Future<void> fetchProducts() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _products = await _repo.fetchProducts();
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  // 🔹 ADD PRODUCT
  Future<void> addProduct(Product product) async {
    try {
      await _repo.addProduct(product);
      _products.add(product);
      notifyListeners();
    } catch (e) {
      _error = "Failed to add product";
      notifyListeners();
    }
  }

  // 🔹 REFRESH (useful for pull-to-refresh)
  Future<void> refresh() async {
    await fetchProducts();
  }
}