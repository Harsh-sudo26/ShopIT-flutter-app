import 'package:flutter/material.dart';
import 'package:shopit/widgets/navigationbar.dart' show BottomNavBar;
import 'package:shopit/widgets/profilepage.dart';
import 'package:shopit/widgets/search.dart';
import 'package:shopit/widgets/searchpage.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _selectedIndex = 0; // bottom nav selected index

  final TextEditingController _searchController = TextEditingController();

  // Your product list
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
      "image": "assets/images/nike.png",
      "description": "Smart watch with fitness tracking",
    },
    {
      "id": 3,
      "name": "Samsung Headphones",
      "price": 89.99,
      "image": "assets/images/nike.png",
      "description": "Noise cancelling headphones",
    },
    {
      "id": 4,
      "name": "Backpack",
      "price": 39.99,
      "image": "assets/images/nike.png",
      "description": "Waterproof travel backpack",
    },
    {
      "id": 1,
      "name": "Nike Shoes",
      "price": 59.99,
      "image": "assets/images/nike.png",
      "description": "Comfortable running shoes",
    },
    {
      "id": 1,
      "name": "Nike Shoes",
      "price": 59.99,
      "image": "assets/images/nike.png",
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

  // bottom nav tap callback
  void _onNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // List of pages
  late final List<dynamic> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(products: products, searchController: _searchController),
      const Searchpage(),
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
      body: SafeArea(
        child: _pages[_selectedIndex], // show current page
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onTap: _onNavTap,
      ),
    );
  }
}

// ---------------------------
// Separate HomePage widget
// ---------------------------

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
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SearchWidget(
            controller: searchController,
            onSearch: () {
              print("Search: ${searchController.text}");
            },
          ),
        ),

        // top container here if needed
        SliverToBoxAdapter(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                color: Colors.red,
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.040,
              )
            ],
          ),
        ),

        // top container end here
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.6,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          delegate: SliverChildBuilderDelegate((context, index) {
            final item = products[index];
            return Card(
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Icon(
                          Icons.favorite_border,
                          color: const Color.fromARGB(255, 24, 38, 236),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Image.asset(item['image'], fit: BoxFit.contain),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              textAlign: TextAlign.start,
                              item['name'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.shopping_cart,size: 30,),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }, childCount: products.length),
        ),
      ],
    );
  }
}
