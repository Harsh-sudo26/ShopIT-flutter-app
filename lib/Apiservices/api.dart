import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopit/model/products.dart';

Future<List<Product>> fetchProducts() async {
  final response = await http.get(
    Uri.parse('https://shopit-flutter-app.onrender.com'),
  );

  if (response.statusCode == 200) {
    List data = json.decode(response.body);
    return data.map((e) => Product.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load products');
  }
}
