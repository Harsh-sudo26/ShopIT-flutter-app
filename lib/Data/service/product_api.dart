import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopit/Data/model/products_model.dart';

class ProductApi {
  static const String _baseUrl =
      "https://shopit-flutter-app.onrender.com/products";

  Future<List<Product>> fetchProducts() async {
    final uri = Uri.parse(_baseUrl);

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List;

        return data.map((e) => Product.fromJson(e)).toList();
      } else {
        throw Exception("Server Error: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Failed to load products");
    }
  }
}
