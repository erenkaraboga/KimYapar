import 'package:firebase_auth/firebase_auth.dart';

abstract class ILoginService {
  final FirebaseAuth auth;
  ILoginService(this.auth);
  Future<User?> login(String email, String password);
  Future<User?> register(String email, String password);
  void logOut();
  void getCurrentUser(String id);
}
