import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopit/Data/service/Authservices/Auth_service.dart';

class AuthRepository {
  final AuthService service;

  AuthRepository(this.service);

  Future<User?> login(String email, String password) async {
    return await service.login(email, password);
  }

  Future<User?> signup(String email, String password) async {
    return await service.signup(email, password);
  }
   Future<void> logout() async {
    await service.logout();
  }
}
