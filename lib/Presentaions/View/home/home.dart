import 'package:flutter/material.dart';
import 'package:shopit/Presentaions/View/cart/cart.dart';
import 'package:shopit/Presentaions/View/fav/fav.dart';
import 'package:shopit/Presentaions/View/profile/profile.dart';
import 'package:shopit/widget/search.dart';
import 'package:shopit/Presentaions/View/product/productcard.dart';
import 'package:shopit/widget/%20button.dart';
import 'package:shopit/widget/textfieldwidget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Fav"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          _header(),
          const SizedBox(height: 15),
          const Text(
            'Curated\nExcellence.',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),

          Textfield(
            icon: const Icon(Icons.search),
            hinttext: 'Search',
            rowtext: '',
            controller: searchController,
          ),

          const SizedBox(height: 20),

          _banner(),

          const SizedBox(height: 20),

          const Productcard(), // 🚀 ONLY DYNAMIC PART
        ],
      ),
    );
  }

  Widget _header() {
    return Container(
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
    );
  }

  Widget _banner() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            "assets/images/image.png",
            fit: BoxFit.cover,
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            height: 120,
            width: 180,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "The Art of Living",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(height: 10),
                buttonsim(
                  simplebtncolor: Colors.blue,
                  simplebuttontext: const Text(
                    "Shop Now",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}