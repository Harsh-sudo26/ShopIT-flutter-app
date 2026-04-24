import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopit/features/products/viewmodel/auth_viewmodel.dart';
import 'package:shopit/features/products/view/home.dart';
import 'package:shopit/widget/%20button.dart';
import 'package:shopit/widget/textfieldwidget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
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
              icon: const Icon(Icons.password),
              hinttext: 'Enter Pasword',
              rowtext: '',
              controller: password,
            ),
            SizedBox(height: 100),
            if (authViewModel.isLoading)
              const CircularProgressIndicator()
            else
              buttonsim(
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
                  final authenticated = await authViewModel.login(
                    email.text.trim(),
                    password.text.trim(),
                    context,
                  );

                  if (authenticated) {
                    await authViewModel.login(email, password, context);
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
