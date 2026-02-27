import 'package:flutter/widgets.dart';
import 'package:shopit/features/home/homescreen.dart';
import 'package:shopit/features/auth/login.dart';
import 'package:shopit/features/auth/onboard.dart';
import 'package:shopit/features/auth/signup.dart';

class Approutes {
  static const String homescreen = "/home";
  static const String login = "/login";
  static const String signup = "/signup";
  static const String onboard = "/onboard";

  static Map<String, WidgetBuilder> routes = {
    homescreen: (context) => Homescreen(),
    login: (context) => Login(),
    signup: (context) => Signup(),
    onboard:(context) => Onboard()
  };
}
