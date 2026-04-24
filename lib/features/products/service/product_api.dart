import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shopit/features/products/viewmodel/products_model.dart';

class ProductApi {
  static const String _baseUrl =
      "https://shopit-flutter-app.onrender.com/products";

  Future<List<Product>> fetchProducts() async {
  try {
    return await _makeRequest();
  } catch (e) {
    debugPrint("Retrying API...");
    await Future.delayed(const Duration(seconds: 3));
    return await _makeRequest(); 
  }
}

Future<List<Product>> _makeRequest() async {
  final uri = Uri.parse(_baseUrl);

  final response = await http
      .get(uri)
      .timeout(const Duration(seconds: 60));

  debugPrint("STATUS: ${response.statusCode}");

  if (response.statusCode == 200) {
    final decoded = jsonDecode(response.body);

    if (decoded is List) {
      return decoded.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception("Invalid response format");
    }
  } else {
    throw Exception("Server error: ${response.statusCode}");
  }
}
}
