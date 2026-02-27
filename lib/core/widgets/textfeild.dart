import 'package:flutter/material.dart';

class Textfeild extends StatelessWidget {
  final String hint;
  final Icon icon;
  final bool obsecuretext;

  const Textfeild({
    super.key,
    required this.hint,
    required this.icon,
    required this.obsecuretext,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obsecuretext,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        prefixIcon: icon,
        hintText: hint,
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontSize: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 238, 238, 238),
            width: 2,
          ),
        ),
      ),
    );
  }
}
