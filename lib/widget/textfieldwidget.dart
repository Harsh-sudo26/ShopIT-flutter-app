import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  final TextEditingController controller;
  final Icon icon;
  final String hinttext;
  final String rowtext;

  const Textfield({
    super.key,
    required this.controller,
    required this.icon,
    required this.hinttext,
    required this.rowtext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller, 
        obscureText: hinttext.toLowerCase().contains("password"),
        decoration: InputDecoration(
          prefixIcon: icon,
          hintText: hinttext,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}