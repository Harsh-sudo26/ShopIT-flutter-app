import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopit/features/products/repository/Auth_repository.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository repository;

  AuthViewModel(this.repository);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void toggleIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  Future<bool> login({required String email, required String password}) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      await repository.login(email, password);

      return true;
    } catch (e) {
      _error = "Login failed";
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> signup({required String email, required String password}) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      await repository.signup(email, password);

      return true;
    } catch (e) {
      _error = "Signup failed";
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    await _auth.signOut();
  }
}
