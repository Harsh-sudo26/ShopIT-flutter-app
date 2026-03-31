import 'package:flutter/material.dart';
import 'package:shopit/widget/textfeild.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Textfeildwidget(
            hinttext: 'Email',
            icon: Icon(Icons.abc_outlined),
            textcolor: Colors.white,
          ),
        ],
      ),
    );
  }
}
