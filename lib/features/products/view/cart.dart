import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopit/features/products/model/cartview_model.dart';
import 'package:shopit/widget/appbar.dart' show Appbarcus;

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartVm = context.watch<CartViewModel>();
    final items = cartVm.items;

    return Scaffold(
      appBar: Appbarcus(title: 'Cart', textSize: 25, textColor: Colors.blue),

      body: items.isEmpty
          ? const Center(child: Text("Cart is empty"))
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];

                return Card(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 6),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        item.product.image,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        errorBuilder: (_, _, _) =>
                            const Icon(Icons.image),
                      ),
                    ),

                    title: Text(item.product.name),

                   
                    subtitle: Text(
                      "₹${item.product.price}  x${item.quantity}",
                    ),

                
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            cartVm.decreaseQty(item.product);
                          },
                        ),

                        Text("${item.quantity}"),

                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            cartVm.increaseQty(item.product);
                          },
                        ),

                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            cartVm.removeFromCart(item.product);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}