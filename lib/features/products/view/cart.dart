import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopit/features/products/model/cartviewmodel.dart';
import 'package:shopit/features/products/model/productsmodel.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartVm = Provider.of<CartViewModel>(context);
    final uniqueProducts = cartVm.carts.toSet().toList();
    return Scaffold(
      appBar: AppBar(title: const Text("Cart")),
      body: ListView.builder(
        itemCount: uniqueProducts.length,
        itemBuilder: (context, index) {
          final product = uniqueProducts[index];

          final qty = cartVm.carts
              .where((item) => item.id == product.id)
              .length;

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  product.image,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Icon(Icons.image),
                ),
              ),

              title: Text(product.name),

              subtitle: Text("₹${product.price}  x$qty"),

              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  cartVm.removeFromCart(product);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}
