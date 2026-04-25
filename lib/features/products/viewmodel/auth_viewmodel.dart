import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopit/features/products/service/Authservices/Auth_service.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthService service;

  AuthViewModel(this.service);

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  void switchTab(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  Future<bool> login({required String email, required String password}) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      await service.login(email, password);

      return true;
    } on FirebaseAuthException catch (e) {
      _error = _handleAuthError(e);
      return false;
    } catch (e) {
      _error = "Something went wrong";
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> signup(email, password, BuildContext context) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      await service.signup(email, password);

      return true;
    } on FirebaseAuthException catch (e) {
      _error = e.message ?? "Signup failed";
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout(BuildContext context) async {
    await service.logout();
  }

  String _handleAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return "No user found";
      case 'wrong-password':
        return "Wrong password";
      case 'invalid-email':
        return "Invalid email";
      default:
        return "Login failed";
    }
  }
}
