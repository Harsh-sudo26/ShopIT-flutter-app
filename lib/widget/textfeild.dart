import 'package:flutter/material.dart';

class Textfeildwidget extends StatelessWidget {
  final String hinttext;
  final Color textcolor;
  final Icon icon;
  

  const Textfeildwidget({
    super.key,
    required this.hinttext,
    required this.textcolor,
    required this.icon,
   
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        TextField(
          
          style: TextStyle(color: textcolor),
          decoration: InputDecoration(
            prefixIcon: icon,
            hintText: hinttext,
            hintStyle: TextStyle(color: textcolor?.withOpacity(0.5)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }
}
