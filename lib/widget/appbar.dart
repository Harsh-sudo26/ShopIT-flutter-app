import 'package:flutter/material.dart';

class Appbarcus extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color textColor;
  final double textSize;
  final FontWeight textWeight;
  final Widget? leading;
  final List<Widget>? actions;

  const Appbarcus({
    super.key,
    required this.title,
    this.textSize = 18,
    this.textWeight = FontWeight.bold,
    this.leading,
    this.actions,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,

      // LEFT SIDE
      leading: leading,

      // TITLE
      title: Text(
        title,
        style: TextStyle(
          color: textColor,
          fontSize: textSize,
          fontWeight: textWeight,
        ),
      ),

      // RIGHT SIDE
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
