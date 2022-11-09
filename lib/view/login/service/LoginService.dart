import 'package:firebase_auth/firebase_auth.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kimyapar/view/login/service/ILoginService.dart';
import 'package:kimyapar/view/map/model/UserModel.dart';

import '../../map/viewmodel/controllers/mapController.dart';

class LoginService extends ILoginService {
  LoginService(super.service);
  final mapController = Get.find<MapController>();
  final geo = Geoflutterfire();
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
      GeoFirePoint myLocation = geo.point(latitude: mapController.position.value.latitude, longitude:mapController.position.value.longitude);
      String id = user.user!.uid;
      service.db.collection('users').doc(id).set({
        'id': id,
        'name': email,
        'email': email,
        'position':myLocation.data,
        'imageUrl':
            "https://res.cloudinary.com/dinqa9wqr/image/upload/v1663226962/indir_oj3zv3.png"
      });
    } catch (firebaseAuthException) {}
    return null;
  }

  @override
  void logOut() {
    super.service.auth.signOut();
  }

  @override
  void verifyNumber(String number) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: number,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              print(value.user!.uid);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String? verficationID, int? resendToken) {},
        codeAutoRetrievalTimeout: (String verificationID) {},
        timeout: const Duration(seconds: 120));
  }
}
