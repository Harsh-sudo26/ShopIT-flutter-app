import 'package:flutter/material.dart';

class buttonsim extends StatelessWidget {
  final Color simplebtncolor;
  final Text simplebuttontext;
  final VoidCallback onPressed;

  const buttonsim({
    super.key,
    required this.simplebtncolor,
    required this.simplebuttontext,
    required this.onPressed, required Text buttontext,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, 
      height: 45,
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