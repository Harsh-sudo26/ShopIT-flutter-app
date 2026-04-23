import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopit/features/products/model/products_model.dart';

class ProductApi {
  Future<List<Product>> fetchProducts() async {
    try {
      final response = await http
          .get(Uri.parse("http://192.168.1.11:8000/products/"))
          .timeout(const Duration(seconds: 30));

      print("STATUS: ${response.statusCode}");

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        return data.map((e) => Product.fromJson(e)).toList();
      } else {
        print("BODY: ${response.body}");
        throw Exception("Failed to load products");
      }
    } catch (e) {
      print("ERROR: $e");
      throw Exception("API Error: $e");
    }
  }
}
