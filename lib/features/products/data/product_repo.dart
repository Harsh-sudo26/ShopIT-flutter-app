import 'package:shopit/features/products/model/productsmodel.dart';
import 'product_api.dart';

class ProductRepository {
  final ProductApi api = ProductApi();

  // 🔹 FETCH FROM REAL API
  Future<List<Product>> fetchProducts() async {
    return await api.fetchProducts();
  }

  // 🔹 ADD PRODUCT (optional - backend not connected yet)
  Future<void> addProduct(Product product) async {
    // If you have POST API, call here
    // For now, just placeholder
  }
}