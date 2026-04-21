import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopit/features/products/model/cartview_model.dart';
import 'package:shopit/features/products/model/favoriteview_model.dart';
import 'package:shopit/features/products/view/productdetails.dart';
import 'package:shopit/widget/appbar.dart';

class Favpage extends StatelessWidget {
  const Favpage({super.key});

  @override
  Widget build(BuildContext context) {
    final favam = context.watch<FavoriteViewModel>();
    final favProducts = favam.favorites;
    return Scaffold(
      appBar: Appbarcus(
        title: 'Favorites',
        textSize: 25,
        textColor: Colors.red,
      ),

      body: favProducts.isEmpty
          ? const Center(child: Text("No favorites yet"))
          : ListView.builder(
              itemCount: favProducts.length,
              itemBuilder: (context, index) {
                final product = favProducts[index];
                return ListTile(
                  leading: Image.network(
                    product.image,
                    height: 50,
                    width: 50,
                    fit: BoxFit.contain,
                  ),
                  title: Text(product.name),
                  subtitle: Text("${product.price}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      context.read()<CartViewModel>().removeFromCart(product);
                    },
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetail(product: product),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
