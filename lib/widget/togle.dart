import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopit/features/products/model/auth_viewmodel.dart';

class AuthToggle extends StatelessWidget {
  const AuthToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = context.select<AuthViewModel, int>(
      (vm) => vm.selectedIndex,
    );

    final vm = context.read<AuthViewModel>();

    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: const Color(0xFFE5E5EA),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => vm.switchTab(0),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: selectedIndex == 0
                      ? const Color.fromARGB(255, 51, 69, 168)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      color: selectedIndex == 0
                          ? Colors.white
                          : Colors.black54,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => vm.switchTab(1),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: selectedIndex == 1
                      ? Colors.white
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: Text(
                    "Create Account",
                    style: TextStyle(
                      color: selectedIndex == 1
                          ? Colors.blue
                          : Colors.black54,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}