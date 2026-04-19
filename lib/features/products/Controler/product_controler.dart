import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
import 'package:shopit/features/products/data/product_repo.dart';
import 'package:shopit/features/products/model/products.dart';

class ProductController extends ChangeNotifier {
  final ProductRepository repository = ProductRepository();

  List<Product> products = [];
  bool isLoading = false;
  String? error; // 🔥 ADD THIS

  Future<void> loadProducts() async {
    isLoading = true;
    error = null; // reset error
    notifyListeners();

    try {
      products = await repository.getProducts();
    } catch (e) {
      error = e.toString(); // 🔥 store error
    }

    isLoading = false;
    notifyListeners();
  }
}