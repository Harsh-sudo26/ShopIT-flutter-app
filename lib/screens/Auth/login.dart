import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopit/features/products/viewmodel/auth_viewmodel.dart';
import 'package:shopit/widget/%20button.dart';
import 'package:shopit/widget/textfieldwidget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome Back!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            Text(
              "Access your curated selection.",
              style: Theme.of(context).textTheme.bodyMedium,
            ),

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

            const SizedBox(height: 100),

            authViewModel.isLoading
                ? const CircularProgressIndicator()
                : buttonsim(
                    simplebtncolor: Colors.blue,
                    simplebuttontext: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () async {
                      final vm = context.read<AuthViewModel>();

                      final success = await vm.login(
                        email: email.text.trim(),
                        password: password.text.trim(),
                      );

                      if (success != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Login Success")),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Login Failed")),
                        );
                      }
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
