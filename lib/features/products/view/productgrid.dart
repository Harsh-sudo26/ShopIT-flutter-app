import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopit/features/products/viewmodel/product_viewmoderl.dart';
import 'package:shopit/features/products/view/productcard.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductViewModel>(
      builder: (context, vm, _) {
        if (vm.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (vm.error != null) {
          return Center(child: Text(vm.error!));
        }

        if (vm.products.isEmpty) {
          return const Center(child: Text("No products found"));
        }

        return GridView.builder(
          itemCount: vm.products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (_, index) {
            return Productcard();
          },
        );
      },
    );
  }
}
