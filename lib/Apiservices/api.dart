import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopit/model/products.dart';

class ApiService {
  final String baseUrl = "https://shopit-flutter-app.onrender.com";

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }

  Future<Product> fetchSingleProduct(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/products/$id'));

    if (response.statusCode == 200) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Product not found");
    }
  }
}
