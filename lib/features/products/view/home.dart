import 'package:flutter/material.dart';
import 'package:shopit/features/products/view/cart.dart';
import 'package:shopit/features/products/view/fav.dart';
import 'package:shopit/features/products/view/profile.dart';
import 'package:shopit/features/products/view/search.dart';
import 'package:shopit/features/products/view/productcard.dart';
import 'package:shopit/widget/%20button.dart';

import 'package:shopit/widget/textfieldwidget.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeContent(),
    CartScreen(),
    Search(),
    Favpage(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Fav"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent>
    with AutomaticKeepAliveClientMixin {
  final TextEditingController searchController = TextEditingController();

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Container(
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(40),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Merchant",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                Icon(Icons.notifications),
              ],
            ),
          ),

          const SizedBox(height: 15),

          const Text(
            'Curated\nExcellence.',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),

          const SizedBox(height: 15),

          Textfield(
            icon: const Icon(Icons.search_rounded),
            hinttext: 'Search',
            rowtext: '',
            controller: searchController,
          ),

          const SizedBox(height: 20),

          Stack(
            alignment: Alignment.bottomRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  "assets/images/image.png",
                  fit: BoxFit.contain,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 120,
                  width: 180,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "The Art of Living",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      buttonsim(
                        simplebtncolor: Colors.blue,
                        simplebuttontext: const Text(
                          "Shop Now",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          const RepaintBoundary(child: Productcard()),
        ],
      ),
    );
  }
}
