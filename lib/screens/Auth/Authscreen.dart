import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopit/features/products/model/auth_viewmodel.dart';
import 'package:shopit/screens/Auth/login.dart';
import 'package:shopit/screens/Auth/signup.dart';
import 'package:shopit/widget/togle.dart';



class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<AuthViewModel>();

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 60),

          const AuthToggle(),

          const SizedBox(height: 20),

        
          Expanded(
            child: vm.selectedIndex == 0 ? const LoginView():const SignupView(),
          ),
        ],
      ),
    );
  }
}


