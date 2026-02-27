import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopit/screens/topnav.dart';
// import 'package:shopit/screens/cart.dart';
import 'package:shopit/widgets/navigationbar.dart' show BottomNavBar;
import 'package:shopit/screens/profilepage.dart';
import 'package:shopit/widgets/search.dart';
import 'package:shopit/screens/cart.dart';

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
    {
      "id": 1,
      "name": "Nike Shoes",
      "price": 59.99,
      "image": "assets/images/apple.png",
      "description": "Comfortable running shoes",
    },
    {
      "id": 1,
      "name": "Nike Shoes",
      "price": 59.99,
      "image": "assets/images/headphone.png",
      "description": "Comfortable running shoes",
    },
    {
      "id": 1,
      "name": "Nike Shoes",
      "price": 59.99,
      "image": "assets/images/nike.png",
      "description": "Comfortable running shoes",
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
      CartPage(),
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
        Topnav(),
        Row(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            
          ),
        ],),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              childAspectRatio: 0.75,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 109, 59, 178),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                               ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(backgroundColor: Colors.purpleAccent,
                            content: Text("Added to cart!", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                          ),
                        ); 
                              Cart.items.add({
                                'name': product['name'],
                                'price': product['price'],
                                'image': product['image'],
                                'quantity': 1,
                              });
                            },
                            icon: Padding(
                              padding: const EdgeInsets.only(
                                right: 15,
                                bottom: 5,
                              ),
                              child: FaIcon(FontAwesomeIcons.cartShopping, color: Colors.white, size: 18)
                            ),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
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
