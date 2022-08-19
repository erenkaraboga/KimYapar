import 'package:firebase_auth/firebase_auth.dart';
import 'package:kimyapar/services/firebase/FirebaseService.dart';

abstract class ILoginService {
  final FirebaseService service;
  ILoginService(this.service);
  Future<User?> login(String email, String password);
  Future<User?> registerUser(String email, String password);
  void logOut();
 
}
