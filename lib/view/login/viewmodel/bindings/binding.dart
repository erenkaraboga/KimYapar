import 'package:get/get.dart';
import 'package:kimyapar/product/init/network/firebase_auth.dart';
import 'package:kimyapar/view/login/service/LoginService.dart';
import 'package:kimyapar/view/login/viewmodel/controllers/loginController.dart';

import '../../../../product/init/network/firebase_init.dart';
import '../../../../services/firebase/FirebaseService.dart';
import '../../../map/service/MapService.dart';
import '../../../map/viewmodel/controllers/mapController.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController(
        FirebaseService(
            FirebaseAuthInit.instance.auth, FirebaseInit.instance.db),
        LoginService(FirebaseService(
            FirebaseAuthInit.instance.auth, FirebaseInit.instance.db))));
    Get.put<MapController>(MapController(
        FirebaseService(
            FirebaseAuthInit.instance.auth, FirebaseInit.instance.db),
        MapService(FirebaseService(
            FirebaseAuthInit.instance.auth, FirebaseInit.instance.db))));
  }
}
