import 'package:flutter/material.dart';
import 'package:shopit/widget/textfieldwidget.dart';
import 'package:shopit/widget/togle.dart';

class Login extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
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

      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(
              "Welcome Back",
              style: TextStyle(
                fontSize: 26,
                color: const Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              " Access your curated selection.",
              style: TextStyle(
                fontSize: 18,
                color: const Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                color: const Color.fromARGB(213, 230, 224, 224),
              ),
              height: 50,
              width: double.infinity,
              child: AuthToggle(),
            ),
            Textfield(
              icon: Icon(Icons.person),
              hinttext: 'enter Name',
              rowtext: 'Name',
              controller: nameController,
            ),
            Textfield(
              icon: Icon(Icons.email),
              hinttext: 'enter email',
              rowtext: 'Email',
              controller: passwordController,
            ),
            Textfield(
              icon: Icon(Icons.password),
              hinttext: 'enter pasword',
              rowtext: 'Password',
              controller: emailController,
            ),
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 31, 16, 168),
                borderRadius: BorderRadius.circular(20),
              ),
              height: 50,
              width: 200,
              child: Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
