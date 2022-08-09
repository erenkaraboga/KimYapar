import 'package:get/get.dart';
import 'package:kimyapar/product/init/network/firebase_auth.dart';
import 'package:kimyapar/view/login/service/LoginService.dart';
import 'package:kimyapar/view/login/viewmodel/controllers/loginController.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(
        LoginController(LoginService(FirebaseAuthInit.instance.auth)));
        
  }
}
