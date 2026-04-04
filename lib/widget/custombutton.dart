import 'package:flutter/material.dart';
import 'package:shopit/screens/homescreen.dart';

class Custombutton extends StatelessWidget {
  const Custombutton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Homescreen()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 26, 46, 223),
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Get Started", style: TextStyle(fontSize: 18)),
          SizedBox(width: 10),
          Icon(Icons.arrow_forward),
        ],
      ),
    );
  }
}
