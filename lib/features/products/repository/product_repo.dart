import 'package:shopit/features/products/model/products_model.dart';
import 'package:shopit/features/products/service/product_api.dart';



class ProductRepository {
  final ProductApi api;

  ProductRepository({required this.api});

  Future<List<Product>> getProducts() async {
    try {
      return await api.fetchProducts();
    } catch (e) {
      throw Exception("Repository Error: $e");
    }
  }
}