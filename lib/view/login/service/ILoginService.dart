import 'package:firebase_auth/firebase_auth.dart';

abstract class ILoginService {
  final FirebaseAuth auth;
  ILoginService(this.auth);
  Future<User?> login(String email, String password);
}
