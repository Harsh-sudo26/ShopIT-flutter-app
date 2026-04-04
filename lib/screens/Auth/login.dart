import 'package:flutter/material.dart';
import 'package:shopit/screens/Auth/signup.dart' show Signup;
import 'package:shopit/widget/custombutton.dart' show Custombutton;
import 'package:shopit/widget/textfeild.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 248, 248),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("ATELIER", style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 15),
            Text(
              "Enter the Digital Atelier",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: 15),
            Container(
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 248, 247, 247),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Textfeildwidget(
                      hinttext: 'Enter Email',
                      label: 'Enter Email',
                      textcolor: Colors.black,
                      icon: Icon(Icons.email),
                      rowtexxt: 'rowtext',
                    ),
                    const SizedBox(height: 20),
                    Textfeildwidget(
                      hinttext: 'Enter Password',
                      label: 'Enter Password',
                      textcolor: Colors.black,
                      icon: Icon(Icons.password),
                      rowtexxt: 'rowtext',
                    ),
                    const SizedBox(height: 20),
                    Textfeildwidget(
                      hinttext: 'Re-Enter Password',
                      label: 'Re-Enter Password',
                      textcolor: Colors.black,
                      icon: Icon(Icons.password),
                      rowtexxt: 'rowtext',
                    ),
                    const SizedBox(height: 20),
                    Custombutton(),
                  ],
                ),
              ),
            ),
            Text(
              "Don't have an account? ",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Signup()),
              ),
              child: Text(
                "Sign Up ",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
