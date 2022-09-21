import 'package:get/get.dart';
import 'package:kimyapar/product/init/network/firebase_auth.dart';
import 'package:kimyapar/product/init/network/firebase_init.dart';
import 'package:kimyapar/services/firebase/FirebaseService.dart';
import 'package:kimyapar/view/profile/viewmodel/controllers/controller.dart';

import '../../../../product/init/network/firebase_messaging.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ProfileController>(ProfileController(
      FirebaseService(FirebaseAuthInit.instance.auth, FirebaseInit.instance.db),
    ));
  }
}
