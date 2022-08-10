import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kimyapar/view/login/service/ILoginService.dart';

import '../../map/viewmodel/controllers/mapController.dart';

class LoginService extends ILoginService {
  LoginService(super.service);
  final mapController = Get.find<MapController>();
  @override
  Future<User?> login(String email, String password) async {
    var response = await super
        .service
        .auth
        .signInWithEmailAndPassword(email: email, password: password);

    return response.user;
  }

  @override
  Future<User?> registerUser(String email, String password) async {
    try {
      var user = await super
          .service
          .auth
          .createUserWithEmailAndPassword(email: email, password: password);
      String id = user.user!.uid;
      service.db.collection('users').doc(id).set({
        'id': id,
        'name': email,
        'lat': mapController.position.value.latitude,
        'long': mapController.position.value.longitude
      });
    } catch (firebaseAuthException) {}
    return null;
  }

  @override
  void logOut() {
    super.service.auth.signOut();
  }

  @override
  void getCurrentUser(String id) {}
}
