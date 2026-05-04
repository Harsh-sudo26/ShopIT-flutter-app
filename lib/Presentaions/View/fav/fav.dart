import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopit/Presentaions/Viewmodel/favorite_viewmodel.dart';
import 'package:shopit/Presentaions/View/product/productdetails.dart';
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
        textColor: const Color.fromARGB(255, 5, 57, 226),
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
                    icon: const Icon(
                      Icons.delete,
                      color: Color.fromARGB(255, 228, 17, 10),
                    ),
                    onPressed: () {
                      context.read<FavoriteViewModel>().removeFromFavorites(
                        product,
                      );
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
