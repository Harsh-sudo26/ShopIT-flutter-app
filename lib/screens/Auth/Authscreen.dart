import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopit/features/products/viewmodel/auth_viewmodel.dart';
import 'package:shopit/screens/Auth/login.dart';
import 'package:shopit/screens/Auth/signup.dart';
import 'package:shopit/widget/togle.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
   final vm = context.watch<AuthViewModel>();
    final selectedIndex = vm.selectedIndex;
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 60),

          const Padding(
            padding: EdgeInsets.all(8.0),
            child: AuthToggle(),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: selectedIndex == 0
                ? const LoginView()
                : const SignupView(),
          ),
        ],
      ),
    );
  }
}