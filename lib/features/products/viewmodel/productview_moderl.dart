import 'package:flutter/material.dart';
import 'package:shopit/features/products/viewmodel/products_model.dart';
import 'package:shopit/features/products/repository/product_repo.dart';

class ProductViewModel with ChangeNotifier {
  final ProductRepository _repo;

  ProductViewModel(this._repo);

  List<Product> _products = [];
  List<Product> get products => List.unmodifiable(_products);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  bool _initialized = false;

  Future<void> fetchProducts({bool forceRefresh = false}) async {
    if (_isLoading) return;

    if (_initialized && !forceRefresh) return;

    _setLoading(true);
    _error = null;

    try {
      final result = await _repo
          .getProducts()
          .timeout(const Duration(seconds: 60));

      _products = result;
      _initialized = true;
    } catch (e) {
      _error = e.toString(); 
      debugPrint("Product Error: $e");
    } finally {
      _setLoading(false);
    }
  }

  Future<void> refresh() async {
    await fetchProducts(forceRefresh: true);
  }

  void clear() {
    _products = [];
    _error = null;
    _initialized = false;
    notifyListeners();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}