import 'package:shopit/features/products/model/productsmodel.dart';
import 'product_api.dart';

class ProductRepository {
  final List<Product> _fakeDb = [];
  final ProductApi api = ProductApi();

Future<List<Product>> getProducts() {
  return api.fetchProducts();
}

  Future<List<Product>> fetchProducts() async {
    await Future.delayed(const Duration(seconds: 1)); // simulate API
    return _fakeDb;
  }

  Future<void> addProduct(Product product) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _fakeDb.add(product);
  }
}
