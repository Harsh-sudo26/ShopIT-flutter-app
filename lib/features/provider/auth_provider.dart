import 'package:flutter/material.dart';

class Auth_Provider extends ChangeNotifier {
  bool isloading = false;
  bool get loading => isloading;
  Future<bool> login(String email, String password) async {
    isloading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    isloading = false;
    notifyListeners();
    return true;
  }
}
