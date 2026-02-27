import 'package:flutter/material.dart';

class ProfileComplete extends StatelessWidget {
  const ProfileComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: const AssetImage('assets/images/google.png'),
                    radius: 50,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'John Doe',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'john@example.com',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            // User Info Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    _buildInfoTile('Phone', '+1 234 567 8900'),
                    const Divider(height: 1),
                    _buildInfoTile('Email', 'john@example.com'),
                    const Divider(height: 1),
                    _buildInfoTile('Location', '123 Street, City'),
                  ],
                ),
              ),
            ),

            // Menu Options
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'ACCOUNT',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildMenuTile(
                    icon: Icons.shopping_bag,
                    title: 'My Orders',
                    context: context,
                    action: 'orders',
                  ),
                  _buildMenuTile(
                    icon: Icons.favorite,
                    title: 'Wishlist',
                    context: context,
                    action: 'wishlist',
                  ),
                  _buildMenuTile(
                    icon: Icons.location_on,
                    title: 'Addresses',
                    context: context,
                    action: 'addresses',
                  ),
                  _buildMenuTile(
                    icon: Icons.payment,
                    title: 'Payment Methods',
                    context: context,
                    action: 'payment',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Settings
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'SETTINGS',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildMenuTile(
                    icon: Icons.notifications,
                    title: 'Notifications',
                    context: context,
                    action: 'notifications',
                  ),
                  _buildMenuTile(
                    icon: Icons.security,
                    title: 'Privacy & Security',
                    context: context,
                    action: 'security',
                  ),
                  _buildMenuTile(
                    icon: Icons.help,
                    title: 'Help & Support',
                    context: context,
                    action: 'help',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Logout Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    _handleAction('logout', context);
                  },
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  static Widget _buildInfoTile(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildMenuTile({
    required IconData icon,
    required String title,
    required BuildContext context,
    required String action,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          _handleAction(action, context);
        },
      ),
    );
  }

  static void _handleAction(String action, BuildContext context) {
    switch (action) {
      case 'orders':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Opening My Orders...')),
        );
        // Navigator.push(context, MaterialPageRoute(builder: (_) => OrdersPage()));
        break;
      case 'wishlist':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Opening Wishlist...')),
        );
        break;
      case 'addresses':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Opening Addresses...')),
        );
        break;
      case 'payment':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Opening Payment Methods...')),
        );
        break;
      case 'notifications':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Opening Notifications...')),
        );
        break;
      case 'security':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Opening Security...')),
        );
        break;
      case 'help':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Opening Help & Support...')),
        );
        break;
      case 'logout':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Logging out...')),
        );
        break;
    }
  }
}