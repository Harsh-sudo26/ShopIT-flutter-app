import 'package:shopit/features/products/model/products.dart';

import 'product_api.dart';

class ProductRepository {
  final ProductApi api = ProductApi();

  Future<List<Product>> getProducts() {
    return api.fetchProducts();
  }
}