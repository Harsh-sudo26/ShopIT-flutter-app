import 'package:flutter/material.dart';
import 'package:shopit/model/products.dart';
import 'package:shopit/widget/%20button.dart';

class ProductDetail extends StatefulWidget {
  final Product product;

  const ProductDetail({super.key, required this.product});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(
              product.image,
              height: 250,
              width: double.infinity,
              fit: BoxFit.contain,
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "₹${product.price.toStringAsFixed(0)}",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 246, 246, 247),
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Product Description",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(product.description),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(children: []),

                  const SizedBox(height: 20),

                  buttonwig(
                    butotncolor: Colors.blue,
                    buttonicon: Icon(Icons.shopping_cart, color: Colors.white),
                    buttontext: Text(
                      "Add to cart",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
