import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopit/Presentaions/Viewmodel/auth_viewmodel.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await context.read<AuthViewModel>().logout();
          },
          child: const Text("Logout"),
        ),
      ),
    );
  }
}
