import 'package:firebase_auth/firebase_auth.dart';
import 'package:kimyapar/view/login/service/ILoginService.dart';

class LoginService extends ILoginService {
  LoginService(super.auth);

  @override
  Future<User?> login(String email, String password) async {
    var response = await super
        .auth
        .signInWithEmailAndPassword(email: email, password: password);

    return response.user;
  }
}
