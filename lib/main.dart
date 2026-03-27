import 'package:flutter/material.dart';
import 'package:shopit/screens/splash.dart';
import 'package:shopit/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const Splash(),
    );
  }
}

// new commit here
