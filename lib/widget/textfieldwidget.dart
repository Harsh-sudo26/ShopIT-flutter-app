import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  final Icon icon;
  final String hinttext;
  final String rowtext;
  final TextEditingController controller;

  const Textfield({
    super.key,
    required this.icon,
    required this.hinttext,
    required this.rowtext,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyLarge?.color;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          rowtext,
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          style: TextStyle(color: textColor), // <-- dynamic text color
          decoration: InputDecoration(
            prefixIcon: icon,
            hintText: hinttext,
            hintStyle: TextStyle(
              color: textColor?.withOpacity(0.5),
            ), // lighter hint
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),
      ],
    );
  }
}
