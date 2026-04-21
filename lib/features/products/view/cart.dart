import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopit/features/products/model/cartview_model.dart';
import 'package:shopit/features/products/model/products_model.dart';
import 'package:shopit/widget/appbar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartVm = Provider.of<CartViewModel>(context);
    final uniqueProducts = cartVm.items.toSet().toList();
    return Scaffold(
      appBar: Appbarcus(title: 'Cart', textSize: 25, textColor: Colors.blue),
      body: ListView.builder(
        itemCount: uniqueProducts.length,
        itemBuilder: (context, index) {
          final product = uniqueProducts[index];

          final qty = cartVm.items
              .where((item) => item.product.id == product.product.id)
              .length;

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  product.product.image,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => const Icon(Icons.image),
                ),
              ),

              title: Text(product.product.name),

              subtitle: Text("₹${product.product.price}  x$qty"),

              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  cartVm.removeFromCart(product as Product);
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
