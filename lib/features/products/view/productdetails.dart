import 'package:flutter/material.dart';
import 'package:shopit/features/products/model/products.dart';
import 'package:shopit/widget/%20button.dart';
// import 'package:shopit/widget/button.dart';

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
          children: [
            // 🔹 Image
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
                  // 🔹 Name
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // 🔹 Price
                  Text(
                    "₹${product.price.toStringAsFixed(0)}",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  // 🔹 Quantity Selector
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Quantity",
                        style: TextStyle(fontSize: 16),
                      ),

                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              if (quantity > 1) {
                                setState(() => quantity--);
                              }
                            },
                            icon: const Icon(Icons.remove),
                          ),

                          Text(
                            quantity.toString(),
                            style: const TextStyle(fontSize: 16),
                          ),

                          IconButton(
                            onPressed: () {
                              setState(() => quantity++);
                            },
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  // 🔹 Total Price
                  Text(
                    "Total: ₹${(product.price * quantity).toStringAsFixed(0)}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // 🔹 Description
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 246, 246, 247),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Product Description",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(product.description),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // 🔹 Add to Cart Button
                  GestureDetector(
                    onTap: () {
                      // 🔥 your logic here
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "${product.name} x$quantity added to cart",
                          ),
                        ),
                      );
                    },
                    child: buttonwig(
                      butotncolor: Colors.blue,
                      buttonicon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      buttontext: const Text(
                        "Add to Cart",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
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