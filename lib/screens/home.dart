import 'package:flutter/material.dart';
import 'package:shopit/widget/%20button.dart';

import 'package:shopit/features/products/view/productcard.dart';
import 'package:shopit/widget/textfieldwidget.dart';

// ignore: camel_case_types
class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

// ignore: camel_case_types
class _homepageState extends State<homepage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeContent(),
    CartPage(),
    ProfilePage(),
    FavPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Fav"),
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

class _HomeContentState extends State<HomeContent> {
  final TextEditingController serchhere = TextEditingController();

  @override
  void dispose() {
    serchhere.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // 🔹 Header
            Container(
              color: const Color.fromARGB(26, 255, 255, 255),
              height: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Merchant",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      Icon(Icons.notifications),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            const Text('''Curated
Excellence.''', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 29)),

            const SizedBox(height: 10),

            Textfield(
              icon: const Icon(Icons.search_rounded),
              hinttext: 'Search',
              rowtext: '',
              controller: serchhere,
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
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(61, 255, 255, 255),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "The Art of living",
                          style: TextStyle(fontSize: 26, color: Colors.white),
                        ),

                        buttonsim(
                          simplebtncolor: Colors.blue,
                          simplebuttontext: Text(
                            "Explore Now",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            const Productcard(),
          ],
        ),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Cart Page", style: TextStyle(fontSize: 20)),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Profile Page", style: TextStyle(fontSize: 20)),
    );
  }
}

class FavPage extends StatelessWidget {
  const FavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Favorite Page", style: TextStyle(fontSize: 20)),
    );
  }
}
