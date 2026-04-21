import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopit/features/products/model/cartview_model.dart';
import 'package:shopit/features/products/model/products_model.dart';
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

  void _increase() {
    setState(() => quantity++);
  }

  void _decrease() {
    if (quantity > 1) {
      setState(() => quantity--);
    }
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      appBar: AppBar(title: Text(product.name)),

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 IMAGE (optimized)
              RepaintBoundary(
                child: AspectRatio(
                  aspectRatio: 1.2,
                  child: Image.network(
                    product.image,
                    width: double.infinity,
                    fit: BoxFit.contain,

                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return const Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      );
                    },

                    errorBuilder: (context, error, stackTrace) =>
                        const Center(child: Icon(Icons.broken_image)),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 🔹 NAME
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // 🔹 PRICE
                    Text(
                      "₹${product.price.toStringAsFixed(0)}",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // 🔹 QUANTITY (optimized taps)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey.shade100,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Quantity",
                            style: TextStyle(fontSize: 16),
                          ),

                          Row(
                            children: [
                              IconButton(
                                onPressed: _decrease,
                                icon: const Icon(Icons.remove),
                              ),

                              Text(
                                quantity.toString(),
                                style: const TextStyle(fontSize: 16),
                              ),

                              IconButton(
                                onPressed: _increase,
                                icon: const Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 15),

                    // 🔹 TOTAL
                    Text(
                      "Total: ₹${(product.price * quantity).toStringAsFixed(0)}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // 🔹 DESCRIPTION (card optimized)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 246, 246, 247),
                        borderRadius: BorderRadius.circular(16),
                      ),
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
                          Text(
                            product.description,
                            style: const TextStyle(height: 1.4),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    // 🔹 BUTTON (less rebuild cost)
                    GestureDetector(
                      onTap: () {
                        final cartVm = Provider.of<CartViewModel>(
                          context,
                          listen: false,
                        );
                        cartVm.addToCart(product);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "${product.name} x$quantity added to cart",
                            ),
                          ),
                        );
                      },
                      child: const buttonwig(
                        butotncolor: Colors.blue,
                        buttonicon: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                        buttontext: Text(
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
      ),
    );
  }
}
