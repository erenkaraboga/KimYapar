import 'package:get/get.dart';
import 'package:kimyapar/services/firebase/FirebaseService.dart';
import 'package:kimyapar/view/map/viewmodel/controllers/mapController.dart';

import '../../../../product/init/network/firebase_auth.dart';
import '../../../../product/init/network/firebase_init.dart';
import '../../../login/service/LoginService.dart';
import '../../../login/viewmodel/controllers/loginController.dart';
import '../../service/MapService.dart';

class MapBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<MapController>(MapController(
        FirebaseService(
            FirebaseAuthInit.instance.auth, FirebaseInit.instance.db),
        MapService(FirebaseService(
            FirebaseAuthInit.instance.auth, FirebaseInit.instance.db))));
    Get.put<LoginController>(LoginController(
        FirebaseService(
            FirebaseAuthInit.instance.auth, FirebaseInit.instance.db),
        LoginService(FirebaseService(
            FirebaseAuthInit.instance.auth, FirebaseInit.instance.db))));
  }
}
