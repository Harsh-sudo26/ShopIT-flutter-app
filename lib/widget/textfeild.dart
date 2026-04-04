import 'package:flutter/material.dart';

class Textfeildwidget extends StatelessWidget {
  final String hinttext;
  final String label;
  final Color textcolor;
  final Icon icon;

  const Textfeildwidget({
    super.key,
    required this.hinttext,
    required this.label,
    required this.textcolor,
    required this.icon,
    required String rowtexxt,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 5),
        TextField(
          style: TextStyle(color: textcolor),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromARGB(255, 255, 255, 255),
            prefixIcon: icon,
            hintText: hinttext,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none, // cleaner look
            ),
          ),
        ),
      ],
    );
  }
}
