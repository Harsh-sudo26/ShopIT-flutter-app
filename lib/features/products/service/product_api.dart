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
      final uri = Uri.parse(_baseUrl);

      final response = await http
          .get(
            uri,
            headers: {
              "Content-Type": "application/json",
              "Accept": "application/json",
            },
          )
          .timeout(const Duration(seconds: 200));

      debugPrint("STATUS: ${response.statusCode}");

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);

        if (decoded is List) {
          return decoded.map((e) => Product.fromJson(e)).toList();
        } else {
          throw Exception("Invalid response format");
        }
      } else {
        debugPrint("BODY: ${response.body}");
        throw HttpException("Server error: ${response.statusCode}");
      }
    } on SocketException {
      throw Exception("No Internet connection");
    } on HttpException catch (e) {
      throw Exception(e.message);
    } on FormatException {
      throw Exception("Bad response format");
    } catch (e) {
      debugPrint("API ERROR: $e");
      throw Exception("Unexpected error: $e");
    }
  }
}
