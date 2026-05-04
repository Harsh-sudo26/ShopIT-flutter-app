import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopit/Presentaions/Viewmodel/auth_viewmodel.dart';
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
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome Back!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              Text(
                "Access your curated selection.",
                style: Theme.of(context).textTheme.bodyMedium,
              ),

              const SizedBox(height: 30),

              // EMAIL
              Textfield(
                icon: const Icon(Icons.email),
                hinttext: 'Enter Email',
                rowtext: 'Enter Email',
                controller: email,
              ),

              const SizedBox(height: 15),

              // PASSWORD
              Textfield(
                icon: const Icon(Icons.lock),
                hinttext: 'Enter Password',
                rowtext: ' ',
                controller: password,
              ),

              const SizedBox(height: 40),

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
                        await vm.login(
                          email: email.text.trim(),
                          password: password.text.trim(),
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
