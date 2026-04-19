import 'package:flutter/material.dart';
import 'package:shopit/features/products/view/home.dart';
import 'package:shopit/widget/textfieldwidget.dart';
import 'package:shopit/widget/togle.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const homepage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Merchant',
            style: TextStyle(
              fontSize: 26,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 60),

                const Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Text(
                  "Access your curated selection.",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ),

                const SizedBox(height: 20),

                // 🔹 Toggle
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    color: const Color.fromARGB(213, 230, 224, 224),
                  ),
                  height: 50,
                  width: double.infinity,
                  child: const AuthToggle(),
                ),

                const SizedBox(height: 20),

                // 🔹 Name
                Textfield(
                  icon: const Icon(Icons.person),
                  hinttext: 'Enter Name',
                  rowtext: 'Name',
                  controller: nameController,
                ),

                // 🔹 Email
                Textfield(
                  icon: const Icon(Icons.email),
                  hinttext: 'Enter Email',
                  rowtext: 'Email',
                  controller: emailController,
                ),

                // 🔹 Password
                Textfield(
                  icon: const Icon(Icons.lock),
                  hinttext: 'Enter Password',
                  rowtext: 'Password',
                  controller: passwordController,
                ),

                const SizedBox(height: 25),

                // 🔹 Login Button
                GestureDetector(
                  onTap: _login,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 7, 53, 202),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 50,
                    width: 150,
                    child: const Center(
                      child: Text(
                        "Login here",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}