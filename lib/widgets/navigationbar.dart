import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onTap,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined,color: Colors.purple,),
          selectedIcon: FaIcon(FontAwesomeIcons.house, color: Colors.purple,),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.shopping_cart,color: Colors.purple,),
          selectedIcon: FaIcon(FontAwesomeIcons.shoppingCart, color: Colors.purple,),
          label: 'Cart',
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline,color: Colors.purple,),
          selectedIcon: FaIcon(FontAwesomeIcons.user, color: Colors.purple,),
          label: 'Profile',
        ),
      ],
    );
  }
}
