import 'package:flutter/material.dart';
import 'package:shopit/features/products/model/products_model.dart';

import '../repository/product_repo.dart';

class ProductViewModel with ChangeNotifier {
  final ProductRepository _repo;

  ProductViewModel(this._repo);

  List<Product> _products = [];
  List<Product> get products => List.unmodifiable(_products);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  bool _isInitialized = false;

  Future<void> fetchProducts({bool forceRefresh = false}) async {
  if (_isLoading) return;

  _setLoading(true);
  _error = null;

  try {
    final result = await _repo.getProducts();
    _products = result;
  } catch (e) {
    _error = "Failed to load products";
  }

  _setLoading(false);
}

  Future<void> refresh() async {
    await fetchProducts(forceRefresh: true);
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}