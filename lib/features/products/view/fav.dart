import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopit/features/products/model/favoriteviewmodel.dart';
import 'package:shopit/features/products/view/productdetails.dart';

class FavPage extends StatelessWidget {
  const FavPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favVm = context.watch<FavoriteViewModel>();
    final favorites = favVm.favorites;

    if (favorites.isEmpty) {
      return const Center(
        child: Text("No favorites yet ❤️"),
      );
    }

    return ListView.builder(
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        final product = favorites[index];

        return ListTile(
          leading: Image.network(
            product.image,
            width: 50,
            height: 50,
            fit: BoxFit.contain,
          ),
          title: Text(product.name),
          subtitle: Text("₹${product.price}"),

       
          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              context.read<FavoriteViewModel>().toggleFavorite(product);
            },
          ),

        
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProductDetail(product: product),
              ),
            );
          },
        );
      },
    );
  }
}