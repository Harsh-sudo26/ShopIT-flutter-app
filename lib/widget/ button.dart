import 'package:flutter/material.dart';

class buttonwig extends StatelessWidget {
  final Color butotncolor;
  final Icon buttonicon;
  final Text buttontext;

  const buttonwig({
    super.key,
    required this.butotncolor,
    required this.buttonicon,
    required this.buttontext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: butotncolor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buttonicon,
          const SizedBox(width: 8),
          buttontext,
        ],
      ),
    );
  }
}