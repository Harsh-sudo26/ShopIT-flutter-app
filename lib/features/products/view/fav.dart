import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopit/features/products/model/favoriteview_model.dart';
import 'package:shopit/features/products/view/productdetails.dart';
import 'package:shopit/widget/appbar.dart';

class Favpage extends StatelessWidget {
  const Favpage({super.key});

  @override
  Widget build(BuildContext context) {
    final favam = context.watch<FavoriteViewModel>();
    final favProducts = favam.favorites;
    if (favProducts.isEmpty) {
      return Scaffold(body: Center(child: Text("Your have no fav avilable")));
    } else {
      return ListView.builder(
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
                context.read<FavoriteViewModel>().toggleFavorite(product);
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
      );
    }
  }
}
