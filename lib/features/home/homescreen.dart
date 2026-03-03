import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopit/features/home/topnav.dart';
import 'package:shopit/features/profile/profilepage.dart';
import 'package:shopit/core/widgets/search.dart';
import 'package:shopit/features/cart/cart.dart';
import 'package:shopit/features/provider/cart_provider.dart';
import 'package:shopit/core/widgets/navigationbar.dart' show BottomNavBar;

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _selectedIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> products = [
    {
      "id": 1,
      "name": "Nike Shoes",
      "price": 59.99,
      "image": "assets/images/nike.png",
      "description": "Comfortable running shoes",
    },
    {
      "id": 2,
      "name": "Apple Watch",
      "price": 199.99,
      "image": "assets/images/apple.png",
      "description": "Smart watch with fitness tracking",
    },
    {
      "id": 3,
      "name": "Samsung Headphones",
      "price": 89.99,
      "image": "assets/images/headphone.png",
      "description": "Noise cancelling headphones",
    },
    {
      "id": 4,
      "name": "Backpack",
      "price": 39.99,
      "image": "assets/images/bag.png",
      "description": "Waterproof travel backpack",
    },
  ];

  void _onNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(products: products, searchController: _searchController),
      const CartPage(),
      const ProfileComplete(),
    ];
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[_selectedIndex]),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onTap: _onNavTap,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final TextEditingController searchController;

  const HomePage({
    super.key,
    required this.products,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search bar
        SizedBox(
          height: 100,
          width: double.infinity,
          child: SearchWidget(
            controller: searchController,
            onSearch: () {
              print("Search: ${searchController.text}");
            },
          ),
        ),

        // Top Navigation
        Topnav(),

        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.75,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];

              return Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 109, 59, 178),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Image
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(8),
                        ),
                        child: Image.asset(
                          product['image'],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),

                    // Product Name
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: Text(
                        product['name'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    // Price + Add to Cart
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "\$${product['price']}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),

                          // ✅ Use Consumer here for cart button
                          Consumer<CartProvider>(
                            builder: (context, cart, child) {
                              return IconButton(
                                onPressed: () {
                                  cart.addToCart({
                                    "id": product['id'],
                                    "name": product['name'],
                                    "price": product['price'],
                                    "image": product['image'],
                                    "quantity": 1,
                                  });

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      backgroundColor: Colors.purpleAccent,
                                      content: Text(
                                        "Added to cart!",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.shopping_cart,
                                  color: Colors.white,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 5),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
