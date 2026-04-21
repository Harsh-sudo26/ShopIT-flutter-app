import 'package:flutter/material.dart';

class buttonsim extends StatelessWidget {
  final Color simplebtncolor;
  final Widget simplebuttontext;
  final VoidCallback onPressed;

  const buttonsim({
    super.key,
    required this.simplebtncolor,
    required this.simplebuttontext,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: simplebtncolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: simplebuttontext,
      ),
    );
  }
}
