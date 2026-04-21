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
        children: [buttonicon, const SizedBox(width: 8), buttontext],
      ),
    );
  }
}

class buttonsim extends StatelessWidget {
  final Color simplebtncolor;
  final Text simplebuttontext;
  final VoidCallback onPressed;
  const buttonsim({
    super.key,
    required this.simplebtncolor,
    required this.simplebuttontext,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 120,
      decoration: BoxDecoration(
        color: simplebtncolor,
        borderRadius: BorderRadius.circular(10),

        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(94, 5, 83, 252),
            blurRadius: 8,
            offset: Offset(0, 4), // shadow position
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [simplebuttontext],
      ),
    );
  }
}
