import 'package:flutter/material.dart';
import 'package:shopit/features/products/data/product_repo.dart';
import 'package:shopit/features/products/model/productsmodel.dart';


class ProductViewModel with ChangeNotifier {
  final ProductRepository _repo = ProductRepository();

  List<Product> _products = [];
  List<Product> get products => _products;

  bool _loading = false;
  bool get loading => _loading;

  // LOAD PRODUCTS
  Future<void> loadProducts() async {
    _loading = true;
    notifyListeners();

    _products = await _repo.fetchProducts();

    _loading = false;
    notifyListeners();
  }

  // ADD PRODUCT
  Future<void> addProduct(Product product) async {
    await _repo.addProduct(product);
    _products.add(product);
    notifyListeners();
  }
}