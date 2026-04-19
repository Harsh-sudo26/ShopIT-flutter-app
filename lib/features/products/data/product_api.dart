import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/products.dart';

class ProductApi {
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(
      Uri.parse("https://shopit-flutter-app.onrender.com"),
    );

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);

      
      if (decoded is List) {
        return decoded.map((e) => Product.fromJson(e)).toList();
      } else if (decoded is Map && decoded['products'] is List) {
        return (decoded['products'] as List)
            .map((e) => Product.fromJson(e))
            .toList();
      } else {
        throw Exception("Invalid API format");
      }
    } else {
      throw Exception("Failed to load products");
    }
  }
}
