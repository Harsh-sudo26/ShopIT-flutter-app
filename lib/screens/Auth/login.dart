import 'package:flutter/material.dart';
import 'package:shopit/widget/textfeild.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.orange,
            height: 200,
            width: double.infinity,
            child: Textfeildwidget(
              hinttext: 'Email',
              icon: Icon(Icons.abc_outlined),
              textcolor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
