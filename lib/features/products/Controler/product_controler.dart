import 'package:flutter/material.dart';
import 'package:shopit/features/products/data/product_repo.dart';
import 'package:shopit/features/products/model/productsmodel.dart';

class ProductController extends ChangeNotifier {
  final ProductRepository repository = ProductRepository();

  List<Product> products = [];
  bool isLoading = false;
  String? error;

  Future<void> loadProducts() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      products = await repository.getProducts(); 
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}