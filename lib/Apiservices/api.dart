import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopit/model/products.dart';

Future<List<Product>> fetchProducts() async {
  final response = await http.get(
    Uri.parse('http://192.168.1.11:8000/products'),
  );

  if (response.statusCode == 200) {
    List data = json.decode(response.body);
    return data.map((e) => Product.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load products');
  }
}
