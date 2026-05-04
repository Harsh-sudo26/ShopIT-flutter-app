import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopit/Data/model/Uistateview.dart';
import 'package:shopit/Presentaions/View/Auth/login.dart';
import 'package:shopit/Presentaions/View/Auth/signup.dart';
import 'package:shopit/Presentaions/Viewmodel/auth_viewmodel.dart';
import 'package:shopit/widget/togle.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final vm = context.watch<AuthViewModel>();

    if (vm.error != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(vm.error!)));

        vm.clearError();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = context.select<UIStateViewModel, int>(
      (vm) => vm.selectedIndex,
    );

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 60),
          const Padding(padding: EdgeInsets.all(8.0), child: AuthToggle()),
          const SizedBox(height: 20),
          Expanded(
            child: selectedIndex == 0 ? const LoginView() : const SignupView(),
          ),
        ],
      ),
    );
  }
}
