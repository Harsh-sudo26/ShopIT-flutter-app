import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopit/Data/repository/Auth_repository.dart';

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
    if (email.isEmpty || password.isEmpty) {
      _error = "Email and password cannot be empty";
      notifyListeners();
      return false;
    }

    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      await repository.login(email, password);
      return true;
    } on FirebaseAuthException catch (e) {
      _error = _mapFirebaseError(e);
      return false;
    } catch (e) {
      _error = "Something went wrong. Try again.";
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> signup({required String email, required String password}) async {
    if (email.isEmpty || password.isEmpty) {
      _error = "Email and password cannot be empty";
      notifyListeners();
      return false;
    }

    try {
      _isLoading = true;
      _error = null;
      notifyListeners();
      await repository.signup(email, password);
      return true;
    } on FirebaseAuthException catch (e) {
      _error = _mapFirebaseError(e);
      return false;
    } catch (e) {
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    try {
      _isLoading = true;
      notifyListeners();

      await repository.logout();
    } catch (e) {
      debugPrint("LOGOUT ERROR: $e");
      _error = "Logout failed";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  String _mapFirebaseError(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return "No user found with this email";

      case 'wrong-password':
        return "Incorrect password";

      case 'invalid-credential':
        return "Invalid email or password";

      case 'email-already-in-use':
        return "Email already registered";

      case 'invalid-email':
        return "Invalid email format";

      case 'weak-password':
        return "Password should be at least 6 characters";

      case 'operation-not-allowed':
        return "Email/password login is not enabled";

      case 'network-request-failed':
        return "No internet connection";

      case 'too-many-requests':
        return "Too many attempts. Try again later";

      default:
        return e.message ?? "Authentication failed";
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
