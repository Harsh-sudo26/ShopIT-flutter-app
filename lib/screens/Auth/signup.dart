import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopit/features/products/viewmodel/auth_viewmodel.dart';
import 'package:shopit/widget/%20button.dart';
import 'package:shopit/widget/textfieldwidget.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = context.watch<AuthViewModel>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Create Account",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Sign up to continue",
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(height: 20),

            Textfield(
              icon: const Icon(Icons.email),
              hinttext: 'Enter Email',
              rowtext: '',
              controller: email,
            ),

            Textfield(
              icon: const Icon(Icons.lock),
              hinttext: 'Enter Password',
              rowtext: '',
              controller: password,
            ),

            const SizedBox(height: 40),

            if (authViewModel.isLoading)
              const CircularProgressIndicator()
            else
              buttonsim(
                simplebtncolor: Colors.blue,
                simplebuttontext: const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () async {
                  final vm = context.read<AuthViewModel>();
                  
                  await vm.signup(
                    email: email.text.trim(),
                    password: password.text.trim(),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
