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
      body: Column(
        children: [
          // 🔹 Product Image
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

                const SizedBox(height: 10),

                // 🔹 Description
                Text(product.description),

                const SizedBox(height: 20),

                // 🔹 Quantity Selector
                Row(
                  children: [
                    const Text("Quantity: "),
                    IconButton(
                      onPressed: () {
                        if (quantity > 1) {
                          setState(() => quantity--);
                        }
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    Text(quantity.toString()),
                    IconButton(
                      onPressed: () {
                        setState(() => quantity++);
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // 🔹 Buy Button
                SizedBox(
                  width: double.infinity,
                  child: buttonwig(
                    butotncolor: Colors.blue,
                    buttonicon: Icon(Icons.shopping_cart),
                    buttontext: Text('Add to cart'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
