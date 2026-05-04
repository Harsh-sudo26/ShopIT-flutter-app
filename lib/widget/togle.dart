import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopit/Data/model/Uistateview.dart';
import 'package:shopit/Presentaions/Viewmodel/auth_viewmodel.dart';

class AuthToggle extends StatelessWidget {
  const AuthToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = context.select<UIStateViewModel, int>(
      (vm) => vm.selectedIndex,
    );

    void onTap(int index) {
      context.read<UIStateViewModel>().switchTab(index);
      context.read<AuthViewModel>().clearError(); // clear error safely
    }

    Widget tab(String text, int index) {
      final isActive = selectedIndex == index;

      return Expanded(
        child: GestureDetector(
          onTap: () => onTap(index),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: isActive ? Colors.blue : Colors.transparent,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: isActive ? Colors.white : Colors.black54,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: const Color(0xFFE5E5EA),
      ),
      child: Row(children: [tab("Sign In", 0), tab("Create Account", 1)]),
    );
  }
}
