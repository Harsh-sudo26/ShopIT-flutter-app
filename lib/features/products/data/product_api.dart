import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/productsmodel.dart';

class ProductApi {
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(
      Uri.parse("https://shopit-flutter-app.onrender.com/products"),
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);

      return data.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }
}