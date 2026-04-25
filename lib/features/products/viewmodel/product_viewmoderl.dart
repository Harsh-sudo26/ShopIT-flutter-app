import 'package:flutter/material.dart';
import 'package:shopit/features/products/viewmodel/products_model.dart';
import 'package:shopit/features/products/repository/product_repo.dart';

class ProductViewModel with ChangeNotifier {
  final ProductRepository _repo;

  ProductViewModel(this._repo) {
    fetchProducts(); //Api call
  }

  List<Product> _products = [];
  List<Product> get products => _products;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      final result = await _repo.getProducts();
      _products = result;

    } catch (e) {
      _error = e.toString();
     
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> refresh() async {
    await fetchProducts();
  }
}